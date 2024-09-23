@implementation MessageStatusIndicatorManager

+ (id)dotIndicatorImage
{
  return +[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphStatusIndicatorUnread, 11);
}

+ (id)flagShapeImage
{
  return +[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphStatusIndicatorFlagged, 12);
}

+ (id)timeSensitiveTransactionsImage
{
  return +[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphCategoryTransactions, 12);
}

+ (id)timeSensitivePromotionsImage
{
  return +[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphCategoryPromotions, 12);
}

+ (id)timeSensitiveUpdatesImage
{
  return +[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphCategoryUpdates, 12);
}

- (id)statusIndicatorColorWithOptionsMask:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;

  v5 = -[MessageStatusIndicatorManager effectiveIndicatorOptions](self, "effectiveIndicatorOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageStatusIndicatorManager flagColors](self, "flagColors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MessageStatusIndicatorManager statusIndicatorColorWithOptions:flagColors:useSelectedColors:](MessageStatusIndicatorManager, "statusIndicatorColorWithOptions:flagColors:useSelectedColors:", v5 & a3, v6, -[MessageStatusIndicatorManager useSelectedColors](self, "useSelectedColors")));

  return v7;
}

+ (id)statusIndicatorColorWithOptions:(unint64_t)a3
{
  return objc_msgSend(a1, "statusIndicatorColorWithOptions:flagColors:useSelectedColors:", a3, 0, 0);
}

+ (id)statusIndicatorColorWithOptions:(unint64_t)a3 flagColors:(id)a4 useSelectedColors:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;

  v5 = a5;
  v7 = a4;
  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v9 = (void *)v8;
  if ((uint64_t)a3 > 127)
  {
    if ((uint64_t)a3 > 1023)
    {
      switch(a3)
      {
        case 0x400uLL:
          v10 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
          break;
        case 0x800uLL:
          v10 = objc_claimAutoreleasedReturnValue(+[UIColor systemPinkColor](UIColor, "systemPinkColor"));
          break;
        case 0x1000uLL:
          v10 = objc_claimAutoreleasedReturnValue(+[UIColor systemIndigoColor](UIColor, "systemIndigoColor"));
          break;
        default:
          goto LABEL_34;
      }
    }
    else
    {
      if (a3 == 128)
      {
LABEL_17:
        if (v5)
          v10 = objc_claimAutoreleasedReturnValue(+[UIColor mailMessageListSelectedStatusIndicatorColor](UIColor, "mailMessageListSelectedStatusIndicatorColor"));
        else
          v10 = objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
        goto LABEL_33;
      }
      if (a3 != 256)
      {
        if (a3 != 512)
          goto LABEL_34;
        goto LABEL_17;
      }
      v10 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    }
LABEL_33:
    v12 = (void *)v10;

    v9 = v12;
    goto LABEL_34;
  }
  switch(a3)
  {
    case 1uLL:
      if (v5)
        v10 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      else
        v10 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      goto LABEL_33;
    case 2uLL:
      v10 = objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
      goto LABEL_33;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      if (objc_msgSend(v7, "count"))
        v11 = objc_msgSend(v7, "firstIndex");
      else
        v11 = 0;
      v10 = objc_claimAutoreleasedReturnValue(+[UIColor mf_colorFromFlagColor:](UIColor, "mf_colorFromFlagColor:", v11));
      goto LABEL_33;
    case 8uLL:
      goto LABEL_17;
    default:
      if (a3 - 16 <= 0x30 && ((1 << (a3 - 16)) & 0x1000000010101) != 0)
        goto LABEL_17;
      break;
  }
LABEL_34:

  return v9;
}

+ (void)clearCache
{
  qword_100044380 = 0;
}

- (double)midXToMidXSpacing
{
  double result;
  double v3;
  void *v4;
  double v5;

  result = *(double *)&qword_100044380;
  v3 = -*(double *)&qword_100044380;
  if (*(double *)&qword_100044380 >= 0.0)
    v3 = *(double *)&qword_100044380;
  if (v3 < 2.22044605e-16)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MessageStatusIndicatorManager flagShapeImage](MessageStatusIndicatorManager, "flagShapeImage"));
    objc_msgSend(v4, "size");
    *(double *)&qword_100044380 = v5 * 1.5;

    return *(double *)&qword_100044380;
  }
  return result;
}

- (void)pruneIndicatorOptions:(int64_t)a3
{
  _QWORD *v3;
  _QWORD v4[7];
  _QWORD v5[4];

  self->_pruneDisabledIndicatorOptions = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005AC4;
  v4[3] = &unk_100038990;
  v4[4] = self;
  v4[5] = v5;
  v4[6] = a3;
  v3 = objc_retainBlock(v4);
  ((void (*)(_QWORD *, uint64_t))v3[2])(v3, 1);
  ((void (*)(_QWORD *, uint64_t))v3[2])(v3, 4);
  ((void (*)(_QWORD *, uint64_t))v3[2])(v3, 32);
  ((void (*)(_QWORD *, uint64_t))v3[2])(v3, 8);
  ((void (*)(_QWORD *, uint64_t))v3[2])(v3, 16);
  ((void (*)(_QWORD *, uint64_t))v3[2])(v3, 64);
  ((void (*)(_QWORD *, uint64_t))v3[2])(v3, 512);
  ((void (*)(_QWORD *, uint64_t))v3[2])(v3, 128);
  ((void (*)(_QWORD *, uint64_t))v3[2])(v3, 256);

  _Block_object_dispose(v5, 8);
}

- (void)setHidesUnreadIndicator:(BOOL)a3
{
  -[MessageStatusIndicatorManager _setIndicatorOptions:disabled:](self, "_setIndicatorOptions:disabled:", 1, a3);
}

- (BOOL)hidesUnreadIndicator
{
  return -[MessageStatusIndicatorManager _indicatorOptionsAreDisabled:](self, "_indicatorOptionsAreDisabled:", 1);
}

- (void)setHidesVIPIndicator:(BOOL)a3
{
  -[MessageStatusIndicatorManager _setIndicatorOptions:disabled:](self, "_setIndicatorOptions:disabled:", 2, a3);
}

- (BOOL)hidesVIPIndicator
{
  return -[MessageStatusIndicatorManager _indicatorOptionsAreDisabled:](self, "_indicatorOptionsAreDisabled:", 2);
}

- (void)setHidesAttachmentIndicator:(BOOL)a3
{
  -[MessageStatusIndicatorManager _setIndicatorOptions:disabled:](self, "_setIndicatorOptions:disabled:", 32, a3);
}

- (BOOL)hidesAttachmentIndicator
{
  return -[MessageStatusIndicatorManager _indicatorOptionsAreDisabled:](self, "_indicatorOptionsAreDisabled:", 32);
}

- (unint64_t)effectiveIndicatorOptions
{
  return -[MessageStatusIndicatorManager indicatorOptions](self, "indicatorOptions") & ~(self->_pruneDisabledIndicatorOptions | self->_disabledIndicatorOptions);
}

- (id)statusIndicatorImageWithOptionsMask:(unint64_t)a3
{
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int64_t v13;

  v4 = -[MessageStatusIndicatorManager effectiveIndicatorOptions](self, "effectiveIndicatorOptions");
  v5 = v4 & a3;
  if ((uint64_t)(v4 & a3) <= 31)
  {
    v4 = 0;
    v6 = &MFImageGlyphStatusIndicatorVIP;
    switch(v5)
    {
      case 0:
        return (id)v4;
      case 1:
        v4 = objc_claimAutoreleasedReturnValue(+[MessageStatusIndicatorManager dotIndicatorImage](MessageStatusIndicatorManager, "dotIndicatorImage"));
        goto LABEL_29;
      case 2:
        goto LABEL_28;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_30;
      case 4:
        v4 = objc_claimAutoreleasedReturnValue(+[MessageStatusIndicatorManager flagShapeImage](MessageStatusIndicatorManager, "flagShapeImage"));
        goto LABEL_29;
      case 8:
        goto LABEL_15;
      default:
        if (v5 == 16)
        {
          v6 = &MFImageGlyphStatusIndicatorForwarded;
        }
        else
        {
          if (v5 != 24)
            goto LABEL_30;
LABEL_15:
          v6 = &MFImageGlyphStatusIndicatorReplied;
        }
        break;
    }
    goto LABEL_28;
  }
  if (v5 > 511)
  {
    if (v5 > 2047)
    {
      if (v5 == 2048)
      {
        v4 = objc_claimAutoreleasedReturnValue(+[MessageStatusIndicatorManager timeSensitivePromotionsImage](MessageStatusIndicatorManager, "timeSensitivePromotionsImage"));
        goto LABEL_29;
      }
      if (v5 == 4096)
      {
        v4 = objc_claimAutoreleasedReturnValue(+[MessageStatusIndicatorManager timeSensitiveUpdatesImage](MessageStatusIndicatorManager, "timeSensitiveUpdatesImage"));
        goto LABEL_29;
      }
    }
    else
    {
      if (v5 == 512)
      {
        v6 = &MFImageGlyphStatusIndicatorReadLater;
        goto LABEL_28;
      }
      if (v5 == 1024)
      {
        v4 = objc_claimAutoreleasedReturnValue(+[MessageStatusIndicatorManager timeSensitiveTransactionsImage](MessageStatusIndicatorManager, "timeSensitiveTransactionsImage"));
        goto LABEL_29;
      }
    }
  }
  else if (v5 > 127)
  {
    if (v5 == 128)
    {
      v6 = &MFImageGlyphStatusIndicatorMute;
      goto LABEL_28;
    }
    if (v5 == 256)
    {
      v6 = &MFImageGlyphStatusIndicatorBlockSender;
      goto LABEL_28;
    }
  }
  else
  {
    if (v5 == 32)
    {
      v6 = &MFImageGlyphStatusIndicatorAttachment;
      goto LABEL_28;
    }
    if (v5 == 64)
    {
      v6 = &MFImageGlyphStatusIndicatorNotify;
LABEL_28:
      v4 = objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", *v6, 12));
LABEL_29:
      if (v4)
        return (id)v4;
    }
  }
LABEL_30:
  v7 = MFLogGeneral(v4);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "UIImage *ImageForOptions(MessageStatusIndicatorOptions)";
    v12 = 2048;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Warning %s: No image pair for options %lu", (uint8_t *)&v10, 0x16u);
  }

  v4 = 0;
  return (id)v4;
}

- (void)_setIndicatorOptions:(unint64_t)a3 disabled:(BOOL)a4
{
  unint64_t v4;

  if (a4)
    v4 = self->_disabledIndicatorOptions | a3;
  else
    v4 = self->_disabledIndicatorOptions & ~a3;
  self->_disabledIndicatorOptions = v4;
}

- (BOOL)_indicatorOptionsAreDisabled:(unint64_t)a3
{
  return (a3 & ~self->_disabledIndicatorOptions) == 0;
}

- (BOOL)useSelectedColors
{
  return self->_useSelectedColors;
}

- (void)setUseSelectedColors:(BOOL)a3
{
  self->_useSelectedColors = a3;
}

- (NSIndexSet)flagColors
{
  return self->_flagColors;
}

- (void)setFlagColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)indicatorOptions
{
  return self->_indicatorOptions;
}

- (void)setIndicatorOptions:(unint64_t)a3
{
  self->_indicatorOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagColors, 0);
}

@end
