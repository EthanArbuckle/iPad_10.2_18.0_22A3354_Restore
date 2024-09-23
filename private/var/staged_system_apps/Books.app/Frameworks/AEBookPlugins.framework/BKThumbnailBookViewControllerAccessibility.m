@implementation BKThumbnailBookViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKThumbnailBookViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)contentViewReady:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  -[BKThumbnailBookViewControllerAccessibility contentViewReady:](&v3, "contentViewReady:", a3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  -[BKThumbnailBookViewControllerAccessibility viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_pageNumberHUD")));
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (id)_libraryBarButtonItem
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = -[BKThumbnailBookViewControllerAccessibility _libraryBarButtonItem](&v7, "_libraryBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = AEAXLocString(CFSTR("library.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  return v3;
}

- (id)_editToolboxBarButtonItem
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = -[BKThumbnailBookViewControllerAccessibility _editToolboxBarButtonItem](&v7, "_editToolboxBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = AEAXLocString(CFSTR("markup.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  return v3;
}

- (id)_searchBarButtonItem
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = -[BKThumbnailBookViewControllerAccessibility _searchBarButtonItem](&v7, "_searchBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = AEAXLocString(CFSTR("search.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  return v3;
}

- (id)_tocBarButtonItem
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = -[BKThumbnailBookViewControllerAccessibility _tocBarButtonItem](&v7, "_tocBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = AEAXLocString(CFSTR("toc.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  return v3;
}

- (id)_brightnessBarButtonItem
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = -[BKThumbnailBookViewControllerAccessibility _brightnessBarButtonItem](&v9, "_brightnessBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = AEAXLocString(CFSTR("brightness.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  v6 = AEAXLocString(CFSTR("brightness.button.hint"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setAccessibilityHint:", v7);

  return v3;
}

- (id)_bookmarkBarButtonItem
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = -[BKThumbnailBookViewControllerAccessibility _bookmarkBarButtonItem](&v8, "_bookmarkBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = AEAXLocString(CFSTR("bookmark.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  v6 = (unint64_t)objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", UIAccessibilityTraitButton | v6);
  return v3;
}

- (id)_bookmarkButton
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = -[BKThumbnailBookViewControllerAccessibility _bookmarkButton](&v7, "_bookmarkButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = AEAXLocString(CFSTR("bookmark.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  return v3;
}

- (id)_fontBarButtonItem
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = -[BKThumbnailBookViewControllerAccessibility _fontBarButtonItem](&v12, "_fontBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = AEAXLocString(CFSTR("font.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);
  v6 = AEAXLocString(CFSTR("font.button"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));
  objc_msgSend(v8, "setAccessibilityValue:", v7);

  v9 = AEAXLocString(CFSTR("font.button.hint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v3, "setAccessibilityHint:", v10);

  return v3;
}

- (id)_directorySwitchBarButtonItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v3 = -[BKThumbnailBookViewControllerAccessibility _directorySwitchBarButtonItem](&v21, "_directorySwitchBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_directorySwitch")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imaxValueForKey:", CFSTR("_segments")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("book")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imaxValueForKey:", CFSTR("suppressTOC")));
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
    v10 = &dword_0 + 2;
  else
    v10 = &dword_0 + 3;
  if (v10 == objc_msgSend(v6, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v12 = AEAXLocString(CFSTR("grid.view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "setAccessibilityLabel:", v13);

    if ((v9 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 1));
      v15 = AEAXLocString(CFSTR("list.view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      objc_msgSend(v14, "setAccessibilityLabel:", v16);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v18 = AEAXLocString(CFSTR("bookmark.button"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v17, "setAccessibilityLabel:", v19);

  }
  return v4;
}

- (id)_audioBarButtonItem
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v2 = -[BKThumbnailBookViewControllerAccessibility _audioBarButtonItem](&v7, "_audioBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = AEAXLocString(CFSTR("audio.options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  return v3;
}

- (void)scrubValueChanged:(id)a3
{
  id v4;
  Class v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  -[BKThumbnailBookViewControllerAccessibility scrubValueChanged:](&v15, "scrubValueChanged:", v4);
  v5 = NSClassFromString(CFSTR("BKScrubberControl"));
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imaxValueForKey:", CFSTR("callout")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imaxValueForKey:", CFSTR("title")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imaxValueForKey:", CFSTR("text")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imaxValueForKey:", CFSTR("callout")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imaxValueForKey:", CFSTR("subtitle")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imaxValueForKey:", CFSTR("text")));

    v14 = __IMAccessibilityStringForVariablesSentinel;
    v12 = __IMAccessibilityStringForVariables(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (objc_msgSend(v13, "length", v8, v14))
      UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v13);

  }
  else if (IMAccessibilityShouldPerformValidationChecks())
  {
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("Accessibility"), CFSTR("sender is not a BKScrubber"));
  }

}

- (void)toggleBookmark:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  -[BKThumbnailBookViewControllerAccessibility toggleBookmark:](&v4, "toggleBookmark:", a3);
  -[BKThumbnailBookViewControllerAccessibility _updateBookmark](self, "_updateBookmark");
}

- (BOOL)bkaxUnbookmarkPage
{
  _BOOL4 v3;
  UIAccessibilityNotifications v4;
  id v5;
  void *v6;

  v3 = -[BKThumbnailBookViewControllerAccessibility bkAccessibilityIsPageBookmarked](self, "bkAccessibilityIsPageBookmarked");
  if (v3)
  {
    -[BKThumbnailBookViewControllerAccessibility toggleBookmark:](self, "toggleBookmark:", 0);
    v4 = UIAccessibilityAnnouncementNotification;
    v5 = AEAXLocString(CFSTR("page.unbookmarked"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    UIAccessibilityPostNotification(v4, v6);

  }
  return v3;
}

- (BOOL)bkaxBookmarkPage
{
  unsigned __int8 v3;
  UIAccessibilityNotifications v4;
  id v5;
  void *v6;

  v3 = -[BKThumbnailBookViewControllerAccessibility bkAccessibilityIsPageBookmarked](self, "bkAccessibilityIsPageBookmarked");
  if ((v3 & 1) == 0)
  {
    -[BKThumbnailBookViewControllerAccessibility toggleBookmark:](self, "toggleBookmark:", 0);
    v4 = UIAccessibilityAnnouncementNotification;
    v5 = AEAXLocString(CFSTR("page.bookmarked"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    UIAccessibilityPostNotification(v4, v6);

  }
  return v3 ^ 1;
}

- (void)updateBookmarkButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  -[BKThumbnailBookViewControllerAccessibility updateBookmarkButton](&v3, "updateBookmarkButton");
  -[BKThumbnailBookViewControllerAccessibility _updateBookmark](self, "_updateBookmark");
}

- (void)_updateBookmark
{
  __CFString *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;
  objc_super v11;

  if (-[BKThumbnailBookViewControllerAccessibility bkAccessibilityIsPageBookmarked](self, "bkAccessibilityIsPageBookmarked"))
  {
    v3 = CFSTR("bookmark.button.on");
  }
  else
  {
    v3 = CFSTR("bookmark.button.off");
  }
  v4 = AEAXLocString(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v11.receiver = self;
  v11.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v6 = -[BKThumbnailBookViewControllerAccessibility _bookmarkButton](&v11, "_bookmarkButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "setAccessibilityValue:", v5);
  v10.receiver = self;
  v10.super_class = (Class)BKThumbnailBookViewControllerAccessibility;
  v8 = -[BKThumbnailBookViewControllerAccessibility _bookmarkBarButtonItem](&v10, "_bookmarkBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "setAccessibilityValue:", v5);

}

- (BOOL)bkAccessibilityIsPageBookmarked
{
  return -[BKThumbnailBookViewControllerAccessibility imaxBoolValueForKey:](self, "imaxBoolValueForKey:", CFSTR("isPageBookmarked"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = -[BKThumbnailBookViewControllerAccessibility _libraryBarButtonItem](self, "_libraryBarButtonItem");
  v4 = -[BKThumbnailBookViewControllerAccessibility _tocBarButtonItem](self, "_tocBarButtonItem");
  v5 = -[BKThumbnailBookViewControllerAccessibility _directorySwitchBarButtonItem](self, "_directorySwitchBarButtonItem");
  v6 = -[BKThumbnailBookViewControllerAccessibility _brightnessBarButtonItem](self, "_brightnessBarButtonItem");
  v7 = -[BKThumbnailBookViewControllerAccessibility _editToolboxBarButtonItem](self, "_editToolboxBarButtonItem");
  v8 = -[BKThumbnailBookViewControllerAccessibility _audioBarButtonItem](self, "_audioBarButtonItem");
  v9 = -[BKThumbnailBookViewControllerAccessibility _searchBarButtonItem](self, "_searchBarButtonItem");
  v10 = -[BKThumbnailBookViewControllerAccessibility _bookmarkBarButtonItem](self, "_bookmarkBarButtonItem");
  v11 = -[BKThumbnailBookViewControllerAccessibility _bookmarkButton](self, "_bookmarkButton");
  v12 = -[BKThumbnailBookViewControllerAccessibility _fontBarButtonItem](self, "_fontBarButtonItem");
  -[BKThumbnailBookViewControllerAccessibility _updateBookmark](self, "_updateBookmark");
}

@end
