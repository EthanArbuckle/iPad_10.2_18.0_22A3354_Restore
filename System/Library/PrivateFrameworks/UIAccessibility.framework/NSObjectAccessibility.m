@implementation NSObjectAccessibility

- (id)accessibilityLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_super v9;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityAttributedLabel](&v9, sel_accessibilityAttributedLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", v6);
LABEL_11:

        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        AXRuntimeLogCommon();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
          -[NSObjectAccessibility accessibilityLabel].cold.1();

      }
    }
    v5 = 0;
    goto LABEL_11;
  }
  (*(void (**)(uint64_t))(v3 + 16))(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  id v4;
  objc_super v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "isAXAttributedString"))
    -[NSObjectAccessibility setAccessibilityAttributedLabel:](&v6, sel_setAccessibilityAttributedLabel_, objc_msgSend(v4, "cfAttributedString"), v5.receiver, v5.super_class, self, NSObjectAccessibility);
  else
    -[NSObjectAccessibility setAccessibilityLabel:](&v5, sel_setAccessibilityLabel_, v4, self, NSObjectAccessibility, v6.receiver, v6.super_class);

}

- (id)accessibilityUserDefinedLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_super v9;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityAttributedLabel](&v9, sel_accessibilityAttributedLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", v6);
LABEL_11:

        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        AXRuntimeLogCommon();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
          -[NSObjectAccessibility accessibilityLabel].cold.1();

      }
    }
    v5 = 0;
    goto LABEL_11;
  }
  (*(void (**)(uint64_t))(v3 + 16))(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v5;
}

- (id)accessibilityLanguage
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityLanguage](&v8, sel_accessibilityLanguage);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityUserDefinedIdentifier
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 21);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityIdentifier](&v8, sel_accessibilityIdentifier);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSObject");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityCustomActions
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 26);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityCustomActions](&v8, sel_accessibilityCustomActions);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (int64_t)accessibilityElementCount
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = -[NSObjectAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AXPerformingChildrenCount"));
  -[NSObjectAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXPerformingChildrenCount"));
  -[NSObject _accessibilityElements](self, "_accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "count");
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  -[NSObjectAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", v3, CFSTR("AXPerformingChildrenCount"));

  return v6;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;

  -[NSObject _accessibilityElements](self, "_accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "count");
    v7 = 0;
    if ((a3 & 0x8000000000000000) == 0 && v6 > a3)
    {
      objc_msgSend(v5, "objectAtIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[NSObject _accessibilityElements](self, "_accessibilityElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "indexOfObject:", v4);
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (void)accessibilityIncrement
{
  void (**v2)(void);
  void (**v3)(void);

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 18);
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (void)accessibilityDecrement
{
  void (**v2)(void);
  void (**v3)(void);

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 19);
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (BOOL)accessibilityRespondsToUserInteraction
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 41);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    -[NSObjectAccessibility storedAccessibilityRespondsToUserInteraction](self, "storedAccessibilityRespondsToUserInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      v9 = -[NSObjectAccessibility accessibilityTraits](self, "accessibilityTraits");
      v10 = dyld_program_sdk_at_least();
      v11 = *MEMORY[0x1E0CF4498];
      if (!v10)
        v11 = 0;
      if (((*MEMORY[0x1E0CF4568] | *MEMORY[0x1E0CF4508]) & v9) == 0)
      {
        v12 = *MEMORY[0x1E0CF4440];
        if ((*MEMORY[0x1E0CF4578] & v9) == 0 || (v12 & v9) != 0)
        {
          v13 = (*MEMORY[0x1E0CF4490] | *MEMORY[0x1E0CF4570] | v11) & v9;
          if (((*MEMORY[0x1E0CF44D8] | *MEMORY[0x1E0CF4590] | *MEMORY[0x1E0CF4528] | *MEMORY[0x1E0CF4458] | *MEMORY[0x1E0CF43E8] | *MEMORY[0x1E0CF43F8] | *MEMORY[0x1E0CF4678] | *MEMORY[0x1E0CF44D0] | *MEMORY[0x1E0CF4478] | *MEMORY[0x1E0CF4408] | *MEMORY[0x1E0CF44C8] | *MEMORY[0x1E0CF4638] | *MEMORY[0x1E0CF4580] | v12) & v9) != 0
            || v13 == 0)
          {
            v5 = 1;
LABEL_18:

            goto LABEL_19;
          }
        }
      }
      v8 = -[NSObject _accessibilityRespondsToUserInteraction](self, "_accessibilityRespondsToUserInteraction");
    }
    v5 = v8;
    goto LABEL_18;
  }
  v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
LABEL_19:

  return v5;
}

- (id)accessibilityValue
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", -[NSObjectAccessibility accessibilityAttributedValue](&v8, sel_accessibilityAttributedValue));
  }
  v6 = (void *)v5;

  return v6;
}

- (void)setAccessibilityValue:(id)a3
{
  id v4;
  objc_super v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "isAXAttributedString"))
    -[NSObjectAccessibility setAccessibilityAttributedValue:](&v6, sel_setAccessibilityAttributedValue_, objc_msgSend(v4, "cfAttributedString"), v5.receiver, v5.super_class, self, NSObjectAccessibility);
  else
    -[NSObjectAccessibility setAccessibilityValue:](&v5, sel_setAccessibilityValue_, v4, self, NSObjectAccessibility, v6.receiver, v6.super_class);

}

- (id)accessibilityUserDefinedValue
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", -[NSObjectAccessibility accessibilityAttributedValue](&v8, sel_accessibilityAttributedValue));
  }
  v6 = (void *)v5;

  return v6;
}

- (id)_accessibilityCapturedImages
{
  return 0;
}

- (id)accessibilityHint
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", -[NSObjectAccessibility accessibilityAttributedHint](&v8, sel_accessibilityAttributedHint));
  }
  v6 = (void *)v5;

  return v6;
}

- (void)setAccessibilityHint:(id)a3
{
  id v4;
  objc_super v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "isAXAttributedString"))
    -[NSObjectAccessibility setAccessibilityAttributedHint:](&v6, sel_setAccessibilityAttributedHint_, objc_msgSend(v4, "cfAttributedString"), v5.receiver, v5.super_class, self, NSObjectAccessibility);
  else
    -[NSObjectAccessibility setAccessibilityHint:](&v5, sel_setAccessibilityHint_, v4, self, NSObjectAccessibility, v6.receiver, v6.super_class);

}

- (id)accessibilityUserDefinedHint
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", -[NSObjectAccessibility accessibilityAttributedHint](&v8, sel_accessibilityAttributedHint));
  }
  v6 = (void *)v5;

  return v6;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityFrame](&v17, sel_accessibilityFrame);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityUserDefinedFrame
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3B18];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    objc_msgSend(v5, "valueWithRect:");
  }
  else
  {
    -[NSObjectAccessibility storedAccessibilityFrame](self, "storedAccessibilityFrame");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  void *v4;
  id v5;
  objc_super v7;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3 || (v5 = (id)(*(uint64_t (**)(uint64_t))(v3 + 16))(v3)) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)NSObjectAccessibility;
    v5 = -[NSObjectAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  }

  return (unint64_t)v5;
}

- (id)accessibilityUserDefinedTraits
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (*(uint64_t (**)(uint64_t))(v3 + 16))(v3));
  else
    -[NSObjectAccessibility storedAccessibilityTraits](self, "storedAccessibilityTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    v5 = -[NSObjectAccessibility isAccessibilityElement](&v8, sel_isAccessibilityElement);
  }
  v6 = v5;

  return v6;
}

- (id)isAccessibilityUserDefinedElement
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*(uint64_t (**)(uint64_t))(v3 + 16))(v3));
  else
    -[NSObjectAccessibility storedIsAccessibilityElement](self, "storedIsAccessibilityElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityUserDefinedLanguage
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityLanguage](&v8, sel_accessibilityLanguage);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityIdentifier
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 21);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityIdentifier](&v8, sel_accessibilityIdentifier);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)accessibilityActivate
{
  uint64_t v2;
  void *v3;
  char v4;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 17);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
  else
    v4 = 0;

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v2;
  void *v3;
  char v4;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 25);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
  else
    v4 = 0;

  return v4;
}

- (BOOL)accessibilityPerformMagicTap
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 44);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    v5 = -[NSObjectAccessibility accessibilityPerformMagicTap](&v8, sel_accessibilityPerformMagicTap);
  }
  v6 = v5;

  return v6;
}

- (id)accessibilityUserDefinedActivationPoint
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3B18];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    objc_msgSend(v5, "valueWithCGPoint:");
  }
  else
  {
    -[NSObjectAccessibility storedAccessibilityActivationPoint](self, "storedAccessibilityActivationPoint");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    v5 = -[NSObjectAccessibility shouldGroupAccessibilityChildren](&v8, sel_shouldGroupAccessibilityChildren);
  }
  v6 = v5;

  return v6;
}

- (id)storedShouldGroupAccessibilityChildren
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*(uint64_t (**)(uint64_t))(v3 + 16))(v3));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility storedShouldGroupAccessibilityChildren](&v8, sel_storedShouldGroupAccessibilityChildren);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityUserDefinedShouldGroupChildren
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*(uint64_t (**)(uint64_t))(v3 + 16))(v3));
  else
    -[NSObjectAccessibility storedShouldGroupAccessibilityChildren](self, "storedShouldGroupAccessibilityChildren");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityPath
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityPath](&v8, sel_accessibilityPath);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)accessibilityElementsHidden
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 10);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    v5 = -[NSObjectAccessibility accessibilityElementsHidden](&v8, sel_accessibilityElementsHidden);
  }
  v6 = v5;

  return v6;
}

- (id)storedAccessibilityElementsHidden
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 10);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*(uint64_t (**)(uint64_t))(v3 + 16))(v3));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility storedAccessibilityElementsHidden](&v8, sel_storedAccessibilityElementsHidden);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)accessibilityViewIsModal
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 11);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    v5 = -[NSObjectAccessibility accessibilityViewIsModal](&v8, sel_accessibilityViewIsModal);
  }
  v6 = v5;

  return v6;
}

- (id)storedAccessibilityViewIsModal
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 11);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*(uint64_t (**)(uint64_t))(v3 + 16))(v3));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility storedAccessibilityViewIsModal](&v8, sel_storedAccessibilityViewIsModal);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (int64_t)accessibilityNavigationStyle
{
  uint64_t v3;
  void *v4;
  id v5;
  int64_t v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 13);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (id)(*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    v5 = -[NSObjectAccessibility accessibilityNavigationStyle](&v8, sel_accessibilityNavigationStyle);
  }
  v6 = (int64_t)v5;

  return v6;
}

- (id)accessibilityHeaderElements
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 14);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObject accessibilityHeaderElements](&v8, sel_accessibilityHeaderElements);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityUserDefinedContainer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSObjectAccessibility;
  -[NSObjectAccessibility accessibilityContainer](&v3, sel_accessibilityContainer);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityElements
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 22);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityElements](&v8, sel_accessibilityElements);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)setAccessibilityElements:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSObjectAccessibility;
  v4 = a3;
  -[NSObjectAccessibility setAccessibilityElements:](&v5, sel_setAccessibilityElements_, v4);
  -[NSObject _accessibilityUpdateContainerElementReferencesIfNeededForNewElements:](self, "_accessibilityUpdateContainerElementReferencesIfNeededForNewElements:", v4, v5.receiver, v5.super_class);

}

- (id)automationElements
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 45);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility automationElements](&v10, sel_automationElements);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[NSObject _accessibilityUserTestingChildren](self, "_accessibilityUserTestingChildren");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return v5;
}

- (void)setAutomationElements:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSObjectAccessibility;
  -[NSObjectAccessibility setAutomationElements:](&v3, sel_setAutomationElements_, a3);
}

- (id)accessibilityUserInputLabels
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 37);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityUserInputLabels](&v8, sel_accessibilityUserInputLabels);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityUserDefinedDragSourceDescriptors
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSObjectAccessibility;
  -[NSObjectAccessibility accessibilityDragSourceDescriptors](&v3, sel_accessibilityDragSourceDescriptors);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityUserDefinedDropPointDescriptors
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSObjectAccessibility;
  -[NSObjectAccessibility accessibilityDropPointDescriptors](&v3, sel_accessibilityDropPointDescriptors);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityPreviousTextNavigationElement
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 46);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityPreviousTextNavigationElement](&v8, sel_accessibilityPreviousTextNavigationElement);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityNextTextNavigationElement
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 47);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSObjectAccessibility;
    -[NSObjectAccessibility accessibilityNextTextNavigationElement](&v8, sel_accessibilityNextTextNavigationElement);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)accessibilityLabel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_15(&dword_19D0DD000, v0, v1, "axLabel has unexpected type! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
