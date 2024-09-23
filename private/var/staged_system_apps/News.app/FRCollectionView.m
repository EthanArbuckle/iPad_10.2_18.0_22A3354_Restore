@implementation FRCollectionView

- (void)setMode:(unint64_t)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (self->_mode != a3)
  {
    self->_mode = a3;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionView subviews](self, "subviews", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v11 = objc_opt_class(FRFeedBasedCollectionViewCell, v6);
          v12 = FCDynamicCast(v11, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          objc_msgSend(v13, "setMode:", a3);

        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
}

- (void)reloadData
{
  _QWORD block[5];
  objc_super v4;

  -[FRCollectionView _accessibilitySaveFocusedElementIfApplicable](self, "_accessibilitySaveFocusedElementIfApplicable");
  v4.receiver = self;
  v4.super_class = (Class)FRCollectionView;
  -[FRCollectionView reloadData](&v4, "reloadData");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005DF2C;
  block[3] = &unk_1000D9758;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_accessibilitySaveFocusedElementIfApplicable
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionView _accessibilityFocusedIdentifierForRestoringAfterReload](self, "_accessibilityFocusedIdentifierForRestoringAfterReload"));

    if (!v3)
    {
      v4 = _UIAccessibilityFocusedElements();
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

      if (objc_msgSend(v7, "_accessibilityIsDescendantOfElement:", self))
      {
        if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___FRCollectionViewAccessibilityFocusRestoring))
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityCollectionViewFocusRestoreIdentifier"));
          -[FRCollectionView set_accessibilityFocusedIdentifierForRestoringAfterReload:](self, "set_accessibilityFocusedIdentifierForRestoringAfterReload:", v6);

        }
      }

    }
  }
}

- (void)_accessibilityRestoreFocusedElementIfApplicable
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionView _accessibilityFocusedIdentifierForRestoringAfterReload](self, "_accessibilityFocusedIdentifierForRestoringAfterReload"));

    if (v3)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10005E09C;
      v5[3] = &unk_1000DD8D8;
      v5[4] = self;
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionView _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", v5));
      if (v4)
        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v4);
      -[FRCollectionView set_accessibilityFocusedIdentifierForRestoringAfterReload:](self, "set_accessibilityFocusedIdentifierForRestoringAfterReload:", 0);

    }
  }
}

- (int64_t)accessibilityContainerType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRCollectionView;
  return -[FRCollectionView accessibilityContainerType](&v3, "accessibilityContainerType");
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSObject)_accessibilityFocusedIdentifierForRestoringAfterReload
{
  return self->__accessibilityFocusedIdentifierForRestoringAfterReload;
}

- (void)set_accessibilityFocusedIdentifierForRestoringAfterReload:(id)a3
{
  objc_storeStrong((id *)&self->__accessibilityFocusedIdentifierForRestoringAfterReload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessibilityFocusedIdentifierForRestoringAfterReload, 0);
}

@end
