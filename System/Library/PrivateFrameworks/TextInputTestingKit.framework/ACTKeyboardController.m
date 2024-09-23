@implementation ACTKeyboardController

- (ACTKeyboardController)init
{
  return -[ACTKeyboardController initWithInputMode:](self, "initWithInputMode:", 0);
}

- (ACTKeyboardController)initWithInputMode:(id)a3
{
  id v5;
  char *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  ACTKeyboardLayoutUtils *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  Class v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ACTKeyboardController;
  v6 = -[ACTKeyboardController init](&v29, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = (void *)*((_QWORD *)v6 + 31);
    *((_QWORD *)v6 + 31) = v7;

    objc_storeStrong((id *)v6 + 12, a3);
    objc_msgSend(v5, "normalizedIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    v11 = (void *)*((_QWORD *)v6 + 11);
    *((_QWORD *)v6 + 11) = v10;

    v6[49] = 1;
    v6[60] = 1;
    v12 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v13 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v12;

    v14 = [ACTKeyboardLayoutUtils alloc];
    objc_msgSend(v5, "locale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ACTKeyboardLayoutUtils initWithLocale:](v14, "initWithLocale:", v15);
    v17 = (void *)*((_QWORD *)v6 + 9);
    *((_QWORD *)v6 + 9) = v16;

    *(_OWORD *)(v6 + 168) = xmmword_22FAC91F0;
    v6[56] = 1;
    v18 = NSClassFromString(CFSTR("TISmartPunctuationController"));
    if (v18)
    {
      v19 = objc_alloc_init(v18);
      v20 = (void *)*((_QWORD *)v6 + 23);
      *((_QWORD *)v6 + 23) = v19;

      v21 = NSClassFromString(CFSTR("TISmartPunctuationOptions"));
      objc_msgSend(v5, "locale");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class smartPunctuationOptionsForLocale:](v21, "smartPunctuationOptionsForLocale:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v6 + 23), "setSmartPunctuationOptions:", v23);

      objc_msgSend(*((id *)v6 + 23), "setSmartQuotesEnabled:", 0);
      objc_msgSend(*((id *)v6 + 23), "setSmartDashesEnabled:", 0);
    }
    v24 = objc_alloc_init(MEMORY[0x24BDD14C8]);
    v25 = (void *)*((_QWORD *)v6 + 32);
    *((_QWORD *)v6 + 32) = v24;

    v26 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v27 = (void *)*((_QWORD *)v6 + 34);
    *((_QWORD *)v6 + 34) = v26;

    objc_msgSend(MEMORY[0x24BEB53A8], "swizzleTestingParameters");
  }

  return (ACTKeyboardController *)v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ACTKeyboardController inputManager](self, "inputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  v4.receiver = self;
  v4.super_class = (Class)ACTKeyboardController;
  -[ACTKeyboardController dealloc](&v4, sel_dealloc);
}

- (void)setAutocorrectionList:(id)a3
{
  TIAutocorrectionList *v4;
  TIAutocorrectionList *autocorrectionList;
  ACTKeyboardController *obj;

  v4 = (TIAutocorrectionList *)a3;
  obj = self;
  objc_sync_enter(obj);
  autocorrectionList = obj->_autocorrectionList;
  obj->_autocorrectionList = v4;

  objc_sync_exit(obj);
}

- (TIAutocorrectionList)autocorrectionList
{
  ACTKeyboardController *v2;
  TIAutocorrectionList *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_autocorrectionList;
  objc_sync_exit(v2);

  return v3;
}

- (void)setKeyboard:(id)a3
{
  UIKBTree *v5;
  void *v6;
  void *v7;
  UIKBTree *v8;

  v5 = (UIKBTree *)a3;
  if (self->_keyboard != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_keyboard, a3);
    -[UIKBTree subtrees](self->_keyboard, "subtrees");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController setKeyplane:](self, "setKeyplane:", v7);

    -[ACTKeyboardController setInitialKeyplane](self, "setInitialKeyplane");
    -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
    v5 = v8;
  }

}

- (void)setKeyplane:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableSet *leftKeys;
  NSMutableSet *rightKeys;
  void *v17;
  NSMutableSet *v18;
  NSMutableSet *v19;
  NSMutableSet *v20;
  NSMutableSet *v21;
  UIKBTree *v22;

  v22 = (UIKBTree *)a3;
  if (self->_keyplane != v22)
  {
    objc_storeStrong((id *)&self->_keyplane, a3);
    -[UIKBTree zipGeometrySet](self->_keyplane, "zipGeometrySet");
    -[ACTKeyboardController adjustKeyplaneEmulatingKBStar:](self, "adjustKeyplaneEmulatingKBStar:", self->_keyplane);
    -[ACTKeyboardController keyplane](self, "keyplane");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController setKeys:](self, "setKeys:", v6);

    -[ACTKeyboardController keyplane](self, "keyplane");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedKeysByKeyName:", CFSTR("Latin-Accents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController keyboardState](self, "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHasAccentKey:", v8 != 0);

    -[ACTKeyboardController keyplane](self, "keyplane");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isAlphabeticPlane");
    -[ACTKeyboardController keyboardState](self, "keyboardState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIsAlphabeticPlane:", v12);

    leftKeys = self->_leftKeys;
    self->_leftKeys = 0;

    rightKeys = self->_rightKeys;
    self->_rightKeys = 0;

    -[UIKBTree name](self->_keyplane, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v17, "containsString:", CFSTR("Wildcat"));

    if ((_DWORD)v12)
    {
      v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v19 = self->_leftKeys;
      self->_leftKeys = v18;

      v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v21 = self->_rightKeys;
      self->_rightKeys = v20;

      -[ACTKeyboardController divideKeyplane:intoLeft:right:](self, "divideKeyplane:intoLeft:right:", self->_keyplane, self->_leftKeys, self->_rightKeys);
    }
  }
  -[ACTKeyboardController registerLayoutWithFavonius](self, "registerLayoutWithFavonius");

}

- (void)divideKeyplane:(id)a3 intoLeft:(id)a4 right:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[6];
  _QWORD v46[4];
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  __int128 v50;
  __int128 v51;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    objc_msgSend(v8, "removeAllObjects");
    objc_msgSend(v10, "removeAllObjects");
    objc_msgSend(v7, "subtrees");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x4010000000;
    v49[3] = &unk_22FAD47AA;
    v13 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
    v50 = *MEMORY[0x24BDBF070];
    v51 = v13;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x4010000000;
    v46[3] = &unk_22FAD47AA;
    v47 = v50;
    v48 = v13;
    objc_msgSend(v12, "keys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __55__ACTKeyboardController_divideKeyplane_intoLeft_right___block_invoke;
    v45[3] = &unk_24FD49210;
    v45[4] = v49;
    v45[5] = v46;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v45);

    UIRectInset();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    UIRectInset();
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    objc_msgSend(v7, "keys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v15;
    v33[1] = 3221225472;
    v33[2] = __55__ACTKeyboardController_divideKeyplane_intoLeft_right___block_invoke_2;
    v33[3] = &unk_24FD49238;
    v37 = v17;
    v38 = v19;
    v39 = v21;
    v40 = v23;
    v36 = v49;
    v34 = v8;
    v41 = v25;
    v42 = v27;
    v43 = v29;
    v44 = v31;
    v35 = v10;
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", v33);

    _Block_object_dispose(v46, 8);
    _Block_object_dispose(v49, 8);

  }
}

- (void)mergeFrameFromKey:(id)a3 intoKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6 && objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__5727;
    v53 = __Block_byref_object_dispose__5728;
    objc_msgSend(v7, "firstObject");
    v54 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v46 = (double *)&v45;
    v47 = 0x2020000000;
    v48 = 0x7FEFFFFFFFFFFFFFLL;
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v8, "frame");
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __51__ACTKeyboardController_mergeFrameFromKey_intoKey___block_invoke;
      v37[3] = &unk_24FD49260;
      v41 = v9;
      v42 = v10;
      v43 = v11;
      v44 = v12;
      v38 = v8;
      v39 = &v45;
      v40 = &v49;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v37);

    }
    if (v46[3] < 2.0)
    {
      objc_msgSend(v8, "frame");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      objc_msgSend((id)v50[5], "frame");
      v59.origin.x = v21;
      v59.origin.y = v22;
      v59.size.width = v23;
      v59.size.height = v24;
      v55.origin.x = v14;
      v55.origin.y = v16;
      v55.size.width = v18;
      v55.size.height = v20;
      v56 = CGRectUnion(v55, v59);
      objc_msgSend((id)v50[5], "setFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
      objc_msgSend(v8, "paddedFrame");
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      objc_msgSend((id)v50[5], "paddedFrame");
      v60.origin.x = v33;
      v60.origin.y = v34;
      v60.size.width = v35;
      v60.size.height = v36;
      v57.origin.x = v26;
      v57.origin.y = v28;
      v57.size.width = v30;
      v57.size.height = v32;
      v58 = CGRectUnion(v57, v60);
      objc_msgSend((id)v50[5], "setPaddedFrame:", v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
    }
    objc_msgSend(v8, "setVisible:", 0);
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);

  }
}

- (void)adjustKeyplaneEmulatingKBStar:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  ACTKeyboardController *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  ACTKeyboardController *v42;
  id v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  objc_msgSend(v45, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v55 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        v11 = self;
        -[ACTKeyboardController layoutUtils](self, "layoutUtils");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "representedStringForKey:shifted:", v10, objc_msgSend(v45, "isShiftKeyplane"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v5, "objectForKey:", v14);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v5, "setObject:forKey:", v15, v14);
          }
          objc_msgSend(v15, "addObject:", v10);

        }
        objc_msgSend(v10, "setVisible:", 1);

        self = v11;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v7);
  }

  if (self->_ttkLayout)
  {
    v16 = (void *)objc_opt_new();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v42 = self;
    -[TTKSimpleKeyboardPlane keys](self->_ttkLayout, "keys");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(v43);
          v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
          objc_msgSend(v21, "string");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = CFSTR(" ");
          if ((objc_msgSend(v22, "isEqualToString:", CFSTR("space")) & 1) == 0)
          {
            objc_msgSend(v21, "string");
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v5, "valueForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "firstObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v21, v27);

          }
        }
        v18 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v18);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v5, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v47;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v47 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "name");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            objc_msgSend(v33, "name");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKey:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v37, "frame");
            objc_msgSend(v33, "setFrame:");
            objc_msgSend(v37, "frame");
            objc_msgSend(v33, "setPaddedFrame:");

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v30);
    }

    self = v42;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("dictation"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR(" "));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController mergeFrameFromKey:intoKey:](self, "mergeFrameFromKey:intoKey:", v38, v39);

  objc_msgSend(v5, "objectForKey:", CFSTR("international"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("more"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController mergeFrameFromKey:intoKey:](self, "mergeFrameFromKey:intoKey:", v40, v41);

}

- (BOOL)isShifted
{
  void *v2;
  char v3;

  -[ACTKeyboardController keyplane](self, "keyplane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShiftKeyplane");

  return v3;
}

- (BOOL)isAutoshifted
{
  void *v2;
  BOOL v3;

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shiftState") == 2;

  return v3;
}

- (void)shiftKeyplane
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[ACTKeyboardController keyboard](self, "keyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController keyplane](self, "keyplane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shiftAlternateKeyplaneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtreeWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController setKeyplane:](self, "setKeyplane:", v6);

  -[ACTKeyboardController keyplane](self, "keyplane");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isShiftKeyplane");

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShiftState:", v8);

}

- (void)alternateKeyplane
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[ACTKeyboardController keyboard](self, "keyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController keyplane](self, "keyplane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternateKeyplaneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtreeWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController setKeyplane:](self, "setKeyplane:", v6);

  -[ACTKeyboardController keyplane](self, "keyplane");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isShiftKeyplane");

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShiftState:", v8);

  -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
}

- (void)updateAutoshift
{
  void *v3;
  char v4;
  _BOOL4 v5;
  unint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  if (-[ACTKeyboardController isShifted](self, "isShifted"))
  {
    -[ACTKeyboardController keyplane](self, "keyplane");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForProperty:", CFSTR("shift-is-plane-chooser"));

    if ((v4 & 1) == 0)
      -[ACTKeyboardController shiftKeyplane](self, "shiftKeyplane");
  }
  if (!-[ACTKeyboardController isShifted](self, "isShifted"))
  {
    -[ACTKeyboardController keyplane](self, "keyplane");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "usesAutoShift"))
      goto LABEL_16;
    v5 = -[ACTKeyboardController usesAutocapitalization](self, "usesAutocapitalization");

    if (v5)
    {
      -[ACTKeyboardController text](self, "text");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v6 = -[ACTKeyboardController autocapitalizationType](self, "autocapitalizationType");
      if (v6 == 1)
      {
        if (objc_msgSend(v13, "length"))
        {
          -[ACTKeyboardController inputManagerState](self, "inputManagerState");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "_stringWithUnichar:", objc_msgSend(v13, "_lastLongCharacter"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "stringEndsWord:", v10);

          if (!v11)
            goto LABEL_16;
        }
      }
      else if (v6 != 3)
      {
        if (v6 != 2)
          goto LABEL_16;
        -[ACTKeyboardController inputManagerState](self, "inputManagerState");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "nextInputWouldStartSentence");

        if ((v8 & 1) == 0)
          goto LABEL_16;
      }
      -[ACTKeyboardController shiftKeyplane](self, "shiftKeyplane");
      -[ACTKeyboardController keyboardState](self, "keyboardState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShiftState:", 2);

LABEL_16:
    }
  }
}

- (void)setInitialKeyplane
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[ACTKeyboardController keyboard](self, "keyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtrees");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isShiftKeyplane"))
  {
    -[ACTKeyboardController keyboard](self, "keyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shiftAlternateKeyplaneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtreeWithName:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  -[ACTKeyboardController setKeyplane:](self, "setKeyplane:", v4);
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShiftState:", 0);

}

- (void)setKeyboardConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  ACTKeyboardLayoutUtils *layoutUtils;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "inputManagerState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController setInputManagerState:](self, "setInputManagerState:", v4);

  objc_msgSend(v9, "intermediateText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v9, "intermediateText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController setIntermediateText:](self, "setIntermediateText:", v6);

  }
  layoutUtils = self->_layoutUtils;
  objc_msgSend(v9, "accentKeyString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardLayoutUtils setLayoutKeyOverride:forKey:uiKeyboardStringNothing:](layoutUtils, "setLayoutKeyOverride:forKey:uiKeyboardStringNothing:", v8, *MEMORY[0x24BDF7AF0], *MEMORY[0x24BDF7B40]);

  -[ACTKeyboardController registerLayoutWithFavonius](self, "registerLayoutWithFavonius");
  -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");

}

- (void)setIntermediateText:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)&self->_intermediateText, a3);
  v5 = a3;
  objc_msgSend(v5, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController setMarkedText:](self, "setMarkedText:", v6);

  objc_msgSend(v5, "inputString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInputForMarkedText:", v7);

  objc_msgSend(v5, "searchString");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSearchStringForMarkedText:", v10);

}

- (void)registerLayoutWithFavonius
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEB4E48]);
  -[ACTKeyboardController keys](self, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  if (self->_leftKeys && self->_rightKeys)
    objc_msgSend(v26, "setUsesTwoHands:", 1);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ACTKeyboardController keys](self, "keys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    v8 = *MEMORY[0x24BDBF070];
    v9 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v11 = *(double *)(MEMORY[0x24BDBF070] + 24);
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v13, "visible") & 1) != 0)
        {
          -[ACTKeyboardController layoutUtils](self, "layoutUtils");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "representedStringForKey:shifted:", v13, -[ACTKeyboardController isShifted](self, "isShifted"));
          v15 = objc_claimAutoreleasedReturnValue();

          if (v15)
            v16 = (__CFString *)v15;
          else
            v16 = &stru_24FD49B78;
          v17 = (void *)MEMORY[0x24BDBCEA0];
          -[ACTKeyboardController inputModeIdentifier](self, "inputModeIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          TIInputModeGetLanguageWithRegion();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "localeWithLocaleIdentifier:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[__CFString lowercaseStringWithLocale:](v16, "lowercaseStringWithLocale:", v20);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v21)
            v23 = v21;
          else
            v23 = (uint64_t)v16;
          objc_msgSend(v13, "paddedFrame");
          objc_msgSend(v26, "addKeyWithExactString:frame:", v23);

        }
        else
        {
          objc_msgSend(v26, "addKeyWithExactString:frame:", &stru_24FD49B78, v8, v9, v10, v11);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setKeyLayout:", v26);

}

- (id)clonedKeyboardState
{
  void *v2;
  void *v3;

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)reset
{
  void *v3;
  void *v4;
  TIKeyboardInputManagerWrapper *inputManagerWrapper;
  void *v6;

  objc_msgSend(MEMORY[0x24BEB53E0], "clearDynamicLearningCaches");
  if (self->_inputManagerWrapper)
  {
    -[ACTKeyboardController inputManager](self, "inputManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearSoftLearning");

    -[ACTKeyboardController inputManager](self, "inputManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspend");

    inputManagerWrapper = self->_inputManagerWrapper;
    self->_inputManagerWrapper = 0;

  }
  -[ACTKeyboardController inputManager](self, "inputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume");

  -[ACTKeyboardController syncToEmptyDocument](self, "syncToEmptyDocument");
}

- (void)tearDown
{
  id v2;

  -[ACTKeyboardController inputManager](self, "inputManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tearDown");

}

- (TIKeyboardInputManager)inputManager
{
  void *v2;
  void *v3;
  id v4;

  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (TIKeyboardInputManager *)v4;
}

- (TIKeyboardInputManager)existingInputManager
{
  void *v2;
  id v3;

  -[TIKeyboardInputManagerWrapper inputManager](self->_inputManagerWrapper, "inputManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (TIKeyboardInputManager *)v3;
}

- (id)createKeyboardInputManagerWrapper
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BEB53C8]);
  -[ACTKeyboardController keyboardInputManagerFactory](self, "keyboardInputManagerFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ACTKeyboardController keyboardInputManagerFactory](self, "keyboardInputManagerFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "newKeyboardInputManager");
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BEB53A8]);
    -[ACTKeyboardController inputMode](self, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "initWithInputMode:keyboardState:", v5, 0);
  }
  v8 = (void *)v6;

  objc_msgSend(v3, "setInputManager:", v8);
  objc_msgSend(v3, "changingContextWithTrigger:", *MEMORY[0x24BEB4F18]);

  return v3;
}

- (TIKeyboardInputManagerWrapper)inputManagerWrapper
{
  TIKeyboardInputManagerWrapper *inputManagerWrapper;
  id v4;
  ACTClientProxy *v5;

  inputManagerWrapper = self->_inputManagerWrapper;
  if (!inputManagerWrapper)
  {
    v4 = -[ACTKeyboardController createKeyboardInputManagerWrapper](self, "createKeyboardInputManagerWrapper");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = -[ACTClientProxy initWithClient:]([ACTClientProxy alloc], "initWithClient:", self);
      objc_msgSend(v4, "setClientProxy:", v5);

    }
    -[ACTKeyboardController setInputManagerWrapper:](self, "setInputManagerWrapper:", v4);

    inputManagerWrapper = self->_inputManagerWrapper;
  }
  return inputManagerWrapper;
}

- (BOOL)hardwareKeyboardMode
{
  void *v3;
  void *v4;
  char v5;

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return self->_hardwareKeyboardMode;
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hardwareKeyboardMode");

  return v5;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_hardwareKeyboardMode = a3;
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHardwareKeyboardMode:", v3);

}

- (BOOL)shouldSkipCandidateSelection
{
  void *v2;
  char v3;

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldSkipCandidateSelection");

  return v3;
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldSkipCandidateSelection:", v3);

}

- (void)commitText
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  -[ACTKeyboardController inputManagerState](self, "inputManagerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesCandidateSelection");

  if (v4)
  {
    -[ACTKeyboardController candidateResultSet](self, "candidateResultSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstCandidate");
    v33 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v33;
    if (!v33)
    {
LABEL_17:

      return;
    }
    -[ACTKeyboardController acceptCandidate:](self, "acceptCandidate:", v33);
LABEL_16:
    v6 = v33;
    goto LABEL_17;
  }
  if (-[ACTKeyboardController usesAutocorrection](self, "usesAutocorrection"))
  {
    -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "candidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v33 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "rawInput");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v33, "rawInput");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "input");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqualToString:", v12))
      {
        objc_msgSend(v33, "input");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "candidate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", v14) & 1) != 0)
        {

        }
        else
        {
          objc_msgSend(v33, "rawInput");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "candidate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if ((v17 & 1) == 0)
            goto LABEL_8;
        }
        objc_msgSend(v33, "input");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[ACTKeyboardController selectedRangeForText:](self, "selectedRangeForText:", v18);
        v21 = v20;

        -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "input");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v21) = objc_msgSend(v22, "isEqualToString:", v23);

        if ((v21 & 1) == 0)
        {
          objc_msgSend(v33, "rawInput");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[ACTKeyboardController selectedRangeForText:](self, "selectedRangeForText:", v24);
          v27 = v26;

          -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v25, v27);
          v28 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v28;
        }
        v29 = objc_alloc(MEMORY[0x24BEB4E20]);
        objc_msgSend(v33, "input");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "rawInput");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v29, "initWithCandidate:forInput:rawInput:", v22, v30, v31);

        -[ACTKeyboardController textAccepted:predictiveCandidate:](self, "textAccepted:predictiveCandidate:", v32, 0);
        -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0);

        goto LABEL_16;
      }

    }
LABEL_8:
    -[ACTKeyboardController acceptAutocorrection](self, "acceptAutocorrection");
    goto LABEL_16;
  }
}

- (void)syncToDocumentState:(id)a3
{
  id v4;
  TIKeyboardState *v5;
  TIKeyboardState *keyboardState;
  id v7;
  NSMutableString *text;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  NSUInteger v12;
  void *v13;
  NSUInteger v14;
  NSMutableString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  NSMutableString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  _BOOL8 v42;
  void *v43;
  _BOOL8 v44;
  void *v45;
  unint64_t v46;
  void *v47;
  _BOOL8 hardwareKeyboardMode;
  void *v49;
  void *v50;
  _BOOL8 v51;
  void *v52;
  _BOOL8 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  void *v62;
  _BOOL8 v63;
  uint64_t v64;
  void *v65;
  _BOOL8 v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL8 v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _BOOL8 v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BOOL8 v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _BOOL8 v100;
  void *v101;
  _BOOL8 v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD v109[5];
  _QWORD v110[5];

  v4 = a3;
  v5 = (TIKeyboardState *)objc_alloc_init(MEMORY[0x24BEB4E60]);
  keyboardState = self->_keyboardState;
  self->_keyboardState = v5;

  v7 = objc_alloc_init(MEMORY[0x24BEB4EB8]);
  -[TIKeyboardState setTextInputTraits:](self->_keyboardState, "setTextInputTraits:", v7);

  text = self->_text;
  objc_msgSend(v4, "contextBeforeInput");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_24FD49B78;
  -[NSMutableString setString:](text, "setString:", v11);

  v12 = -[NSMutableString length](self->_text, "length");
  objc_msgSend(v4, "selectedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");
  self->_selectedRange.location = v12;
  self->_selectedRange.length = v14;

  v15 = self->_text;
  objc_msgSend(v4, "selectedText");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_24FD49B78;
  -[NSMutableString appendString:](v15, "appendString:", v18);

  v19 = self->_text;
  objc_msgSend(v4, "contextAfterInput");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = &stru_24FD49B78;
  -[NSMutableString appendString:](v19, "appendString:", v22);

  -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "corrections");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "autocorrection");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  if (v25)
  {
    v27 = (void *)v25;
    v28 = TISwearWordPolicyV1Enabled();

    if (!v28)
      goto LABEL_14;
    -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "corrections");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "autocorrection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = v26;
    v110[1] = 3221225472;
    v110[2] = __45__ACTKeyboardController_syncToDocumentState___block_invoke;
    v110[3] = &unk_24FD49288;
    v110[4] = self;
    objc_msgSend(v23, "textAccepted:completionHandler:", v30, v110);

  }
LABEL_14:
  -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0);
  -[ACTKeyboardController setCandidateResultSet:](self, "setCandidateResultSet:", 0);
  objc_msgSend(v4, "markedText");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController setMarkedText:](self, "setMarkedText:", v31);

  if (objc_msgSend(v4, "documentIsEmpty"))
  {
    -[ACTKeyboardController setIntermediateText:](self, "setIntermediateText:", 0);
  }
  else
  {
    v32 = (void *)MEMORY[0x24BEB4E38];
    objc_msgSend(v4, "markedText");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markedText");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "intermediateTextWithInputString:displayString:selectionLocation:lastInputString:", v33, v34, objc_msgSend(v4, "selectedRangeInMarkedText"), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController setIntermediateText:](self, "setIntermediateText:", v35);

  }
  -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
  -[ACTKeyboardController inputModeIdentifier](self, "inputModeIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setInputMode:", v36);

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAutocorrectionEnabled:", 1);

  v39 = -[ACTKeyboardController autocorrectionType](self, "autocorrectionType");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "textInputTraits");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAutocorrectionType:", v39);

  v42 = -[ACTKeyboardController usesPrediction](self, "usesPrediction");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAutocorrectionListUIDisplayed:", v42);

  v44 = -[ACTKeyboardController usesAutocapitalization](self, "usesAutocapitalization");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAutocapitalizationEnabled:", v44);

  v46 = -[ACTKeyboardController autocapitalizationType](self, "autocapitalizationType");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setAutocapitalizationType:", v46);

  hardwareKeyboardMode = self->_hardwareKeyboardMode;
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setHardwareKeyboardMode:", hardwareKeyboardMode);

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setShortcutConversionEnabled:", 1);

  v51 = -[ACTKeyboardController wordLearningEnabled](self, "wordLearningEnabled");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setWordLearningEnabled:", v51);

  v53 = -[ACTKeyboardController inlineCompletionEnabled](self, "inlineCompletionEnabled");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setInlineCompletionEnabled:", v53);

  -[ACTKeyboardController clientIdentifier](self, "clientIdentifier");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setClientIdentifier:", v55);

  -[ACTKeyboardController recipientIdentifier](self, "recipientIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setRecipientIdentifier:", v57);

  -[ACTKeyboardController inputContextHistory](self, "inputContextHistory");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setInputContextHistory:", v59);

  v61 = -[ACTKeyboardController supplementalLexiconIdentifier](self, "supplementalLexiconIdentifier");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setSupplementalLexiconIdentifier:", v61);

  v63 = -[ACTKeyboardController canSuggestSupplementalItemsForCurrentSelection](self, "canSuggestSupplementalItemsForCurrentSelection");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v64 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v64, "setCanSuggestSupplementalItemsForCurrentSelection:", v63);

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v64) = objc_opt_respondsToSelector();

  if ((v64 & 1) != 0)
  {
    v66 = -[ACTKeyboardController longPredictionListEnabled](self, "longPredictionListEnabled");
    -[ACTKeyboardController keyboardState](self, "keyboardState");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setLongPredictionListEnabled:", v66);

  }
  v68 = objc_alloc_init(MEMORY[0x24BEB4E50]);
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setLayoutState:", v68);

  -[ACTKeyboardController inputModeIdentifier](self, "inputModeIdentifier");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "layoutState");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setInputMode:", v70);

  -[ACTKeyboardController keyplane](self, "keyplane");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "cachedKeysByKeyName:", CFSTR("Candidate-Selection"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "count") != 0;
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "layoutState");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setHasCandidateKey:", v75);

  -[ACTKeyboardController keyplane](self, "keyplane");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "cachedKeysByKeyName:", CFSTR("Latin-Accents"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "count") != 0;
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "layoutState");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setHasAccentKey:", v80);

  -[ACTKeyboardController keyplane](self, "keyplane");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "cachedKeysByKeyName:", CFSTR("Multitap-Complete-Key"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "count") != 0;
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "layoutState");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setCanMultitap:", v85);

  -[ACTKeyboardController keyplane](self, "keyplane");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "isAlphabeticPlane");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "layoutState");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setIsAlphabeticPlane:", v89);

  -[ACTKeyboardController keyplane](self, "keyplane");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v92, "isKanaPlane");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "layoutState");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setIsKanaPlane:", v93);

  -[ACTKeyboardController keyplane](self, "keyplane");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "name");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v94) = objc_msgSend(v97, "containsString:", CFSTR("Wildcat"));

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "layoutState");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setUserInterfaceIdiom:", v94);

  v100 = -[ACTKeyboardController secureTextEntry](self, "secureTextEntry");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setSecureTextEntry:", v100);

  v102 = -[ACTKeyboardController isScreenLocked](self, "isScreenLocked");
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setIsScreenLocked:", v102);

  -[ACTKeyboardController setInitialKeyplane](self, "setInitialKeyplane");
  -[ACTKeyboardController layoutUtils](self, "layoutUtils");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "keyOverrides");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "removeAllObjects");

  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "removeAllObjects");

  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v26;
  v109[1] = 3221225472;
  v109[2] = __45__ACTKeyboardController_syncToDocumentState___block_invoke_2;
  v109[3] = &unk_24FD49288;
  v109[4] = self;
  objc_msgSend(v107, "syncToKeyboardState:completionHandler:", v108, v109);

  -[ACTKeyboardController setLastInputWasSelection:](self, "setLastInputWasSelection:", 0);
  -[ACTKeyboardController setLastInputWasContinuousPath:](self, "setLastInputWasContinuousPath:", 0);
  -[ACTKeyboardController setInputIsPunctuationFollowingContinuousPath:](self, "setInputIsPunctuationFollowingContinuousPath:", 0);
  -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
  -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");

}

- (void)syncToEmptyDocument
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB4D20]), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", &stru_24FD49B78, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  -[ACTKeyboardController syncToDocumentState:](self, "syncToDocumentState:", v3);

}

- (void)syncToKeyboardState
{
  -[ACTKeyboardController syncToKeyboardStateByWaitingForResults:](self, "syncToKeyboardStateByWaitingForResults:", 0);
}

- (BOOL)syncToKeyboardStateByWaitingForResults:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = !a3;
  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__ACTKeyboardController_syncToKeyboardStateByWaitingForResults___block_invoke;
  v12[3] = &unk_24FD492B0;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v4, "syncToKeyboardState:completionHandler:", v5, v12);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v14 + 24))
  {
LABEL_5:
    v10 = 1;
  }
  else
  {
    v7 = *MEMORY[0x24BDBCA90];
    while (1)
    {
      objc_msgSend(v6, "timeIntervalSinceNow");
      if (v8 <= 0.0)
        break;
      objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "acceptInputForMode:beforeDate:", v7, v6);

      if (*((_BYTE *)v14 + 24))
        goto LABEL_5;
    }
    v10 = *((_BYTE *)v14 + 24) != 0;
  }

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)updateDocumentState
{
  void *v3;
  NSUInteger location;
  NSUInteger length;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;

  -[ACTKeyboardController text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  location = self->_selectedRange.location;
  length = self->_selectedRange.length;
  v23 = v3;
  if ((unint64_t)objc_msgSend(v3, "length") <= 0x1000)
  {
    v8 = v23;
  }
  else
  {
    v6 = objc_msgSend(v23, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v23, "length") - 2048);
    objc_msgSend(v23, "substringFromIndex:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    location -= v6;
    v8 = (void *)v7;
  }
  v24 = v8;
  if (location)
  {
    objc_msgSend(v8, "substringToIndex:", location);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (length)
    {
LABEL_6:
      objc_msgSend(v24, "substringWithRange:", location, length);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    v9 = &stru_24FD49B78;
    if (length)
      goto LABEL_6;
  }
  v10 = 0;
LABEL_9:
  v11 = location + length;
  if (v11 >= objc_msgSend(v24, "length"))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v24, "substringFromIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BEB4D20], "documentStateWithContextBefore:selectedText:contextAfter:", v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController markedText](self, "markedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    -[ACTKeyboardController intermediateText](self, "intermediateText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController intermediateText](self, "intermediateText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "selectedRange");
    objc_msgSend(v13, "documentStateAfterSettingMarkedText:selectedRange:", v17, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v21;
  }
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDocumentState:", v13);

}

- (void)insertText:(id)a3
{
  NSMutableString *text;
  NSUInteger location;
  NSUInteger length;
  id v7;
  uint64_t v8;

  if (a3)
  {
    text = self->_text;
    location = self->_selectedRange.location;
    length = self->_selectedRange.length;
    v7 = a3;
    -[NSMutableString replaceCharactersInRange:withString:](text, "replaceCharactersInRange:withString:", location, length, v7);
    v8 = objc_msgSend(v7, "length");

    self->_selectedRange.location += v8;
    self->_selectedRange.length = 0;
    -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
  }
}

- (void)deleteBackwards
{
  NSUInteger location;
  NSUInteger v4;
  uint64_t v5;

  if (self->_selectedRange.length)
  {
    -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", self->_selectedRange.location);
LABEL_5:
    self->_selectedRange.length = 0;
    goto LABEL_6;
  }
  location = self->_selectedRange.location;
  if (location)
  {
    v4 = -[NSMutableString _rangeOfBackwardDeletionClusterAtIndex:](self->_text, "_rangeOfBackwardDeletionClusterAtIndex:", location - 1);
    -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", v4, v5);
    self->_selectedRange.location = v4;
    goto LABEL_5;
  }
LABEL_6:
  -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
}

- (_NSRange)selectedRangeForText:(id)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v4 = a3;
  v5 = self->_selectedRange.length + self->_selectedRange.location;
  if (v5 <= objc_msgSend(v4, "length"))
    v6 = 0;
  else
    v6 = v5 - objc_msgSend(v4, "length");

  v7 = v6;
  v8 = v5 - v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)deleteText:(id)a3 rawText:(id)a4
{
  id v6;
  uint64_t location;
  NSUInteger v8;
  NSUInteger length;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  location = -[ACTKeyboardController selectedRangeForText:](self, "selectedRangeForText:", v15);
  length = v8;
  v10 = -[ACTKeyboardController selectedRangeForText:](self, "selectedRangeForText:", v6);
  v12 = v11;
  -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", location, length);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if (!objc_msgSend(v13, "isEqualToString:", v15))
  {
    if (objc_msgSend(v14, "isEqualToString:", v6))
    {
      self->_selectedRange.location = v10;
      self->_selectedRange.length = v12;
      length = v12;
      location = v10;
      goto LABEL_11;
    }
    if (!v15 || v14)
    {
      location = self->_selectedRange.location;
      length = self->_selectedRange.length;
      goto LABEL_11;
    }
  }
  self->_selectedRange.location = location;
  self->_selectedRange.length = length;
LABEL_11:
  -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", location, length);
  self->_selectedRange.length = 0;
  -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");

}

- (void)setSelectedRange:(_NSRange)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (a3.location != self->_selectedRange.location || a3.length != self->_selectedRange.length)
  {
    self->_selectedRange = a3;
    -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0);
    -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
    -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __42__ACTKeyboardController_setSelectedRange___block_invoke;
    v7[3] = &unk_24FD49288;
    v7[4] = self;
    objc_msgSend(v5, "syncToKeyboardState:completionHandler:", v6, v7);

  }
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__ACTKeyboardController_adjustPhraseBoundaryInForwardDirection_granularity___block_invoke;
  v9[3] = &unk_24FD49288;
  v9[4] = self;
  objc_msgSend(v7, "adjustPhraseBoundaryInForwardDirection:granularity:keyboardState:completionHandler:", v5, v4, v8, v9);

}

- (void)adjustCursorByOffset:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentStateAfterCursorAdjustment:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDocumentState:", v7);

  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncToKeyboardState:completionHandler:", v9, &__block_literal_global_107);

}

- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  int64_t v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _ACTKeyboardTouchState *v27;
  void *v28;
  void *v29;
  int64_t v30;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int64_t v36;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACTKeyboardController keyplane](self, "keyplane");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController keyContainingPoint:inKeyplane:](self, "keyContainingPoint:inKeyplane:", v17, x, y);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "interactionType") == 14)
  {
    -[ACTKeyboardController keyplane](self, "keyplane");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("Shift");
LABEL_5:
    v21 = -[ACTKeyboardController keyCodeWithString:inKeyplane:](self, "keyCodeWithString:inKeyplane:", v20, v19);

    goto LABEL_7;
  }
  if (objc_msgSend(v18, "interactionType") == 11)
  {
    -[ACTKeyboardController keyplane](self, "keyplane");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("More");
    goto LABEL_5;
  }
  v21 = -1;
LABEL_7:
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = v21;
  v22 = a4;
  if (objc_msgSend(v18, "interactionType") != 11)
  {
    objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 0, a6, v7, v21, 1, x, y, v22, a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __88__ACTKeyboardController_performTouchDownAtLocation_radius_timestamp_pathIndex_fingerID___block_invoke;
    v32[3] = &unk_24FD49318;
    v32[4] = &v33;
    objc_msgSend(v24, "performHitTestForTouchEvent:keyboardState:continuation:", v23, v25, v32);

  }
  objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 0, a6, v7, v34[3], 1, x, y, v22, a5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(_ACTKeyboardTouchState);
  -[_ACTKeyboardTouchState setLastTouchEvent:](v27, "setLastTouchEvent:", v26);
  -[_ACTKeyboardTouchState setDragged:](v27, "setDragged:", 0);
  -[_ACTKeyboardTouchState setInitialDragPoint:](v27, "setInitialDragPoint:", x, y);
  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v27, v29);

  v30 = v34[3];
  _Block_object_dispose(&v33, 8);

  return v30;
}

- (BOOL)touchPassesDragThresholdAtPoint:(CGPoint)a3 pathIndex:(unint64_t)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  float v19;
  float v20;
  float v21;
  float v22;
  BOOL v23;
  BOOL v24;

  y = a3.y;
  x = a3.x;
  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "initialDragPoint");
  v12 = v11;
  v14 = v13;
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  v18 = objc_msgSend(v10, "dragged");
  v19 = 42.0;
  if (v18)
    v19 = 34.0;
  v20 = 18.0;
  if (v18)
    v20 = 12.0;
  if (v17 != 1)
    v19 = v20;
  v21 = y - v14;
  v22 = x - v12;
  v23 = fabsf(v22) >= v19;
  v24 = fabsf(v21) >= v19 || v23;

  return v24;
}

- (int64_t)retestTouchAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _ACTKeyboardTouchState *v25;
  void *v26;
  void *v27;
  int64_t v28;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "lastTouchEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "continuousPathState") == 1)
    v18 = 3;
  else
    v18 = objc_msgSend(v17, "continuousPathState");
  if (objc_msgSend(v17, "forcedKeyCode") == -2)
    v19 = -2;
  else
    v19 = -1;
  v20 = a4;
  objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 1, a6, v7, v19, v18, x, y, v20, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = v19;
  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __83__ACTKeyboardController_retestTouchAtLocation_radius_timestamp_pathIndex_fingerID___block_invoke;
  v30[3] = &unk_24FD49318;
  v30[4] = &v31;
  objc_msgSend(v22, "performHitTestForTouchEvent:keyboardState:continuation:", v21, v23, v30);

  objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 1, a6, v7, x, y, v20, a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(_ACTKeyboardTouchState);
  -[_ACTKeyboardTouchState setLastTouchEvent:](v25, "setLastTouchEvent:", v24);
  -[_ACTKeyboardTouchState setDragged:](v25, "setDragged:", 1);
  -[_ACTKeyboardTouchState setInitialDragPoint:](v25, "setInitialDragPoint:", x, y);
  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v25, v27);

  v28 = v32[3];
  _Block_object_dispose(&v31, 8);

  return v28;
}

- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  int64_t v18;
  void *v19;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ACTKeyboardController touchPassesDragThresholdAtPoint:pathIndex:](self, "touchPassesDragThresholdAtPoint:pathIndex:", a6, x, y))
  {
    *(float *)&v17 = a4;
    v18 = -[ACTKeyboardController retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:](self, "retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v17, a5);
  }
  else
  {
    objc_msgSend(v16, "lastTouchEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "forcedKeyCode");

  }
  return v18;
}

- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "lastTouchEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "continuousPathState");
  if (v17 == 2)
    v18 = 2;
  else
    v18 = 6;
  if (v17)
    v19 = v18;
  else
    v19 = 0;
  if (objc_msgSend(v16, "forcedKeyCode") == -2)
    v20 = -2;
  else
    v20 = -1;
  objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 3, a6, v7, v20, v19, x, y, a4, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "skipHitTestForTouchEvent:keyboardState:", v21, v23);

  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeObjectForKey:", v25);

}

- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _ACTKeyboardTouchState *v25;
  void *v26;
  void *v27;
  id v28;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "lastTouchEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = objc_msgSend(v16, "continuousPathState");
    if (v18 == 2)
      v19 = 2;
    else
      v19 = 6;
    if (v18)
      v20 = v19;
    else
      v20 = 0;
    v21 = objc_msgSend(v17, "forcedKeyCode");
  }
  else
  {
    v20 = 0;
    v21 = -1;
  }
  objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 4, a6, v7, v21, v20, x, y, a4, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "skipHitTestForTouchEvent:keyboardState:", v22, v24);

  v25 = objc_alloc_init(_ACTKeyboardTouchState);
  -[_ACTKeyboardTouchState setLastTouchEvent:](v25, "setLastTouchEvent:", v22);
  -[_ACTKeyboardTouchState setDragged:](v25, "setDragged:", objc_msgSend(v28, "dragged"));
  objc_msgSend(v28, "initialDragPoint");
  -[_ACTKeyboardTouchState setInitialDragPoint:](v25, "setInitialDragPoint:");
  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v25, v27);

}

- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "lastTouchEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "continuousPathState");
  if (v17 == 2)
    v18 = 2;
  else
    v18 = 6;
  if (v17)
    v19 = v18;
  else
    v19 = 0;
  v20 = objc_msgSend(v16, "forcedKeyCode");
  objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 5, a6, v7, v20, v19, x, y, a4, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "performHitTestForTouchEvent:keyboardState:continuation:", v21, v23, &__block_literal_global_116);

  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeObjectForKey:", v25);

}

- (id)adjustContinuousPathCandidate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;

  v4 = a3;
  -[ACTKeyboardController text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (v6 >= 3
    && objc_msgSend(v4, "length")
    && objc_msgSend(v5, "characterAtIndex:", (v6 - 1)) == 46
    && objc_msgSend(v5, "characterAtIndex:", (v6 - 2)) == 46
    && objc_msgSend(v5, "characterAtIndex:", (v6 - 3)) == 46
    && objc_msgSend(v4, "characterAtIndex:", 0))
  {
    objc_msgSend(v4, "substringFromIndex:", 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }

  return v4;
}

- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v9;
  double y;
  double x;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;

  v8 = a8;
  v9 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[ACTKeyboardController activeTouchState](self, "activeTouchState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0x24BDD1000uLL;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "lastTouchEvent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ACTKeyboardController touchPassesDragThresholdAtPoint:pathIndex:](self, "touchPassesDragThresholdAtPoint:pathIndex:", a6, x, y)|| objc_msgSend(v20, "continuousPathState") == 3|| objc_msgSend(v20, "continuousPathState") == 4)
  {
    *(float *)&v21 = a4;
    -[ACTKeyboardController retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:](self, "retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v9, x, y, v21, a5);
    -[ACTKeyboardController activeTouchState](self, "activeTouchState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "lastTouchEvent");
    v25 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v25;
    v19 = v24;
  }
  v26 = objc_msgSend(v20, "forcedKeyCode");
  if (objc_msgSend(v20, "continuousPathState") == 4)
    v27 = 5;
  else
    v27 = objc_msgSend(v20, "continuousPathState");
  objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 2, a6, v9, v26, v27, x, y, a4, a5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 == -2)
  {
    if (!-[ACTKeyboardController insertsSpaceAfterPredictiveInput](self, "insertsSpaceAfterPredictiveInput")
      && !-[ACTKeyboardController usesTransliteration](self, "usesTransliteration"))
    {
      -[ACTKeyboardController autocorrection](self, "autocorrection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v29, "isAutocorrection"))
      {
LABEL_32:

        goto LABEL_33;
      }
      -[ACTKeyboardController autocorrection](self, "autocorrection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "candidate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v31, "length"))
      {

        goto LABEL_31;
      }
      -[ACTKeyboardController autocorrection](self, "autocorrection");
      v32 = v28;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isContinuousPathConversion");

      v28 = v32;
      if ((v34 & 1) == 0)
      {
        -[ACTKeyboardController setLastInputWasSelection:](self, "setLastInputWasSelection:", 1);
        -[ACTKeyboardController inputManagerState](self, "inputManagerState");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "wordSeparator");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACTKeyboardController addInput:fromVariantKey:touchEvent:](self, "addInput:fromVariantKey:touchEvent:", v30, 0, 0);
LABEL_31:

        goto LABEL_32;
      }
    }
LABEL_33:
    -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "skipHitTestForTouchEvent:keyboardState:", v28, v56);

    -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");
    -[ACTKeyboardController autocorrection](self, "autocorrection");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "candidate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ACTKeyboardController usesTransliteration](self, "usesTransliteration")
      || -[ACTKeyboardController generatesCandidates](self, "generatesCandidates"))
    {
      v43 = 0;
      v58 = 0x24BDD1000;
LABEL_48:
      -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
      -[ACTKeyboardController activeTouchState](self, "activeTouchState");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v58 + 1760), "numberWithUnsignedInteger:", a6);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "removeObjectForKey:", v79);

      goto LABEL_49;
    }
    v86 = v28;
    v59 = (void *)MEMORY[0x24BEB4CF8];
    -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "predictions");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "emojiList");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "listWithCorrections:predictions:emojiList:", 0, v61, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v44, "length"))
    {
      v43 = 0;
      goto LABEL_40;
    }
    if (-[ACTKeyboardController insertsSpaceAfterPredictiveInput](self, "insertsSpaceAfterPredictiveInput"))
    {
      -[ACTKeyboardController inputManagerState](self, "inputManagerState");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "wordSeparator");
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[ACTKeyboardController inputManagerState](self, "inputManagerState");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "wordSeparator");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringByAppendingString:", v67);
      v68 = objc_claimAutoreleasedReturnValue();

      v69 = -[ACTKeyboardController adjustContinuousPathCandidate:](self, "adjustContinuousPathCandidate:", v68);
      -[ACTKeyboardController addInput:fromVariantKey:touchEvent:](self, "addInput:fromVariantKey:touchEvent:", v43, 0, 0);
      v44 = (void *)v68;
LABEL_40:
      v58 = 0x24BDD1000;
LABEL_47:
      v28 = v86;
      -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", v64);

      goto LABEL_48;
    }
    -[ACTKeyboardController autocorrection](self, "autocorrection");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "candidate");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v71, "hasPrefix:", CFSTR(" ")))
    {
      -[ACTKeyboardController text](self, "text");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "hasSuffix:", CFSTR("..."));

      if (!v73)
      {
        v58 = 0x24BDD1000uLL;
        goto LABEL_46;
      }
      v81 = objc_alloc(MEMORY[0x24BEB4ED8]);
      objc_msgSend(v70, "candidate");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "substringFromIndex:", 1);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "input");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "rawInput");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend(v81, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:", v74, v75, v76, objc_msgSend(v70, "wordOriginFeedbackID"), objc_msgSend(v70, "usageTrackingMask"), objc_msgSend(v70, "sourceMask"));

      objc_msgSend(v82, "setContinuousPathConversion:", 1);
      v71 = v70;
      v70 = v82;
    }
    v58 = 0x24BDD1000;

LABEL_46:
    objc_msgSend(v70, "candidate");
    v77 = objc_claimAutoreleasedReturnValue();

    -[ACTKeyboardController acceptCandidate:](self, "acceptCandidate:", v70);
    v43 = 0;
    v44 = (void *)v77;
    goto LABEL_47;
  }
  -[ACTKeyboardController keys](self, "keys");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndex:", v26);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACTKeyboardController layoutUtils](self, "layoutUtils");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "representedStringForKey:shifted:includeSecondaryStrings:", v36, -[ACTKeyboardController isShifted](self, "isShifted"), v8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  v40 = &stru_24FD49B78;
  switch(objc_msgSend(v36, "interactionType"))
  {
    case 1u:
    case 2u:
    case 0xDu:
    case 0x10u:
      -[ACTKeyboardController addInput:fromVariantKey:touchEvent:](self, "addInput:fromVariantKey:touchEvent:", v38, 0, v28);
      v39 = v38;
      goto LABEL_17;
    case 4u:
      -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "skipHitTestForTouchEvent:keyboardState:", v28, v46);

      -[ACTKeyboardController deleteInput:](self, "deleteInput:", v28);
      v39 = CFSTR("\\b");
      goto LABEL_17;
    case 0xBu:
      goto LABEL_18;
    case 0xEu:
      -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "skipHitTestForTouchEvent:keyboardState:", v28, v48);

      -[ACTKeyboardController shiftKeyplane](self, "shiftKeyplane");
      v39 = &stru_24FD49B78;
      goto LABEL_17;
    case 0xFu:
      v85 = v28;
      -[ACTKeyboardController addInput:fromVariantKey:touchEvent:](self, "addInput:fromVariantKey:touchEvent:", v38, 0, v28);
      v39 = v38;
      -[ACTKeyboardController keyplane](self, "keyplane");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "name");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "containsString:", CFSTR("Wildcat"));

      if ((v51 & 1) != 0)
      {
        -[ACTKeyboardController keyplane](self, "keyplane");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "name");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "uppercaseString");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v54, "containsString:", CFSTR("-ALTERNATE"));

        v17 = 0x24BDD1000;
        v28 = v85;
        if (!v83)
          goto LABEL_19;
      }
      else
      {
        v17 = 0x24BDD1000;
        v28 = v85;
      }
LABEL_17:
      v40 = v39;
      if (objc_msgSend(v36, "BOOLForProperty:", CFSTR("more-after")))
      {
LABEL_18:
        -[ACTKeyboardController alternateKeyplane](self, "alternateKeyplane");
        v39 = (__CFString *)v40;
      }
LABEL_19:
      if (objc_msgSend(v36, "BOOLForProperty:", CFSTR("shift-after")))
        -[ACTKeyboardController shiftKeyplane](self, "shiftKeyplane");
      if (objc_msgSend(v36, "interactionType") != 14)
        -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
      -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");

      -[ACTKeyboardController activeTouchState](self, "activeTouchState");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v17 + 1760), "numberWithUnsignedInteger:", a6);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "removeObjectForKey:", v42);

      v43 = v39;
      v44 = v43;
      break;
    default:
      goto LABEL_17;
  }
LABEL_49:

  return v44;
}

- (id)performSkipTapAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 forcedKeyCode:(int64_t)a8
{
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;

  -[ACTKeyboardController keys](self, "keys", a6, *(_QWORD *)&a7, a3.x, a3.y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "interactionType") == 11)
  {
    v12 = &stru_24FD49B78;
  }
  else
  {
    v12 = 0;
    v13 = 0;
    if (!objc_msgSend(v11, "BOOLForProperty:", CFSTR("more-after")))
      goto LABEL_5;
  }
  -[ACTKeyboardController alternateKeyplane](self, "alternateKeyplane");
  v13 = v12;
LABEL_5:
  if (objc_msgSend(v11, "BOOLForProperty:", CFSTR("shift-after")))
    -[ACTKeyboardController shiftKeyplane](self, "shiftKeyplane");
  if (objc_msgSend(v11, "interactionType") != 14)
    -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
  -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");

  return (id)v13;
}

- (void)addStringFromVariantKey:(id)a3
{
  -[ACTKeyboardController addInput:fromVariantKey:fromGestureKey:](self, "addInput:fromVariantKey:fromGestureKey:", a3, 1, 0);
}

- (void)addStringFromGestureKeyInput:(id)a3
{
  -[ACTKeyboardController addInput:fromVariantKey:fromGestureKey:](self, "addInput:fromVariantKey:fromGestureKey:", a3, 0, 1);
}

- (int64_t)keyCodeWithString:(id)a3 inKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  int64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -1;
  objc_msgSend(v7, "keys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__ACTKeyboardController_keyCodeWithString_inKeyplane___block_invoke;
  v13[3] = &unk_24FD49380;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  v11 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (float)distanceFromKey:(id)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  double MinX;
  uint64_t v8;
  double MaxX;
  float v13;
  double MinY;
  uint64_t v15;
  double v19;
  CGFloat MaxY;
  float v21;
  float v22;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  objc_msgSend(v6, "frame");
  MinX = CGRectGetMinX(v24);
  objc_msgSend(v6, "frame");
  if (x >= MinX)
  {
    v13 = 0.0;
    if (x <= CGRectGetMaxX(*(CGRect *)&v8))
      goto LABEL_6;
    objc_msgSend(v6, "frame");
    MaxX = CGRectGetMaxX(v25);
  }
  else
  {
    MaxX = CGRectGetMinX(*(CGRect *)&v8);
  }
  v13 = x - MaxX;
LABEL_6:
  objc_msgSend(v6, "frame");
  MinY = CGRectGetMinY(v26);
  objc_msgSend(v6, "frame");
  if (y < MinY)
  {
    v19 = CGRectGetMinY(*(CGRect *)&v15);
LABEL_10:
    v21 = y - v19;
    goto LABEL_11;
  }
  MaxY = CGRectGetMaxY(*(CGRect *)&v15);
  v21 = 0.0;
  if (y > MaxY)
  {
    objc_msgSend(v6, "frame");
    v19 = CGRectGetMaxY(v27);
    goto LABEL_10;
  }
LABEL_11:
  v22 = sqrtf((float)(v21 * v21) + (float)(v13 * v13));

  return v22;
}

- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  float v16;
  double v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGPoint v26;
  CGRect v27;

  y = a3.y;
  x = a3.x;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(v7, "frame");
  v26.x = x;
  v26.y = y;
  if (CGRectContainsPoint(v27, v26))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v7, "keys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v21;
      v13 = 1.79769313e308;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v15, "visible"))
          {
            -[ACTKeyboardController distanceFromKey:toPoint:](self, "distanceFromKey:toPoint:", v15, x, y);
            v17 = v16;
            if (v13 > v16)
            {
              v18 = v15;

              v11 = v18;
              v13 = v17;
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isKeyStringAboveSpaceBar:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  CGFloat MidX;
  CGFloat v18;
  BOOL v19;
  CGPoint v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  -[ACTKeyboardController keyplane](self, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ACTKeyboardController keyCodeWithString:inKeyplane:](self, "keyCodeWithString:inKeyplane:", CFSTR(" "), v5);

  if (v6 == -1)
  {
    v19 = 0;
  }
  else
  {
    -[ACTKeyboardController keyplane](self, "keyplane");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACTKeyboardController keyplane](self, "keyplane");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ACTKeyboardController keyCodeWithString:inKeyplane:](self, "keyCodeWithString:inKeyplane:", v4, v10);

    if (v11 == -1)
    {
      v19 = 0;
    }
    else
    {
      -[ACTKeyboardController keyplane](self, "keyplane");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "frame");
      v16 = v15;
      objc_msgSend(v14, "frame");
      MidX = CGRectGetMidX(v22);
      objc_msgSend(v14, "frame");
      v18 = v16 + CGRectGetMidY(v23);
      objc_msgSend(v9, "frame");
      v21.x = MidX;
      v21.y = v18;
      v19 = CGRectContainsPoint(v24, v21);

    }
  }

  return v19;
}

- (void)enumerateKeyplaneNamesAdjacentToKeyplane:(id)a3 usingBlock:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a4;
  objc_msgSend(a3, sel_shiftAlternateKeyplaneName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v5);

  objc_msgSend(a3, sel_alternateKeyplaneName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v6);

}

- (BOOL)isKeyplane:(id)a3 shiftAlternateOfKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[ACTKeyboardController keyboard](self, "keyboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shiftAlternateKeyplaneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "subtreeWithName:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10 == v7;
}

- (BOOL)isKeyplane:(id)a3 alternateOfKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[ACTKeyboardController keyboard](self, "keyboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alternateKeyplaneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "subtreeWithName:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10 == v7;
}

- (id)keyToAccessKeyplane:(id)a3 fromKeyplane:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[ACTKeyboardController isKeyplane:shiftAlternateOfKeyplane:](self, "isKeyplane:shiftAlternateOfKeyplane:", v6, v7))
  {
    v8 = CFSTR("Shift");
  }
  else
  {
    if (!-[ACTKeyboardController isKeyplane:alternateOfKeyplane:](self, "isKeyplane:alternateOfKeyplane:", v6, v7))
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = CFSTR("More");
  }
  -[ACTKeyboardLayoutUtils exactKeyForString:keyplane:includeSecondaryStrings:](self->_layoutUtils, "exactKeyForString:keyplane:includeSecondaryStrings:", v8, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v9;
}

- (id)displayStringOverrideForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ACTKeyboardController layoutUtils](self, "layoutUtils");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyOverrides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)acceptAutocorrection
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAcceptTopCandidate");

  if (v4)
  {
    -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[ACTKeyboardController textAccepted:predictiveCandidate:](self, "textAccepted:predictiveCandidate:", v7, 0);
  -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0);

}

- (void)rejectCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t i;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ACTKeyboardController *v27;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidateRejected:", v4);

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = self;
  -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predictions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v28 = v4;
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v31;
    v12 = &stru_24FD49B78;
    v13 = &stru_24FD49B78;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v15, "input");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v13)
        {
          v18 = -[__CFString length](v16, "length");
          v19 = -[__CFString length](v13, "length");

          if (v18 <= v19)
            continue;
          objc_msgSend(v15, "input");
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v15, "rawInput");
        v20 = objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v15, "typingEngine");
        v12 = (__CFString *)v20;
        v13 = v17;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (!v9)
        goto LABEL_16;
    }
  }
  v10 = 0;
  v12 = &stru_24FD49B78;
  v13 = &stru_24FD49B78;
LABEL_16:

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E20]), "initWithCandidate:forInput:rawInput:", v13, v13, v12);
  objc_msgSend(v21, "setTypingEngine:", v10);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4D18]), "initWithAutocorrection:alternateCorrections:", v21, 0);
  v23 = (void *)MEMORY[0x24BEB4CF8];
  -[ACTKeyboardController autocorrectionList](v27, "autocorrectionList");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "predictions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "listWithCorrections:predictions:", v22, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController setAutocorrectionList:](v27, "setAutocorrectionList:", v26);

}

- (BOOL)hasPrediction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ACTKeyboardController autocorrectionList](self, "autocorrectionList", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "candidate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "compare:", v4) == 0;

        v9 |= v13;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

- (void)acceptCandidate:(id)a3
{
  -[ACTKeyboardController acceptCandidate:predictiveCandidate:](self, "acceptCandidate:predictiveCandidate:", a3, 0);
}

- (void)acceptCandidate:(id)a3 predictiveCandidate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v4 = a4;
  v6 = a3;
  -[ACTKeyboardController inputManagerState](self, "inputManagerState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "usesCandidateSelection");

  if (v8)
  {
    -[ACTKeyboardController inputManagerState](self, "inputManagerState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "commitsAcceptedCandidate");

    if (v10)
    {
      objc_msgSend(v6, "candidate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12)
      {
        -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textAccepted:", v6);

      }
      -[ACTKeyboardController setMarkedText:](self, "setMarkedText:", 0);
      objc_msgSend(v6, "candidate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTKeyboardController insertText:](self, "insertText:", v14);

    }
    -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __61__ACTKeyboardController_acceptCandidate_predictiveCandidate___block_invoke;
    v17[3] = &unk_24FD493A8;
    v17[4] = self;
    objc_msgSend(v15, "handleAcceptedCandidate:keyboardState:completionHandler:", v6, v16, v17);

  }
  else
  {
    -[ACTKeyboardController textAccepted:predictiveCandidate:](self, "textAccepted:predictiveCandidate:", v6, v4);
  }
  -[ACTKeyboardController setLastInputWasSelection:](self, "setLastInputWasSelection:", v4);
  -[ACTKeyboardController setCandidateResultSet:](self, "setCandidateResultSet:", 0);
  -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0);

}

- (id)candidateByApplyingSmartPunctuationToCandidate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACTKeyboardController smartPunctuationController](self, "smartPunctuationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  v7 = v6;
  if (v5)
  {
    -[ACTKeyboardController smartPunctuationController](self, "smartPunctuationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "smartPunctuationResultsForString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6;
    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)MEMORY[0x24BDD16A8];
      objc_msgSend(v6, "candidate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v10, "reverseObjectEnumerator", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            v20 = objc_msgSend(v19, "range");
            v22 = v21;
            objc_msgSend(v19, "replacementString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "replaceCharactersInRange:withString:", v20, v22, v23);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v16);
      }

      v24 = objc_alloc(MEMORY[0x24BEB4E20]);
      objc_msgSend(v6, "input");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rawInput");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v24, "initWithCandidate:forInput:rawInput:", v13, v25, v26);

    }
  }

  return v7;
}

- (void)textAccepted:(id)a3 predictiveCandidate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[ACTKeyboardController candidateByApplyingSmartPunctuationToCandidate:](self, "candidateByApplyingSmartPunctuationToCandidate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __58__ACTKeyboardController_textAccepted_predictiveCandidate___block_invoke;
      v21[3] = &unk_24FD49288;
      v21[4] = self;
      objc_msgSend(v12, "textAccepted:completionHandler:", v9, v21);
    }
    else
    {
      objc_msgSend(v12, "textAccepted:", v9);
    }

    if (v4)
    {
      -[ACTKeyboardController inputManager](self, "inputManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dropInput");

    }
    if (objc_msgSend(v9, "isContinuousPathConversion"))
    {
      objc_msgSend(v9, "input");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {

      }
      else
      {
        objc_msgSend(v9, "rawInput");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (!v17)
        {
          -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", self->_selectedRange.location, self->_selectedRange.length);
          self->_selectedRange.length = 0;
          -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
          goto LABEL_13;
        }
      }
    }
    objc_msgSend(v9, "input");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rawInput");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController deleteText:rawText:](self, "deleteText:rawText:", v18, v19);

LABEL_13:
    objc_msgSend(v9, "candidate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController insertText:](self, "insertText:", v20);

    goto LABEL_14;
  }
  v9 = v6;
LABEL_14:

}

- (TIKeyboardCandidate)inlineCompletion
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAcceptInlineCompletion");

  if (v4)
  {
    -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inlineCompletions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "candidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACTKeyboardController text](self, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ACTKeyboardController selectedRange](self, "selectedRange");
    objc_msgSend(v10, "substringFromIndex:", v12 + v11 - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "isEqualToString:", CFSTR(" ")) & 1) != 0)
    {
      if ((unint64_t)objc_msgSend(v9, "count") < 2)
      {
        v16 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "candidateByReplacingWithCandidate:input:rawInput:", v14, &stru_24FD49B78, &stru_24FD49B78);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "candidateByReplacingWithCandidate:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;

    v7 = (void *)v14;
LABEL_9:

    return (TIKeyboardCandidate *)v16;
  }
  v16 = 0;
  return (TIKeyboardCandidate *)v16;
}

- (TIKeyboardCandidate)autocorrection
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAcceptTopCandidate");

  if (!v4)
    goto LABEL_4;
  -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ACTKeyboardController trimmedCandidate:](self, "trimmedCandidate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    -[ACTKeyboardController candidateToConfirmInputString](self, "candidateToConfirmInputString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[ACTKeyboardController text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ACTKeyboardController selectedRange](self, "selectedRange");
  objc_msgSend(v9, "substringToIndex:", v10 + v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "input");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v8, "input");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "hasSuffix:", v14))
    {

    }
    else
    {
      objc_msgSend(v8, "rawInput");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        objc_msgSend(v8, "rawInput");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v12, "hasSuffix:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_14;
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x24BEB4E20], "candidateWithUnchangedInput:", &stru_24FD49B78);
      v13 = v8;
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_14:
  return (TIKeyboardCandidate *)v8;
}

- (NSArray)predictions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[ACTKeyboardController candidateResultSet](self, "candidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || !objc_msgSend(v4, "count"))
  {
    -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predictions");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x24BDBD1A8];
    if (v6)
      v8 = (void *)v6;
    v9 = v8;

    v4 = v9;
  }
  return (NSArray *)v4;
}

- (id)candidateToConfirmInputString
{
  void *v3;
  void *v4;
  void *v5;

  -[ACTKeyboardController inputManager](self, "inputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultCandidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACTKeyboardController trimmedCandidate:](self, "trimmedCandidate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)trimmedCandidate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v3 = a3;
  objc_msgSend(v3, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rawInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "length");
  v8 = objc_msgSend(v6, "length");
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __42__ACTKeyboardController_trimmedCandidate___block_invoke;
  v22[3] = &unk_24FD493D0;
  v11 = v4;
  v23 = v11;
  v12 = v10;
  v24 = v12;
  v25 = &v26;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v22);
  v13 = v3;
  v14 = v13;
  if (v27[3])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_alloc(MEMORY[0x24BEB4ED8]);
      objc_msgSend(v6, "substringFromIndex:", v27[3]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "substringFromIndex:", v27[3]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v15, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:", v16, v17, v5, objc_msgSend(v13, "wordOriginFeedbackID"), objc_msgSend(v13, "usageTrackingMask"), objc_msgSend(v13, "sourceMask"));

      objc_msgSend(v14, "setContinuousPathConversion:", objc_msgSend(v13, "isContinuousPathConversion"));
      v18 = v13;
    }
    else
    {
      v19 = (void *)MEMORY[0x24BEB4E20];
      objc_msgSend(v6, "substringFromIndex:", v27[3]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "substringFromIndex:", v27[3]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "candidateWithCandidate:forInput:", v18, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  _Block_object_dispose(&v26, 8);
  return v14;
}

- (BOOL)generatesCandidates
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ACTKeyboardController keyboardState](self, "keyboardState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "longPredictionListEnabled");

  }
  else
  {
    v5 = 0;
  }

  -[ACTKeyboardController inputManagerState](self, "inputManagerState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "usesCandidateSelection") | v5;

  return v7;
}

- (void)generateAutocorrectionsOrCandidates
{
  _BOOL4 v3;
  id v4;

  v3 = -[ACTKeyboardController generatesCandidates](self, "generatesCandidates");
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[ACTKeyboardController generateCandidatesWithKeyboardState:](self, "generateCandidatesWithKeyboardState:", v4);
  else
    -[ACTKeyboardController generateAutocorrectionsWithKeyboardState:](self, "generateAutocorrectionsWithKeyboardState:", v4);

}

- (void)generateAutocorrectionsWithShiftState:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = *(_QWORD *)&a3;
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShiftState:", v3);
  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__ACTKeyboardController_generateAutocorrectionsWithShiftState___block_invoke;
  v7[3] = &unk_24FD493F8;
  v7[4] = self;
  objc_msgSend(v6, "generateAutocorrectionsWithKeyboardState:completionHandler:", v5, v7);

}

- (void)generateAutocorrectionsWithCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__ACTKeyboardController_generateAutocorrectionsWithCount___block_invoke;
  v7[3] = &unk_24FD493F8;
  v7[4] = self;
  objc_msgSend(v5, "generateAutocorrectionsWithKeyboardState:candidateRange:completionHandler:", v6, 0, a3, v7);

}

- (void)pushAutocorrections:(id)a3 requestToken:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v14, "corrections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "autocorrection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isContinuousPathConversion");

  if (v9)
  {
    -[ACTKeyboardController cpRequestTokenLock](self, "cpRequestTokenLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lock");

    -[ACTKeyboardController lastCPRequestToken](self, "lastCPRequestToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isSameRequestAs:", v6);

    if (v12)
    {
      -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", v14);
      -[ACTKeyboardController setLastCPRequestToken:](self, "setLastCPRequestToken:", 0);
    }
    -[ACTKeyboardController cpRequestTokenLock](self, "cpRequestTokenLock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unlock");

  }
  else
  {
    -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", v14);
  }

}

- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "firstCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isContinuousPathConversion");

  if (v8)
  {
    -[ACTKeyboardController cpRequestTokenLock](self, "cpRequestTokenLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lock");

    -[ACTKeyboardController lastCPRequestToken](self, "lastCPRequestToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSameRequestAs:", v6);

    if (v11)
    {
      -[ACTKeyboardController setCandidateResultSet:](self, "setCandidateResultSet:", v13);
      -[ACTKeyboardController setLastCPRequestToken:](self, "setLastCPRequestToken:", 0);
    }
    -[ACTKeyboardController cpRequestTokenLock](self, "cpRequestTokenLock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unlock");

  }
  else
  {
    -[ACTKeyboardController setCandidateResultSet:](self, "setCandidateResultSet:", v13);
  }

}

- (void)closeRequestToken:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    -[ACTKeyboardController currentRequestToken](self, "currentRequestToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSameRequestAs:", v10);

    v4 = v10;
    if (v6)
    {
      -[ACTKeyboardController requestCondition](self, "requestCondition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lock");

      -[ACTKeyboardController setCurrentRequestToken:](self, "setCurrentRequestToken:", 0);
      -[ACTKeyboardController requestCondition](self, "requestCondition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "signal");

      -[ACTKeyboardController requestCondition](self, "requestCondition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unlock");

      v4 = v10;
    }
  }

}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;

  v4 = a3;
  -[ACTKeyboardController autocorrection](self, "autocorrection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[ACTKeyboardController autocorrection](self, "autocorrection"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isForShortcutConversion"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    if (-[ACTKeyboardController asyncPredictions](self, "asyncPredictions")
      && (-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_opt_respondsToSelector(),
          v9,
          (v10 & 1) != 0))
    {
      -[objc_class tokenForKeyboardState:](NSClassFromString(CFSTR("TICandidateRequestToken")), "tokenForKeyboardState:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTKeyboardController requestCondition](self, "requestCondition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lock");

      -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0);
      -[ACTKeyboardController setCurrentRequestToken:](self, "setCurrentRequestToken:", v11);
      -[ACTKeyboardController requestCondition](self, "requestCondition");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "unlock");

      -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __66__ACTKeyboardController_generateAutocorrectionsWithKeyboardState___block_invoke;
      v31[3] = &unk_24FD49420;
      v31[4] = self;
      v16 = v11;
      v32 = v16;
      objc_msgSend(v14, "generateAutocorrectionsWithKeyboardState:candidateRange:requestToken:completionHandler:", v15, 0, 3, v16, v31);

      -[ACTKeyboardController requestCondition](self, "requestCondition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lock");

      -[ACTKeyboardController currentRequestToken](self, "currentRequestToken");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = *MEMORY[0x24BDBCA90];
        do
        {
          if (objc_msgSend(v4, "needAutofill"))
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.5);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACTKeyboardController requestCondition](self, "requestCondition");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "waitUntilDate:", v20);

            if ((v22 & 1) == 0)
            {
              -[ACTKeyboardController requestCondition](self, "requestCondition");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "unlock");

              objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.5);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "acceptInputForMode:beforeDate:", v19, v24);

              -[ACTKeyboardController requestCondition](self, "requestCondition");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "lock");

            }
          }
          else
          {
            -[ACTKeyboardController requestCondition](self, "requestCondition");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "wait");
          }

          -[ACTKeyboardController currentRequestToken](self, "currentRequestToken");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

        }
        while (v27);
      }
      -[ACTKeyboardController requestCondition](self, "requestCondition");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "unlock");

    }
    else
    {
      -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __66__ACTKeyboardController_generateAutocorrectionsWithKeyboardState___block_invoke_2;
      v30[3] = &unk_24FD493F8;
      v30[4] = self;
      objc_msgSend(v16, "generateAutocorrectionsWithKeyboardState:completionHandler:", v29, v30);

    }
  }

}

- (void)generateCandidates
{
  id v3;

  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController generateCandidatesWithKeyboardState:](self, "generateCandidatesWithKeyboardState:", v3);

}

- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  v14 = v6;
  if (v4)
  {
    objc_msgSend(v6, "acceptedCandidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {

      v7 = v14;
LABEL_5:
      -[ACTKeyboardController handleKeyboardInput:](self, "handleKeyboardInput:", v7);
      -[ACTKeyboardController setLastInputWasSelection:](self, "setLastInputWasSelection:", 1);
LABEL_8:
      -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
      -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");
      v13 = v14;
      goto LABEL_9;
    }
    objc_msgSend(v14, "acceptedCandidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSecureContentCandidate");

    v7 = v14;
    if (v11)
      goto LABEL_5;
  }
  v12 = objc_msgSend(v7, "isDoubleSpace");
  v13 = v14;
  if (v12)
  {
    -[ACTKeyboardController handleKeyboardInput:](self, "handleKeyboardInput:", v14);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)generateCandidatesWithKeyboardState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[ACTKeyboardController setCandidateResultSet:](self, "setCandidateResultSet:", 0);
  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __61__ACTKeyboardController_generateCandidatesWithKeyboardState___block_invoke;
  v19[3] = &unk_24FD49448;
  v19[4] = self;
  v19[5] = &v20;
  objc_msgSend(v5, "generateCandidatesWithKeyboardState:candidateRange:completionHandler:", v6, 0, 0x7FFFFFFFLL, v19);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v21 + 24))
    goto LABEL_7;
  v8 = *MEMORY[0x24BDBCA90];
  while (1)
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    if (v9 <= 0.0)
      break;
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "acceptInputForMode:beforeDate:", v8, v7);

    if (*((_BYTE *)v21 + 24))
      goto LABEL_7;
  }
  if (*((_BYTE *)v21 + 24))
  {
LABEL_7:
    -[ACTKeyboardController candidateResultSet](self, "candidateResultSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uncommittedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[ACTKeyboardController candidateResultSet](self, "candidateResultSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uncommittedText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTKeyboardController setIntermediateText:](self, "setIntermediateText:", v14);

    }
    -[ACTKeyboardController candidateResultSet](self, "candidateResultSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "committedText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[ACTKeyboardController candidateResultSet](self, "candidateResultSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "committedText");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTKeyboardController insertText:](self, "insertText:", v18);

    }
  }

  _Block_object_dispose(&v20, 8);
}

- (id)candidatesForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5727;
  v15 = __Block_byref_object_dispose__5728;
  v16 = 0;
  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__ACTKeyboardController_candidatesForString___block_invoke;
  v10[3] = &unk_24FD49470;
  v10[4] = &v11;
  objc_msgSend(v5, "generateReplacementsForString:keyLayout:continuation:", v4, v7, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)updateKeyboardOutput:(id)a3 withInputForSmartPunctuation:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[ACTKeyboardController smartPunctuationController](self, "smartPunctuationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_msgSend(v6, "isPopupVariant") & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "isFlick");
    -[ACTKeyboardController smartPunctuationController](self, "smartPunctuationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTKeyboardController keyboardState](self, "keyboardState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "documentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "smartPunctuationOutputForInput:isLockedInput:documentState:", v10, v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "deletionCount"))
      objc_msgSend(v17, "setDeletionCount:", objc_msgSend(v13, "deletionCount"));
    objc_msgSend(v13, "insertionText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v17, "insertionText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (!v16)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v13, "insertionText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setInsertionText:", v14);
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (void)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  objc_msgSend(v4, "acceptedCandidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_9;
  objc_msgSend(v4, "acceptedCandidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController candidateByApplyingSmartPunctuationToCandidate:](self, "candidateByApplyingSmartPunctuationToCandidate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAcceptedCandidate:", v7);

  objc_msgSend(v4, "acceptedCandidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acceptedCandidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rawInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController deleteText:rawText:](self, "deleteText:rawText:", v9, v11);

  objc_msgSend(v4, "acceptedCandidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "candidate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "acceptedCandidate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v4, "acceptedCandidate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isContinuousPathConversion");

  if (v16)
  {
    -[ACTKeyboardController adjustContinuousPathCandidate:](self, "adjustContinuousPathCandidate:", v13);
    v14 = v13;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  }
  -[ACTKeyboardController insertText:](self, "insertText:", v13);
  objc_msgSend(v4, "acceptedCandidate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isAutocorrection");

  if (v18)
    -[ACTKeyboardController setJustAcceptedAutocorrection:](self, "setJustAcceptedAutocorrection:", 1);

LABEL_9:
  -[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __45__ACTKeyboardController_handleKeyboardInput___block_invoke;
  v22[3] = &unk_24FD49498;
  v22[4] = self;
  v23 = v4;
  v21 = v4;
  objc_msgSend(v19, "handleKeyboardInput:keyboardState:completionHandler:", v21, v20, v22);

}

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v8;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[ACTKeyboardController addInput:fromVariantKey:fromGestureKey:touchEvent:](self, "addInput:fromVariantKey:fromGestureKey:touchEvent:", v8, v6, v5, 0);
  LOBYTE(v5) = objc_msgSend(v8, "isEqualToString:", CFSTR("Shift"));

  if ((v5 & 1) == 0)
    -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
  -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");
}

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 touchEvent:(id)a5
{
  -[ACTKeyboardController addInput:fromVariantKey:fromGestureKey:touchEvent:](self, "addInput:fromVariantKey:fromGestureKey:touchEvent:", a3, a4, 0, a5);
}

- (BOOL)isContinuousPathNonSpacePunctuation:(unsigned int)a3
{
  unsigned __int16 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  -[ACTKeyboardController inputManager](self, "inputManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "terminatorsDeletingAutospace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "characterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "characterIsMember:", v3);

  return v3;
}

- (BOOL)shouldAcceptCandidate:(id)a3 beforeInputString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length") || objc_msgSend(v6, "slotID"))
  {

  }
  else
  {
    v19 = objc_msgSend(v6, "customInfoType");

    if (!v19)
      goto LABEL_5;
  }
  -[ACTKeyboardController inputManagerState](self, "inputManagerState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldSuppressAutocorrectionWithTerminator:", v7);

  if ((v10 & 1) != 0)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "length") && (objc_msgSend(v6, "input"), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    objc_msgSend(v6, "candidate");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v6, "input");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "candidate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v18, "rangeOfString:options:", v17, 9) == 0x7FFFFFFFFFFFFFFFLL;

    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }
LABEL_15:

  return v11;
}

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5 touchEvent:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  _BOOL4 v40;
  _BOOL4 v41;
  id v42;

  v7 = a5;
  v8 = a4;
  v42 = a3;
  v10 = a6;
  -[ACTKeyboardController inputManagerState](self, "inputManagerState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "stringEndsWord:", v42);

  if (!v12)
    goto LABEL_11;
  if (-[ACTKeyboardController usesAutocorrection](self, "usesAutocorrection")
    && (-[ACTKeyboardController inputManagerState](self, "inputManagerState"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "usesCandidateSelection"),
        v14,
        (v15 & 1) == 0))
  {
    -[ACTKeyboardController inlineCompletion](self, "inlineCompletion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v42;
    if (!v19)
    {
      -[ACTKeyboardController autocorrection](self, "autocorrection");
      v20 = objc_claimAutoreleasedReturnValue();
      v13 = v42;
      v19 = (void *)v20;
      if (!v20)
        goto LABEL_12;
    }
  }
  else
  {
    -[ACTKeyboardController inputManagerState](self, "inputManagerState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "usesCandidateSelection");

    if (!v17)
    {
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    -[ACTKeyboardController candidateResultSet](self, "candidateResultSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "defaultCandidate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v42;
    if (!v19)
      goto LABEL_12;
  }
  if (!-[ACTKeyboardController shouldAcceptCandidate:beforeInputString:](self, "shouldAcceptCandidate:beforeInputString:", v19, v13))
  {

    goto LABEL_11;
  }
LABEL_12:
  -[ACTKeyboardController setInputIsPunctuationFollowingContinuousPath:](self, "setInputIsPunctuationFollowingContinuousPath:", 0, v13);
  if (-[ACTKeyboardController lastInputWasContinuousPath](self, "lastInputWasContinuousPath"))
  {
    v21 = -[NSMutableString length](self->_text, "length");
    v22 = objc_msgSend(v42, "length") == 1 ? objc_msgSend(v42, "_firstLongCharacter") : 0;
    if (-[ACTKeyboardController isContinuousPathNonSpacePunctuation:](self, "isContinuousPathNonSpacePunctuation:", v22)&& ((v21 - 1) & 0x80000000) == 0&& -[NSMutableString characterAtIndex:](self->_text, "characterAtIndex:") == 32)
    {
      -[ACTKeyboardController setInputIsPunctuationFollowingContinuousPath:](self, "setInputIsPunctuationFollowingContinuousPath:", 1);
    }
  }
  -[ACTKeyboardController setLastInputWasContinuousPath:](self, "setLastInputWasContinuousPath:", 0);
  if (v19)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v19, "performSelector:", sel_isContinuousPathConversion))
    {
      v23 = (void *)MEMORY[0x24BEB4CF8];
      -[ACTKeyboardController autocorrectionList](self, "autocorrectionList");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "predictions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "listWithCorrections:predictions:", 0, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", v26);

      -[ACTKeyboardController setLastInputWasContinuousPath:](self, "setLastInputWasContinuousPath:", 1);
    }
    else
    {
      -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0);
    }
    -[ACTKeyboardController inputManagerState](self, "inputManagerState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "usesCandidateSelection");

    if (v28)
    {
      -[ACTKeyboardController acceptCandidate:](self, "acceptCandidate:", v19);
      goto LABEL_46;
    }
  }
  else
  {
    -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0);
  }
  v29 = objc_alloc_init(MEMORY[0x24BEB4E28]);
  objc_msgSend(v29, "setString:", v42);
  objc_msgSend(v29, "setUppercase:", -[ACTKeyboardController isShifted](self, "isShifted"));
  objc_msgSend(v29, "setAutoshifted:", -[ACTKeyboardController isAutoshifted](self, "isAutoshifted"));
  objc_msgSend(v29, "setPopupVariant:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v29, "setGesture:", v7);
  objc_msgSend(v29, "setTouchEvent:", v10);
  objc_msgSend(v29, "setAcceptedCandidate:", v19);
  if (-[ACTKeyboardController nextKeyIsMultitap](self, "nextKeyIsMultitap"))
  {
    objc_msgSend(v29, "setMultitap:", 1);
    -[ACTKeyboardController setNextKeyIsMultitap:](self, "setNextKeyIsMultitap:", 0);
  }
  if (-[ACTKeyboardController nextKeyIsFlick](self, "nextKeyIsFlick"))
  {
    objc_msgSend(v29, "setFlick:", 1);
    -[ACTKeyboardController setNextKeyIsFlick:](self, "setNextKeyIsFlick:", 0);
  }
  if (v10)
  {
    -[ACTKeyboardController keys](self, "keys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v10, "forcedKeyCode"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "stringForProperty:", *MEMORY[0x24BDF7980]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setInputManagerHint:", v32);

  }
  objc_msgSend(v29, "acceptedCandidate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_opt_respondsToSelector();

  if ((v34 & 1) != 0)
  {
    objc_msgSend(v29, "acceptedCandidate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isContinuousPathConversion");

  }
  else
  {
    v36 = 0;
  }
  -[ACTKeyboardController inputManagerState](self, "inputManagerState");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "wordSeparator");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v42, "isEqualToString:", v38);

  if (v39)
  {
    v40 = -[ACTKeyboardController lastInputWasSelection](self, "lastInputWasSelection");
    if (v10)
      v41 = 0;
    else
      v41 = v40;
    if ((v41 | v36) == 1)
      objc_msgSend(v29, "setSynthesizedByAcceptingCandidate:", 1);
  }
  -[ACTKeyboardController handleKeyboardInput:](self, "handleKeyboardInput:", v29);

LABEL_46:
  -[ACTKeyboardController setLastInputWasSelection:](self, "setLastInputWasSelection:", 0);

}

- (void)deleteInput
{
  -[ACTKeyboardController deleteInput:](self, "deleteInput:", 0);
}

- (void)deleteInput:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0);
  v5 = objc_alloc_init(MEMORY[0x24BEB4E28]);
  objc_msgSend(v5, "setBackspace:", 1);
  -[ACTKeyboardController handleKeyboardInput:](self, "handleKeyboardInput:", v5);
  objc_msgSend(v5, "setTouchEvent:", v4);

  -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
}

- (NSString)text
{
  return &self->_text->super;
}

- (ACTKeyboardLayoutUtils)layoutUtils
{
  return self->_layoutUtils;
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  return self->_insertsSpaceAfterPredictiveInput;
}

- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3
{
  self->_insertsSpaceAfterPredictiveInput = a3;
}

- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory
{
  return self->_keyboardInputManagerFactory;
}

- (void)setKeyboardInputManagerFactory:(id)a3
{
  self->_keyboardInputManagerFactory = (TIKeyboardInputManagerFactory *)a3;
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (void)setInputModeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (unint64_t)supplementalLexiconIdentifier
{
  return self->_supplementalLexiconIdentifier;
}

- (void)setSupplementalLexiconIdentifier:(unint64_t)a3
{
  self->_supplementalLexiconIdentifier = a3;
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  return self->_canSuggestSupplementalItemsForCurrentSelection;
}

- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  self->_canSuggestSupplementalItemsForCurrentSelection = a3;
}

- (BOOL)asyncPredictions
{
  return self->_asyncPredictions;
}

- (void)setAsyncPredictions:(BOOL)a3
{
  self->_asyncPredictions = a3;
}

- (UIKBTree)keyboard
{
  return self->_keyboard;
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (NSMutableSet)leftKeys
{
  return self->_leftKeys;
}

- (void)setLeftKeys:(id)a3
{
  objc_storeStrong((id *)&self->_leftKeys, a3);
}

- (NSMutableSet)rightKeys
{
  return self->_rightKeys;
}

- (void)setRightKeys:(id)a3
{
  objc_storeStrong((id *)&self->_rightKeys, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (void)setInputContextHistory:(id)a3
{
  objc_storeStrong((id *)&self->_inputContextHistory, a3);
}

- (TIKeyboardInputManagerState)inputManagerState
{
  return self->_inputManagerState;
}

- (void)setInputManagerState:(id)a3
{
  objc_storeStrong((id *)&self->_inputManagerState, a3);
}

- (BOOL)lastInputWasSelection
{
  return self->_lastInputWasSelection;
}

- (void)setLastInputWasSelection:(BOOL)a3
{
  self->_lastInputWasSelection = a3;
}

- (BOOL)lastInputWasContinuousPath
{
  return self->_lastInputWasContinuousPath;
}

- (void)setLastInputWasContinuousPath:(BOOL)a3
{
  self->_lastInputWasContinuousPath = a3;
}

- (BOOL)inputIsPunctuationFollowingContinuousPath
{
  return self->_inputIsPunctuationFollowingContinuousPath;
}

- (void)setInputIsPunctuationFollowingContinuousPath:(BOOL)a3
{
  self->_inputIsPunctuationFollowingContinuousPath = a3;
}

- (BOOL)nextKeyIsMultitap
{
  return self->_nextKeyIsMultitap;
}

- (void)setNextKeyIsMultitap:(BOOL)a3
{
  self->_nextKeyIsMultitap = a3;
}

- (BOOL)nextKeyIsFlick
{
  return self->_nextKeyIsFlick;
}

- (void)setNextKeyIsFlick:(BOOL)a3
{
  self->_nextKeyIsFlick = a3;
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (BOOL)usesAutocorrection
{
  return self->_usesAutocorrection;
}

- (void)setUsesAutocorrection:(BOOL)a3
{
  self->_usesAutocorrection = a3;
}

- (unint64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(unint64_t)a3
{
  self->_autocorrectionType = a3;
}

- (unint64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(unint64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (BOOL)usesPrediction
{
  return self->_usesPrediction;
}

- (void)setUsesPrediction:(BOOL)a3
{
  self->_usesPrediction = a3;
}

- (BOOL)usesAutocapitalization
{
  return self->_usesAutocapitalization;
}

- (void)setUsesAutocapitalization:(BOOL)a3
{
  self->_usesAutocapitalization = a3;
}

- (BOOL)wordLearningEnabled
{
  return self->_wordLearningEnabled;
}

- (void)setWordLearningEnabled:(BOOL)a3
{
  self->_wordLearningEnabled = a3;
}

- (BOOL)inlineCompletionEnabled
{
  return self->_inlineCompletionEnabled;
}

- (void)setInlineCompletionEnabled:(BOOL)a3
{
  self->_inlineCompletionEnabled = a3;
}

- (BOOL)longPredictionListEnabled
{
  return self->_longPredictionListEnabled;
}

- (void)setLongPredictionListEnabled:(BOOL)a3
{
  self->_longPredictionListEnabled = a3;
}

- (TISmartPunctuationController)smartPunctuationController
{
  return self->_smartPunctuationController;
}

- (BOOL)usesTransliteration
{
  return self->_usesTransliteration;
}

- (void)setUsesTransliteration:(BOOL)a3
{
  self->_usesTransliteration = a3;
}

- (TTKSimpleKeyboardPlane)ttkLayout
{
  return self->_ttkLayout;
}

- (void)setTtkLayout:(id)a3
{
  objc_storeStrong((id *)&self->_ttkLayout, a3);
}

- (_NSRange)selectedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_selectedRange.length;
  location = self->_selectedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)markedText
{
  return self->_markedText;
}

- (void)setMarkedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)lastCommittedText
{
  return self->_lastCommittedText;
}

- (BOOL)secureTextEntry
{
  return self->_secureTextEntry;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->_secureTextEntry = a3;
}

- (BOOL)isScreenLocked
{
  return self->_isScreenLocked;
}

- (void)setIsScreenLocked:(BOOL)a3
{
  self->_isScreenLocked = a3;
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (void)setCandidateResultSet:(id)a3
{
  objc_storeStrong((id *)&self->_candidateResultSet, a3);
}

- (BOOL)justAcceptedAutocorrection
{
  return self->_justAcceptedAutocorrection;
}

- (void)setJustAcceptedAutocorrection:(BOOL)a3
{
  self->_justAcceptedAutocorrection = a3;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keys, a3);
}

- (void)setInputManagerWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_inputManagerWrapper, a3);
}

- (TIKeyboardIntermediateText)intermediateText
{
  return self->_intermediateText;
}

- (NSMutableDictionary)activeTouchState
{
  return self->_activeTouchState;
}

- (void)setActiveTouchState:(id)a3
{
  objc_storeStrong((id *)&self->_activeTouchState, a3);
}

- (NSCondition)requestCondition
{
  return self->_requestCondition;
}

- (TICandidateRequestToken)currentRequestToken
{
  return self->_currentRequestToken;
}

- (void)setCurrentRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequestToken, a3);
}

- (NSLock)cpRequestTokenLock
{
  return self->_cpRequestTokenLock;
}

- (void)setCpRequestTokenLock:(id)a3
{
  objc_storeStrong((id *)&self->_cpRequestTokenLock, a3);
}

- (TICandidateRequestToken)lastCPRequestToken
{
  return self->_lastCPRequestToken;
}

- (void)setLastCPRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_lastCPRequestToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCPRequestToken, 0);
  objc_storeStrong((id *)&self->_cpRequestTokenLock, 0);
  objc_storeStrong((id *)&self->_currentRequestToken, 0);
  objc_storeStrong((id *)&self->_requestCondition, 0);
  objc_storeStrong((id *)&self->_activeTouchState, 0);
  objc_storeStrong((id *)&self->_intermediateText, 0);
  objc_storeStrong((id *)&self->_inputManagerWrapper, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_candidateResultSet, 0);
  objc_storeStrong((id *)&self->_lastCommittedText, 0);
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_ttkLayout, 0);
  objc_storeStrong((id *)&self->_smartPunctuationController, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_inputManagerState, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_rightKeys, 0);
  objc_storeStrong((id *)&self->_leftKeys, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_inputModeIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutUtils, 0);
  objc_storeStrong((id *)&self->_autocorrectionList, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
}

void __45__ACTKeyboardController_handleKeyboardInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "updateKeyboardOutput:withInputForSmartPunctuation:", v15, *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v15, "deletionCount"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "deleteBackwards");
      ++v6;
    }
    while (v6 < objc_msgSend(v15, "deletionCount"));
  }
  objc_msgSend(v15, "insertionText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "inputIsPunctuationFollowingContinuousPath"))
      objc_msgSend(*(id *)(a1 + 32), "deleteBackwards");
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v15, "insertionText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertText:", v9);

  }
  objc_msgSend(v15, "shortcutConversion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BEB4D18]);
    objc_msgSend(v15, "shortcutConversion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithAutocorrection:alternateCorrections:", v12, 0);

    objc_msgSend(MEMORY[0x24BEB4CF8], "listWithCorrections:predictions:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAutocorrectionList:", v14);

  }
  objc_msgSend(*(id *)(a1 + 32), "setKeyboardConfiguration:", v5);

}

void __45__ACTKeyboardController_candidatesForString___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __61__ACTKeyboardController_generateCandidatesWithKeyboardState___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    result = objc_msgSend(*(id *)(result + 32), "setCandidateResultSet:", a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __66__ACTKeyboardController_generateAutocorrectionsWithKeyboardState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setAutocorrectionList:", v4);
  objc_msgSend(v4, "corrections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "autocorrection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isContinuousPathConversion");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "cpRequestTokenLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lock");

    objc_msgSend(*(id *)(a1 + 32), "setLastCPRequestToken:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "cpRequestTokenLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

    objc_msgSend(*(id *)(a1 + 32), "closeRequestToken:", *(_QWORD *)(a1 + 40));
  }
}

void __66__ACTKeyboardController_generateAutocorrectionsWithKeyboardState___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setAutocorrectionList:", v4);
  objc_msgSend(v4, "corrections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "autocorrection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isContinuousPathConversion");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "cpRequestTokenLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lock");

    objc_msgSend(*(id *)(a1 + 32), "setLastCPRequestToken:", 0);
    objc_msgSend(*(id *)(a1 + 32), "cpRequestTokenLock");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

  }
}

uint64_t __58__ACTKeyboardController_generateAutocorrectionsWithCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAutocorrectionList:", a2);
}

uint64_t __63__ACTKeyboardController_generateAutocorrectionsWithShiftState___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAutocorrectionList:", a2);
}

void __42__ACTKeyboardController_trimmedCandidate___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;
  char v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v13, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
  {
    if (a4 == 1
      && objc_msgSend(*(id *)(a1 + 40), "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", 0)))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3 + 1;
    }
  }
  else
  {
    *a7 = 1;
  }

}

uint64_t __58__ACTKeyboardController_textAccepted_predictiveCandidate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setKeyboardConfiguration:", a2);
}

void __61__ACTKeyboardController_acceptCandidate_predictiveCandidate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = a2;
  objc_msgSend(v5, "textToCommit");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 208);
  *(_QWORD *)(v7 + 208) = v6;

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v5, "textToCommit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "insertText:", v10);
  objc_msgSend(*(id *)(a1 + 32), "setKeyboardConfiguration:", v11);

}

void __54__ACTKeyboardController_keyCodeWithString_inKeyplane___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "layoutUtils");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "representedStringForKey:shifted:", v8, objc_msgSend(*(id *)(a1 + 40), "isShiftKeyplane"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", v10))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
    *a4 = 1;
  }

}

uint64_t __83__ACTKeyboardController_retestTouchAtLocation_radius_timestamp_pathIndex_fingerID___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __88__ACTKeyboardController_performTouchDownAtLocation_radius_timestamp_pathIndex_fingerID___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __76__ACTKeyboardController_adjustPhraseBoundaryInForwardDirection_granularity___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setKeyboardConfiguration:", a2);
}

uint64_t __42__ACTKeyboardController_setSelectedRange___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setKeyboardConfiguration:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "updateAutoshift");
}

uint64_t __64__ACTKeyboardController_syncToKeyboardStateByWaitingForResults___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "setKeyboardConfiguration:", a2);
}

uint64_t __45__ACTKeyboardController_syncToDocumentState___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setKeyboardConfiguration:", a2);
}

uint64_t __45__ACTKeyboardController_syncToDocumentState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setKeyboardConfiguration:", a2);
}

void __51__ACTKeyboardController_mergeFrameFromKey_intoKey___block_invoke(uint64_t a1, void *a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v16 = a2;
  objc_msgSend(v16, "frame");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  MinX = CGRectGetMinX(v17);
  MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 56));
  objc_msgSend(v16, "frame");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "frame");
  if (v11 >= v12)
  {
    v14 = MinX - MaxX;
  }
  else
  {
    v13 = CGRectGetMinX(*(CGRect *)(a1 + 56));
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v14 = v13 - CGRectGetMaxX(v18);
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v14 < *(double *)(v15 + 24))
  {
    *(double *)(v15 + 24) = v14;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

void __55__ACTKeyboardController_divideKeyplane_intoLeft_right___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  uint64_t v11;
  _BOOL4 IsNull;
  CGRect *v13;
  CGFloat *v14;
  CGRect v15;
  CGRect v16;

  objc_msgSend(a2, "frame");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = a1 + 32;
  IsNull = CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  v13 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
  if (IsNull)
  {
    v13[1].origin.x = x;
    v13[1].origin.y = y;
    v11 = a1 + 40;
    v13[1].size.width = width;
    v13[1].size.height = height;
  }
  else
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v15 = CGRectUnion(v13[1], v16);
    x = v15.origin.x;
    y = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
  }
  v14 = *(CGFloat **)(*(_QWORD *)v11 + 8);
  v14[4] = x;
  v14[5] = y;
  v14[6] = width;
  v14[7] = height;
}

void __55__ACTKeyboardController_divideKeyplane_intoLeft_right___block_invoke_2(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double MaxX;
  double v12;
  double v13;
  double v14;
  double v15;
  double MinX;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v17 = a2;
  objc_msgSend(v17, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v22.origin.x = v3;
  v22.origin.y = v5;
  v22.size.width = v7;
  v22.size.height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v22))
    goto LABEL_4;
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), v23))
  {
    MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 56));
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    v12 = MaxX - CGRectGetMinX(v18);
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    v13 = CGRectGetMaxX(v19);
    if (v12 > v13 - CGRectGetMaxX(*(CGRect *)(a1 + 56)))
LABEL_4:
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
  }
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 88), v24))
    goto LABEL_8;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), v25))
  {
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    v14 = CGRectGetMaxX(v20);
    v15 = v14 - CGRectGetMinX(*(CGRect *)(a1 + 88));
    MinX = CGRectGetMinX(*(CGRect *)(a1 + 88));
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    if (v15 > MinX - CGRectGetMinX(v21))
LABEL_8:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
  }

}

@end
