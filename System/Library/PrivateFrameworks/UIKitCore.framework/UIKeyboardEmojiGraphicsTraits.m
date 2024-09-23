@implementation UIKeyboardEmojiGraphicsTraits

- (UIKeyboardEmojiGraphicsTraits)initWithScreenTrait:(id)a3
{
  id v4;
  UIKeyboardEmojiGraphicsTraits *v5;
  UIKeyboardEmojiGraphicsTraits *v6;
  BOOL v7;
  int IsStickerPickerService;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  UIKeyboardEmojiGraphicsTraits *v26;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  double v33;
  double v34;
  uint64_t v35;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)UIKeyboardEmojiGraphicsTraits;
  v5 = -[UIKeyboardEmojiGraphicsTraits init](&v36, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = *((_BYTE *)v4 + 35) != 0;
    }
    else
    {
      v7 = 0;
      v5->_scrollSnapOffset = 0.0;
      *(_OWORD *)&v5->_prepolulatedRecentCount = 0u;
      *(_OWORD *)&v5->_inputViewRightMostPadding = 0u;
      *(_OWORD *)&v5->_categoryHeaderHeight = 0u;
      *(_OWORD *)&v5->_categorySelectedCirWidth = 0u;
      *(_OWORD *)&v5->_minimumInteritemSpacing = 0u;
      *(_OWORD *)&v5->_sectionOffset = 0u;
      *(_OWORD *)&v5->_emojiKeyWidth = 0u;
      v5->_fakeEmojiKeySize.width = 0.0;
      v5->_fakeEmojiKeySize.height = 0.0;
      v5->_alertTextWidth = 0.0;
    }
    v5->_isFirstPartyStickers = v7;
    IsStickerPickerService = _UIApplicationIsStickerPickerService();
    if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
    {
      *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186680D60;
      *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186680F50;
      *(_OWORD *)&v6->_sectionOffset = xmmword_186680CD0;
      *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186680F60;
      v6->_fakeEmojiKeySize.height = 42.0;
      *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186680F70;
      v6->_prepolulatedRecentCount = 30;
      *(_OWORD *)&v6->_inputViewLeftMostPadding = xmmword_186680F40;
      v10 = xmmword_186680F80;
LABEL_7:
      *(_OWORD *)&v6->_alertTextWidth = v10;
      v11 = xmmword_186680D80;
LABEL_51:
      *(_OWORD *)&v6->_rightBiasPercentage = v11;
      goto LABEL_52;
    }
    if (IsStickerPickerService)
      v12 = 38.0;
    else
      v12 = 32.0;
    if (v6->_isFirstPartyStickers)
      v13 = 15;
    else
      v13 = 24;
    if (v6->_isFirstPartyStickers)
      v14 = 20.0;
    else
      v14 = 10.0;
    v15 = 48.0;
    if (!v6->_isFirstPartyStickers)
      v15 = v12;
    objc_msgSend(v4, "keyboardWidth", *(_QWORD *)&v15, v9);
    v17 = v16;
    if (v4 && *((_BYTE *)v4 + 38))
      v17 = *((double *)v4 + 12);
    if (objc_msgSend(v4, "isKeyboardMinorEdgeWidth"))
    {
      if (v17 < 1024.0)
      {
        if (v17 < 768.0)
        {
          if (v17 >= 414.0)
          {
            v6->_emojiKeyWidth = v12;
            *(_OWORD *)&v6->_minimumLineSpacing = xmmword_186680E70;
            *(_OWORD *)&v6->_columnOffset = xmmword_186680E80;
            *(_OWORD *)&v6->_bottomPadding = xmmword_186680E90;
            *(_OWORD *)&v6->_categoryHeaderLeftPadding = xmmword_186680EA0;
            v28 = 40.0;
            v29 = 46.0;
            if (IsStickerPickerService)
            {
              v28 = 46.0;
              v29 = 52.0;
            }
            v6->_fakeEmojiKeySize.width = v28;
            v6->_fakeEmojiKeySize.height = v29;
            v6->_categoryHeaderFontSize = 13.0;
            v6->_prepolulatedRecentCount = 30;
            *(_OWORD *)&v6->_inputViewLeftMostPadding = xmmword_186680EB0;
            v6->_alertTextWidth = 280.0;
            *(_OWORD *)&v6->_rightBiasPercentage = xmmword_1866800C0;
          }
          else
          {
            if (v17 < 375.0)
            {
              if (v17 >= 360.0)
              {
                v6->_emojiKeyWidth = v12;
                *(_OWORD *)&v6->_minimumLineSpacing = xmmword_186680ED0;
                *(_OWORD *)&v6->_columnOffset = xmmword_186680EE0;
                *(_OWORD *)&v6->_bottomPadding = xmmword_186680EF0;
                *(_OWORD *)&v6->_categoryHeaderLeftPadding = xmmword_186680EA0;
                v33 = 38.0;
                v34 = 44.0;
                if (IsStickerPickerService)
                {
                  v33 = 44.0;
                  v34 = 50.0;
                }
                v6->_fakeEmojiKeySize.width = v33;
                v6->_fakeEmojiKeySize.height = v34;
                v6->_categoryHeaderFontSize = 12.0;
                v6->_prepolulatedRecentCount = 30;
                v20 = xmmword_186680F00;
LABEL_70:
                *(_OWORD *)&v6->_inputViewLeftMostPadding = v20;
                v6->_alertTextWidth = 280.0;
                *(_OWORD *)&v6->_rightBiasPercentage = xmmword_186680D80;
                if (!objc_msgSend(v4, "isEmojiScrollingDirectionVertical"))
                  goto LABEL_52;
                v6->_fakeEmojiKeySize = (CGSize)vaddq_f64((float64x2_t)vdupq_lane_s64(v35, 0), (float64x2_t)xmmword_1866806E0);
                v6->_prepolulatedRecentCount = v13;
                *(_QWORD *)&v6->_emojiKeyWidth = v35;
                v6->_minimumLineSpacing = v14;
                v6->_minimumInteritemSpacing = v14;
                v6->_inputViewRightMostPadding = v6->_inputViewLeftMostPadding;
                if (v6->_isFirstPartyStickers)
                {
                  v6->_minimumInteritemSpacing = 9.0;
                  goto LABEL_73;
                }
                goto LABEL_59;
              }
              if (v17 >= 320.0)
              {
                v6->_emojiKeyWidth = v12;
                *(_OWORD *)&v6->_minimumLineSpacing = xmmword_18667F5B0;
                *(_OWORD *)&v6->_columnOffset = xmmword_186680F10;
                *(_OWORD *)&v6->_bottomPadding = xmmword_186680F20;
                *(_OWORD *)&v6->_categoryHeaderLeftPadding = xmmword_186680F30;
                v18 = 38.0;
                if (IsStickerPickerService)
                  v18 = 44.0;
                v19 = 42.0;
                if (IsStickerPickerService)
                  v19 = 48.0;
                v6->_fakeEmojiKeySize.width = v18;
                v6->_fakeEmojiKeySize.height = v19;
                v6->_categoryHeaderFontSize = 12.0;
                v6->_prepolulatedRecentCount = 30;
                v20 = xmmword_186680F40;
                goto LABEL_70;
              }
LABEL_52:
              v26 = v6;
              goto LABEL_53;
            }
            v6->_emojiKeyWidth = v12;
            *(_OWORD *)&v6->_minimumLineSpacing = xmmword_186680ED0;
            *(_OWORD *)&v6->_columnOffset = xmmword_186680EE0;
            *(_OWORD *)&v6->_bottomPadding = xmmword_186680EF0;
            *(_OWORD *)&v6->_categoryHeaderLeftPadding = xmmword_186680EA0;
            v30 = 38.0;
            v31 = 44.0;
            if (IsStickerPickerService)
            {
              v30 = 44.0;
              v31 = 50.0;
            }
            v6->_fakeEmojiKeySize.width = v30;
            v6->_fakeEmojiKeySize.height = v31;
            v6->_categoryHeaderFontSize = 12.0;
            v6->_prepolulatedRecentCount = 30;
            *(_OWORD *)&v6->_inputViewLeftMostPadding = xmmword_186680F00;
            v6->_alertTextWidth = 280.0;
            *(_OWORD *)&v6->_rightBiasPercentage = xmmword_186680D80;
            if (objc_msgSend(v4, "isInPopover"))
              v6->_bottomPadding = 2.0;
          }
          if (!objc_msgSend(v4, "isEmojiScrollingDirectionVertical"))
            goto LABEL_52;
          v6->_fakeEmojiKeySize = (CGSize)vaddq_f64((float64x2_t)vdupq_lane_s64(v35, 0), (float64x2_t)xmmword_1866806E0);
          v6->_prepolulatedRecentCount = v13;
          *(_QWORD *)&v6->_emojiKeyWidth = v35;
          v6->_minimumLineSpacing = v14;
          v6->_minimumInteritemSpacing = v14;
          v6->_inputViewRightMostPadding = v6->_inputViewLeftMostPadding;
          if (v6->_isFirstPartyStickers)
          {
LABEL_73:
            v6->_sectionOffset = v14 + 9.0;
            v6->_topPadding = v14 + -9.0;
            v6->_categoryHeaderFontSize = 15.0;
            *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186680EC0;
            goto LABEL_52;
          }
LABEL_59:
          v6->_sectionOffset = v14;
          v6->_topPadding = v14;
          goto LABEL_52;
        }
        *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186680E20;
        *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186680E30;
        *(_OWORD *)&v6->_sectionOffset = xmmword_186680E40;
        *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186680E50;
        v6->_fakeEmojiKeySize.height = 64.0;
        *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186680C50;
        v6->_prepolulatedRecentCount = 30;
        v24 = xmmword_186680E60;
        goto LABEL_49;
      }
      *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186680C10;
      *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186680DF0;
      *(_OWORD *)&v6->_sectionOffset = xmmword_186680C30;
      *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186680E00;
      v6->_fakeEmojiKeySize.height = 64.0;
      *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186680E10;
      v21 = 27;
    }
    else
    {
      if (v17 >= 1366.0)
      {
        *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186680C10;
        *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186680C20;
        v22 = xmmword_186680C30;
        v23 = xmmword_186680C40;
      }
      else
      {
        if (v17 < 1024.0)
        {
          if (v17 >= 812.0)
          {
            *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186680CB0;
            *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186680CC0;
            *(_OWORD *)&v6->_sectionOffset = xmmword_186680CD0;
            *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186680CE0;
            v6->_fakeEmojiKeySize.height = 33.0;
            *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186680CF0;
            v6->_prepolulatedRecentCount = 30;
            *(int64x2_t *)&v6->_inputViewLeftMostPadding = vdupq_n_s64(0x404E000000000000uLL);
            *(_OWORD *)&v6->_alertTextWidth = xmmword_186680D00;
            v11 = xmmword_186680D10;
            goto LABEL_51;
          }
          if (v17 >= 780.0)
          {
            *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186680D20;
            *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186680D30;
            *(_OWORD *)&v6->_sectionOffset = xmmword_186680D40;
            *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186680D50;
            v6->_fakeEmojiKeySize.height = 33.0;
            *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186680D60;
            v6->_prepolulatedRecentCount = 30;
            v32 = xmmword_186680D70;
          }
          else
          {
            if (v17 >= 736.0)
            {
              *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186680CB0;
              *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186680CC0;
              *(_OWORD *)&v6->_sectionOffset = xmmword_186680CD0;
              *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186680CE0;
              v6->_fakeEmojiKeySize.height = 33.0;
              *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186680CF0;
              v6->_prepolulatedRecentCount = 30;
              *(_OWORD *)&v6->_inputViewLeftMostPadding = xmmword_186680D90;
              v25 = xmmword_186680D00;
              goto LABEL_50;
            }
            if (v17 >= 667.0)
            {
              *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186680D20;
              *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186680D30;
              *(_OWORD *)&v6->_sectionOffset = xmmword_186680D40;
              *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186680D50;
              v6->_fakeEmojiKeySize.height = 33.0;
              *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186680D60;
              v6->_prepolulatedRecentCount = 30;
              v32 = xmmword_186680DA0;
            }
            else
            {
              if (v17 < 568.0)
              {
                if (v17 >= 480.0)
                {
                  *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186680D20;
                  *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_1866806E0;
                  *(_OWORD *)&v6->_sectionOffset = xmmword_186680D40;
                  *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186680DB0;
                  v6->_fakeEmojiKeySize.height = 35.0;
                  *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186680DC0;
                  v6->_prepolulatedRecentCount = 30;
                  *(_OWORD *)&v6->_inputViewLeftMostPadding = xmmword_186680DD0;
                  v10 = xmmword_186680DE0;
                  goto LABEL_7;
                }
                goto LABEL_52;
              }
              *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186680D20;
              *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_1866806E0;
              *(_OWORD *)&v6->_sectionOffset = xmmword_186680D40;
              *(_OWORD *)&v6->_categoryHeaderHeight = xmmword_186680DB0;
              v6->_fakeEmojiKeySize.height = 33.0;
              *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186680DC0;
              v6->_prepolulatedRecentCount = 30;
              v32 = xmmword_186680DD0;
            }
          }
          *(_OWORD *)&v6->_inputViewLeftMostPadding = v32;
          v10 = xmmword_186680D00;
          goto LABEL_7;
        }
        *(_OWORD *)&v6->_emojiKeyWidth = xmmword_186680C10;
        *(_OWORD *)&v6->_minimumInteritemSpacing = xmmword_186680C90;
        v22 = xmmword_186680C30;
        v23 = xmmword_186680CA0;
      }
      *(_OWORD *)&v6->_sectionOffset = v22;
      *(_OWORD *)&v6->_categoryHeaderHeight = v23;
      v6->_fakeEmojiKeySize.height = 64.0;
      *(_OWORD *)&v6->_categorySelectedCirWidth = xmmword_186680C50;
      v21 = 30;
    }
    v6->_prepolulatedRecentCount = v21;
    v24 = xmmword_186680C60;
LABEL_49:
    *(_OWORD *)&v6->_inputViewLeftMostPadding = v24;
    v25 = xmmword_186680C70;
LABEL_50:
    *(_OWORD *)&v6->_alertTextWidth = v25;
    v11 = xmmword_186680C80;
    goto LABEL_51;
  }
LABEL_53:

  return v6;
}

+ (UIKeyboardEmojiGraphicsTraits)emojiGraphicsTraitsWithScreenTraits:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScreenTrait:", v4);

  return (UIKeyboardEmojiGraphicsTraits *)v5;
}

+ (id)emojiGraphicsTraitsForCurrentScreenTraits
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CGRect v13;
  CGRect v14;

  +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v8 = CGRectGetWidth(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  if (v8 <= CGRectGetHeight(v14))
    v9 = 1;
  else
    v9 = 4;
  +[UIKBScreenTraits traitsWithScreen:orientation:ignoreRemoteKeyboard:](UIKBScreenTraits, "traitsWithScreen:orientation:ignoreRemoteKeyboard:", v3, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScreenTrait:", v10);

  return v11;
}

- (double)emojiKeyWidth
{
  return self->_emojiKeyWidth;
}

- (double)minimumLineSpacing
{
  return self->_minimumLineSpacing;
}

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (double)columnOffset
{
  return self->_columnOffset;
}

- (double)sectionOffset
{
  return self->_sectionOffset;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (double)categoryHeaderHeight
{
  return self->_categoryHeaderHeight;
}

- (double)categoryHeaderLeftPadding
{
  return self->_categoryHeaderLeftPadding;
}

- (double)categorySelectedCirWidth
{
  return self->_categorySelectedCirWidth;
}

- (CGSize)fakeEmojiKeySize
{
  double width;
  double height;
  CGSize result;

  width = self->_fakeEmojiKeySize.width;
  height = self->_fakeEmojiKeySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)categoryHeaderFontSize
{
  return self->_categoryHeaderFontSize;
}

- (int64_t)prepolulatedRecentCount
{
  return self->_prepolulatedRecentCount;
}

- (double)inputViewLeftMostPadding
{
  return self->_inputViewLeftMostPadding;
}

- (double)inputViewRightMostPadding
{
  return self->_inputViewRightMostPadding;
}

- (double)rightBiasPercentage
{
  return self->_rightBiasPercentage;
}

- (double)scrollSnapOffset
{
  return self->_scrollSnapOffset;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (double)categoryHeaderBottomInset
{
  return self->_categoryHeaderBottomInset;
}

- (double)alertTextWidth
{
  return self->_alertTextWidth;
}

@end
