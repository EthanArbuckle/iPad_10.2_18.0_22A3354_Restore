@implementation SLDHighlightDisambiguationPillSlotTag

+ (id)tagForHighlightAttribution:(id)a3 maxWidth:(double)a4 variant:(unint64_t)a5
{
  id v7;
  SLDHighlightDisambiguationPillSlotTag *v8;

  v7 = a3;
  v8 = -[SLDHighlightDisambiguationPillSlotTag initWithHighlightAttribution:maxWidth:variant:]([SLDHighlightDisambiguationPillSlotTag alloc], "initWithHighlightAttribution:maxWidth:variant:", v7, a5, a4);

  return v8;
}

- (SLDHighlightDisambiguationPillSlotTag)initWithHighlightAttribution:(id)a3 maxWidth:(double)a4 variant:(unint64_t)a5
{
  id v8;
  SLDHighlightDisambiguationPillSlotTag *v9;
  double v10;
  SLDHighlightDisambiguationPillSlotTag *v11;
  uint64_t v12;
  NSNumber *widthNumber;
  uint64_t v14;
  SLPerson *sender;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  objc_super v27;

  v8 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SLDHighlightDisambiguationPillSlotTag;
  v9 = -[SLDHighlightDisambiguationPillSlotTag init](&v27, sel_init);
  v11 = v9;
  if (v9)
  {
    v9->_maxWidth = a4;
    *(float *)&v10 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    widthNumber = v11->_widthNumber;
    v11->_widthNumber = (NSNumber *)v12;

    v11->_variant = a5;
    objc_msgSend(v8, "sender");
    v14 = objc_claimAutoreleasedReturnValue();
    sender = v11->_sender;
    v11->_sender = (SLPerson *)v14;

    v11->_fromMe = objc_msgSend(v8, "isFromMe");
    v16 = objc_msgSend(v8, "isGroupConversation");
    v11->_isGroupConversation = v16;
    if (!v16)
    {
      SLDaemonLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[SLDHighlightDisambiguationPillSlotTag initWithHighlightAttribution:maxWidth:variant:].cold.2((uint64_t)v11, v8, v21);
      goto LABEL_10;
    }
    objc_msgSend(v8, "groupDisplayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      objc_msgSend(v8, "groupDisplayName");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = 40;
    }
    else
    {
      objc_msgSend(v8, "relatedPersons");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23 < 3)
      {
        SLDaemonLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[SLDHighlightDisambiguationPillSlotTag initWithHighlightAttribution:maxWidth:variant:].cold.1((uint64_t)v11, v8, v21);
        goto LABEL_10;
      }
      objc_msgSend(v8, "relatedPersons");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count") - 2;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = 48;
    }
    v21 = *(NSObject **)((char *)&v11->super.super.super.isa + v20);
    *(Class *)((char *)&v11->super.super.super.isa + v20) = (Class)v19;
LABEL_10:

  }
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SLDHighlightDisambiguationPillSlotTag widthNumber](self, "widthNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SLDHighlightDisambiguationPillSlotTag: %p> maxWidth:[%@]"), self, v4);
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

- (SLDHighlightDisambiguationPillSlotTag)initWithCoder:(id)a3
{
  id v4;
  SLDHighlightDisambiguationPillSlotTag *v5;
  double v6;
  uint64_t v7;
  NSNumber *widthNumber;
  uint64_t v9;
  SLPerson *sender;
  uint64_t v11;
  NSString *groupDisplayName;
  uint64_t v13;
  NSNumber *otherRecipientCount;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SLDHighlightDisambiguationPillSlotTag;
  v5 = -[SLDHighlightDisambiguationPillSlotTag init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxWidth"));
    v5->_maxWidth = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxWidthNumber"));
    v7 = objc_claimAutoreleasedReturnValue();
    widthNumber = v5->_widthNumber;
    v5->_widthNumber = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
    v9 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (SLPerson *)v9;

    v5->_isGroupConversation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isGroup"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
    v11 = objc_claimAutoreleasedReturnValue();
    groupDisplayName = v5->_groupDisplayName;
    v5->_groupDisplayName = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientCount"));
    v13 = objc_claimAutoreleasedReturnValue();
    otherRecipientCount = v5->_otherRecipientCount;
    v5->_otherRecipientCount = (NSNumber *)v13;

    v5->_variant = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variant"));
    v5->_pinned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pinned"));
    v5->_fromMe = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fromMe"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SLDHighlightDisambiguationPillSlotTag maxWidth](self, "maxWidth");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("maxWidth"));
  -[SLDHighlightDisambiguationPillSlotTag widthNumber](self, "widthNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("maxWidthNumber"));

  -[SLDHighlightDisambiguationPillSlotTag sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("sender"));

  objc_msgSend(v8, "encodeBool:forKey:", -[SLDHighlightDisambiguationPillSlotTag isGroupConversation](self, "isGroupConversation"), CFSTR("isGroup"));
  -[SLDHighlightDisambiguationPillSlotTag groupDisplayName](self, "groupDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("groupName"));

  -[SLDHighlightDisambiguationPillSlotTag otherRecipientCount](self, "otherRecipientCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("recipientCount"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[SLDHighlightDisambiguationPillSlotTag variant](self, "variant"), CFSTR("variant"));
  objc_msgSend(v8, "encodeBool:forKey:", -[SLDHighlightDisambiguationPillSlotTag isPinned](self, "isPinned"), CFSTR("pinned"));
  objc_msgSend(v8, "encodeBool:forKey:", -[SLDHighlightDisambiguationPillSlotTag isFromMe](self, "isFromMe"), CFSTR("fromMe"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SLDHighlightDisambiguationPillSlotTag maxWidth](self, "maxWidth");
  objc_msgSend(v4, "setMaxWidth:");
  -[SLDHighlightDisambiguationPillSlotTag widthNumber](self, "widthNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWidthNumber:", v5);

  -[SLDHighlightDisambiguationPillSlotTag sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSender:", v6);

  objc_msgSend(v4, "setIsGroupConversation:", -[SLDHighlightDisambiguationPillSlotTag isGroupConversation](self, "isGroupConversation"));
  -[SLDHighlightDisambiguationPillSlotTag groupDisplayName](self, "groupDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupDisplayName:", v7);

  -[SLDHighlightDisambiguationPillSlotTag otherRecipientCount](self, "otherRecipientCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOtherRecipientCount:", v8);

  objc_msgSend(v4, "setVariant:", -[SLDHighlightDisambiguationPillSlotTag variant](self, "variant"));
  objc_msgSend(v4, "setPinned:", -[SLDHighlightDisambiguationPillSlotTag isPinned](self, "isPinned"));
  objc_msgSend(v4, "setFromMe:", -[SLDHighlightDisambiguationPillSlotTag isFromMe](self, "isFromMe"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  SLDHighlightDisambiguationPillSlotTag *v6;
  SLDHighlightDisambiguationPillSlotTag *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  _BOOL4 v25;
  _BOOL4 v26;
  unint64_t v28;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (SLDHighlightDisambiguationPillSlotTag *)v5;
    v7 = v6;
    if (v6 == self)
    {
      v15 = 1;
LABEL_28:

      goto LABEL_29;
    }
    -[SLDHighlightDisambiguationPillSlotTag maxWidth](v6, "maxWidth");
    v9 = v8;
    -[SLDHighlightDisambiguationPillSlotTag maxWidth](self, "maxWidth");
    if (SL_CGFloatApproximatelyEqualToFloat(v9, v10))
    {
      -[SLDHighlightDisambiguationPillSlotTag sender](self, "sender");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        || (-[SLDHighlightDisambiguationPillSlotTag sender](v7, "sender"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SLDHighlightDisambiguationPillSlotTag sender](self, "sender");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDHighlightDisambiguationPillSlotTag sender](v7, "sender");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (v11)
        {

          if (!v14)
            goto LABEL_27;
        }
        else
        {

          if ((v14 & 1) == 0)
            goto LABEL_27;
        }
      }
      v16 = -[SLDHighlightDisambiguationPillSlotTag isGroupConversation](self, "isGroupConversation");
      if (v16 == -[SLDHighlightDisambiguationPillSlotTag isGroupConversation](v7, "isGroupConversation"))
      {
        -[SLDHighlightDisambiguationPillSlotTag groupDisplayName](self, "groupDisplayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17
          || (-[SLDHighlightDisambiguationPillSlotTag groupDisplayName](v7, "groupDisplayName"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[SLDHighlightDisambiguationPillSlotTag groupDisplayName](self, "groupDisplayName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLDHighlightDisambiguationPillSlotTag groupDisplayName](v7, "groupDisplayName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if (v17)
          {

            if (!v20)
              goto LABEL_27;
          }
          else
          {

            if ((v20 & 1) == 0)
              goto LABEL_27;
          }
        }
        -[SLDHighlightDisambiguationPillSlotTag otherRecipientCount](self, "otherRecipientCount");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          -[SLDHighlightDisambiguationPillSlotTag otherRecipientCount](v7, "otherRecipientCount");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
            goto LABEL_25;
        }
        -[SLDHighlightDisambiguationPillSlotTag otherRecipientCount](self, "otherRecipientCount");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDHighlightDisambiguationPillSlotTag otherRecipientCount](v7, "otherRecipientCount");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToNumber:", v23);

        if (v21)
        {

          if (!v24)
            goto LABEL_27;
LABEL_25:
          v25 = -[SLDHighlightDisambiguationPillSlotTag isPinned](self, "isPinned");
          if (v25 == -[SLDHighlightDisambiguationPillSlotTag isPinned](v7, "isPinned"))
          {
            v26 = -[SLDHighlightDisambiguationPillSlotTag isFromMe](self, "isFromMe");
            if (v26 == -[SLDHighlightDisambiguationPillSlotTag isFromMe](v7, "isFromMe"))
            {
              v28 = -[SLDHighlightDisambiguationPillSlotTag variant](self, "variant");
              v15 = v28 == -[SLDHighlightDisambiguationPillSlotTag variant](v7, "variant");
              goto LABEL_28;
            }
          }
          goto LABEL_27;
        }

        if ((v24 & 1) != 0)
          goto LABEL_25;
      }
    }
LABEL_27:
    v15 = 0;
    goto LABEL_28;
  }
  v15 = 0;
LABEL_29:

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  _BOOL4 v14;
  _BOOL4 v15;

  v15 = -[SLDHighlightDisambiguationPillSlotTag isPinned](self, "isPinned");
  v14 = -[SLDHighlightDisambiguationPillSlotTag isFromMe](self, "isFromMe");
  -[SLDHighlightDisambiguationPillSlotTag widthNumber](self, "widthNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SLDHighlightDisambiguationPillSlotTag sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = -[SLDHighlightDisambiguationPillSlotTag isGroupConversation](self, "isGroupConversation");
  -[SLDHighlightDisambiguationPillSlotTag groupDisplayName](self, "groupDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[SLDHighlightDisambiguationPillSlotTag otherRecipientCount](self, "otherRecipientCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v4 ^ v6 ^ v7 ^ v14 ^ v15 ^ v9 ^ v11 ^ -[SLDHighlightDisambiguationPillSlotTag variant](self, "variant");

  return v12;
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

- (SLPerson)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (void)setIsGroupConversation:(BOOL)a3
{
  self->_isGroupConversation = a3;
}

- (NSString)groupDisplayName
{
  return self->_groupDisplayName;
}

- (void)setGroupDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_groupDisplayName, a3);
}

- (NSNumber)otherRecipientCount
{
  return self->_otherRecipientCount;
}

- (void)setOtherRecipientCount:(id)a3
{
  objc_storeStrong((id *)&self->_otherRecipientCount, a3);
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_fromMe = a3;
}

- (NSNumber)widthNumber
{
  return self->_widthNumber;
}

- (void)setWidthNumber:(id)a3
{
  objc_storeStrong((id *)&self->_widthNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthNumber, 0);
  objc_storeStrong((id *)&self->_otherRecipientCount, 0);
  objc_storeStrong((id *)&self->_groupDisplayName, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

- (void)initWithHighlightAttribution:(uint64_t)a1 maxWidth:(void *)a2 variant:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_199EFF000, a3, OS_LOG_TYPE_ERROR, "[SLDHighlightDisambiguationPillSlotTag: %p] Initialized with an attribution (%@) for a group conversation without a display name, and with less than 3 related persons!", v5, 0x16u);

  OUTLINED_FUNCTION_9();
}

- (void)initWithHighlightAttribution:(uint64_t)a1 maxWidth:(void *)a2 variant:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_199EFF000, a3, OS_LOG_TYPE_DEBUG, "[SLDHighlightDisambiguationPillSlotTag: %p] SLAttribuition is not set as a group conversation: %@", v5, 0x16u);

  OUTLINED_FUNCTION_9();
}

@end
