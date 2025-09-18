
local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t
local f = ls.f
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- Define the table of snippets
local snippets = {
    ----------------------------------------------------------------------
    -- Math Mode
    ----------------------------------------------------------------------
    s({trig="mk", snippetType="snippet"}, { t"$", i(1), t"$ ", i(0) }),
    s({trig="dm", snippetType="snippet"}, { t"$$", i(1), t"$$" }),
    s({trig="beg", snippetType="snippet"}, fmt("\\begin{{{}}}\n\t{}\n\\end{{{}}}", {i(1), i(2), rep(1)})),
    ----------------------------------------------------------------------
    -- Greeks
    ----------------------------------------------------------------------
    s({trig="@a", snippetType="snippet", condition = in_mathzone}, t"\\alpha"),
    s({trig="@b", snippetType="snippet", condition = in_mathzone}, t"\\beta"),
    s({trig="@g", snippetType="snippet", condition = in_mathzone}, t"\\gamma"),
    s({trig="@G", snippetType="snippet", condition = in_mathzone}, t"\\Gamma"),
    s({trig="@d", snippetType="snippet", condition = in_mathzone}, t"\\delta"),
    s({trig="@D", snippetType="snippet", condition = in_mathzone}, t"\\Delta"),
    s({trig="@e", snippetType="snippet", condition = in_mathzone}, t"\\epsilon"),
    s({trig="@E", snippetType="snippet", condition = in_mathzone}, t"\\Epsilon"),
    s({trig="@z", snippetType="snippet", condition = in_mathzone}, t"\\zeta"),
    s({trig="@Z", snippetType="snippet", condition = in_mathzone}, t"\\Zeta"),
    s({trig="@h", snippetType="snippet", condition = in_mathzone}, t"\\eta"), 
    s({trig="@H", snippetType="snippet", condition = in_mathzone}, t"\\Eta"),
    s({trig="@t", snippetType="snippet", condition = in_mathzone}, t"\\theta"), 
    s({trig="@T", snippetType="snippet", condition = in_mathzone}, t"\\Theta"),
    s({trig="@i", snippetType="snippet", condition = in_mathzone}, t"\\iota"),
    s({trig="@I", snippetType="snippet", condition = in_mathzone}, t"\\Iota"),
    s({trig="@k", snippetType="snippet", condition = in_mathzone}, t"\\kappa"),
    s({trig="@K", snippetType="snippet", condition = in_mathzone}, t"\\Kappa"),
    s({trig="@l", snippetType="snippet", condition = in_mathzone}, t"\\lambda"),
    s({trig="@L", snippetType="snippet", condition = in_mathzone}, t"\\Lambda"),
    s({trig="@m", snippetType="snippet", condition = in_mathzone}, t"\\mu"),
    s({trig="@M", snippetType="snippet", condition = in_mathzone}, t"\\Mu"),
    s({trig="@n", snippetType="snippet", condition = in_mathzone}, t"\\nu"),
    s({trig="@N", snippetType="snippet", condition = in_mathzone}, t"\\Nu"),
    s({trig="@x", snippetType="snippet", condition = in_mathzone}, t"\\xi"),
    s({trig="@X", snippetType="snippet", condition = in_mathzone}, t"\\Xi"),
    s({trig="@oo", snippetType="snippet", condition = in_mathzone}, t"\\omicron"), 
    s({trig="@OO", snippetType="snippet", condition = in_mathzone}, t"\\Omicron"),
    s({trig="@p", snippetType="snippet", condition = in_mathzone}, t"\\pi"),
    s({trig="@P", snippetType="snippet", condition = in_mathzone}, t"\\Pi"),
    s({trig="@r", snippetType="snippet", condition = in_mathzone}, t"\\rho"),
    s({trig="@R", snippetType="snippet", condition = in_mathzone}, t"\\Rho"),
    s({trig="@s", snippetType="snippet", condition = in_mathzone}, t"\\sigma"),
    s({trig="@S", snippetType="snippet", condition = in_mathzone}, t"\\Sigma"),
    s({trig="@ta", snippetType="snippet", condition = in_mathzone}, t"\\tau"), 
    s({trig="@Ta", snippetType="snippet", condition = in_mathzone}, t"\\Tau"),
    s({trig="@u", snippetType="snippet", condition = in_mathzone}, t"\\upsilon"),
    s({trig="@U", snippetType="snippet", condition = in_mathzone}, t"\\Upsilon"),
    s({trig="@f", snippetType="snippet", condition = in_mathzone}, t"\\phi"), 
    s({trig="@F", snippetType="snippet", condition = in_mathzone}, t"\\Phi"),
    s({trig="@c", snippetType="snippet", condition = in_mathzone}, t"\\chi"),
    s({trig="@C", snippetType="snippet", condition = in_mathzone}, t"\\Chi"),
    s({trig="@y", snippetType="snippet", condition = in_mathzone}, t"\\psi"),
    s({trig="@Y", snippetType="snippet", condition = in_mathzone}, t"\\Psi"),
    s({trig="@o", snippetType="snippet", condition = in_mathzone}, t"\\omega"), 
    s({trig="@O", snippetType="snippet", condition = in_mathzone}, t"\\Omega"),
    s({trig="@ve", snippetType="snippet", condition = in_mathzone}, t"\\varepsilon"),
    s({trig="@vk", snippetType="snippet", condition = in_mathzone}, t"\\varkappa"),
    s({trig="@vp", snippetType="snippet", condition = in_mathzone}, t"\\varphi"), 
    s({trig="@vpi", snippetType="snippet", condition = in_mathzone}, t"\\varpi"),
    s({trig="@vr", snippetType="snippet", condition = in_mathzone}, t"\\varrho"),
    s({trig="@vs", snippetType="snippet", condition = in_mathzone}, t"\\varsigma"),
    s({trig="@vt", snippetType="snippet", condition = in_mathzone}, t"\\vartheta"),
    ----------------------------------------------------------------------
    -- Basic Operations
    ----------------------------------------------------------------------
    s({trig="sr", snippetType="snippet", condition = in_mathzone}, t"^{2}"),
    s({trig="cb", snippetType="snippet", condition = in_mathzone}, t"^{3}"),
    s({trig="rd", snippetType="snippet", condition = in_mathzone}, { t"^{", i(1), t"}" }),
    s({trig="_", snippetType="snippet", condition = in_mathzone}, { t"_{", i(1), t"}" }),
    s({trig="sq", snippetType="snippet", condition = in_mathzone}, { t"\\sqrt{", i(1), t"}" }),
    s({trig="//", snippetType="snippet", condition = in_mathzone}, { t"\\frac{", i(1), t"}{", i(2), t"}" }),
    s({trig="ee", snippetType="snippet", condition = in_mathzone}, { t"e^{", i(1), t"}" }),
    s({trig="invs", snippetType="snippet", condition = in_mathzone}, t"^{-1}"),
    s({trig="conj", snippetType="snippet", condition = in_mathzone}, t"^{*}"),
    s({trig="Re", snippetType="snippet", condition = in_mathzone}, t"\\mathrm{Re}"),
    s({trig="Im", snippetType="snippet", condition = in_mathzone}, t"\\mathrm{Im}"),
    s({trig="bf", snippetType="snippet", condition = in_mathzone}, { t"\\mathbf{", i(1), t"}" }),
    s({trig="rm", snippetType="snippet", condition = in_mathzone}, { t"\\mathrm{", i(1), t"}" }),
    ----------------------------------------------------------------------
    -- Accents
    ----------------------------------------------------------------------
    s({trig="hat", snippetType="snippet", condition = in_mathzone}, { t"\\hat{", i(1), t"}" }),
    s({trig="bar", snippetType="snippet", condition = in_mathzone}, { t"\\bar{", i(1), t"}" }),
    s({trig="dot", snippetType="snippet", condition = in_mathzone}, { t"\\dot{", i(1), t"}" }),
    s({trig="ddot", snippetType="snippet", condition = in_mathzone}, { t"\\ddot{", i(1), t"}" }),
    s({trig="tilde", snippetType="snippet", condition = in_mathzone}, { t"\\tilde{", i(1), t"}" }),
    s({trig="und", snippetType="snippet", condition = in_mathzone}, { t"\\underline{", i(1), t"}" }),
    s({trig="vec", snippetType="snippet", condition = in_mathzone}, { t"\\vec{", i(1), t"}" }),
    ----------------------------------------------------------------------
    -- Symbols and Relations
    ----------------------------------------------------------------------
    s({trig="ooo", snippetType="snippet", condition = in_mathzone}, t"\\infty"),
    s({trig="prod", snippetType="snippet", condition = in_mathzone}, { t"\\prod_{", i(1,"i=1"), t"}^{", i(2,"n"), t"} ", i(3) }),
    s({trig="sum", snippetType="snippet", condition = in_mathzone}, { t"\\sum_{ ", i(1,"i=1"), t"}^{", i(2,"n"), t"} ", i(3) }),
    s({trig="lim", snippetType="snippet", condition = in_mathzone}, { t"\\lim_{", i(1,"n \\to \\infty"), t"} ", i(2) }),
    s({trig="ex", snippetType="snippet", condition = in_mathzone}, t"\\exists"),
    s({trig="del", snippetType="snippet", condition = in_mathzone}, t"\\nabla"),
    s({trig="xx", snippetType="snippet", condition = in_mathzone}, t"\\times "),
    s({trig="**", snippetType="snippet", condition = in_mathzone}, t"\\cdot "),
    s({trig="para", snippetType="snippet", condition = in_mathzone}, t"\\parallel "),
    s({trig="===", snippetType="snippet", condition = in_mathzone}, t"\\equiv "),
    s({trig="!=", snippetType="snippet", condition = in_mathzone}, t"\\neq "),
    s({trig=">=", snippetType="snippet", condition = in_mathzone}, t"\\geq "),
    s({trig="<=", snippetType="snippet", condition = in_mathzone}, t"\\leq "),
    s({trig="->", snippetType="snippet", condition = in_mathzone}, t"\\to "),
    s({trig="imp", snippetType="snippet", condition = in_mathzone}, t"\\implies "),
    s({trig="iimp", snippetType="snippet", condition = in_mathzone}, t"\\Longleftrightarrow"),
    s({trig="inn", snippetType="snippet", condition = in_mathzone}, t"\\in "),
    s({trig="ninn", snippetType="snippet", condition = in_mathzone}, t"\\not\\in "),
    s({trig="eset", snippetType="snippet", condition = in_mathzone}, t"\\varnothing"),
    s({trig="RR", snippetType="snippet", condition = in_mathzone}, t"\\mathbb{R}"),
    s({trig="QQ", snippetType="snippet", condition = in_mathzone}, t"\\mathbb{Q}"),
    s({trig="PP", snippetType="snippet", condition = in_mathzone}, t"\\mathbb{P}"),
    s({trig="CC", snippetType="snippet", condition = in_mathzone}, t"\\mathbb{C}"),
    s({trig="ZZ", snippetType="snippet", condition = in_mathzone}, t"\\mathbb{Z}"),
    s({trig="NN", snippetType="snippet", condition = in_mathzone}, t"\\mathbb{N}"),
    s({trig="MM", snippetType="snippet", condition = in_mathzone}, t"\\mathcal{M}"),
    s({trig="EE", snippetType="snippet", condition = in_mathzone}, { t"\\mathbb{E}(", i(1), t")" }),
    s({trig="II", snippetType="snippet", condition = in_mathzone}, { t"\\mathbb{I}(", i(1), t")" }),
    s({trig="leq", snippetType="snippet", condition = in_mathzone}, t"\\leq "),
    s({trig="geq", snippetType="snippet", condition = in_mathzone}, t"\\geq "),
    s({trig="neq", snippetType="snippet", condition = in_mathzone}, t"\\neq "),
    s({trig="qeq", snippetType="snippet", condition = in_mathzone}, t"\\stackrel{?}{=}"),
    s({trig="topd", snippetType="snippet", condition = in_mathzone}, { t"\\stackrel{\\partial ", i(1), t"}{\\longrightarrow} ", i(2) }),
    s({trig="toin", snippetType="snippet", condition = in_mathzone}, { t"\\stackrel{\\int ", i(1), t"}{\\longrightarrow} ", i(2) }),
    s({trig="thus", snippetType="snippet", condition = in_mathzone}, t"\\therefore "),
    s({trig="iid", snippetType="snippet", condition = in_mathzone}, t"\\overset{\\text{i.i.d}}{\\sim}"),
    s({trig="sim", snippetType="snippet", condition = in_mathzone}, t"\\sim "),
    s({trig="too", snippetType="snippet", condition = in_mathzone}, { t"\\stackrel{", i(1), t"}{\\longrightarrow} ", i(2) }),
    s({trig="ts1", snippetType="snippet", condition = in_mathzone}, t"\\vdash "),
    s({trig="ts2", snippetType="snippet", condition = in_mathzone}, t"\\vDash "),
    s({trig="nts1", snippetType="snippet", condition = in_mathzone}, t"\\nvdash "),
    s({trig="nts2", snippetType="snippet", condition = in_mathzone}, t"\\nvDash "),
    s({trig="st", snippetType="snippet", condition = in_mathzone}, t"\\text{ s.t } "),
    s({trig="fa", snippetType="snippet", condition = in_mathzone}, t"\\forall"),
    s({trig="ss", snippetType="snippet", condition = in_mathzone}, t"\\subset"),
    s({trig="sseq", snippetType="snippet", condition = in_mathzone}, t"\\subseteq"),
    s({trig="sus", snippetType="snippet", condition = in_mathzone}, t"\\supset"),
    s({trig="sus", snippetType="snippet", condition = in_mathzone}, t"\\supseteq"),
    s({trig="no", snippetType="snippet", condition = in_mathzone}, t"\\not"),
    ----------------------------------------------------------------------
    -- Derivatives and Integrals
    ----------------------------------------------------------------------
    s({trig="par", snippetType="snippet", condition = in_mathzone}, { t"\\frac{\\partial ", i(1,"y"), t"}{\\partial ", i(2,"x"), t"}" }),
    s({trig="ddt", snippetType="snippet", condition = in_mathzone}, t"\\frac{d}{dt} "),
    s({trig="dint", snippetType="snippet", condition = in_mathzone}, { t"\\int_{ ", i(1,"a"), t"}^{", i(2,"b"), t"} ", i(3), t" \\, d", i(4,"x") }),
    s({trig="oint", snippetType="snippet", condition = in_mathzone}, t"\\oint"),
    s({trig="iint", snippetType="snippet", condition = in_mathzone}, t"\\iint"),
    s({trig="iiint", snippetType="snippet", condition = in_mathzone}, t"\\iiint"),
    ----------------------------------------------------------------------
    -- Brackets
    ----------------------------------------------------------------------
    s({trig="avg", snippetType="snippet", condition = in_mathzone}, { t"\\langle ", i(1), t" \\rangle ", i(0) }),
    s({trig="norm", snippetType="snippet", condition = in_mathzone}, { t"\\lvert ", i(1), t" \\rvert ", i(0) }),
    s({trig="Norm", snippetType="snippet", condition = in_mathzone}, { t"\\lVert ", i(1), t" \\rVert ", i(0) }),
    s({trig="ceil", snippetType="snippet", condition = in_mathzone}, { t"\\lceil ", i(1), t" \\rceil ", i(0) }),
    s({trig="floor", snippetType="snippet", condition = in_mathzone}, { t"\\lfloor ", i(1), t" \\rfloor ", i(0) }),
    s({trig="lr(", snippetType="snippet", condition = in_mathzone}, { t"\\left( ", i(1), t" \\right) ", i(0) }),
    s({trig="lr[", snippetType="snippet", condition = in_mathzone}, { t"\\left[ ", i(1), t" \\right] ", i(0) }),
    s({trig="lr{", snippetType="snippet", condition = in_mathzone}, { t"\\left\\{ ", i(1), t" \\right\\} ", i(0) }),
    s({trig="lr|", snippetType="snippet", condition = in_mathzone}, { t"\\left| ", i(1), t" \\right| ", i(0) }),
    s({trig="lra", snippetType="snippet", condition = in_mathzone}, { t"\\left< ", i(1), t" \\right> ", i(0) }),
    s({trig="db", snippetType="snippet", condition = in_mathzone}, { t"\\left\\llbracket ", i(1), t" \\right\\rrbracket ", i(0) }),
    ----------------------------------------------------------------------
    -- Environments
    ----------------------------------------------------------------------
    s({trig="pmat", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{pmatrix}}\n\t{}\n\\end{{pmatrix}}", {i(1)})),
    s({trig="bmat", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{bmatrix}}\n\t{}\n\\end{{bmatrix}}", {i(1)})),
    s({trig="Bmat", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{Bmatrix}}\n\t{}\n\\end{{Bmatrix}}", {i(1)})),
    s({trig="vmat", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{vmatrix}}\n\t{}\n\\end{{vmatrix}}", {i(1)})),
    s({trig="Vmat", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{Vmatrix}}\n\t{}\n\\end{{Vmatrix}}", {i(1)})),
    s({trig="cases", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{cases}}\n\t{}\n\\end{{cases}}", {i(1)})),
    s({trig="align", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{align*}}\n\t{}\n\\end{{align*}}", {i(1)})),
    s({trig="sys", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{array}}\n\t{}\n\\end{{array}}", {i(1)})),
    s({trig="bgeq", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{equation}}\n\t{}\n\\end{{equation}}", {i(1)})),
    s({trig="bgal", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{aligned}}\n\t{}\n\\end{{aligned}}", {i(1)})),
    s({trig="bgg", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{gather*}}\n\t{}\n\\end{{gather*}}", {i(1)})),
    s({trig="bgen", snippetType="snippet", condition = in_mathzone}, fmt("\\begin{{enumerate}}[(\t{})]\n\n\\end{{enumerate}}", {i(1)})),
    ----------------------------------------------------------------------
    -- Quantum Mechanics
    ----------------------------------------------------------------------
    s({trig="dag", snippetType="snippet", condition = in_mathzone}, t"^{\\dagger}"),
    s({trig="bra", snippetType="snippet", condition = in_mathzone}, { t"\\bra{", i(1), t"}" }),
    s({trig="ket", snippetType="snippet", condition = in_mathzone}, { t"\\ket{", i(1), t"}" }),
    s({trig="brk", snippetType="snippet", condition = in_mathzone}, { t"\\braket{", i(1), t"|", i(2), t"}" }),
    ----------------------------------------------------------------------
    -- Logic function
    ----------------------------------------------------------------------
    s({trig = "All(.)(.)", regTrig = true, condition = in_mathzone},{
    f(function(_, snip)
      local first_char = snip.captures[1]
      local second_char = snip.captures[2]
      return "\\text{All } " .. first_char .. " \\text{ are } " .. second_char
    end),
  }),
      s({trig = "Some(.)(.)", regTrig = true, condition = in_mathzone},{
    f(function(_, snip)
      local first_char = snip.captures[1]
      local second_char = snip.captures[2]
      return "\\text{Some } " .. first_char .. " \\text{ are } " .. second_char
    end),
  }),
      s({trig = "No(.)(.)", regTrig = true, condition = in_mathzone},{
    f(function(_, snip)
      local first_char = snip.captures[1]
      local second_char = snip.captures[2]
      return "\\text{No } " .. first_char .. " \\text{ are } " .. second_char
    end),
  }),
    ----------------------------------------------------------------------
    -- Text Mode Snippets
    ----------------------------------------------------------------------
    s({trig = "\"", snippetType = "snippet", condition = in_mathzone}, { t"\\text{", i(1), t"}", i(0) }),
    s({trig="!thm", snippetType="snippet", condition = out_mathzone}, { t"> [!theorem] ", i(1), t"\n> ", i(2) }),
    s({trig="!def", snippetType="snippet", condition = out_mathzone}, { t"> [!definition] ", i(1), t"\n> ", i(2) }),
    s({trig="!cor", snippetType="snippet", condition = out_mathzone}, { t"> [!corollary] ", i(1), t"\n> ", i(2) }),
    s({trig="!lem", snippetType="snippet", condition = out_mathzone}, { t"> [!lemma] ", i(1), t"\n> ", i(2) }),
    s({trig="proof", snippetType="snippet", condition = out_mathzone}, { t"`\\begin{proof}`\n", i(1), t"\n`\\end{proof}`" }),
}
return snippets
