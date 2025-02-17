Basis functions, grid defaults, and other defaults
for chemical elements ("species"), for copy-paste
into the FHI-aims input file "control.in". These 
settings are deliberately kept openly visible, as an
invitation to verify / optimize if needed.

Please also refer to the manual (Sec. 2.2) for a quick
overview of the purpose of these settings.

**Table of contents:**

* FHI-aims NAO species defaults: `defaults_2010` and `defaults_2020`
    - `defaults_2010`
    - `defaults_2020`
    - How to use `light`, `tight`, and `really_tight`
    - The `intermediate` settings
* The `NAO-VCC-nZ` basis sets
* The `NAO-J-n` basis sets
* The `non-standard` subdirectory


# FHI-aims NAO species defaults: `defaults_2010` and `defaults_2020`

The FHI-aims NAO species defaults are now available in
two versions:

- `defaults_2010`
- `defaults_2020`

We recommend to use the re-worked `defaults_2020`. The defaults for most
elements are not changed compared to `defaults_2010`. However, due to an 
analysis based on the Delta-Code DFT Test (71 solids), some elements were updated to 
fit into the expected range of accuracy, where it was needed.

The header of each species defaults file also logs updates of its defaults.

## `defaults_2010`

Three defaults (for all elements) are provided:

- `light` 
- `tight` 
- `really_tight` 

A fourth set of defaults is included in

- `intermediate`

This set is not complete for all elements. It resides between the
`light` and `tight` settings and is designed specifically to provide
good but still affordable accuracy for hybrid DFT calculations. Read below
for more details.

## `defaults_2020`

Four defaults are provided:

- `light_spd`: The former light species defaults of `default_2010` for the
    elements 13-17, 31-35, and 49-53. These settings are of use for simulations,
    where the former defaults were sufficient and very light computational settings 
    are needed (e.g. MD simulations).
- `light`: Updates compared to `default_2010`: 
    Be(+3p), Al-Cl(+4f), K(radial_base,cut_pot), Co-Ni(+ionic 4p), Ga-Br(+4f), 
    Kr-Sr(`radial_base`,`cut_pot`), In-I(+4f), Xe-Ba, Rn(`radial_base`,`cut_pot`)
- `intermediate`: now, complete set of elements 1-86. Derived from the `tight` 
    species defaults, however, with focus to provide good but still affordable 
    accuracy for hybrid DFT calculations.
- `tight`: Changes compared to `default_2010`: 
    Mn(+3d function), Zn-Kr(+5g function), In-Xe(+5g function)
- `really_tight`: Changes compared to `default_2010`: 
    Zn-Kr(+5g function), In-Xe(+5g function) 

The updates of the `light`, `tight`, and `really_tight` defaults are the results of 
a careful analysis of the Delta-Code DFT (DCDFT) Test (71 solids). So the updates should
improve the accuracy of an element for the material class (insulator or metal) 
that is present in the DCDFT Test (e.g., the Be crystal is metallic in the test, but may
be an ion for some other systems).


## How to use `light`, `tight`, and `really_tight`

Regarding `light`, `tight`, and `really_tight`, we here repeat 
only that many DFT-LDA/GGA production tasks (e.g.,
pre-relaxation) can and should first be done at the
`light` level, while the `tight` level then allow a
more detailed verification / post-convergence of
all results. Finally, `really_tight` is provided in
case stringent convergence tests are required - for
example, when trying out larger basis sets (`tier 3`, 
`tier 4` etc.). Note that production
calculations should not simply be run at at the
`really_tight` level out of precaution. Of course,
there may be good reasons to use modified
`really_tight` for specific tasks where convergence is
more subtle and requires checking by hand, such as
in MP2, GW, RPA, i.e., the methods that involve the
unoccupied spectrum explicitly.

The references for these standard FHI-aims basis sets is

> Volker Blum, Ralf Gehrke, Felix Hanke, Paula Havu,
> Ville Havu, Xinguo Ren, Karsten Reuter, and Matthias Scheffler,
> 'Ab Initio Molecular Simulations with Numeric Atom-Centered Orbitals',
> Computer Physics Communications 180, 2175-2196 (2009)

## The `intermediate` settings

`intermediate` settings, where available, are derived from `tight`
settings, but lightened with the specific goal of providing still
reliable but affordable accuracy for production calculations of very
large systems with hybrid density functionals.

For hybrid functionals, the dominant memory and CPU time requirements
are associated with the number of basis functions per atom. These can
quickly become overwhelming in practical calculations, especially when
gradients and stress tensors for bulk materials are required.

In contrast, the integration grids or Hartree potential evaluation,
which are important performance parameters in semilocal DFT, play a
relatively much smaller role for hybrid functionals.

Thus, in the `intermediate` settings, the number of radial functions
is reduced to a level that will still be acceptable for many tasks,
but much less expensive than the full "tight" settings. 

`intermediate` settings can, of course, equally well be used for
semilocal DFT. Here, too, some applications will not need the full
accuracy of `tight` settings. As an example, bulk oxides may not
necessarily need the full accuracy of tier 2 (which is designed to
handle the subtleties of weakly bonded systems, like intermolecular
bonds). For these, `intermediate` settings for O may well suffice for
many applications.

A description of what the `for_aux` keyword, used in these defaults,
does, can be found in New J. Phys. 17, 093020 (2015). 

The `for_aux` keyword has no effect for semilocal density functionals.


# The `NAO-VCC-nZ` basis sets 

The NAO-VCC-nZ basis sets are "correlation consistent" numeric
atom-centered orbital basis sets for elements 1-18 by
Igor Ying Zhang and coworkers for FHI. These basis sets are meant for
methods that sum over unoccupied states explicitly, such as RPA, MP2,
or GW. 

For standard DFT-LDA/GGA/hybrids, the usual FHI-aims `light`, `tight`
or `really_tight` species defaults converge faster.

The reference for the NAO-VCC-nZ basis sets is:

> Igor Ying Zhang, Xinguo Ren, Patrick Rinke, Volker Blum, and 
> Matthias Scheffler, Numeric atom-centered-orbital basis sets 
> with valence-correlation consistency from H to Ar, 
> New Journal of Physics 15, 123033 (2013).

Please cite this paper when using these basis sets.


# The NAO-J-n basis sets 

The NAO-J-n basis sets are available for most light elements from H to
Cl. Since these are more expensive (tighter grids) than other basis
sets, they should only be used for J-couplings. Even then, they should
only be placed on atoms of interest, while cheaper basis sets can be
used on other atoms. They are constructed by adding tight Gaussian
orbitals to the NAO-VCC-nZ basis sets. In order to describe the
Gaussian orbitals correctly near the nucleus, tighter grids than
normally are required (with `radial_multiplier 8` and `l_hartree 8`, among
other parameters).


# The `non-standard` subdirectory 

In addition, some further preconstructed
special-purpose species defaults are provided in a
"non-standard" subdirectory. 

Particularly relevant additional species defaults include:

* `gaussian_tight_770` : Collection of species defaults for use 
               with the Gaussian-type orbital reference basis sets
               by Dunning and others, also compiled by Igor Ying Zhang.
               These species defaults can be
               used for exact comparisons with Gaussian-type orbital
               based codes. Note that FHI-aims still performs all
               its operations numerically, not using the analytical
               integration techniques of quantum chemistry that are
               a consequence of the Gaussian shape. It is also
               necessary to use much tighter integration grids for
               these benchmark calculations than is normally the
               case with FHI-aims - i.e., these species_defaults are not
               meant for routine production calculations.

* `light_194` :  Partial example of how to edit the light species defaults for
               very fast qualitative molecular dynamics calculations, sampling
               etc. The restriction of the angular grids to 194 points max.
               per radial shell is not recommended for definitive calculations,
               however.

* `Tier2_aug2` : simple recipe to produce essentially completely
               converged low-lying excitation energies in
               linear-response time-dependent DFT (LDA) calculations. 



