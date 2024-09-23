@implementation UIPencilHoverPose

- (UIPencilHoverPose)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPencilInteraction.m"), 267, CFSTR("%s: init is not allowed on %@"), "-[UIPencilHoverPose init]", objc_opt_class());

  return 0;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location3D.x;
  y = self->_location3D.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)-[UIPencilHoverPose debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIPencilHoverPose succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics())
  {
    v7 = (id)objc_msgSend(v3, "ui_appendPoint3D:withName:", CFSTR("location3D"), self->_location3D.x, self->_location3D.y, self->_location3D.z);
  }
  else
  {
    -[UIPencilHoverPose location](self, "location");
    v4 = (id)objc_msgSend(v3, "appendPoint:withName:", CFSTR("location"));
  }
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("zOffset"), 3, self->_zOffset);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIPencilHoverPose descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIPencilHoverPose descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  UIPencilHoverPose *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__UIPencilHoverPose_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

void __59__UIPencilHoverPose_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__UIPencilHoverPose_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

id __59__UIPencilHoverPose_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  int has_internal_diagnostics;
  double *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4 = *(void **)(a1 + 32);
  v3 = *(double **)(a1 + 40);
  if (has_internal_diagnostics)
  {
    v11 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendPoint3D:withName:", CFSTR("location3D"), v3[7], v3[8], v3[9]);
  }
  else
  {
    objc_msgSend(v3, "location");
    v5 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("location"));
  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("zOffset"), 3, *(double *)(*(_QWORD *)(a1 + 40) + 8));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("azimuthAngle"), 3, *(double *)(*(_QWORD *)(a1 + 40) + 16));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendVector:withName:decimalPrecision:", CFSTR("azimuthUnitVector"), 3, *(double *)(*(_QWORD *)(a1 + 40) + 40), *(double *)(*(_QWORD *)(a1 + 40) + 48));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("altitudeAngle"), 3, *(double *)(*(_QWORD *)(a1 + 40) + 24));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("rollAngle"), 3, *(double *)(*(_QWORD *)(a1 + 40) + 32));
}

- (double)zOffset
{
  return self->_zOffset;
}

- (double)azimuthAngle
{
  return self->_azimuthAngle;
}

- (CGVector)azimuthUnitVector
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_azimuthUnitVector.dx;
  dy = self->_azimuthUnitVector.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (double)altitudeAngle
{
  return self->_altitudeAngle;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

@end
