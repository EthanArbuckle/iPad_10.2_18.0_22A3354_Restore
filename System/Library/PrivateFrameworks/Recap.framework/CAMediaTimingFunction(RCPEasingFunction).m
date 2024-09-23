@implementation CAMediaTimingFunction(RCPEasingFunction)

- (double)rcp_solveForStart:()RCPEasingFunction end:at:
{
  double v7;
  float v8;

  v7 = a2;
  *(float *)&a2 = a6;
  objc_msgSend(a1, "_solveForInput:", a2);
  return v7 + (a4 - v7) * v8;
}

- (double)rcp_solveForDelta:()RCPEasingFunction withSteps:step:
{
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;

  *(float *)&a6 = (float)a9 / (float)a8;
  v12 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v14 = (float)((float)a9 + 1.0) / (float)a8;
  objc_msgSend(a1, "rcp_solveForStart:end:at:", *MEMORY[0x1E0C9D538], v13, a2, a3, a6);
  v16 = v15;
  *(float *)&v17 = v14;
  objc_msgSend(a1, "rcp_solveForStart:end:at:", v12, v13, a2, a3, v17);
  return v18 - v16;
}

- (id)rcp_functionWithLinearEnd
{
  double v1;
  double v2;
  double v3;
  double v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  objc_msgSend(a1, "getControlPointAtIndex:values:", 1, v6);
  LODWORD(v2) = HIDWORD(v6[0]);
  LODWORD(v1) = v6[0];
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v1, v2, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
