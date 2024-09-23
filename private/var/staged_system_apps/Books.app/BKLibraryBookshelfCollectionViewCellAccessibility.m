@implementation BKLibraryBookshelfCollectionViewCellAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKLibraryBookshelfCollectionViewCell");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (id)singleTapGestureRecognizer
{
  return (id)__IMAccessibilityGetAssociatedObject(self, &unk_1009F50A0);
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
  __IMAccessibilitySetAssociatedObject(self, &unk_1009F50A0, a3);
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  int64_t v7;
  dispatch_time_t v8;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility bkaxIndexPathOfTarget](self, "bkaxIndexPathOfTarget"));
  v6 = objc_msgSend(v4, "isAudiobookAtIndexpath:", v5);

  if (v6)
    v7 = 0;
  else
    v7 = 1000000000;
  v8 = dispatch_time(0, v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100131F74;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  -[BKLibraryBookshelfCollectionViewCellAccessibility accessibilityElementDidBecomeFocused](&v6, "accessibilityElementDidBecomeFocused");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility bkaxIndexPathOfTarget](self, "bkaxIndexPathOfTarget"));
  objc_msgSend(v4, "selectItemAtIndexPath:animated:scrollPosition:", v5, 1, 0);

}

- (void)accessibilityElementDidLoseFocus
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  -[BKLibraryBookshelfCollectionViewCellAccessibility accessibilityElementDidLoseFocus](&v6, "accessibilityElementDidLoseFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility bkaxIndexPathOfTarget](self, "bkaxIndexPathOfTarget"));
  objc_msgSend(v4, "deselectItemAtIndexPath:animated:", v5, 1);

}

- (BOOL)__accessibilitySupportsActivateAction
{
  return 1;
}

- (void)didReceiveSingleTap
{
  uint64_t v3;
  _QWORD v4[5];

  if (-[BKLibraryBookshelfCollectionViewCellAccessibility shouldInterceptTapsForFKAWorkaround](self, "shouldInterceptTapsForFKAWorkaround"))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10013213C;
    v4[3] = &unk_1008E72C0;
    v4[4] = self;
    if (__IMAccessibilityPerformSafeBlock(v4, v3))
      abort();
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  -[BKLibraryBookshelfCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, "_accessibilityLoadAccessibilityInformation");
  -[BKLibraryBookshelfCollectionViewCellAccessibility updateGestureRecognizerForFKAWorkaround](self, "updateGestureRecognizerForFKAWorkaround");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  -[BKLibraryBookshelfCollectionViewCellAccessibility prepareForReuse](&v3, "prepareForReuse");
  -[BKLibraryBookshelfCollectionViewCellAccessibility updateGestureRecognizerForFKAWorkaround](self, "updateGestureRecognizerForFKAWorkaround");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  -[BKLibraryBookshelfCollectionViewCellAccessibility touchesBegan:withEvent:](&v5, "touchesBegan:withEvent:", a3, a4);
  -[BKLibraryBookshelfCollectionViewCellAccessibility updateGestureRecognizerForFKAWorkaround](self, "updateGestureRecognizerForFKAWorkaround");
}

- (void)applyLayoutAttributes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCollectionViewCellAccessibility;
  -[BKLibraryBookshelfCollectionViewCellAccessibility applyLayoutAttributes:](&v4, "applyLayoutAttributes:", a3);
  -[BKLibraryBookshelfCollectionViewCellAccessibility updateGestureRecognizerForFKAWorkaround](self, "updateGestureRecognizerForFKAWorkaround");
}

- (id)bkaxTarget
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v7;

  v7 = 0;
  v3 = objc_opt_class(BKLibraryBookshelfCollectionViewCell);
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v7)
    abort();
  return v5;
}

- (id)bkaxIndexPathOfTarget
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForCell:", v5));

  return v6;
}

- (BOOL)shouldInterceptTapsForFKAWorkaround
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  if (!_AXSFullKeyboardAccessEnabled(self, a2) || !GSEventIsHardwareKeyboardAttached())
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = objc_msgSend(v4, "allowsOpeningBooks");

  return v5;
}

- (void)updateGestureRecognizerForFKAWorkaround
{
  void *v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility singleTapGestureRecognizer](self, "singleTapGestureRecognizer"));

  if (!v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "didReceiveSingleTap");
    -[BKLibraryBookshelfCollectionViewCellAccessibility setSingleTapGestureRecognizer:](self, "setSingleTapGestureRecognizer:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility singleTapGestureRecognizer](self, "singleTapGestureRecognizer"));
    -[BKLibraryBookshelfCollectionViewCellAccessibility addGestureRecognizer:](self, "addGestureRecognizer:", v5);

  }
  v6 = -[BKLibraryBookshelfCollectionViewCellAccessibility shouldInterceptTapsForFKAWorkaround](self, "shouldInterceptTapsForFKAWorkaround");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCellAccessibility singleTapGestureRecognizer](self, "singleTapGestureRecognizer"));
  objc_msgSend(v7, "setEnabled:", v6);

}

@end
