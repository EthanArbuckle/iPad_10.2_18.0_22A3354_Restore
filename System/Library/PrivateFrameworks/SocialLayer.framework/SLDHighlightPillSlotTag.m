@implementation SLDHighlightPillSlotTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tagForHighlightAttributions:(id)a3 maxWidth:(double)a4 maxSendersToDisplay:(unint64_t)a5 variant:(unint64_t)a6
{
  id v9;
  SLDHighlightPillSlotTag *v10;

  v9 = a3;
  v10 = -[SLDHighlightPillSlotTag initWithHighlightAttributions:maxWidth:maxSendersToDisplay:variant:]([SLDHighlightPillSlotTag alloc], "initWithHighlightAttributions:maxWidth:maxSendersToDisplay:variant:", v9, a5, a6, a4);

  return v10;
}

- (SLDHighlightPillSlotTag)initWithHighlightAttributions:(id)a3 maxWidth:(double)a4 maxSendersToDisplay:(unint64_t)a5 variant:(unint64_t)a6
{
  id v10;
  SLDHighlightPillSlotTag *v11;
  double v12;
  SLDHighlightPillSlotTag *v13;
  uint64_t v14;
  NSNumber *widthNumber;
  void *v16;
  objc_super v18;

  v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SLDHighlightPillSlotTag;
  v11 = -[SLDHighlightPillSlotTag init](&v18, sel_init);
  v13 = v11;
  if (v11)
  {
    v11->_maxWidth = a4;
    *(float *)&v12 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    widthNumber = v13->_widthNumber;
    v13->_widthNumber = (NSNumber *)v14;

    v13->_variant = a6;
    if (a6 <= 0xA && ((1 << a6) & 0x4AA) != 0)
    {
      if (objc_msgSend(v10, "count") == 1)
      {
        objc_msgSend(v10, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDHighlightPillSlotTag _generateCollaborationSendersForSingleAttribution:maxSendersToDisplay:](v13, "_generateCollaborationSendersForSingleAttribution:maxSendersToDisplay:", v16, a5);

      }
      else
      {
        -[SLDHighlightPillSlotTag _generateCollaborationSendersForMultipleAttributions:maxSendersToDisplay:](v13, "_generateCollaborationSendersForMultipleAttributions:maxSendersToDisplay:", v10, a5);
      }
    }
    else
    {
      -[SLDHighlightPillSlotTag _generateSendersWithDisplayPolicyForAttributions:maxSendersToDisplay:](v13, "_generateSendersWithDisplayPolicyForAttributions:maxSendersToDisplay:", v10, a5);
    }
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SLDHighlightPillSlotTag widthNumber](self, "widthNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SLDHighlightPillSlotTag: %p> maxWidth:[%@]"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)resolvedStyleForStyle:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CGColorRef ConstantColor;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0DC5C60];
  v3 = a3;
  v4 = objc_msgSend(v3, "accessibilityButtonShapes");
  v5 = objc_msgSend(v3, "accessibilityContrast");
  v6 = objc_msgSend(v3, "displayScale");
  v7 = objc_msgSend(v3, "layoutDirection");
  objc_msgSend(v3, "localization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "preferredContentSizeCategory");
  ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9D8E8]);
  v11 = objc_msgSend(v3, "userInterfaceIdiom");
  v12 = objc_msgSend(v3, "userInterfaceStyle");

  objc_msgSend(v15, "slotStyleWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:", v4, v5, 1, v6, v7, 0, v8, v9, ConstantColor, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SLDHighlightPillSlotTag)initWithCoder:(id)a3
{
  id v4;
  SLDHighlightPillSlotTag *v5;
  double v6;
  uint64_t v7;
  NSNumber *widthNumber;
  uint64_t v9;
  void *v10;
  NSNumber *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *sendersToDisplay;
  uint64_t v17;
  SLPerson *pinnedSender;
  uint64_t v19;
  SLPerson *meSender;
  uint64_t v21;
  NSString *groupID;
  uint64_t v23;
  NSURL *groupPhotoPath;
  uint64_t v25;
  NSString *groupName;
  objc_super v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SLDHighlightPillSlotTag;
  v5 = -[SLDHighlightPillSlotTag init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxWidth"));
    v5->_maxWidth = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxWidthNumber"));
    v7 = objc_claimAutoreleasedReturnValue();
    widthNumber = v5->_widthNumber;
    v5->_widthNumber = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allSendersCount"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v5->_allSendersNumber = (NSNumber *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
      v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v5->_allSendersNumber = v11;

    }
    v12 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("sendersToDisplay"));
    v15 = objc_claimAutoreleasedReturnValue();
    sendersToDisplay = v5->_sendersToDisplay;
    v5->_sendersToDisplay = (NSArray *)v15;

    v5->_variant = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variant"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pinnedSender"));
    v17 = objc_claimAutoreleasedReturnValue();
    pinnedSender = v5->_pinnedSender;
    v5->_pinnedSender = (SLPerson *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("meSender"));
    v19 = objc_claimAutoreleasedReturnValue();
    meSender = v5->_meSender;
    v5->_meSender = (SLPerson *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
    v21 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupPhotoPath"));
    v23 = objc_claimAutoreleasedReturnValue();
    groupPhotoPath = v5->_groupPhotoPath;
    v5->_groupPhotoPath = (NSURL *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
    v25 = objc_claimAutoreleasedReturnValue();
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[SLDHighlightPillSlotTag maxWidth](self, "maxWidth");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxWidth"));
  -[SLDHighlightPillSlotTag widthNumber](self, "widthNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("maxWidthNumber"));

  -[SLDHighlightPillSlotTag allSendersNumber](self, "allSendersNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("allSendersCount"));

  -[SLDHighlightPillSlotTag sendersToDisplay](self, "sendersToDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sendersToDisplay"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SLDHighlightPillSlotTag variant](self, "variant"), CFSTR("variant"));
  -[SLDHighlightPillSlotTag pinnedSender](self, "pinnedSender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("pinnedSender"));

  -[SLDHighlightPillSlotTag meSender](self, "meSender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("meSender"));

  -[SLDHighlightPillSlotTag groupID](self, "groupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("groupID"));

  -[SLDHighlightPillSlotTag groupPhotoPath](self, "groupPhotoPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("groupPhotoPath"));

  -[SLDHighlightPillSlotTag groupName](self, "groupName");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("groupName"));

}

- (id)copyWithZone:(_NSZone *)a3
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

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SLDHighlightPillSlotTag maxWidth](self, "maxWidth");
  objc_msgSend(v4, "setMaxWidth:");
  -[SLDHighlightPillSlotTag widthNumber](self, "widthNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWidthNumber:", v5);

  -[SLDHighlightPillSlotTag sendersToDisplay](self, "sendersToDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSendersToDisplay:", v6);

  -[SLDHighlightPillSlotTag allSendersNumber](self, "allSendersNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllSendersNumber:", v7);

  objc_msgSend(v4, "setVariant:", -[SLDHighlightPillSlotTag variant](self, "variant"));
  -[SLDHighlightPillSlotTag pinnedSender](self, "pinnedSender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPinnedSender:", v8);

  -[SLDHighlightPillSlotTag meSender](self, "meSender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMeSender:", v9);

  -[SLDHighlightPillSlotTag groupID](self, "groupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupID:", v10);

  -[SLDHighlightPillSlotTag groupPhotoPath](self, "groupPhotoPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupPhotoPath:", v11);

  -[SLDHighlightPillSlotTag groupName](self, "groupName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupName:", v12);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  SLDHighlightPillSlotTag *v6;
  SLDHighlightPillSlotTag *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  int IsEqualToPerson;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (SLDHighlightPillSlotTag *)v5;
    v7 = v6;
    if (v6 == self)
    {
      v19 = 1;
LABEL_61:

      goto LABEL_62;
    }
    -[SLDHighlightPillSlotTag maxWidth](v6, "maxWidth");
    v9 = v8;
    -[SLDHighlightPillSlotTag maxWidth](self, "maxWidth");
    if (!SL_CGFloatApproximatelyEqualToFloat(v9, v10))
      goto LABEL_60;
    -[SLDHighlightPillSlotTag allSendersNumber](self, "allSendersNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (-[SLDHighlightPillSlotTag allSendersNumber](v7, "allSendersNumber"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SLDHighlightPillSlotTag allSendersNumber](self, "allSendersNumber");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_22;
      v13 = (void *)v12;
      -[SLDHighlightPillSlotTag allSendersNumber](v7, "allSendersNumber");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_21;
      v15 = (void *)v14;
      -[SLDHighlightPillSlotTag allSendersNumber](self, "allSendersNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDHighlightPillSlotTag allSendersNumber](v7, "allSendersNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToNumber:", v17);

      if (v11)
      {

        if (!v18)
          goto LABEL_60;
      }
      else
      {

        if ((v18 & 1) == 0)
          goto LABEL_60;
      }
    }
    -[SLDHighlightPillSlotTag widthNumber](self, "widthNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[SLDHighlightPillSlotTag widthNumber](v7, "widthNumber");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
LABEL_26:
        -[SLDHighlightPillSlotTag sendersToDisplay](self, "sendersToDisplay");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26
          || (-[SLDHighlightPillSlotTag sendersToDisplay](v7, "sendersToDisplay"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[SLDHighlightPillSlotTag sendersToDisplay](self, "sendersToDisplay");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLDHighlightPillSlotTag sendersToDisplay](v7, "sendersToDisplay");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = SLPersonArrayisEqualToArray(v27, v28);

          if (v26)
          {

            if (!v29)
              goto LABEL_60;
          }
          else
          {

            if ((v29 & 1) == 0)
              goto LABEL_60;
          }
        }
        -[SLDHighlightPillSlotTag pinnedSender](self, "pinnedSender");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30
          || (-[SLDHighlightPillSlotTag pinnedSender](v7, "pinnedSender"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[SLDHighlightPillSlotTag pinnedSender](self, "pinnedSender");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLDHighlightPillSlotTag pinnedSender](v7, "pinnedSender");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          IsEqualToPerson = SLPersonIsEqualToPerson(v31, v32);

          if (v30)
          {

            if (!IsEqualToPerson)
              goto LABEL_60;
          }
          else
          {

            if ((IsEqualToPerson & 1) == 0)
              goto LABEL_60;
          }
        }
        -[SLDHighlightPillSlotTag meSender](self, "meSender");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34
          || (-[SLDHighlightPillSlotTag meSender](v7, "meSender"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[SLDHighlightPillSlotTag meSender](self, "meSender");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLDHighlightPillSlotTag meSender](v7, "meSender");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = SLPersonIsEqualToPerson(v35, v36);

          if (v34)
          {

            if (!v37)
              goto LABEL_60;
          }
          else
          {

            if ((v37 & 1) == 0)
              goto LABEL_60;
          }
        }
        v38 = -[SLDHighlightPillSlotTag variant](self, "variant");
        if (v38 == -[SLDHighlightPillSlotTag variant](v7, "variant"))
        {
          -[SLDHighlightPillSlotTag groupID](self, "groupID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39
            || (-[SLDHighlightPillSlotTag groupID](v7, "groupID"),
                (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[SLDHighlightPillSlotTag groupID](self, "groupID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[SLDHighlightPillSlotTag groupID](v7, "groupID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v40, "isEqualToString:", v41);

            if (v39)
            {

              if (!v42)
                goto LABEL_60;
            }
            else
            {

              if ((v42 & 1) == 0)
                goto LABEL_60;
            }
          }
          -[SLDHighlightPillSlotTag groupPhotoPath](self, "groupPhotoPath");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v43)
          {
            -[SLDHighlightPillSlotTag groupPhotoPath](v7, "groupPhotoPath");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v3)
            {
LABEL_55:
              -[SLDHighlightPillSlotTag groupName](self, "groupName");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (v11
                || (-[SLDHighlightPillSlotTag groupName](v7, "groupName"),
                    (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                -[SLDHighlightPillSlotTag groupName](self, "groupName");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[SLDHighlightPillSlotTag groupName](v7, "groupName");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v47, "isEqual:", v48);

                if (v11)
                {
LABEL_24:

                  goto LABEL_61;
                }
              }
              else
              {
                v19 = 1;
              }

              goto LABEL_24;
            }
          }
          -[SLDHighlightPillSlotTag groupPhotoPath](self, "groupPhotoPath");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLDHighlightPillSlotTag groupPhotoPath](v7, "groupPhotoPath");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v44, "isEqual:", v45);

          if (v43)
          {

            if (v46)
              goto LABEL_55;
          }
          else
          {

            if ((v46 & 1) != 0)
              goto LABEL_55;
          }
        }
LABEL_60:
        v19 = 0;
        goto LABEL_61;
      }
    }
    -[SLDHighlightPillSlotTag widthNumber](self, "widthNumber");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
LABEL_22:
      v19 = 0;
      if (!v11)
        v11 = v3;
      goto LABEL_24;
    }
    v13 = (void *)v20;
    -[SLDHighlightPillSlotTag widthNumber](v7, "widthNumber");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      -[SLDHighlightPillSlotTag widthNumber](self, "widthNumber");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDHighlightPillSlotTag widthNumber](v7, "widthNumber");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToNumber:", v24);

      if (v11)
      {

        if (!v25)
          goto LABEL_60;
      }
      else
      {

        if ((v25 & 1) == 0)
          goto LABEL_60;
      }
      goto LABEL_26;
    }
LABEL_21:

    goto LABEL_22;
  }
  v19 = 0;
LABEL_62:

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;

  -[SLDHighlightPillSlotTag widthNumber](self, "widthNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SLDHighlightPillSlotTag sendersToDisplay](self, "sendersToDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SLDHighlightPillSlotTag allSendersNumber](self, "allSendersNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SLDHighlightPillSlotTag pinnedSender](self, "pinnedSender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[SLDHighlightPillSlotTag meSender](self, "meSender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v12 ^ -[SLDHighlightPillSlotTag variant](self, "variant");
  -[SLDHighlightPillSlotTag groupID](self, "groupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10 ^ v13 ^ objc_msgSend(v14, "hash");
  -[SLDHighlightPillSlotTag groupPhotoPath](self, "groupPhotoPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  -[SLDHighlightPillSlotTag groupName](self, "groupName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (unint64_t)maxPossibleImageCount
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[SLDHighlightPillSlotTag groupPhotoPath](self, "groupPhotoPath");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[SLDHighlightPillSlotTag groupID](self, "groupID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = 1;
  }
  else
  {
    -[SLDHighlightPillSlotTag sendersToDisplay](self, "sendersToDisplay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count");

  }
  -[SLDHighlightPillSlotTag pinnedSender](self, "pinnedSender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    return v6 + 1;
  else
    return v6;
}

- (unint64_t)allSendersCount
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[SLDHighlightPillSlotTag allSendersNumber](self, "allSendersNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SLDHighlightPillSlotTag allSendersNumber](self, "allSendersNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (void)_generateCollaborationSendersForSingleAttribution:(id)a3 maxSendersToDisplay:(unint64_t)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  char IsEqualToPerson;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  NSArray *v38;
  NSArray *sendersToDisplay;
  int v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  id obj;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v42 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v44 = objc_claimAutoreleasedReturnValue();
  +[SLPerson fetchMeContact](SLPerson, "fetchMeContact");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v4, "relatedPersons");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  v48 = v5;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    v9 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if (objc_msgSend(v4, "isFromMe", v42))
        {
          objc_msgSend(v4, "sender");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          IsEqualToPerson = SLPersonIsEqualToPerson(v12, v11);

        }
        else
        {
          IsEqualToPerson = 0;
        }
        objc_msgSend(v11, "contact");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        v5 = v48;
        if ((SLPersonArrayContainsPerson(v48, v11) & 1) == 0 && (IsEqualToPerson & 1) == 0 && (v17 & 1) == 0)
          objc_msgSend(v48, "addObject:", v11);
        v4 = v9;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v7);
  }

  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "relatedPersons");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      objc_msgSend(v4, "relatedPersons");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addObject:", v21);

    }
  }
  objc_msgSend(v4, "groupPhotoPath", v42);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDHighlightPillSlotTag setGroupPhotoPath:](self, "setGroupPhotoPath:", v22);

  objc_msgSend(v4, "groupID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDHighlightPillSlotTag setGroupID:](self, "setGroupID:", v24);

  objc_msgSend(v4, "groupDisplayName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "length");

  if (v26)
  {
    objc_msgSend(v4, "groupDisplayName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDHighlightPillSlotTag setGroupName:](self, "setGroupName:", v27);

    -[SLDHighlightPillSlotTag groupPhotoPath](self, "groupPhotoPath");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      -[SLDHighlightPillSlotTag groupID](self, "groupID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = 1;
        v32 = v48;
        v33 = (void *)v44;
        goto LABEL_31;
      }
    }
    v32 = v48;
    if (v43)
    {
      v34 = v48;
    }
    else
    {
      objc_msgSend(v48, "subarrayWithRange:", 0, 0);
      v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    v37 = v34;
    v31 = 1;
    v35 = (void *)v44;
  }
  else
  {
    v32 = v48;
    v31 = objc_msgSend(v48, "count");
    v35 = (void *)v44;
    if (v31 >= v43)
    {
      objc_msgSend(v48, "subarrayWithRange:", 0);
      v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = v48;
    }
    v37 = v36;
  }

  v33 = v37;
LABEL_31:
  self->_allSendersNumber = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
  v38 = (NSArray *)objc_msgSend(v33, "copy");
  sendersToDisplay = self->_sendersToDisplay;
  self->_sendersToDisplay = v38;

  v40 = objc_msgSend(v4, "isPinned");
  if (v40)
  {
    objc_msgSend(v4, "sender");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = 0;
  }
  objc_storeStrong((id *)&self->_pinnedSender, v41);
  if (v40)

}

- (void)_generateCollaborationSendersForMultipleAttributions:(id)a3 maxSendersToDisplay:(unint64_t)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  SLPerson *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  SLPerson *v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  char IsEqualToPerson;
  NSArray *v39;
  NSArray *sendersToDisplay;
  SLPerson *pinnedSender;
  SLPerson *v42;
  void *v43;
  void *v44;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timestamp"), 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  v43 = (void *)v5;
  v44 = v4;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v59;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v59 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        if (objc_msgSend(v14, "isPinned"))
        {
          objc_msgSend(v14, "sender");
          v15 = (SLPerson *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isFromMe"))
          {
            objc_msgSend(v14, "sender");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "relatedPersons");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[SLDHighlightPillSlotTag _personOtherThanPerson:inArray:](self, "_personOtherThanPerson:inArray:", v16, v17);
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v18;
            if (v18)
              v20 = (void *)v18;
            else
              v20 = v15;
            v21 = v20;

            v15 = v21;
          }
          objc_msgSend(v46, "addObject:", v15);
          objc_msgSend(v8, "addObject:", v15);
          goto LABEL_16;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_16:
  v42 = v15;

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v9;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v55 != v48)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        if ((objc_msgSend(v23, "isPinned", v42, v43, v44) & 1) == 0)
        {
          objc_msgSend(v23, "sender");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "isFromMe"))
          {
            objc_msgSend(v23, "sender");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "relatedPersons");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SLDHighlightPillSlotTag _personOtherThanPerson:inArray:](self, "_personOtherThanPerson:inArray:", v25, v26);
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = (void *)v27;
            if (v27)
              v29 = (void *)v27;
            else
              v29 = v24;
            v30 = v29;

            v24 = v30;
          }
          if ((SLPersonArrayContainsPerson(v8, v24) & 1) == 0)
          {
            objc_msgSend(v46, "addObject:", v24);
            objc_msgSend(v8, "addObject:", v24);
          }

        }
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v23, "relatedPersons");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v51;
          do
          {
            for (k = 0; k != v33; ++k)
            {
              if (*(_QWORD *)v51 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
              if (objc_msgSend(v23, "isFromMe"))
              {
                objc_msgSend(v23, "sender");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                IsEqualToPerson = SLPersonIsEqualToPerson(v37, v36);

                if ((IsEqualToPerson & 1) != 0)
                  continue;
              }
              if ((SLPersonArrayContainsPerson(v8, v36) & 1) == 0)
                objc_msgSend(v8, "addObject:", v36);
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
          }
          while (v33);
        }

      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v49);
  }

  self->_allSendersNumber = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v39 = (NSArray *)objc_msgSend(v46, "copy");
  sendersToDisplay = self->_sendersToDisplay;
  self->_sendersToDisplay = v39;

  pinnedSender = self->_pinnedSender;
  self->_pinnedSender = v42;

}

- (void)_generateSendersWithDisplayPolicyForAttributions:(id)a3 maxSendersToDisplay:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  SLPerson *v13;
  SLPerson *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  NSArray *v32;
  NSArray *sendersToDisplay;
  SLPerson *pinnedSender;
  SLPerson *v35;
  SLPerson *meSender;
  SLPerson *v37;
  SLPerson *v38;
  void *v39;
  void *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timestamp"), 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v5;
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (!v11)
  {

    v38 = 0;
    v14 = 0;
    goto LABEL_30;
  }
  v12 = v11;
  v13 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v48;
  obj = v10;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v48 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      if (v14 && v13)
      {
        v10 = obj;

LABEL_23:
        if ((SLPersonArrayContainsPerson(v8, v14) & 1) == 0)
        {
          objc_msgSend(v8, "addObject:", v14);
          objc_msgSend(v9, "addObject:", v14);
        }
        goto LABEL_25;
      }
      objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "sender");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        if (!v14)
        {
          if (!objc_msgSend(v17, "isPinned"))
          {
            v14 = 0;
            if (v13)
              continue;
            goto LABEL_13;
          }
          objc_msgSend(v17, "sender");
          v14 = (SLPerson *)objc_claimAutoreleasedReturnValue();
        }
        if (v13)
          continue;
LABEL_13:
        if (objc_msgSend(v17, "isFromMe"))
        {
          objc_msgSend(v17, "sender");
          v13 = (SLPerson *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
        }
        continue;
      }
    }
    v10 = obj;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v12)
      continue;
    break;
  }

  if (v14)
    goto LABEL_23;
LABEL_25:
  if (v13)
  {
    v38 = v13;
    if ((SLPersonArrayContainsPerson(v8, v13) & 1) == 0)
    {
      objc_msgSend(v8, "addObject:", v13);
      objc_msgSend(v9, "addObject:", v13);
    }
  }
  else
  {
    v38 = 0;
  }
LABEL_30:
  v37 = v14;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v19 = v10;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v44 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v24, "sender", v37);
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)v25;
          v27 = objc_msgSend(v24, "isFromMe");

          if ((v27 & 1) == 0)
          {
            objc_msgSend(v24, "sender");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = SLPersonArrayContainsPerson(v8, v28);

            if ((v29 & 1) == 0)
            {
              objc_msgSend(v24, "sender");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v30);

              if (objc_msgSend(v9, "count") < a4)
              {
                objc_msgSend(v24, "sender");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addObject:", v31);

              }
            }
          }
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v21);
  }

  self->_allSendersNumber = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v32 = (NSArray *)objc_msgSend(v9, "copy");
  sendersToDisplay = self->_sendersToDisplay;
  self->_sendersToDisplay = v32;

  pinnedSender = self->_pinnedSender;
  self->_pinnedSender = v37;
  v35 = v37;

  meSender = self->_meSender;
  self->_meSender = v38;

}

- (id)_personOtherThanPerson:(id)a3 inArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((SLPersonIsEqualToPerson(v10, v5) & 1) == 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (NSArray)sendersToDisplay
{
  return self->_sendersToDisplay;
}

- (void)setSendersToDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_sendersToDisplay, a3);
}

- (SLPerson)pinnedSender
{
  return self->_pinnedSender;
}

- (void)setPinnedSender:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedSender, a3);
}

- (SLPerson)meSender
{
  return self->_meSender;
}

- (void)setMeSender:(id)a3
{
  objc_storeStrong((id *)&self->_meSender, a3);
}

- (NSURL)groupPhotoPath
{
  return self->_groupPhotoPath;
}

- (void)setGroupPhotoPath:(id)a3
{
  objc_storeStrong((id *)&self->_groupPhotoPath, a3);
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (NSNumber)widthNumber
{
  return self->_widthNumber;
}

- (void)setWidthNumber:(id)a3
{
  objc_storeStrong((id *)&self->_widthNumber, a3);
}

- (NSNumber)allSendersNumber
{
  return self->_allSendersNumber;
}

- (void)setAllSendersNumber:(id)a3
{
  self->_allSendersNumber = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthNumber, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_groupPhotoPath, 0);
  objc_storeStrong((id *)&self->_meSender, 0);
  objc_storeStrong((id *)&self->_pinnedSender, 0);
  objc_storeStrong((id *)&self->_sendersToDisplay, 0);
}

@end
