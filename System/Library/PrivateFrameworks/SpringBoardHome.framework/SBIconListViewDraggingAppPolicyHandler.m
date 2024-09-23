@implementation SBIconListViewDraggingAppPolicyHandler

- (unint64_t)dragHitRegionForDropSession:(id)a3 iconListView:(id)a4 point:(CGPoint)a5 icon:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  y = a5.y;
  x = a5.x;
  v26 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a3, "items", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        -[SBIconListViewDraggingAppPolicyHandler _iconForDragItem:](self, "_iconForDragItem:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {

          goto LABEL_11;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_11:

  v19 = objc_msgSend(v11, "dragHitRegionForPoint:icon:", v12, x, y);
  return v19;
}

- (BOOL)allowsSpringLoadForSession:(id)a3 onIconView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconListView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "contentVisibility"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v8, "dragDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "iconListView:shouldAllowSpringLoadedInteractionForIconDropSession:onIconView:", v9, v6, v7);

  }
  return v10;
}

- (void)handleSpringLoadOnIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dragDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconListView:springLoadedInteractionForIconDragDidCompleteOnIconView:", v5, v4);

}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "iconListView:canHandleIconDropSession:", v7, v5);

  return v9;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dragDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconListView:iconDropSessionDidEnter:", v6, v5);

}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconListView:iconDropSessionDidUpdate:", v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dragDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconListView:iconDropSessionDidExit:", v6, v5);

}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dragDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconListView:performIconDrop:", v6, v5);

}

- (id)_iconForDragItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_iconForDragItem:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_iconViewForDragItem:(id)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  -[SBIconListViewDraggingAppPolicyHandler _iconForDragItem:](self, "_iconForDragItem:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iconListView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayedIconViewForIcon:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 && v4)
    {
      objc_msgSend(v8, "layoutAndCreateIcon:", v6);
      objc_msgSend(v8, "iconViewForIcon:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_destinationFolderIconViewForDragItem:(id)a3 iconIndexPath:(id *)a4 folderRelativeIconIndexPath:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v21;

  v7 = a3;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconListView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewDraggingAppPolicyHandler _iconForDragItem:](self, "_iconForDragItem:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "folder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "indexPathForIcon:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v21 = 0;
      objc_msgSend(v12, "folderContainingIndexPath:relativeIndexPath:", v13, &v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v21;
      objc_msgSend(v14, "icon");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayedIconViewForIcon:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
        *a4 = objc_retainAutorelease(v13);
      if (a5)
        *a5 = objc_retainAutorelease(v15);
      v18 = v17;

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MinX;
  double v28;
  double MinY;
  double v30;
  double v31;
  double v32;
  double v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat Height;
  id v53;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  NSObject *v58;
  id v59;
  void *v60;
  uint64_t v61;
  CGAffineTransform v63;
  id v64;
  CGAffineTransform v65;
  uint64_t v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconListView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIconsIfNeeded");
  -[SBIconListViewDraggingAppPolicyHandler _iconViewForDragItem:createIfNecessary:](self, "_iconViewForDragItem:createIfNecessary:", v7, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && !objc_msgSend(v10, "isDisplayingIconView:", v11))
  {
    v35 = 0;
    v13 = v11;
  }
  else
  {
    objc_msgSend(v9, "dragDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "iconListView:iconViewForDroppingIconDragItem:proposedIconView:", v10, v7, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "iconListView:willUseIconView:forDroppingIconDragItem:", v10, v13, v7);
      objc_msgSend(v13, "dropContainerView");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      objc_msgSend(v13, "anchorPoint");
      v24 = v23;
      v26 = v25;
      v67.origin.x = v16;
      v67.origin.y = v18;
      v67.size.width = v20;
      v67.size.height = v22;
      MinX = CGRectGetMinX(v67);
      v68.origin.x = v16;
      v68.origin.y = v18;
      v68.size.width = v20;
      v68.size.height = v22;
      v28 = MinX + CGRectGetWidth(v68) * v24;
      v69.origin.x = v16;
      v69.origin.y = v18;
      v69.size.width = v20;
      v69.size.height = v22;
      MinY = CGRectGetMinY(v69);
      v70.origin.x = v16;
      v70.origin.y = v18;
      v70.size.width = v20;
      v70.size.height = v22;
      objc_msgSend(v14, "convertPoint:fromView:", v13, v28, MinY + CGRectGetHeight(v70) * v26);
      v31 = v30;
      v33 = v32;
      v71.origin.x = v16;
      v71.origin.y = v18;
      v71.size.width = v20;
      v71.size.height = v22;
      if (CGRectIsEmpty(v71))
      {
        v34 = 0;
      }
      else
      {
        v73.origin.x = v16;
        v73.origin.y = v18;
        v73.size.width = v20;
        v73.size.height = v22;
        v34 = !CGRectIsInfinite(v73);
      }
      objc_msgSend(v14, "window");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55 && v34)
      {
        v56 = objc_alloc(MEMORY[0x1E0DC3770]);
        v57 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v65.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v65.c = v57;
        *(_OWORD *)&v65.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v54 = (void *)objc_msgSend(v56, "initWithContainer:center:transform:", v14, &v65, v31, v33);
      }
      else
      {
        SBLogIconDragging();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v65.a) = 138412290;
          *(_QWORD *)((char *)&v65.a + 4) = v14;
          _os_log_impl(&dword_1CFEF3000, v58, OS_LOG_TYPE_DEFAULT, "Drag preview target does not have a window or has a bad frame: %@", (uint8_t *)&v65, 0xCu);
        }

        v54 = 0;
      }
    }
    else
    {
      v64 = 0;
      -[SBIconListViewDraggingAppPolicyHandler _destinationFolderIconViewForDragItem:iconIndexPath:folderRelativeIconIndexPath:](self, "_destinationFolderIconViewForDragItem:iconIndexPath:folderRelativeIconIndexPath:", v7, 0, &v64);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v64;
      if (v36
        && (objc_msgSend(v36, "isAnimatingScrolling") & 1) == 0
        && (v37 = objc_msgSend(v36, "visibleMiniIconListIndex"), v37 == objc_msgSend(v14, "sbListIndex")))
      {
        objc_msgSend(v36, "frameForMiniIconAtIndex:", objc_msgSend(v14, "sbIconIndex"));
        objc_msgSend(v10, "convertRect:fromView:", v36);
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;
        UIRectGetCenter();
        v47 = v46;
        v49 = v48;
        objc_msgSend(v10, "alignmentIconSize");
        v51 = v50;
        v72.origin.x = v39;
        v72.origin.y = v41;
        v72.size.width = v43;
        v72.size.height = v45;
        Height = CGRectGetHeight(v72);
        memset(&v65, 0, sizeof(v65));
        CGAffineTransformMakeScale(&v65, Height / v51, Height / v51);
        v53 = objc_alloc(MEMORY[0x1E0DC3770]);
        v63 = v65;
        v54 = (void *)objc_msgSend(v53, "initWithContainer:center:transform:", v10, &v63, v47, v49);
      }
      else
      {
        v54 = 0;
      }

    }
    v59 = v8;
    v35 = v59;
    if (v54)
    {
      objc_msgSend(v59, "retargetedPreviewWithTarget:", v54);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v60, "set_springboardPlatterStyle:", 1);
      v35 = v60;
    }
    if (v12)
    {
      objc_msgSend(v12, "iconListView:previewForDroppingIconDragItem:proposedPreview:", v10, v7, v35);
      v61 = objc_claimAutoreleasedReturnValue();

      v35 = (void *)v61;
    }

  }
  return v35;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a5;
  v8 = a4;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconListView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requireAllIconsShownForReason:", CFSTR("Icon Drop"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__SBIconListViewDraggingAppPolicyHandler_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
  v14[3] = &unk_1E8D863E0;
  v15 = v11;
  v12 = v11;
  objc_msgSend(v7, "addCompletion:", v14);
  objc_msgSend(v9, "dragDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "iconListView:iconDragItem:willAnimateDropWithAnimator:", v10, v8, v7);

}

uint64_t __91__SBIconListViewDraggingAppPolicyHandler_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[SBIconListViewDraggingAppPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconListView:customSpringAnimationBehaviorForDroppingItem:", v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SBIconListViewDraggingDestinationDelegate)draggingDestinationDelegate
{
  return (SBIconListViewDraggingDestinationDelegate *)objc_loadWeakRetained((id *)&self->_draggingDestinationDelegate);
}

- (void)setDraggingDestinationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_draggingDestinationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_draggingDestinationDelegate);
}

@end
