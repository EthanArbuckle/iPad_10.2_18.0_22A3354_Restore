@implementation UIPencilInteraction

+ (UIPencilPreferredAction)preferredTapAction
{
  return +[_UIPencilPreferences preferredTapAction]();
}

+ (BOOL)prefersPencilOnlyDrawing
{
  return +[_UIPencilPreferences prefersPencilOnlyDrawing]();
}

+ (int64_t)preferredSqueezeAction
{
  return +[_UIPencilPreferences preferredSqueezeAction]();
}

+ (void)_setPrefersPencilOnlyDrawing:(BOOL)a3
{
  +[_UIPencilPreferences setPrefersPencilOnlyDrawing:]((uint64_t)_UIPencilPreferences, a3);
}

+ (BOOL)prefersHoverToolPreview
{
  return +[_UIPencilPreferences prefersHoverToolPreview]();
}

+ (BOOL)hasUsedPassivePencil
{
  return +[_UIPencilPreferences hasUsedPassivePencil]();
}

+ (void)_setHasUsedPassivePencil:(BOOL)a3
{
  +[_UIPencilPreferences setHasUsedPassivePencil:]((uint64_t)_UIPencilPreferences, a3);
}

+ (BOOL)hasSeenPencilPairingUI
{
  return +[_UIPencilPreferences hasSeenPencilPairingUI]();
}

- (UIPencilInteraction)init
{
  UIPencilInteraction *result;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPencilInteraction;
  result = -[UIPencilInteraction init](&v4, sel_init);
  if (result)
  {
    result->_enabled = 1;
    v3 = MEMORY[0x1E0CD2538];
    *(_OWORD *)&result->_lastKnownHoverLocation3D.x = *MEMORY[0x1E0CD2538];
    result->_lastKnownHoverLocation3D.z = *(double *)(v3 + 16);
  }
  return result;
}

- (UIPencilInteraction)initWithDelegate:(id)a3
{
  UIPencilInteraction *v4;
  UIPencilInteraction *v5;

  v4 = -[UIPencilInteraction init](self, "init");
  v5 = v4;
  if (v4)
    -[UIPencilInteraction setDelegate:](v4, "setDelegate:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPencilInteraction _unregisterFromEvent]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)UIPencilInteraction;
  -[UIPencilInteraction dealloc](&v3, sel_dealloc);
}

- (void)_unregisterFromEvent
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = 0x1E1764CA0;
    v5[1] = 0x1E1764CC0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNotificationCenter _uiRemoveObserver:names:](v2, (void *)a1, v3);

    *(_BYTE *)(a1 + 8) &= ~2u;
    objc_msgSend(*(id *)(a1 + 24), "invalidate");
    v4 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

- (unint64_t)_dispatchBehavior
{
  return 0;
}

- (void)setDelegate:(id)delegate
{
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 4;
  else
    v5 = 0;
  *(_BYTE *)&self->_interactionFlags = *(_BYTE *)&self->_interactionFlags & 0xFB | v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 8;
  else
    v6 = 0;
  *(_BYTE *)&self->_interactionFlags = *(_BYTE *)&self->_interactionFlags & 0xF7 | v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 16;
  else
    v7 = 0;
  *(_BYTE *)&self->_interactionFlags = *(_BYTE *)&self->_interactionFlags & 0xEF | v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 32;
  else
    v8 = 0;
  *(_BYTE *)&self->_interactionFlags = *(_BYTE *)&self->_interactionFlags & 0xDF | v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 64;
  else
    v9 = 0;
  *(_BYTE *)&self->_interactionFlags = *(_BYTE *)&self->_interactionFlags & 0xBF | v9;
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)_sendTapFromEvent:(_BYTE *)a1
{
  void *v4;
  unint64_t v5;
  void *v6;
  UIPencilInteractionTap *v7;
  double v8;
  void *v9;
  unint64_t v10;
  void *v11;
  _UIPencilInteractionTap *v12;
  double v13;
  id *v14;
  id *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BYTE *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  id v25;
  void *v26;
  objc_class *v27;
  void *v28;
  __CFString *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _BYTE *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  id v38;
  void *v39;
  objc_class *v40;
  void *v41;
  __CFString *v42;
  NSObject *v43;
  void *v44;
  _BYTE *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  objc_class *v52;
  void *v53;
  __CFString *v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  __CFString *v58;
  __int16 v59;
  __CFString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a1[8] & 8) != 0)
    {
      -[UIPencilInteraction _hoverPoseForEvent:]((uint64_t)a1, a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v7 = [UIPencilInteractionTap alloc];
      objc_msgSend(a2, "timestamp");
      v9 = -[UIPencilInteractionTap _initWithTimestamp:hoverPose:](v7, v6, v8);

      v10 = qword_1ECD80108;
      if (!qword_1ECD80108)
      {
        v10 = __UILogCategoryGetNode("PencilInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD80108);
      }
      if ((*(_BYTE *)v10 & 1) != 0)
      {
        v17 = *(id *)(v10 + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "succinctDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x1E0CB3940];
          v20 = a1;
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v22, v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v23;
          v25 = v4;
          if (v25)
          {
            v26 = (void *)MEMORY[0x1E0CB3940];
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@: %p>"), v28, v25);
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v29 = CFSTR("(nil)");
          }

          *(_DWORD *)buf = 138412802;
          v56 = v18;
          v57 = 2112;
          v58 = v24;
          v59 = 2112;
          v60 = v29;
          _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Calling pencilInteraction:didReceiveTap: %@; interaction: %@; delegate: %@",
            buf,
            0x20u);

        }
      }
      objc_msgSend(v4, "pencilInteraction:didReceiveTap:", a1, v9);
    }
    else
    {
      if ((a1[8] & 0x10) == 0)
      {
        if ((a1[8] & 4) != 0)
        {
          v5 = qword_1ECD80118;
          if (!qword_1ECD80118)
          {
            v5 = __UILogCategoryGetNode("PencilInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v5, (unint64_t *)&qword_1ECD80118);
          }
          if ((*(_BYTE *)v5 & 1) != 0)
          {
            v43 = *(id *)(v5 + 8);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              v44 = (void *)MEMORY[0x1E0CB3940];
              v45 = a1;
              v46 = (objc_class *)objc_opt_class();
              NSStringFromClass(v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "stringWithFormat:", CFSTR("<%@: %p>"), v47, v45);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              v49 = v48;
              v50 = v4;
              if (v50)
              {
                v51 = (void *)MEMORY[0x1E0CB3940];
                v52 = (objc_class *)objc_opt_class();
                NSStringFromClass(v52);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "stringWithFormat:", CFSTR("<%@: %p>"), v53, v50);
                v54 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v54 = CFSTR("(nil)");
              }

              *(_DWORD *)buf = 138412546;
              v56 = v49;
              v57 = 2112;
              v58 = v54;
              _os_log_impl(&dword_185066000, v43, OS_LOG_TYPE_ERROR, "Calling pencilInteractionDidTap: %@; delegate: %@",
                buf,
                0x16u);

            }
          }
          objc_msgSend(v4, "pencilInteractionDidTap:", a1);
        }
        goto LABEL_21;
      }
      -[UIPencilInteraction _hoverPoseForEvent:]((uint64_t)a1, a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIPencilHoverState _hoverStateFromHoverPose:]((uint64_t)_UIPencilHoverState, (uint64_t)v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v12 = [_UIPencilInteractionTap alloc];
      objc_msgSend(a2, "timestamp");
      if (v12)
      {
        v14 = -[UIPencilInteractionTap _initWithTimestamp:hoverPose:](v12, v11, v13);
        v15 = v14;
        if (v14)
          objc_storeStrong(v14 + 3, v11);
      }
      else
      {
        v15 = 0;
      }

      v16 = qword_1ECD80110;
      if (!qword_1ECD80110)
      {
        v16 = __UILogCategoryGetNode("PencilInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD80110);
      }
      if ((*(_BYTE *)v16 & 1) != 0)
      {
        v30 = *(id *)(v16 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v15, "succinctDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)MEMORY[0x1E0CB3940];
          v33 = a1;
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("<%@: %p>"), v35, v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = v36;
          v38 = v4;
          if (v38)
          {
            v39 = (void *)MEMORY[0x1E0CB3940];
            v40 = (objc_class *)objc_opt_class();
            NSStringFromClass(v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "stringWithFormat:", CFSTR("<%@: %p>"), v41, v38);
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v42 = CFSTR("(nil)");
          }

          *(_DWORD *)buf = 138412802;
          v56 = v31;
          v57 = 2112;
          v58 = v37;
          v59 = 2112;
          v60 = v42;
          _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "Calling _pencilInteraction:didReceiveTap: %@; interaction: %@; delegate: %@",
            buf,
            0x20u);

        }
      }
      objc_msgSend(v4, "_pencilInteraction:didReceiveTap:", a1, v15);

    }
LABEL_21:

  }
}

- (UIPencilHoverPose)_hoverPoseForEvent:(uint64_t)a1
{
  uint64_t v3;
  BOOL v4;
  char v5;
  UIPencilHoverPose *v6;
  char v7;
  double v8;
  objc_super v10;

  v3 = objc_msgSend(a2, "subtype");
  v4 = v3 != 251;
  if ((unint64_t)(objc_msgSend(*(id *)(a1 + 40), "state") - 4) >= 0xFFFFFFFFFFFFFFFDLL)
    v4 = 0;
  if (v3 == 251)
    v5 = CAPoint3DEqualToPoint();
  else
    v5 = 0;
  v6 = 0;
  if (*(_QWORD *)(a1 + 40))
    v7 = v4;
  else
    v7 = 1;
  if ((v7 & 1) == 0 && (v5 & 1) == 0)
  {
    v6 = [UIPencilHoverPose alloc];
    if (v6)
    {
      v10.receiver = v6;
      v10.super_class = (Class)UIPencilHoverPose;
      v6 = (UIPencilHoverPose *)objc_msgSendSuper2(&v10, sel_init);
      if (v6)
      {
        v8 = *(double *)(a1 + 120);
        *(_OWORD *)&v6->_location3D.x = *(_OWORD *)(a1 + 104);
        v6->_location3D.z = v8;
        v6->_zOffset = *(double *)(a1 + 48);
        v6->_azimuthAngle = *(double *)(a1 + 56);
        v6->_azimuthUnitVector = *(CGVector *)(a1 + 88);
        v6->_altitudeAngle = *(double *)(a1 + 64);
        v6->_rollAngle = *(double *)(a1 + 72);
      }
    }
  }
  return v6;
}

- (void)_sendSqueezeFromEvent:(_BYTE *)a1
{
  void *v4;
  void *v5;
  void *v6;
  _UIPencilInteractionSqueeze *v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  UIPencilInteractionSqueeze *v14;
  double v15;
  uint64_t v16;
  double v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  _BYTE *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _BYTE *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  objc_class *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPencilInteraction _hoverPoseForEvent:]((uint64_t)a1, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a1[8] & 0x20) != 0)
    {
      objc_opt_self();
      v14 = [UIPencilInteractionSqueeze alloc];
      objc_msgSend(a2, "timestamp");
      if (a2)
      {
        v16 = *((_QWORD *)a2 + 19);
        v17 = a2[20];
      }
      else
      {
        v16 = 0;
        v17 = 0.0;
      }
      v12 = (void *)-[UIPencilInteractionSqueeze _initWithTimestamp:eventPhase:normalizedForceVelocity:hoverPose:](v14, v16, v5, v15, v17);
      v18 = qword_1ECD80120;
      if (!qword_1ECD80120)
      {
        v18 = __UILogCategoryGetNode("PencilInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&qword_1ECD80120);
      }
      if ((*(_BYTE *)v18 & 1) != 0)
      {
        v19 = *(id *)(v18 + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "succinctDescription");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x1E0CB3940];
          v21 = a1;
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p>"), v23, v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v24;
          v26 = v4;
          if (v26)
          {
            v27 = (void *)MEMORY[0x1E0CB3940];
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v26;
            objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p>"), v29, v26);
            v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v30 = 0;
            v31 = CFSTR("(nil)");
          }

          *(_DWORD *)buf = 138412802;
          v47 = v45;
          v48 = 2112;
          v49 = v25;
          v50 = 2112;
          v51 = v31;
          _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Calling pencilInteraction:didReceiveSqueeze: %@; interaction: %@; delegate: %@",
            buf,
            0x20u);

        }
      }
      objc_msgSend(v4, "pencilInteraction:didReceiveSqueeze:", a1, v12);
      goto LABEL_18;
    }
    if ((a1[8] & 0x40) == 0)
    {
LABEL_19:

      return;
    }
    +[_UIPencilHoverState _hoverStateFromHoverPose:]((uint64_t)_UIPencilHoverState, (uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v7 = [_UIPencilInteractionSqueeze alloc];
    objc_msgSend(a2, "timestamp");
    if (a2)
    {
      v9 = *((_QWORD *)a2 + 19);
      v10 = a2[20];
      if (v7)
        goto LABEL_6;
    }
    else
    {
      v9 = 0;
      v10 = 0.0;
      if (v7)
      {
LABEL_6:
        v11 = -[UIPencilInteractionSqueeze _initWithTimestamp:eventPhase:normalizedForceVelocity:hoverPose:](v7, v9, v6, v8, v10);
        v12 = (void *)v11;
        if (v11)
          objc_storeStrong((id *)(v11 + 40), v6);
        goto LABEL_8;
      }
    }
    v12 = 0;
LABEL_8:

    v13 = qword_1ECD80128;
    if (!qword_1ECD80128)
    {
      v13 = __UILogCategoryGetNode("PencilInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&qword_1ECD80128);
    }
    if ((*(_BYTE *)v13 & 1) != 0)
    {
      v32 = *(id *)(v13 + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "succinctDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0CB3940];
        v35 = a1;
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("<%@: %p>"), v37, v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = v38;
        v40 = v4;
        if (v40)
        {
          v41 = (void *)MEMORY[0x1E0CB3940];
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringWithFormat:", CFSTR("<%@: %p>"), v43, v40);
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v44 = CFSTR("(nil)");
        }

        *(_DWORD *)buf = 138412802;
        v47 = v33;
        v48 = 2112;
        v49 = v39;
        v50 = 2112;
        v51 = v44;
        _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "Calling _pencilInteraction:didReceiveSqueeze: %@; interaction: %@; delegate: %@",
          buf,
          0x20u);

      }
    }
    objc_msgSend(v4, "_pencilInteraction:didReceiveSqueeze:", a1, v12);
LABEL_18:

    goto LABEL_19;
  }
}

- (void)_performCallbacksWithEvent:(_BYTE *)a1
{
  uint64_t v4;

  if (!a1)
    return;
  v4 = objc_msgSend(a2, "subtype");
  if (v4 == 251)
  {
    -[UIPencilInteraction _sendSqueezeFromEvent:](a1, (double *)a2);
    if (!a2)
      return;
    goto LABEL_8;
  }
  if (v4 == 250)
    -[UIPencilInteraction _sendTapFromEvent:](a1, a2);
  if (a2)
  {
LABEL_8:
    if ((unint64_t)(a2[19] - 3) <= 1)
      -[UIPencilInteraction _updateLastKnownHoverStateFromGesture:]((uint64_t)a1, 0);
  }
}

- (uint64_t)_updateLastKnownHoverStateFromGesture:(uint64_t)result
{
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (result)
  {
    v3 = result;
    if (a2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(result + 16));
      objc_msgSend(a2, "_location3DInView:", WeakRetained);
      *(_QWORD *)(v3 + 104) = v5;
      *(_QWORD *)(v3 + 112) = v6;
      *(_QWORD *)(v3 + 120) = v7;

    }
    else
    {
      v8 = MEMORY[0x1E0CD2538];
      *(_OWORD *)(result + 104) = *MEMORY[0x1E0CD2538];
      *(_QWORD *)(result + 120) = *(_QWORD *)(v8 + 16);
    }
    objc_msgSend(a2, "zOffset");
    *(_QWORD *)(v3 + 48) = v9;
    v10 = objc_loadWeakRetained((id *)(v3 + 16));
    objc_msgSend(a2, "azimuthAngleInView:", v10);
    *(_QWORD *)(v3 + 56) = v11;

    v12 = objc_loadWeakRetained((id *)(v3 + 16));
    objc_msgSend(a2, "azimuthUnitVectorInView:", v12);
    *(_QWORD *)(v3 + 88) = v13;
    *(_QWORD *)(v3 + 96) = v14;

    objc_msgSend(a2, "altitudeAngle");
    *(_QWORD *)(v3 + 64) = v15;
    result = objc_msgSend(a2, "_rollAngle");
    *(_QWORD *)(v3 + 72) = v16;
  }
  return result;
}

- (BOOL)_shouldReceiveGestureType:(unint64_t)a3
{
  return 1;
}

- (uint64_t)_internalShouldReceiveEvent:(_BYTE *)a1
{
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    v3 = objc_msgSend(a2, "subtype");
    if (v3 == 250)
    {
      if ((a1[8] & 0x1C) != 0)
      {
        v4 = 0;
        return objc_msgSend(a1, "_shouldReceiveGestureType:", v4);
      }
    }
    else if (v3 == 251 && (a1[8] & 0x60) != 0)
    {
      v4 = 1;
      return objc_msgSend(a1, "_shouldReceiveGestureType:", v4);
    }
  }
  return 0;
}

- (void)_handleHoverGestureRecognizer:(id)a3
{
  void *hoverGestureRecognizer;
  uint64_t v5;
  void *v7;

  hoverGestureRecognizer = a3;
  if (self->_hoverGestureRecognizer != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPencilInteraction.m"), 925, CFSTR("%s: Received updates from an unknown hover gesture recognizer: %@"), "-[UIPencilInteraction _handleHoverGestureRecognizer:]", hoverGestureRecognizer);

    hoverGestureRecognizer = self->_hoverGestureRecognizer;
  }
  v5 = objc_msgSend(hoverGestureRecognizer, "state");
  if (v5 < 3 || v5 == 4)
    -[UIPencilInteraction _updateLastKnownHoverStateFromGesture:]((uint64_t)self, self->_hoverGestureRecognizer);
}

- (void)_installHoverGestureIfNeeded
{
  id *v2;
  id WeakRetained;
  UIHoverGestureRecognizer *v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    v2 = (id *)(a1 + 16);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

    if (WeakRetained)
    {
      if (!*(_QWORD *)(a1 + 40))
      {
        v4 = -[UIHoverGestureRecognizer initWithTarget:action:]([UIHoverGestureRecognizer alloc], "initWithTarget:action:", a1, sel__handleHoverGestureRecognizer_);
        v5 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v4;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pencilInteraction.hover.%p"), a1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setName:", v6);

        objc_msgSend(*(id *)(a1 + 40), "setDelegate:", a1);
        -[UIHoverGestureRecognizer _setAllowedTouchTypes:](*(id *)(a1 + 40), (uint64_t)&unk_1E1A94850);
      }
      v7 = objc_loadWeakRetained(v2);
      objc_msgSend(v7, "addGestureRecognizer:", *(_QWORD *)(a1 + 40));

    }
  }
}

- (void)_uninstallHoverGestureIfNeeded
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;

  if (a1)
  {
    v2 = (id *)(a1 + 16);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    if (WeakRetained)
    {
      v4 = *(_QWORD *)(a1 + 40);

      if (v4)
      {
        -[UIPencilInteraction _updateLastKnownHoverStateFromGesture:](a1, 0);
        v5 = objc_loadWeakRetained(v2);
        objc_msgSend(v5, "removeGestureRecognizer:", *(_QWORD *)(a1 + 40));

        v6 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = 0;

      }
    }
  }
}

- (void)_registerWithEventIfAble
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "_window");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_windowHostingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE *)(a1 + 8);
    if (v3)
    {
      *(_BYTE *)(a1 + 8) = v4 & 0xFD;
      objc_msgSend((id)UIApp, "_mainEventEnvironment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[UIEventEnvironment _pencilEventForWindow:](v5, v10);

      -[_UIPencilEvent registerInteraction:]((uint64_t)v6, a1);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v7;

      if ((v4 & 2) != 0)
      {
LABEL_9:

        return;
      }
    }
    else
    {
      if (!v10)
        goto LABEL_9;
      *(_BYTE *)(a1 + 8) = v4 | 2;
      if ((v4 & 2) != 0)
        goto LABEL_9;
    }
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel__windowWillMoveToScene_, 0x1E1764CA0, v10);
      objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel__windowDidMoveToScene_, 0x1E1764CC0, v10);

    }
    goto LABEL_9;
  }
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    if (enabled)
    {
      -[UIPencilInteraction _installHoverGestureIfNeeded]((uint64_t)self);
      -[UIPencilInteraction _registerWithEventIfAble]((uint64_t)self);
    }
    else
    {
      -[UIPencilInteraction _uninstallHoverGestureIfNeeded]((uint64_t)self);
      -[UIPencilInteraction _unregisterFromEvent]((uint64_t)self);
    }
  }
}

- (void)willMoveToView:(id)a3
{
  if (self)
  {
    -[UIPencilInteraction _uninstallHoverGestureIfNeeded]((uint64_t)self);
    -[UIPencilInteraction _unregisterFromEvent]((uint64_t)self);
  }
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  id v5;
  _BOOL4 enabled;

  v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    enabled = self->_enabled;

    if (enabled)
    {
      -[UIPencilInteraction _installHoverGestureIfNeeded]((uint64_t)self);
      -[UIPencilInteraction _registerWithEventIfAble]((uint64_t)self);
    }
  }
}

- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4
{
  void *v7;
  void *v8;

  if (self->_enabled)
  {
    objc_msgSend(a4, "_windowHostingScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_eventRegistrationToken)
    {
      if (a3 && a4 && v7)
      {
        *(_BYTE *)&self->_interactionFlags |= 1u;
      }
      else if (a4 && v7)
      {
        goto LABEL_11;
      }
      v8 = v7;
      -[UIPencilInteraction _unregisterFromEvent]((uint64_t)self);
      v7 = v8;
    }
LABEL_11:

  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v7;
  BSInvalidatable *eventRegistrationToken;
  unsigned __int8 interactionFlags;
  int v10;
  BOOL v11;
  int v14;
  id v16;

  if (self->_enabled)
  {
    objc_msgSend(a3, "_windowHostingScene");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a4, "_windowHostingScene");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    eventRegistrationToken = self->_eventRegistrationToken;
    interactionFlags = self->_interactionFlags;
    v10 = (a3 != 0) & interactionFlags;
    if (!a4)
      v10 = 0;
    if (!((unint64_t)a3 | (unint64_t)eventRegistrationToken))
      v10 = 1;
    if (eventRegistrationToken)
      v11 = v16 == 0;
    else
      v11 = 1;
    v14 = !v11 && v7 != 0 && v16 != v7;
    if (v10 != 1 || v7 == 0)
    {
      if (a3 || !a4 || eventRegistrationToken || v7)
      {
        if (!v14)
        {
LABEL_31:

          return;
        }
        -[UIPencilInteraction _unregisterFromEvent]((uint64_t)self);
      }
    }
    else
    {
      *(_BYTE *)&self->_interactionFlags = interactionFlags & 0xFE;
    }
    -[UIPencilInteraction _registerWithEventIfAble]((uint64_t)self);
    goto LABEL_31;
  }
}

- (void)_windowWillMoveToScene:(id)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  BSInvalidatable *eventRegistrationToken;
  BSInvalidatable *v10;
  uint64_t v11;

  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(a3, "object");
  v11 = objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)v11;
  if (v7 == (void *)v11)
  {
    eventRegistrationToken = self->_eventRegistrationToken;
    if (eventRegistrationToken)
    {
      -[BSInvalidatable invalidate](eventRegistrationToken, "invalidate");
      v10 = self->_eventRegistrationToken;
      self->_eventRegistrationToken = 0;

      v8 = (void *)v11;
      *(_BYTE *)&self->_interactionFlags |= 2u;
    }
  }
LABEL_8:

}

- (void)_windowDidMoveToScene:(id)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;

  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "object");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
    if (v9)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(WeakRetained, "_window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
      if (v8 == (void *)v9 && !self->_eventRegistrationToken && (*(_BYTE *)&self->_interactionFlags & 2) != 0)
      {
        -[UIPencilInteraction _registerWithEventIfAble]((uint64_t)self);
        v6 = (void *)v9;
      }
    }
  }
  else
  {

    v6 = 0;
  }

}

- (NSString)debugDescription
{
  return (NSString *)-[UIPencilInteraction debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIPencilInteraction succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  void *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  id v10;
  id WeakRetained;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  id v17;
  unint64_t cachedDispatchBehavior;
  const __CFString *v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_enabled, CFSTR("enabled"));
  v5 = objc_loadWeakRetained((id *)&self->_view);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v5);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("(nil)");
  }

  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("view"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v12);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = CFSTR("(nil)");
    }

    v17 = (id)objc_msgSend(v3, "appendObject:withName:", v16, CFSTR("delegate"));
  }
  if (os_variant_has_internal_diagnostics())
  {
    if ((*(_BYTE *)&self->_interactionFlags & 0x80000000) != 0)
    {
      cachedDispatchBehavior = self->_cachedDispatchBehavior;
    }
    else
    {
      cachedDispatchBehavior = -[UIPencilInteraction _dispatchBehavior](self, "_dispatchBehavior");
      self->_cachedDispatchBehavior = cachedDispatchBehavior;
    }
    if (cachedDispatchBehavior > 2)
      v20 = &stru_1E16EDF20;
    else
      v20 = off_1E16DFB90[cachedDispatchBehavior];
    v21 = (id)objc_msgSend(v3, "appendObject:withName:", v20, CFSTR("dispatchBehavior"));
  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIPencilInteraction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIPencilInteraction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  char has_internal_diagnostics;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  UIPencilInteraction *v14;
  char v15;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", a3);
  v7 = (id)objc_msgSend(v6, "appendBool:withName:", self->_enabled, CFSTR("enabled"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__UIPencilInteraction_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E16B4008;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v15 = has_internal_diagnostics;
  v9 = (id)objc_msgSend(v8, "modifyBody:", v12);
  v10 = v8;

  return v10;
}

void __61__UIPencilInteraction_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__UIPencilInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B4008;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  v9 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

id __61__UIPencilInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  __CFString *v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  const __CFString *v20;
  id v21;
  id v22;
  id result;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v2 = *(void **)(a1 + 32);
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v6, v3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("(nil)");
  }

  v8 = (id)objc_msgSend(v2, "appendObject:withName:", v7, CFSTR("view"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));

  if (WeakRetained)
  {
    v10 = *(void **)(a1 + 32);
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v11);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = CFSTR("(nil)");
    }

    v16 = (id)objc_msgSend(v10, "appendObject:withName:", v15, CFSTR("delegate"));
  }
  if (*(_BYTE *)(a1 + 48))
  {
    v17 = *(void **)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 40);
    if (v18)
    {
      if (*(char *)(v18 + 8) < 0)
      {
        v19 = *(_QWORD *)(v18 + 32);
      }
      else
      {
        v19 = objc_msgSend(*(id *)(a1 + 40), "_dispatchBehavior");
        *(_QWORD *)(v18 + 32) = v19;
      }
      if (v19 > 2)
        v20 = &stru_1E16EDF20;
      else
        v20 = off_1E16DFB90[v19];
    }
    else
    {
      v20 = CFSTR("default");
    }
    v21 = (id)objc_msgSend(v17, "appendObject:withName:", v20, CFSTR("dispatchBehavior"));
  }
  v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) & 1, CFSTR("registrationPendingDidMoveToWindow"), 1);
  result = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8) >> 1) & 1, CFSTR("registrationPendingWindowMoveToScene"), 1);
  if (*(_BYTE *)(a1 + 48))
  {
    v24 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("registrationToken"));
    v25 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendPoint3D:withName:", CFSTR("lastKnownHoverLocation3D"), *(double *)(*(_QWORD *)(a1 + 40) + 104), *(double *)(*(_QWORD *)(a1 + 40) + 112), *(double *)(*(_QWORD *)(a1 + 40) + 120));
    v26 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("lastKnownHoverZOffset"), 3, *(double *)(*(_QWORD *)(a1 + 40) + 48));
    v27 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("lastKnownHoverAzimuthAngle"), 3, *(double *)(*(_QWORD *)(a1 + 40) + 56));
    v28 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendVector:withName:decimalPrecision:", CFSTR("lastKnownHoverAzimuthUnitVector"), 3, *(double *)(*(_QWORD *)(a1 + 40) + 88), *(double *)(*(_QWORD *)(a1 + 40) + 96));
    v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("lastKnownHoverAltitudeAngle"), 3, *(double *)(*(_QWORD *)(a1 + 40) + 64));
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("lastKnownHoverRollAngle"), 3, *(double *)(*(_QWORD *)(a1 + 40) + 72));
  }
  return result;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (UIHoverGestureRecognizer)_hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_eventRegistrationToken, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
