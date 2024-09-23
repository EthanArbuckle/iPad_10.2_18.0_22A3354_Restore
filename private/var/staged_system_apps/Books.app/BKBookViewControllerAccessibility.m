@implementation BKBookViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKBookViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (id)bkaxTarget
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v7;

  v7 = 0;
  v3 = objc_opt_class(BKBookViewController);
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v7)
    abort();
  return v5;
}

- (int64_t)bkaxPageCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewControllerAccessibility bkaxTarget](self, "bkaxTarget"));
  v3 = objc_msgSend(v2, "pageCountIncludingUpsell");

  return (int64_t)v3;
}

- (NSString)bkaxLocalizedScrollStatus
{
  void *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewControllerAccessibility bkaxTarget](self, "bkaxTarget"));
  v4 = (char *)objc_msgSend(v3, "currentPages");
  v6 = v5;

  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = sub_10009A13C(CFSTR("page.num.of.loading"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  else if (v6 < 2)
  {
    v11 = sub_10009A13C(CFSTR("page.num.of.with.total.single %lu %lu"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v4, -[BKBookViewControllerAccessibility bkaxPageCount](self, "bkaxPageCount")));

  }
  else
  {
    v9 = sub_10009A13C(CFSTR("page.num.of.with.total.spread %lu %lu %lu"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v4, &v4[v6 - 1], -[BKBookViewControllerAccessibility bkaxPageCount](self, "bkaxPageCount")));

  }
  return (NSString *)v8;
}

- (NSArray)bkaxWebDocumentViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  Class v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = 0;
  v4 = objc_opt_class(UIViewController);
  v5 = __IMAccessibilityCastAsClass(v4, self, 1, &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v23)
    abort();
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_accessibleSubviews"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v16 = NSClassFromString(CFSTR("UIWebDocumentView"));
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          objc_msgSend(v3, "addObject:", v15, (_QWORD)v19);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v12);
  }

  v17 = objc_msgSend(v3, "copy");
  return (NSArray *)v17;
}

- (void)bkaxTurnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v4[6];
  BOOL v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000AB4B4;
  v4[3] = &unk_1008E8D18;
  v4[4] = self;
  v4[5] = a3;
  v5 = a4;
  if (__IMAccessibilityPerformSafeBlock(v4, a2))
    abort();
}

- (void)bkaxEditNoteForAnnotation:(id)a3
{
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AB544;
  v5[3] = &unk_1008E7338;
  v5[4] = self;
  v3 = a3;
  v6 = v3;
  if (__IMAccessibilityPerformSafeBlock(v5, v4))
    abort();

}

- (void)bkaxDeleteAnnotation:(id)a3
{
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AB5D4;
  v5[3] = &unk_1008E7338;
  v5[4] = self;
  v3 = a3;
  v6 = v3;
  if (__IMAccessibilityPerformSafeBlock(v5, v4))
    abort();

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKBookViewControllerAccessibility;
  -[BKBookViewControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  -[BKBookViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKBookViewControllerAccessibility;
  -[BKBookViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, "_accessibilityLoadAccessibilityInformation");
}

- (void)showTOC:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKBookViewControllerAccessibility;
  -[BKBookViewControllerAccessibility showTOC:](&v3, "showTOC:", a3);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)resume:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKBookViewControllerAccessibility;
  -[BKBookViewControllerAccessibility resume:](&v3, "resume:", a3);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)_axSendLayoutChange
{
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, kIMAXForceUpdateToken);
}

- (void)scrub:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[BKBookViewControllerAccessibility bkaxScrub:](self, "bkaxScrub:", v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)BKBookViewControllerAccessibility;
    -[BKBookViewControllerAccessibility scrub:](&v5, "scrub:", v4);
  }

}

- (void)bkaxScrub:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  char v10;

  v4 = a3;
  v10 = 0;
  v5 = objc_opt_class(BKScrubberControl);
  v6 = __IMAccessibilityCastAsClass(v5, v4, 1, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = v7;
  v9 = objc_msgSend(v7, "pageNumber");

  if ((objc_opt_respondsToSelector(self, "turnToPageNumber:animated:") & 1) != 0)
    -[BKBookViewControllerAccessibility bkaxTurnToPageNumber:animated:](self, "bkaxTurnToPageNumber:animated:", v9, 0);
  -[BKBookViewControllerAccessibility performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_axSendLayoutChange", 0, 0.5);

}

- (void)tocViewController:(id)a3 didSelectChapter:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[BKBookViewControllerAccessibility _axSetAssociatedObject:forKey:](self, "_axSetAssociatedObject:forKey:", v6, CFSTR("SelectedChapter"));
  v8.receiver = self;
  v8.super_class = (Class)BKBookViewControllerAccessibility;
  -[BKBookViewControllerAccessibility tocViewController:didSelectChapter:](&v8, "tocViewController:didSelectChapter:", v7, v6);

}

- (void)directoryContent:(id)a3 didSelectLocation:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD block[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKBookViewControllerAccessibility;
  -[BKBookViewControllerAccessibility directoryContent:didSelectLocation:](&v12, "directoryContent:didSelectLocation:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewControllerAccessibility _axAssociatedObjectForKey:](self, "_axAssociatedObjectForKey:", CFSTR("SelectedChapter")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = objc_opt_class(BKNavigationInfo);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
      objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("lineString"));

    }
  }
  UIAccessibilityPostNotification(dword_1009C9210, v6);
  UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, &stru_10091C438);
  v10 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB9FC;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)goToPath:(id)a3 fragment:(id)a4 animated:(BOOL)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKBookViewControllerAccessibility;
  -[BKBookViewControllerAccessibility goToPath:fragment:animated:](&v5, "goToPath:fragment:animated:", a3, a4, a5);
  UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, &stru_10091C438);
}

- (BOOL)accessibilityPerformEscape
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000ABB18;
  v3[3] = &unk_1008E72C0;
  v3[4] = self;
  if (__IMAccessibilityPerformSafeBlock(v3, a2))
    abort();
  return 1;
}

- (_NSRange)bkaxCurrentPages
{
  _NSRange *p_bkaxCurrentPages;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_bkaxCurrentPages = &self->_bkaxCurrentPages;
  location = self->_bkaxCurrentPages.location;
  length = p_bkaxCurrentPages->length;
  result.length = length;
  result.location = location;
  return result;
}

@end
