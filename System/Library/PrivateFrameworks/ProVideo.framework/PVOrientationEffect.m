@implementation PVOrientationEffect

- (PVOrientationEffect)initWithEffectID:(id)a3
{
  id v4;
  PVOrientationEffect *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVOrientationEffect;
  v5 = -[PVEffect initWithEffectID:](&v8, sel_initWithEffectID_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_orientationChangeRequest_, CFSTR("PVOrientationEffectChange"), 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PVOrientationEffect;
  -[PVEffect dealloc](&v4, sel_dealloc);
}

- (void)orientationChangeRequest:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "userInfo");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("seconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("alt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("inputID"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    v8 = -[PVOrientationEffect showAlt](self, "showAlt");
    -[PVOrientationEffect setShowAlt:](self, "setShowAlt:", objc_msgSend(v5, "BOOLValue"));
    -[PVOrientationEffect setOldShowAlt:](self, "setOldShowAlt:", v8);
    if (!v7)
      goto LABEL_6;
  }
  else if (!v6)
  {
    goto LABEL_7;
  }
  v9 = -[PVOrientationEffect inputID](self, "inputID");
  -[PVOrientationEffect setInputID:](self, "setInputID:", objc_msgSend(v7, "intValue"));
  -[PVOrientationEffect setOldInputID:](self, "setOldInputID:", v9 != 0);
LABEL_6:
  objc_msgSend(v4, "doubleValue");
  -[PVOrientationEffect setSwitchTime:](self, "setSwitchTime:");
LABEL_7:
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("timeDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    -[PVOrientationEffect setTimeNotificationDelegate:](self, "setTimeNotificationDelegate:", v11);
  }

}

- (void)setShowAlt:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  -[PVOrientationEffect animationTime](self, "animationTime");
  if (v5 > 0.0)
  {
    if (self->_showAlt != v3)
    {
      -[PVOrientationEffect setSwitchTime:](self, "setSwitchTime:", -1.0);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      goto LABEL_6;
    }
    -[PVOrientationEffect switchTime](self, "switchTime");
    if (v6 == -1.0)
    {
      v7 = 0.0;
LABEL_6:
      -[PVOrientationEffect setSwitchSetTime:](self, "setSwitchSetTime:", v7);
    }
  }
  self->_oldShowAlt = v3;
  self->_showAlt = v3;
}

- (void)setInputID:(unsigned int)a3
{
  double v5;

  -[PVOrientationEffect animationTime](self, "animationTime");
  if (v5 > 0.0 && self->_inputID != a3)
  {
    -[PVOrientationEffect setSwitchTime:](self, "setSwitchTime:", -1.0);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[PVOrientationEffect setSwitchSetTime:](self, "setSwitchSetTime:");
  }
  self->_oldInputID = a3;
  self->_inputID = a3;
}

- (id)inputsForTime:(id *)a3
{
  double Seconds;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CMTime v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *(CMTime *)a3;
  Seconds = CMTimeGetSeconds(&v11);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PVOrientationEffect switchTime](self, "switchTime");
  if (v6 <= Seconds)
    v7 = -[PVOrientationEffect inputID](self, "inputID");
  else
    v7 = -[PVOrientationEffect oldInputID](self, "oldInputID");
  objc_msgSend(v5, "numberWithUnsignedInt:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v6, CFSTR("FFEffectProperty_DisplayName"), CFSTR("Helium"), CFSTR("FFEffectProperty_Category"), CFSTR("effect.video.compositor"), CFSTR("FFEffectProperty_EffectType"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", a1, v10, v7);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v6, CFSTR("displayName"), CFSTR("BuiltIn"), CFSTR("contentGroup"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVContentRegistry sharedInstance](PVContentRegistry, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerContentClass:forID:type:withProperties:", objc_opt_class(), v10, CFSTR("effect.video.compositor"), v8);

}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGNode **v6;
  HGNode **v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double Seconds;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  float v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  HGNode *v46;
  HGHWMultiBlend *v47;
  unsigned int *v48;
  uint64_t v49;
  _BOOL4 v50;
  double v51;
  HGNode *v52;
  HGNode *v53;
  unsigned int v54;
  __n128 v55;
  HGNode *v56;
  char *v57;
  char *v58;
  HGNode *v59;
  CMTime v60;
  CMTime time;
  __int128 v62;
  int64_t var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v64;
  _QWORD v65[2];
  _QWORD v66[3];

  v11 = v6;
  v66[2] = *MEMORY[0x1E0C80C00];
  v64 = *a3;
  -[PVOrientationEffect inputsForTime:](self, "inputsForTime:", &v64, a4, a5);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "intValue");

  -[PVOrientationEffect timeNotificationDelegate](self, "timeNotificationDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = v15 == 0;

  if ((v12 & 1) == 0)
  {
    -[PVOrientationEffect timeNotificationDelegate](self, "timeNotificationDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    objc_msgSend(v16, "effectRenderedTime:", &v62);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = &unk_1E6648E68;
    v65[0] = CFSTR("seconds");
    v65[1] = CFSTR("timeDelegate");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("PVOrientationEffectChange"), 0, v19);

  }
  -[PVOrientationEffect animationTime](self, "animationTime");
  v20 = 1.0;
  if (v21 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v23 = v22;
    -[PVOrientationEffect switchSetTime](self, "switchSetTime");
    v25 = v24;
    -[PVOrientationEffect animationTime](self, "animationTime");
    v26 = v23 - v25;
    if (v26 < v27)
    {
      -[PVOrientationEffect switchTime](self, "switchTime");
      if (v28 == -1.0)
      {
        time = (CMTime)*a3;
        Seconds = CMTimeGetSeconds(&time);
        if (Seconds == 0.0)
        {
          -[PVOrientationEffect animationTime](self, "animationTime");
          v30 = -v31;
        }
        else
        {
          v30 = Seconds - v26;
        }
        -[PVOrientationEffect setSwitchTime:](self, "setSwitchTime:", v30);
      }
      v60 = (CMTime)*a3;
      v32 = CMTimeGetSeconds(&v60);
      -[PVOrientationEffect switchTime](self, "switchTime");
      v34 = v33;
      -[PVOrientationEffect animationTime](self, "animationTime");
      v36 = (v32 - v34) / v35;
      if (v36 >= 0.0 && v36 <= 1.0)
      {
        v38 = (float)(1.0 - v36) * 3.14159265;
        v20 = cosf(v38) * 0.5 + 0.5;
      }
    }
  }
  v39 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
  v41 = v40;
  v42 = (*(float (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj);
  v43 = v39 * v42 * 0.5;
  v44 = v41 * v42 * 0.5;
  if (v20 == 1.0)
  {
    if (-[PVOrientationEffect showAlt](self, "showAlt"))
    {
      LODWORD(v45) = 1.0;
      -[PVOrientationEffect rotationNodeForPercent:atCenter:](self, "rotationNodeForPercent:atCenter:", v45, v43, v44);
      PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, v14, &v59);
      (*(void (**)(char *, _QWORD, HGNode *))(*(_QWORD *)v57 + 120))(v57, 0, v59);
      v46 = v59;
      if (v59)
        v46 = (HGNode *)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v59 + 24))(v59);
      *v11 = (HGNode *)v57;
    }
    else
    {
      return (HGRef<HGNode>)PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, v14, v11);
    }
    return (HGRef<HGNode>)v46;
  }
  v47 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
  HGHWMultiBlend::HGHWMultiBlend(v47);
  PVInputHGNodeMap<unsigned int>::MapKeys(a4, &v57);
  v48 = (unsigned int *)v57;
  if (v57 != v58)
  {
    while (1)
    {
      v49 = *v48;
      PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, *v48, &v59);
      v50 = -[PVOrientationEffect showAlt](self, "showAlt");
      if (v50 != -[PVOrientationEffect oldShowAlt](self, "oldShowAlt"))
      {
        *(float *)&v51 = v20;
        -[PVOrientationEffect rotationNodeForPercent:atCenter:](self, "rotationNodeForPercent:atCenter:", v51, v43, v44);
        (*(void (**)(HGNode *, _QWORD, HGNode *))(*(_QWORD *)v56 + 120))(v56, 0, v59);
        v52 = v59;
        v53 = v56;
        if (v59 != v56)
        {
          if (v59)
          {
            (*(void (**)(void))(*(_QWORD *)v59 + 24))();
            v53 = v56;
          }
          v59 = v53;
          if (!v53)
            goto LABEL_30;
          (*(void (**)(HGNode *))(*(_QWORD *)v53 + 16))(v53);
          v52 = v56;
        }
        if (v52)
          (*(void (**)(HGNode *))(*(_QWORD *)v52 + 24))(v52);
      }
LABEL_30:
      v54 = -[PVOrientationEffect inputID](self, "inputID");
      v55.n128_f32[0] = v20;
      if (v54 != (_DWORD)v49)
      {
        if (-[PVOrientationEffect oldInputID](self, "oldInputID", v55.n128_f64[0]) == (_DWORD)v49)
          v55.n128_f32[0] = 1.0 - v20;
        else
          v55.n128_f32[0] = 0.0;
      }
      (*(void (**)(HGHWMultiBlend *, uint64_t, HGNode *, uint64_t, __n128))(*(_QWORD *)v47 + 624))(v47, v49, v59, 9, v55);
      v46 = v59;
      if (v59)
        v46 = (HGNode *)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v59 + 24))(v59);
      if (++v48 == (unsigned int *)v58)
      {
        v48 = (unsigned int *)v57;
        break;
      }
    }
  }
  *v11 = (HGNode *)v47;
  if (v48)
  {
    v58 = (char *)v48;
    operator delete(v48);
  }
  return (HGRef<HGNode>)v46;
}

- (HGRef<HGXForm>)rotationNodeForPercent:(float)a3 atCenter:(CGPoint)a4
{
  HGXForm **v4;
  double y;
  double x;
  HGXForm **v9;
  _BOOL4 v10;
  float v11;
  HGXForm *v12;
  HGRef<HGXForm> v13;
  _BYTE v14[144];

  y = a4.y;
  x = a4.x;
  v9 = v4;
  HGTransform::HGTransform((HGTransform *)v14);
  HGTransform::Translate((HGTransform *)v14, -x, -y, 0.0);
  v10 = -[PVOrientationEffect showAlt](self, "showAlt");
  v11 = 1.0 - a3;
  if (v10)
    v11 = a3;
  HGTransform::Rotate((HGTransform *)v14, (float)(v11 * -90.0), 0.0, 0.0, 1.0);
  HGTransform::Translate((HGTransform *)v14, x, y, 0.0);
  v12 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v12);
  *v9 = v12;
  (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v12 + 576))(v12, v14);
  HGTransform::~HGTransform((HGTransform *)v14);
  return v13;
}

- (BOOL)showAlt
{
  return self->_showAlt;
}

- (unsigned)inputID
{
  return self->_inputID;
}

- (double)animationTime
{
  return self->_animationTime;
}

- (void)setAnimationTime:(double)a3
{
  self->_animationTime = a3;
}

- (double)switchTime
{
  return self->_switchTime;
}

- (void)setSwitchTime:(double)a3
{
  self->_switchTime = a3;
}

- (double)switchSetTime
{
  return self->_switchSetTime;
}

- (void)setSwitchSetTime:(double)a3
{
  self->_switchSetTime = a3;
}

- (BOOL)oldShowAlt
{
  return self->_oldShowAlt;
}

- (void)setOldShowAlt:(BOOL)a3
{
  self->_oldShowAlt = a3;
}

- (int)oldInputID
{
  return self->_oldInputID;
}

- (void)setOldInputID:(int)a3
{
  self->_oldInputID = a3;
}

- (PVEffectTimeNotificationDelegate)timeNotificationDelegate
{
  return (PVEffectTimeNotificationDelegate *)objc_loadWeakRetained((id *)&self->_timeNotificationDelegate);
}

- (void)setTimeNotificationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_timeNotificationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_timeNotificationDelegate);
}

@end
