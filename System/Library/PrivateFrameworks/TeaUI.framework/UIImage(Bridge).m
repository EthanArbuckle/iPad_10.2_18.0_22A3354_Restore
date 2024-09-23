@implementation UIImage(Bridge)

+ (uint64_t)ts_internalSystemImageNamed:()Bridge
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:");
}

+ (id)ts_bookmark
{
  if (ts_bookmark_onceToken != -1)
    dispatch_once(&ts_bookmark_onceToken, &__block_literal_global);
  return (id)ts_bookmark_image;
}

+ (id)ts_bookmarkFill
{
  if (ts_bookmarkFill_onceToken != -1)
    dispatch_once(&ts_bookmarkFill_onceToken, &__block_literal_global_2);
  return (id)ts_bookmarkFill_image;
}

+ (id)ts_bookmarkFillForHUD
{
  if (ts_bookmarkFillForHUD_onceToken != -1)
    dispatch_once(&ts_bookmarkFillForHUD_onceToken, &__block_literal_global_5);
  return (id)ts_bookmarkFillForHUD_image;
}

+ (id)ts_checkmark
{
  if (ts_checkmark_onceToken != -1)
    dispatch_once(&ts_checkmark_onceToken, &__block_literal_global_7);
  return (id)ts_checkmark_image;
}

+ (id)ts_checkmarkCircleFill
{
  if (ts_checkmarkCircleFill_onceToken != -1)
    dispatch_once(&ts_checkmarkCircleFill_onceToken, &__block_literal_global_10);
  return (id)ts_checkmarkCircleFill_image;
}

+ (id)ts_checkmarkCircleFillWhite
{
  if (ts_checkmarkCircleFillWhite_onceToken != -1)
    dispatch_once(&ts_checkmarkCircleFillWhite_onceToken, &__block_literal_global_13);
  return (id)ts_checkmarkCircleFillWhite_image;
}

+ (id)ts_checkmarkCircleTertiaryFillOnPink
{
  if (ts_checkmarkCircleTertiaryFillOnPink_onceToken != -1)
    dispatch_once(&ts_checkmarkCircleTertiaryFillOnPink_onceToken, &__block_literal_global_14);
  return (id)ts_checkmarkCircleTertiaryFillOnPink_image;
}

+ (id)ts_checkmarkCircleOpaqueFillOnPink
{
  if (ts_checkmarkCircleOpaqueFillOnPink_onceToken != -1)
    dispatch_once(&ts_checkmarkCircleOpaqueFillOnPink_onceToken, &__block_literal_global_17);
  return (id)ts_checkmarkCircleOpaqueFillOnPink_image;
}

+ (id)ts_minusCircleOpaqueFillOnRed
{
  if (ts_minusCircleOpaqueFillOnRed_onceToken != -1)
    dispatch_once(&ts_minusCircleOpaqueFillOnRed_onceToken, &__block_literal_global_18);
  return (id)ts_minusCircleOpaqueFillOnRed_image;
}

+ (id)ts_checkmarkCircleOnGrayFill
{
  if (ts_checkmarkCircleOnGrayFill_onceToken != -1)
    dispatch_once(&ts_checkmarkCircleOnGrayFill_onceToken, &__block_literal_global_21);
  return (id)ts_checkmarkCircleOnGrayFill_image;
}

+ (id)ts_checkmarkForHUD
{
  if (ts_checkmarkForHUD_onceToken != -1)
    dispatch_once(&ts_checkmarkForHUD_onceToken, &__block_literal_global_22);
  return (id)ts_checkmarkForHUD_image;
}

+ (id)ts_chevronRight
{
  if (ts_chevronRight_onceToken != -1)
    dispatch_once(&ts_chevronRight_onceToken, &__block_literal_global_23);
  return (id)ts_chevronRight_image;
}

+ (id)ts_circleFill
{
  if (ts_circleFill_onceToken != -1)
    dispatch_once(&ts_circleFill_onceToken, &__block_literal_global_26);
  return (id)ts_circleFill_image;
}

+ (id)ts_disclosureIndicator
{
  if (ts_disclosureIndicator_onceToken != -1)
    dispatch_once(&ts_disclosureIndicator_onceToken, &__block_literal_global_29);
  return (id)ts_disclosureIndicator_disclosureIndicator;
}

+ (id)ts_ellipsis
{
  if (ts_ellipsis_onceToken != -1)
    dispatch_once(&ts_ellipsis_onceToken, &__block_literal_global_32);
  return (id)ts_ellipsis_image;
}

+ (id)ts_ellipsisCircle
{
  if (ts_ellipsisCircle_onceToken != -1)
    dispatch_once(&ts_ellipsisCircle_onceToken, &__block_literal_global_35);
  return (id)ts_ellipsisCircle_image;
}

+ (id)ts_ellipsisCircleWhite
{
  if (ts_ellipsisCircleWhite_onceToken != -1)
    dispatch_once(&ts_ellipsisCircleWhite_onceToken, &__block_literal_global_38);
  return (id)ts_ellipsisCircleWhite_image;
}

+ (id)ts_ellipsisCirclePinkOnTertiaryFill
{
  if (ts_ellipsisCirclePinkOnTertiaryFill_onceToken != -1)
    dispatch_once(&ts_ellipsisCirclePinkOnTertiaryFill_onceToken, &__block_literal_global_39);
  return (id)ts_ellipsisCirclePinkOnTertiaryFill_image;
}

+ (id)ts_ellipsisCircleFill
{
  if (ts_ellipsisCircleFill_onceToken != -1)
    dispatch_once(&ts_ellipsisCircleFill_onceToken, &__block_literal_global_42);
  return (id)ts_ellipsisCircleFill_image;
}

+ (id)ts_ellipsisCircleFillWhite
{
  if (ts_ellipsisCircleFillWhite_onceToken != -1)
    dispatch_once(&ts_ellipsisCircleFillWhite_onceToken, &__block_literal_global_43);
  return (id)ts_ellipsisCircleFillWhite_image;
}

+ (id)ts_ellipsisCircleTertiaryFillOnPink
{
  if (ts_ellipsisCircleTertiaryFillOnPink_onceToken != -1)
    dispatch_once(&ts_ellipsisCircleTertiaryFillOnPink_onceToken, &__block_literal_global_44);
  return (id)ts_ellipsisCircleTertiaryFillOnPink_image;
}

+ (id)ts_exclamationMarkCircle
{
  if (ts_exclamationMarkCircle_onceToken != -1)
    dispatch_once(&ts_exclamationMarkCircle_onceToken, &__block_literal_global_45);
  return (id)ts_exclamationMarkCircle_image;
}

+ (id)ts_filledSystemImageNamed:()Bridge fillColor:symbolColor:
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DC3888];
  v16[0] = a4;
  v16[1] = a5;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationWithPaletteColors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)ts_filledSystemImageNamed:()Bridge fillColor:symbolColor:symbolConfig:
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v9 = a6;
  objc_msgSend(MEMORY[0x1E0DC3870], "ts_filledSystemImageNamed:fillColor:symbolColor:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "imageByApplyingSymbolConfiguration:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }

  return v11;
}

+ (id)ts_handRaised
{
  if (ts_handRaised_onceToken != -1)
    dispatch_once(&ts_handRaised_onceToken, &__block_literal_global_48);
  return (id)ts_handRaised_image;
}

+ (id)ts_handRaisedFill
{
  if (ts_handRaisedFill_onceToken != -1)
    dispatch_once(&ts_handRaisedFill_onceToken, &__block_literal_global_51);
  return (id)ts_handRaisedFill_image;
}

+ (id)ts_handRaisedFillForHUD
{
  if (ts_handRaisedFillForHUD_onceToken != -1)
    dispatch_once(&ts_handRaisedFillForHUD_onceToken, &__block_literal_global_54);
  return (id)ts_handRaisedFillForHUD_image;
}

+ (id)ts_handRaisedSlash
{
  if (ts_handRaisedSlash_onceToken != -1)
    dispatch_once(&ts_handRaisedSlash_onceToken, &__block_literal_global_55);
  return (id)ts_handRaisedSlash_image;
}

+ (id)ts_handRaisedSlashFill
{
  if (ts_handRaisedSlashFill_onceToken != -1)
    dispatch_once(&ts_handRaisedSlashFill_onceToken, &__block_literal_global_58);
  return (id)ts_handRaisedSlashFill_image;
}

+ (id)ts_handThumbsDown
{
  if (ts_handThumbsDown_onceToken != -1)
    dispatch_once(&ts_handThumbsDown_onceToken, &__block_literal_global_61);
  return (id)ts_handThumbsDown_image;
}

+ (id)ts_handThumbsDownFill
{
  if (ts_handThumbsDownFill_onceToken != -1)
    dispatch_once(&ts_handThumbsDownFill_onceToken, &__block_literal_global_64);
  return (id)ts_handThumbsDownFill_image;
}

+ (id)ts_handThumbsDownFillForHUD
{
  if (ts_handThumbsDownFillForHUD_onceToken != -1)
    dispatch_once(&ts_handThumbsDownFillForHUD_onceToken, &__block_literal_global_67);
  return (id)ts_handThumbsDownFillForHUD_image;
}

+ (id)ts_handThumbsUp
{
  if (ts_handThumbsUp_onceToken != -1)
    dispatch_once(&ts_handThumbsUp_onceToken, &__block_literal_global_68);
  return (id)ts_handThumbsUp_image;
}

+ (id)ts_handThumbsUpFill
{
  if (ts_handThumbsUpFill_onceToken != -1)
    dispatch_once(&ts_handThumbsUpFill_onceToken, &__block_literal_global_71);
  return (id)ts_handThumbsUpFill_image;
}

+ (id)ts_handThumbsUpFillForHUD
{
  if (ts_handThumbsUpFillForHUD_onceToken != -1)
    dispatch_once(&ts_handThumbsUpFillForHUD_onceToken, &__block_literal_global_74);
  return (id)ts_handThumbsUpFillForHUD_image;
}

+ (id)ts_heartCircle
{
  if (ts_heartCircle_onceToken != -1)
    dispatch_once(&ts_heartCircle_onceToken, &__block_literal_global_75);
  return (id)ts_heartCircle_image;
}

+ (id)ts_heartCirclePinkOnTertiaryFill
{
  if (ts_heartCirclePinkOnTertiaryFill_onceToken != -1)
    dispatch_once(&ts_heartCirclePinkOnTertiaryFill_onceToken, &__block_literal_global_78);
  return (id)ts_heartCirclePinkOnTertiaryFill_image;
}

+ (id)ts_heartCircleFill
{
  if (ts_heartCircleFill_onceToken != -1)
    dispatch_once(&ts_heartCircleFill_onceToken, &__block_literal_global_81);
  return (id)ts_heartCircleFill_image;
}

+ (id)ts_heartCircleTertiaryFillOnPink
{
  if (ts_heartCircleTertiaryFillOnPink_onceToken != -1)
    dispatch_once(&ts_heartCircleTertiaryFillOnPink_onceToken, &__block_literal_global_82);
  return (id)ts_heartCircleTertiaryFillOnPink_image;
}

+ (id)ts_heartFill
{
  if (ts_heartFill_onceToken != -1)
    dispatch_once(&ts_heartFill_onceToken, &__block_literal_global_83);
  return (id)ts_heartFill_image;
}

+ (id)ts_iCloudAndArrowDown
{
  if (ts_iCloudAndArrowDown_onceToken != -1)
    dispatch_once(&ts_iCloudAndArrowDown_onceToken, &__block_literal_global_86);
  return (id)ts_iCloudAndArrowDown_image;
}

+ (id)ts_link
{
  if (ts_link_onceToken[0] != -1)
    dispatch_once(ts_link_onceToken, &__block_literal_global_89);
  return (id)ts_link_image;
}

+ (uint64_t)ts_macSidebar
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("sidebar.left"));
}

+ (id)ts_minusCircle
{
  if (ts_minusCircle_onceToken != -1)
    dispatch_once(&ts_minusCircle_onceToken, &__block_literal_global_94);
  return (id)ts_minusCircle_image;
}

+ (id)ts_minusCircleFill
{
  if (ts_minusCircleFill_onceToken != -1)
    dispatch_once(&ts_minusCircleFill_onceToken, &__block_literal_global_97);
  return (id)ts_minusCircleFill_image;
}

+ (id)ts_minusCircleFillWhite
{
  if (ts_minusCircleFillWhite_onceToken != -1)
    dispatch_once(&ts_minusCircleFillWhite_onceToken, &__block_literal_global_98);
  return (id)ts_minusCircleFillWhite_image;
}

+ (id)ts_minusCircleTertiaryFillOnPink
{
  if (ts_minusCircleTertiaryFillOnPink_onceToken != -1)
    dispatch_once(&ts_minusCircleTertiaryFillOnPink_onceToken, &__block_literal_global_99);
  return (id)ts_minusCircleTertiaryFillOnPink_image;
}

+ (id)ts_navigationVerticalColumnShadow
{
  if (ts_navigationVerticalColumnShadow_onceToken != -1)
    dispatch_once(&ts_navigationVerticalColumnShadow_onceToken, &__block_literal_global_100);
  return (id)ts_navigationVerticalColumnShadow_navigationVerticalColumnShadow;
}

+ (id)ts_noSign
{
  if (ts_noSign_onceToken != -1)
    dispatch_once(&ts_noSign_onceToken, &__block_literal_global_103);
  return (id)ts_noSign_image;
}

+ (id)ts_plus
{
  if (ts_plus_onceToken[0] != -1)
    dispatch_once(ts_plus_onceToken, &__block_literal_global_106);
  return (id)ts_plus_image;
}

+ (id)ts_plusCircle
{
  if (ts_plusCircle_onceToken != -1)
    dispatch_once(&ts_plusCircle_onceToken, &__block_literal_global_109);
  return (id)ts_plusCircle_image;
}

+ (id)ts_plusCircleWhite
{
  if (ts_plusCircleWhite_onceToken != -1)
    dispatch_once(&ts_plusCircleWhite_onceToken, &__block_literal_global_112);
  return (id)ts_plusCircleWhite_image;
}

+ (id)ts_plusCircleFill
{
  if (ts_plusCircleFill_onceToken != -1)
    dispatch_once(&ts_plusCircleFill_onceToken, &__block_literal_global_113);
  return (id)ts_plusCircleFill_image;
}

+ (id)ts_plusCirclePinkOnTertiaryFill
{
  if (ts_plusCirclePinkOnTertiaryFill_onceToken != -1)
    dispatch_once(&ts_plusCirclePinkOnTertiaryFill_onceToken, &__block_literal_global_116);
  return (id)ts_plusCirclePinkOnTertiaryFill_image;
}

+ (id)ts_plusCirclePinkOnOpaqueFill
{
  if (ts_plusCirclePinkOnOpaqueFill_onceToken != -1)
    dispatch_once(&ts_plusCirclePinkOnOpaqueFill_onceToken, &__block_literal_global_117);
  return (id)ts_plusCirclePinkOnOpaqueFill_image;
}

+ (id)ts_plusCirclePinkOnGrayFill
{
  if (ts_plusCirclePinkOnGrayFill_onceToken != -1)
    dispatch_once(&ts_plusCirclePinkOnGrayFill_onceToken, &__block_literal_global_118);
  return (id)ts_plusCirclePinkOnGrayFill_image;
}

+ (id)ts_rightArrow
{
  if (ts_rightArrow_onceToken != -1)
    dispatch_once(&ts_rightArrow_onceToken, &__block_literal_global_119);
  return (id)ts_rightArrow_image;
}

+ (id)ts_safari
{
  if (ts_safari_onceToken != -1)
    dispatch_once(&ts_safari_onceToken, &__block_literal_global_122);
  return (id)ts_safari_image;
}

+ (id)ts_sidebarLeft
{
  if (ts_sidebarLeft_onceToken != -1)
    dispatch_once(&ts_sidebarLeft_onceToken, &__block_literal_global_125);
  return (id)ts_sidebarLeft_image;
}

+ (id)ts_squareAndArrowUp
{
  if (ts_squareAndArrowUp_onceToken != -1)
    dispatch_once(&ts_squareAndArrowUp_onceToken, &__block_literal_global_126);
  return (id)ts_squareAndArrowUp_image;
}

+ (id)ts_textFormatSize
{
  if (ts_textFormatSize_onceToken != -1)
    dispatch_once(&ts_textFormatSize_onceToken, &__block_literal_global_129);
  return (id)ts_textFormatSize_image;
}

+ (id)ts_trash
{
  if (ts_trash_onceToken != -1)
    dispatch_once(&ts_trash_onceToken, &__block_literal_global_132);
  return (id)ts_trash_image;
}

+ (id)ts_xmark
{
  if (ts_xmark_onceToken != -1)
    dispatch_once(&ts_xmark_onceToken, &__block_literal_global_135);
  return (id)ts_xmark_image;
}

+ (id)ts_xmarkCircle
{
  if (ts_xmarkCircle_onceToken != -1)
    dispatch_once(&ts_xmarkCircle_onceToken, &__block_literal_global_138);
  return (id)ts_xmarkCircle_image;
}

+ (id)ts_xmarkForHUD
{
  if (ts_xmarkForHUD_onceToken != -1)
    dispatch_once(&ts_xmarkForHUD_onceToken, &__block_literal_global_141);
  return (id)ts_xmarkForHUD_image;
}

+ (uint64_t)ts_internalSystemImageNamed:()Bridge withConfiguration:
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:");
}

@end
