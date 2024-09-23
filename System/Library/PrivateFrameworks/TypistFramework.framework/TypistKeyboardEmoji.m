@implementation TypistKeyboardEmoji

- (id)init:(id)a3 options:(id)a4
{
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardEmoji;
  v5 = -[TypistKeyboard setupKeyboardInfo:options:](&v7, sel_setupKeyboardInfo_options_, a3, a4);
  -[TypistKeyboard setUsePopupKeys:](self, "setUsePopupKeys:", 0);
  return self;
}

+ (void)resetSelectedCategory
{
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", &__block_literal_global_3);
}

void __44__TypistKeyboardEmoji_resetSelectedCategory__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDF6B30], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSelectedCategoryType:", 0);
  objc_msgSend(MEMORY[0x24BDF6B20], "categoryForType:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEmojiCategoryDefaultsIndex:forCategory:", 0, v0);

}

+ (id)findEmojiScrollView
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__TypistKeyboardEmoji_findEmojiScrollView__block_invoke;
  v4[3] = &unk_251A7C9D8;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__TypistKeyboardEmoji_findEmojiScrollView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentKeyplaneView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v4;
  objc_msgSend(v4, "subviews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      v17 = v6;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        NSClassFromString(CFSTR("UIKeyboardEmojiCollectionInputView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          objc_msgSend(v9, "subviews");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v20;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v20 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
                NSClassFromString(CFSTR("UIKeyboardEmojiCollectionView"));
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v15);
                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v12);
          }

          v6 = v17;
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

}

+ (BOOL)scrollEmojiKeyboard
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[4];
  __int128 v29;
  _QWORD v30[4];
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  +[TypistKeyboardEmoji findEmojiScrollView](TypistKeyboardEmoji, "findEmojiScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  if (!v2)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3010000000;
  v30[3] = &unk_2494BA09E;
  v31 = *MEMORY[0x24BDBEFB0];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3010000000;
  v28[3] = &unk_2494BA09E;
  v29 = v31;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke;
  v14[3] = &unk_251A7CE58;
  v17 = &v22;
  v5 = v3;
  v15 = v5;
  v16 = v2;
  v18 = &v36;
  v19 = &v32;
  v20 = v30;
  v21 = v28;
  +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v14);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke_3;
  v13[3] = &unk_251A7CE80;
  v13[4] = v30;
  v13[5] = v28;
  objc_msgSend(MEMORY[0x24BE7CE50], "eventStreamWithEventActions:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v7);
    v10 = v9;

    if (v10 > 30.0)
      break;
    +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:](TypistKeyboardUtilities, "launchRecapWithSyntheticEventStream:", v6);
    +[TypistKeyboardUtilities waitFor:](TypistKeyboardUtilities, "waitFor:", 0.1);
  }
  while (!*((_BYTE *)v37 + 24));
  objc_msgSend(v5, "removeObserver:", v23[5]);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

  if (*((_BYTE *)v37 + 24))
    v11 = *((_BYTE *)v33 + 24) != 0;
  else
LABEL_7:
    v11 = 0;
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v11;
}

void __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v12;
  CGFloat MidY;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke_2;
  v24[3] = &unk_251A7CE30;
  v26 = *(_OWORD *)(a1 + 56);
  v25 = *(id *)(a1 + 40);
  objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", CFSTR("DidEndSmoothScrolling"), v3, v4, v24);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 40), "bounds");
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  v12 = CGRectGetMaxX(v27) + -10.0;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MidY = CGRectGetMidY(v28);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  *(CGFloat *)(v14 + 32) = v12;
  *(CGFloat *)(v14 + 40) = MidY;
  objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", 0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  *(_QWORD *)(v15 + 32) = v16;
  *(_QWORD *)(v15 + 40) = v17;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v18 = CGRectGetMinX(v29) + 10.0;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v19 = CGRectGetMidY(v30);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  *(CGFloat *)(v20 + 32) = v18;
  *(CGFloat *)(v20 + 40) = v19;
  objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", 0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  *(_QWORD *)(v21 + 32) = v22;
  *(_QWORD *)(v21 + 40) = v23;

}

uint64_t __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t result;
  double v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "contentOffset");
  v5 = v3 + v4;
  result = objc_msgSend(*(id *)(a1 + 32), "contentSize");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5 >= v7;
  return result;
}

void __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x24BE7CE38];
  v14 = a2;
  objc_msgSend(v3, "touchScreenDigitizerSender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSenderProperties:", v4);

  NSStringFromCGPoint(*(CGPoint *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(*(CGPoint *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TYLog(CFSTR("Scrolling emoji keyboard from %@ to %@"), v6, v7, v8, v9, v10, v11, v12, (char)v5);

  objc_msgSend(v14, "dragWithStartPoint:endPoint:duration:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0.1);
}

- (id)generateKeystrokeStream:(id)a3
{
  return 0;
}

@end
