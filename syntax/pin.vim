" Vim syntax file
" " Language: PRECISE-UNS parameter file (pin)
" " Maintainer: Guillermo Guirao Aguilar
" " Latest Revision: 1 April 2015
"
if exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword pinKeyword absolute_tolerance absorption active additional_variables blending_factor boundary combustion convection_scheme debug debug_parser english_unit fuel_nozzle fuel_type gradient_by ignition init monitor_cell mixing noise nox output plot_format plot_spray_cycle plot_trajectories plot_unsteady_spray post postprocessing prandtl_schmidt_number pressure_correction radiation reference_numbers relative_tolerance relaxation_factor restart rtdf save scalarsubiterations set_bounds sigma slope_limiter solve solver solid_material soot spark spray spray_atomization steps store target_residual thermal title tpdf transient turbulence

syn keyword pinParameter u active adiab alfa all_speed amplitude andens angle angxzn angxzp axis azimuthal_angle bml center chemistry_model coefficient cond contant Courant cp Cphi csm cyclic d d32 decouple_flow_spray den density dt ebu ed emissivity evaporation every every fact fgm field fixed flowsplit flux fmix frequency fuel_type gamma gmix gradient_by gravity initialize inlet iter iterations ke_realizable length ls mach_number massflow max max_sub_steps Mixonly monopulse n noise noslip nox npartcell npartmax nsize nsl outlet outputcycle outputvtkdata p pp p1_g partial_equilibrium particle_number_control pdf_debug periodic pgr plot_particle_trajectories polar_angle pref_at_cell pressure pressure_total print_all_outer_loops print_max_cfl prof q radial random_walks randomwalk relax_fuel_source relax_particle_time_step Rmin save_function_params Schmidt sizeGroup slip smd soot specific_heat_cp specific_heat_cv spherical spray_cycle start start_average_at start_spray_at_iteration step symp t T_high T_low T0_air T0_fuel te temperature temperature_total teta1 teta2 tfuel thermal_lambda thermoaccousticsource thetalocation ti totalpressure turbulent_dispersion turn_off_enthalpy v vax vector velocity vfuel vis viscosity vitiated volumetric_beta vpgr vrad w wall wall_bc wall_bounce wff width wsggm x y z zone_id
syn match pinParameter "effusion-\(keps\|mass\|t\|uvw\)"

syn keyword pinValue 2-step benzene butane center cloning_off clustering_off df2 earsm ethane ethdiene ethylene euler exit fgm h2d ildm initial isat ispa jp-4 jp-5 ke_durbin ke_realizable ke_rng ke_standard kero least_squares les_csmag les_csmag_wale les_dsmag loops methane no_backup nondimensional p1 pentane propane quad reset_counter reset_time_statistics rsm_d_h rsm_def rsm_ini rsm_ssg rte stochastic tecplot vertex vtk
syn match pinValue "jet-a\|rosin-rammler"

syn keyword pinTodo contained TODO FIXME XXX NOTE

syn keyword pinOn on
syn keyword pinOff off

" Errors: operators defined outside of a formula expression
syn keyword pinError max min abs sqrt ln log10 cos sin tan cos_deg sin_deg tan_deg 
syn match   pinError '+\|\*\|\/\|\"\|\$' display

" Operators:
syn keyword pinOperator contained max min abs sqrt ln log10 cos sin tan cos_deg sin_deg tan_deg 
syn match   pinOperator contained "[\+\-\*\/]" display

" Inline comments
syn match pinInlineComment "#.*$" contains=pinTodo display
syn match pinIgnore "\*.*$" contains=pinInlineComment display


" Numbers:
" Integer with - + or nothing in front
syn match pinNumber '\<\d\+\>' display
syn match pinNumber '[-+]\d\+' display

" Floating point number with decimal no E or e (+,-)
syn match pinNumber '\d\+\.\d*' display
syn match pinNumber '[-+]\d\+\.\d*' display

" Floating point like number with E and no decimal point (+,-)
syn match pinNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+' display
syn match pinNumber '\d[[:digit:]]*[eE][\-+]\=\d\+' display

" Floating point like number with E and decimal point (+,-)
syn match pinNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' display
syn match pinNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' display


syn match pinVarName "\w*" contained display
syn match pinVarSymbol "\$\w*" contains=pinVarName display


syn region pinString start='"' end='"' oneline display
syn region pinBlockComment start="\[" end="\]" fold contains=pinTodo
syn region pinFormula start="{" end="}" fold contains=pinVarSymbol,pinOperator,pinNumber skipwhite skipnl skipempty
syn region pinRange start="(" end=")" contains=pinNumber


let b:current_syntax = "pin"

hi def pinKeyword         ctermfg=Yellow cterm=underline
hi def pinIgnore          ctermfg=DarkGray
hi def pinOn              ctermfg=Green
hi def pinOff             ctermfg=Red
hi def pinVarSymbol       ctermfg=DarkGray

"hi def link pinKeyword         Underlined
hi def link pinParameter       Define
hi def link pinValue           Identifier
hi def link pinInlineComment   Comment
hi def link pinBlockComment    Comment
hi def link pinString          String
hi def link pinNumber          Number
hi def link pinParameter       Tag 
hi def link pinTodo            Todo
hi def link pinVarName         Statement
hi def link pinRange           Identifier
hi def link pinFormula         Structure
hi def link pinOperator        Function
hi def link pinError           Error
