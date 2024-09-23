@implementation UIAccessibilityHUDPositionManager

+ (id)sharedInstance
{
  if (_MergedGlobals_924 != -1)
    dispatch_once(&_MergedGlobals_924, &__block_literal_global_3);
  return (id)qword_1ECD7C8A0;
}

void __51__UIAccessibilityHUDPositionManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD7C8A0;
  qword_1ECD7C8A0 = v0;

}

- (UIAccessibilityHUDPositionManager)init
{
  UIAccessibilityHUDPositionManager *v2;
  uint64_t v3;
  NSMapTable *managedHUDs;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIAccessibilityHUDPositionManager;
  v2 = -[UIAccessibilityHUDPositionManager init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    managedHUDs = v2->_managedHUDs;
    v2->_managedHUDs = (NSMapTable *)v3;

    +[UIPeripheralHost allVisiblePeripheralFrames](UIPeripheralHost, "allVisiblePeripheralFrames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_keyboardAvoidanceArea.origin.x = unionRectValues(v5);
    v2->_keyboardAvoidanceArea.origin.y = v6;
    v2->_keyboardAvoidanceArea.size.width = v7;
    v2->_keyboardAvoidanceArea.size.height = v8;

    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_keyboardFrameDidChange_, CFSTR("UIKeyboardDidChangeFrameNotification"), 0);

    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardDidChangeFrameNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UIAccessibilityHUDPositionManager;
  -[UIAccessibilityHUDPositionManager dealloc](&v4, sel_dealloc);
}

- (void)updateFramesForManagedHUDsUsingKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSMapTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_managedHUDs;
  v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_managedHUDs, "objectForKey:", v13, (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAccessibilityHUDPositionManager adjustViewPropertiesForHUD:withReferenceView:keyboardFrame:](self, "adjustViewPropertiesForHUD:withReferenceView:keyboardFrame:", v13, v14, x, y, width, height);

      }
      v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)keyboardFrameDidChange:(id)a3
{
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  _QWORD v8[5];

  +[UIPeripheralHost allVisiblePeripheralFrames](UIPeripheralHost, "allVisiblePeripheralFrames", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_keyboardAvoidanceArea.origin.x = unionRectValues(v4);
  self->_keyboardAvoidanceArea.origin.y = v5;
  self->_keyboardAvoidanceArea.size.width = v6;
  self->_keyboardAvoidanceArea.size.height = v7;

  if (-[NSMapTable count](self->_managedHUDs, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__UIAccessibilityHUDPositionManager_keyboardFrameDidChange___block_invoke;
    v8[3] = &unk_1E16B1B28;
    v8[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v8, 0, 0.25, 0.0);
  }
}

uint64_t __60__UIAccessibilityHUDPositionManager_keyboardFrameDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFramesForManagedHUDsUsingKeyboardFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 16), *(double *)(*(_QWORD *)(a1 + 32) + 24), *(double *)(*(_QWORD *)(a1 + 32) + 32), *(double *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)adjustViewPropertiesForHUD:(id)a3 withReferenceView:(id)a4 keyboardFrame:(CGRect)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGSize v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double MaxY;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGRect *p_remainder;
  double v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  char v70;
  double width;
  CGFloat v72;
  double height;
  CGFloat v74;
  double v75;
  double v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGRect v79;
  CGRect remainder;
  CGRect slice;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  width = a5.size.width;
  height = a5.size.height;
  y = a5.origin.y;
  x = a5.origin.x;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = v82.origin.x;
  v12 = v82.origin.y;
  v13 = v82.size.width;
  v14 = v82.size.height;
  if (CGRectGetWidth(v82) <= 320.0
    || (v83.origin.x = v11,
        v83.origin.y = v12,
        v83.size.width = v13,
        v83.size.height = v14,
        CGRectGetHeight(v83) <= 320.0))
  {
    v15 = 24.0;
  }
  else
  {
    v15 = 48.0;
  }
  objc_msgSend(v9, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v9, "convertRect:toView:", 0);
  objc_msgSend(v16, "convertRect:toWindow:", v10);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  objc_msgSend(v10, "bounds");
  v96.origin.x = v25;
  v96.origin.y = v26;
  v96.size.width = v27;
  v96.size.height = v28;
  v84.origin.x = v18;
  v84.origin.y = v20;
  v84.size.width = v22;
  v84.size.height = v24;
  v85 = CGRectIntersection(v84, v96);
  v86 = CGRectInset(v85, v15, v15);
  v29 = v86.origin.x;
  v30 = v86.origin.y;
  v31 = v86.size.width;
  v32 = v86.size.height;
  v33 = MEMORY[0x1E0C9D648];
  v34 = *MEMORY[0x1E0C9D648];
  v35 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v9, "window");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v75 = v35;
  v76 = v34;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v8, "traitCollection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "userInterfaceIdiom") == 1)
  {

LABEL_8:
LABEL_9:
    objc_msgSend(v10, "convertRect:fromWindow:", 0, x, y, width, height);
    v34 = v38;
    v35 = v39;
    v72 = v41;
    v74 = v40;
    goto LABEL_10;
  }
  objc_msgSend(v8, "window");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "_isHostedInAnotherProcess");

  if ((v70 & 1) != 0)
    goto LABEL_9;
  v72 = *(double *)(v33 + 24);
  v74 = *(double *)(v33 + 16);
LABEL_10:
  v42 = *(CGSize *)(v33 + 16);
  slice.origin = *(CGPoint *)v33;
  slice.size = v42;
  remainder.origin = slice.origin;
  remainder.size = v42;
  v79.origin = slice.origin;
  v79.size = v42;
  v43 = v29;
  v42.width = v30;
  v44 = v31;
  v45 = v32;
  v46 = v32;
  v47 = v31;
  v48 = v30;
  v49 = v29;
  MaxY = CGRectGetMaxY(*(CGRect *)((char *)&v42 - 8));
  v87.origin.x = v34;
  v87.origin.y = v35;
  v87.size.width = v74;
  v87.size.height = v72;
  v51 = fmax(MaxY - CGRectGetMinY(v87), 0.0);
  v88.origin.x = v49;
  v88.origin.y = v48;
  v88.size.width = v47;
  v88.size.height = v46;
  CGRectDivide(v88, &slice, &remainder, v51, CGRectMaxYEdge);
  v89.origin.x = v34;
  v89.origin.y = v35;
  v89.size.width = v74;
  v89.size.height = v72;
  v52 = CGRectGetMaxY(v89);
  v90.origin.x = v49;
  v90.origin.y = v48;
  v90.size.width = v47;
  v90.size.height = v46;
  v53 = fmax(v52 - CGRectGetMinY(v90), 0.0);
  v91.origin.x = v49;
  v91.origin.y = v48;
  v91.size.width = v47;
  v91.size.height = v46;
  CGRectDivide(v91, &slice, &v79, v53, CGRectMinYEdge);
  if (remainder.size.height <= v79.size.height)
    v54 = v79.size.height;
  else
    v54 = remainder.size.height;
  if (remainder.size.height <= v79.size.height)
    p_remainder = &v79;
  else
    p_remainder = &remainder;
  v57 = p_remainder->origin.y;
  v56 = p_remainder->size.width;
  v58 = p_remainder->origin.x;
  objc_msgSend(v8, "sizeThatFits:", v56, v54);
  v60 = v59;
  v62 = v61;
  v92.origin.x = v58;
  v92.origin.y = v57;
  v92.size.width = v56;
  v92.size.height = v54;
  v63 = CGRectGetWidth(v92) / v60;
  v93.origin.x = v58;
  v93.origin.y = v57;
  v93.size.width = v56;
  v93.size.height = v54;
  v64 = CGRectGetHeight(v93) / v62;
  if (v63 < v64)
    v64 = v63;
  if (v64 > 1.0)
    v64 = 1.0;
  v65 = fmax(v64, 0.5);
  v94.origin.x = v58;
  v94.origin.y = v57;
  v94.size.width = v56;
  v94.size.height = v54;
  CGRectGetMidX(v94);
  UIRoundToViewScale(v8);
  v67 = v60 * 0.5 + v66;
  v95.origin.x = v58;
  v95.origin.y = v57;
  v95.size.width = v56;
  v95.size.height = v54;
  CGRectGetMidY(v95);
  UIRoundToViewScale(v8);
  objc_msgSend(v8, "setCenter:", v67, v62 * 0.5 + v68);
  objc_msgSend(v8, "setBounds:", v76, v75, v60, v62);
  CGAffineTransformMakeScale(&v78, v65, v65);
  v77 = v78;
  objc_msgSend(v8, "setTransform:", &v77);

}

- (void)adjustViewPropertiesForHUD:(id)a3 withReferenceView:(id)a4
{
  -[UIAccessibilityHUDPositionManager adjustViewPropertiesForHUD:withReferenceView:keyboardFrame:](self, "adjustViewPropertiesForHUD:withReferenceView:keyboardFrame:", a3, a4, self->_keyboardAvoidanceArea.origin.x, self->_keyboardAvoidanceArea.origin.y, self->_keyboardAvoidanceArea.size.width, self->_keyboardAvoidanceArea.size.height);
}

- (void)beginManagingPositionOfHUD:(id)a3 withReferenceView:(id)a4
{
  -[NSMapTable setObject:forKey:](self->_managedHUDs, "setObject:forKey:", a4, a3);
}

- (void)stopManagingPositionOfHUD:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_managedHUDs, "removeObjectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedHUDs, 0);
}

@end
