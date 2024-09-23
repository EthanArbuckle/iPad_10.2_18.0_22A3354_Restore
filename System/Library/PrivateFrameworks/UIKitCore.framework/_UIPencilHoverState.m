@implementation _UIPencilHoverState

+ (_QWORD)_hoverStateFromHoverPose:(uint64_t)a1
{
  _UIPencilHoverState *v3;
  char *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  objc_opt_self();
  if (a2)
  {
    v3 = [_UIPencilHoverState alloc];
    if (v3)
    {
      v14.receiver = v3;
      v14.super_class = (Class)UIPencilHoverPose;
      v4 = (char *)objc_msgSendSuper2(&v14, sel_init);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)(a2 + 72);
        *(_OWORD *)(v4 + 56) = *(_OWORD *)(a2 + 56);
        *((_QWORD *)v4 + 9) = v6;
        objc_msgSend((id)a2, "zOffset");
        v5[1] = v7;
        objc_msgSend((id)a2, "azimuthAngle");
        v5[2] = v8;
        objc_msgSend((id)a2, "azimuthUnitVector");
        v5[5] = v9;
        v5[6] = v10;
        objc_msgSend((id)a2, "altitudeAngle");
        v5[3] = v11;
        objc_msgSend((id)a2, "rollAngle");
        v5[4] = v12;
        return v5;
      }
    }
    objc_msgSend((id)a2, "zOffset");
    objc_msgSend((id)a2, "azimuthAngle");
    objc_msgSend((id)a2, "azimuthUnitVector");
    objc_msgSend((id)a2, "altitudeAngle");
    objc_msgSend((id)a2, "rollAngle");
  }
  return 0;
}

- (_UIPencilHoverState)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPencilInteraction.m"), 367, CFSTR("%s: init is not allowed on %@"), "-[_UIPencilHoverState init]", objc_opt_class());

  return 0;
}

@end
