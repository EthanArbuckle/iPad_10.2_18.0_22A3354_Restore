@implementation UIFloatCompoundSpringIntegrator

+ ($22447E269F592A6BAB60C6B6905FC588)advanceParametersWithState:(SEL)a3 springParameters:(id *)a4 deltaTime:(id *)a5
{
  double var0;
  double var1;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  double v18;
  double v19;
  $F24F406B2B787EFB06265DBA3D28CBD5 v20;
  __int128 v21;
  __int128 v22;

  if (!a5->var3)
  {
    var0 = a4->var0.var0;
    var1 = a4->var0.var1;
    v12 = *(_OWORD *)&a5->var0.var2;
    v21 = *(_OWORD *)&a5->var0.var0;
    v22 = v12;
    result = ($22447E269F592A6BAB60C6B6905FC588 *)+[UIFloatSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v21, var0, var1, a6);
    a4->var0.var0 = v13;
    a4->var0.var1 = v14;
  }
  if (!a5->var4)
  {
    v15 = a4->var1.var0;
    v16 = a4->var1.var1;
    v17 = *(_OWORD *)&a5->var1.var2;
    v21 = *(_OWORD *)&a5->var1.var0;
    v22 = v17;
    result = ($22447E269F592A6BAB60C6B6905FC588 *)+[UIFloatSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v21, v15, v16, a6);
    a4->var1.var0 = v18;
    a4->var1.var1 = v19;
  }
  v20 = a4->var1;
  retstr->var0 = a4->var0;
  retstr->var1 = v20;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&a4->var2;
  return result;
}

+ ($9C1DAAB1EE9F2972F3CD6243B83D231A)integrateWithState:(SEL)a3 springParameters:(id *)a4 deltaTime:(id *)a5
{
  double var0;
  double var1;
  __int128 v12;
  double v13;
  int64_t var3;
  double v15;
  double v16;
  $9C1DAAB1EE9F2972F3CD6243B83D231A *result;
  double v18;
  double v19;
  $F24F406B2B787EFB06265DBA3D28CBD5 v20;
  $F24F406B2B787EFB06265DBA3D28CBD5 v21;
  _BYTE v22[32];

  var0 = a4->var0.var0;
  if (!a5->var5)
  {
    var1 = a4->var0.var1;
    v12 = *(_OWORD *)&a5->var2.var2;
    *(_OWORD *)v22 = *(_OWORD *)&a5->var2.var0;
    *(_OWORD *)&v22[16] = v12;
    +[UIFloatSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatSpringIntegrator, "integrateWithState:springParameters:deltaTime:", v22, var0, var1, a6);
    a4->var0.var0 = var0;
    a4->var0.var1 = v13;
  }
  var3 = a5->var2.var3;
  v16 = a4->var1.var0;
  v15 = a4->var1.var1;
  *(double *)v22 = var0;
  *(_OWORD *)&v22[8] = *(_OWORD *)&a4->var2.var2;
  *(_QWORD *)&v22[24] = var3;
  result = ($9C1DAAB1EE9F2972F3CD6243B83D231A *)+[UIFloatSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatSpringIntegrator, "integrateWithState:springParameters:deltaTime:", v22, v16, v15, a6);
  a4->var1.var0 = v18;
  a4->var1.var1 = v19;
  v20 = a4->var2.var1;
  retstr->var2.var0 = a4->var2.var0;
  retstr->var2.var1 = v20;
  *(_OWORD *)&retstr->var2.var2 = *(_OWORD *)&a4->var2.var2;
  v21 = a4->var1;
  retstr->var0 = a4->var0;
  retstr->var1 = v21;
  return result;
}

@end
