@implementation UIView(UIAccessibilityPrivate)

- (double)_accessibilityFrameExpansion
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXFrameSizeExpansion"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sizeValue");
  v3 = v2;

  return v3;
}

- (void)_accessibilitySetFrameExpansion:()UIAccessibilityPrivate
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXFrameSizeExpansion"));

}

- (uint64_t)_accessibilityViewIsActive
{
  uint64_t result;

  result = objc_msgSend(a1, "_accessibilityViewIsVisible");
  if ((_DWORD)result)
    return objc_msgSend(a1, "isUserInteractionEnabled");
  return result;
}

- (uint64_t)_accessibilityViewIsVisible
{
  return objc_msgSend(a1, "_accessibilityViewIsVisibleIgnoringAXOverrides:", 0);
}

- (void)_accessibilitySetViewIsVisible:()UIAccessibilityPrivate
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &kAccessibilityViewIsVisibleStorage, v2, (void *)0x301);

}

- (uint64_t)_accessibilityViewIsVisibleIgnoringAXOverrides:()UIAccessibilityPrivate
{
  void *v5;
  uint64_t v6;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityContainerToStopVisibilityCheck");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "_accessibilityViewIsVisibleIgnoringAXOverrides:stoppingBeforeContainer:", a3, v5);

  return v6;
}

- (uint64_t)_accessibilityViewIsVisibleIgnoringAXOverrides:()UIAccessibilityPrivate stoppingBeforeContainer:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  objc_getAssociatedObject(a1, &kAccessibilityViewIsVisibleStorage);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "BOOLValue");
  }
  else if ((a3 & 1) != 0 || (objc_msgSend(a1, "accessibilityElementsHidden") & 1) == 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __105__UIView_UIAccessibilityPrivate___accessibilityViewIsVisibleIgnoringAXOverrides_stoppingBeforeContainer___block_invoke;
    v15[3] = &unk_1E3DFF6A0;
    v16 = v6;
    objc_msgSend(a1, "_accessibilityFindViewAncestor:startWithSelf:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!v10 || objc_msgSend(a1, "_accessibilityOverridesInvisibility"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_msgSend(a1, "window"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
      {
        if ((objc_msgSend(a1, "frame"), fabs(v13) >= 0.001) && fabs(v12) >= 0.001
          || objc_msgSend(a1, "_accessibilityOverridesInvalidFrames"))
        {
          v9 = 1;
        }
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_accessibleSubviews:()UIAccessibilityPrivate
{
  void *v5;
  void *v6;

  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldUseAllSubviews:", 1);
  objc_msgSend(v5, "setSorted:", a3 == 0);
  objc_msgSend(a1, "_accessibilityViewChildrenWithOptions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)_accessibleSubviews
{
  return objc_msgSend(a1, "_accessibleSubviews:", objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("AXPerformingChildrenCount")));
}

- (id)_accessibleNonSupplementarySubviews
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("AXPerformingChildrenCount")) ^ 1;
  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldUseAllSubviews:", 1);
  objc_msgSend(v3, "setSorted:", v2);
  objc_msgSend(v3, "setShouldExcludeSupplementaryViews:", 1);
  objc_msgSend(a1, "_accessibilityViewChildrenWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)_accessibilityOverridesInvalidFrames
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)_accessibilitySetOverridesInvalidFrames:()UIAccessibilityPrivate
{
  return __UIAccessibilitySetAssociatedBool();
}

- (uint64_t)_accessibilityAllowsSiblingsWhenOvergrown
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)_accessibilitySetAllowsSiblingsWhenOvergrown:()UIAccessibilityPrivate
{
  return __UIAccessibilitySetAssociatedBool();
}

- (id)_accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:()UIAccessibilityPrivate
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  objc_msgSend(a1, "accessibilityUserDefinedLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "accessibilityUserDefinedLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  objc_msgSend(a1, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_26;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "safeValueForKey:", CFSTR("image"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v4, "isSystemItem") && objc_msgSend(v4, "systemItem") == 4)
  {
    v9 = CFSTR("uibutton.navbar.add.button.title");
LABEL_15:
    UIKitAccessibilityLocalizedString(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (v8)
  {
    UIImageGetNavigationBarBackArrow();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      v9 = CFSTR("uibutton.navbar.back.button.title");
      goto LABEL_15;
    }
  }
  v20.receiver = a1;
  v20.super_class = (Class)UIView_0;
  objc_msgSendSuper2(&v20, sel_accessibilityLabel);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  v6 = v12;
  if (!objc_msgSend(v12, "length") && objc_msgSend(v4, "isSystemItem"))
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_accessibilityTitleForSystemTag:", objc_msgSend(v4, "systemItem"));
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v13;
  }
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(a1, "accessibilityIdentification");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(a1, "accessibilityIdentification");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      objc_msgSend(MEMORY[0x1E0CEABB0], "_accessibilityTitleForSystemTag:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v17;
    }
  }
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v4, "title");
    v18 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v18;
  }

LABEL_26:
  return v6;
}

- (uint64_t)_accessibilityShouldIgnoreSwipeActionCompletionHandler
{
  return 0;
}

+ (id)_accessibilityTitleForSystemTag:()UIAccessibilityPrivate
{
  void *v3;
  __CFString *v4;

  v3 = 0;
  switch(a3)
  {
    case 0:
      v4 = CFSTR("done.toolbar.button.text");
      goto LABEL_27;
    case 1:
      v4 = CFSTR("cancel.toolbar.button.text");
      goto LABEL_27;
    case 2:
      v4 = CFSTR("edit.toolbar.button.text");
      goto LABEL_27;
    case 3:
      v4 = CFSTR("save.toolbar.button.text");
      goto LABEL_27;
    case 4:
      v4 = CFSTR("uibutton.navbar.add.button.title");
      goto LABEL_27;
    case 5:
    case 6:
    case 21:
    case 22:
    case 23:
      return v3;
    case 7:
      v4 = CFSTR("compose.button");
      goto LABEL_27;
    case 8:
      v4 = CFSTR("reply.button");
      goto LABEL_27;
    case 9:
      v4 = CFSTR("action.button");
      goto LABEL_27;
    case 10:
      v4 = CFSTR("organize.button");
      goto LABEL_27;
    case 11:
      v4 = CFSTR("bookmarks.button");
      goto LABEL_27;
    case 12:
      v4 = CFSTR("search.button");
      goto LABEL_27;
    case 13:
      v4 = CFSTR("refresh.button");
      goto LABEL_27;
    case 14:
      v4 = CFSTR("stop.button");
      goto LABEL_27;
    case 15:
      v4 = CFSTR("camera.button");
      goto LABEL_27;
    case 16:
      v4 = CFSTR("garbage.toolbar.button.text");
      goto LABEL_27;
    case 17:
      v4 = CFSTR("play.button");
      goto LABEL_27;
    case 18:
      v4 = CFSTR("pause.button");
      goto LABEL_27;
    case 19:
      v4 = CFSTR("rewind.button");
      goto LABEL_27;
    case 20:
      v4 = CFSTR("fastforward.button");
      goto LABEL_27;
    case 24:
      v4 = CFSTR("close.button");
LABEL_27:
      UIKitAccessibilityLocalizedString(v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = CFSTR("uibutton.navbar.back.button.title");
      switch(a3)
      {
        case 'e':
          goto LABEL_27;
        case 'f':
          v4 = CFSTR("uibutton.navbar.forward.button.title");
          goto LABEL_27;
        case 'g':
        case 'k':
          v4 = CFSTR("uibutton.table.previous.button.title");
          goto LABEL_27;
        case 'h':
        case 'l':
          v4 = CFSTR("uibutton.table.next.button.title");
          goto LABEL_27;
        case 'o':
          v4 = CFSTR("airtunes.text");
          goto LABEL_27;
        default:
          return v3;
      }
  }
  return v3;
}

@end
