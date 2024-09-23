@implementation RFFormattedText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setText:(id)a3
{
  RFImageElement *inline_image_element;
  id v6;

  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_text, a3);
  v6 = a3;
  *(_BYTE *)&self->_has &= ~2u;
  inline_image_element = self->_inline_image_element;
  self->_inline_image_element = 0;

}

- (BOOL)hasText
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setInline_image_element:(id)a3
{
  NSString *text;
  id v6;

  *(_BYTE *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_inline_image_element, a3);
  v6 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  text = self->_text;
  self->_text = 0;

}

- (BOOL)hasInline_image_element
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setWeight:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_weight = a3;
}

- (BOOL)hasWeight
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDesign:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_design = a3;
}

- (BOOL)hasDesign
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (RFFormattedText)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFFormattedText *v6;
  RFFormattedText *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFFormattedText initWithData:]([_SFPBRFFormattedText alloc], "initWithData:", v5);
  v7 = -[RFFormattedText initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFFormattedText *v6;

  v4 = a3;
  v6 = -[_SFPBRFFormattedText initWithFacade:]([_SFPBRFFormattedText alloc], "initWithFacade:", self);
  -[_SFPBRFFormattedText data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFFormattedText *v2;
  void *v3;

  v2 = -[_SFPBRFFormattedText initWithFacade:]([_SFPBRFFormattedText alloc], "initWithFacade:", self);
  -[_SFPBRFFormattedText dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFFormattedText *v2;
  void *v3;

  v2 = -[_SFPBRFFormattedText initWithFacade:]([_SFPBRFFormattedText alloc], "initWithFacade:", self);
  -[_SFPBRFFormattedText jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[RFFormattedText hasText](self, "hasText"))
  {
    -[RFFormattedText text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setText:", v6);

  }
  if (-[RFFormattedText hasInline_image_element](self, "hasInline_image_element"))
  {
    -[RFFormattedText inline_image_element](self, "inline_image_element");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setInline_image_element:", v8);

  }
  -[RFFormattedText color](self, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setColor:", v10);

  -[RFFormattedText is_italic](self, "is_italic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setIs_italic:", v12);

  -[RFFormattedText is_bold](self, "is_bold");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setIs_bold:", v14);

  -[RFFormattedText text_encapsulation](self, "text_encapsulation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setText_encapsulation:", v16);

  -[RFFormattedText is_highlighted](self, "is_highlighted");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setIs_highlighted:", v18);

  -[RFFormattedText background_color](self, "background_color");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setBackground_color:", v20);

  -[RFFormattedText attributions](self, "attributions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setAttributions:", v22);

  -[RFFormattedText highlighted_substrings](self, "highlighted_substrings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setHighlighted_substrings:", v24);

  -[RFFormattedText font](self, "font");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setFont:", v26);

  -[RFFormattedText is_underlined](self, "is_underlined");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setIs_underlined:", v28);

  -[RFFormattedText engageable](self, "engageable");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setEngageable:", v30);

  objc_msgSend(v4, "setWeight:", -[RFFormattedText weight](self, "weight"));
  objc_msgSend(v4, "setDesign:", -[RFFormattedText design](self, "design"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFFormattedText *v4;
  RFFormattedText *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  RFFormattedText *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int v50;
  int v51;
  uint64_t v52;
  RFFormattedText *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  _BYTE v117[20];
  _QWORD v118[6];
  uint64_t v119;
  int v120;
  int v121;
  id v122;
  id v123;
  _QWORD v124[5];

  v4 = (RFFormattedText *)a3;
  if (self == v4)
  {
    v19 = 1;
    goto LABEL_92;
  }
  if (!-[RFFormattedText isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v19 = 0;
    goto LABEL_92;
  }
  v5 = v4;
  -[RFFormattedText text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RFFormattedText text](v5, "text");
  v122 = (id)objc_claimAutoreleasedReturnValue();
  v123 = v6;
  v120 = v122 != 0;
  v121 = v6 == 0;
  if (v121 == v120)
  {
    v119 = 0;
    memset(v118, 0, sizeof(v118));
    v11 = 0;
    v12 = 0;
    v13 = 0;
    memset(v117, 0, sizeof(v117));
    v14 = 0;
    memset(v124, 0, sizeof(v124));
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_15;
  }
  -[RFFormattedText text](self, "text");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;
  v116 = (void *)v8;
  if (!v8
    || (-[RFFormattedText text](self, "text"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        -[RFFormattedText text](v5, "text"),
        v112 = (void *)objc_claimAutoreleasedReturnValue(),
        v113 = v10,
        objc_msgSend(v10, "isEqual:")))
  {
    -[RFFormattedText inline_image_element](self, "inline_image_element");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFormattedText inline_image_element](v5, "inline_image_element");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v119) = v9;
    if ((v115 == 0) == (v114 != 0))
    {
      LODWORD(v119) = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      memset(v117, 0, sizeof(v117));
      v14 = 0;
      memset(v124, 0, sizeof(v124));
      memset(v118, 0, 44);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      HIDWORD(v118[5]) = 1;
      goto LABEL_15;
    }
    -[RFFormattedText inline_image_element](self, "inline_image_element");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20 != 0;
    v111 = (void *)v20;
    if (v20)
    {
      -[RFFormattedText inline_image_element](self, "inline_image_element");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFFormattedText inline_image_element](v5, "inline_image_element");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v22;
      if (!objc_msgSend(v22, "isEqual:"))
      {
        memset(v118, 0, 40);
        v11 = 0;
        v12 = 0;
        v13 = 0;
        memset(v117, 0, sizeof(v117));
        v14 = 0;
        memset(v124, 0, sizeof(v124));
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v118[5] = 0x100000001;
        LODWORD(v119) = 1;
        goto LABEL_15;
      }
    }
    -[RFFormattedText color](self, "color");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFormattedText color](v5, "color");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v119) = v21;
    if ((v110 == 0) == (v109 != 0))
    {
      memset(v118, 0, 32);
      v11 = 0;
      v12 = 0;
      v13 = 0;
      memset(v117, 0, sizeof(v117));
      v14 = 0;
      memset(v124, 0, sizeof(v124));
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v118[5] = 0x100000001;
      v118[4] = 1;
      goto LABEL_15;
    }
    -[RFFormattedText color](self, "color");
    v28 = objc_claimAutoreleasedReturnValue();
    HIDWORD(v124[4]) = v28 != 0;
    v106 = (void *)v28;
    if (v28
      && (-[RFFormattedText color](self, "color"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          v53 = v5,
          -[RFFormattedText color](v5, "color"),
          v102 = (void *)objc_claimAutoreleasedReturnValue(),
          v103 = v29,
          !objc_msgSend(v29, "isEqual:")))
    {
      memset(v118, 0, 32);
      v11 = 0;
      v12 = 0;
      v13 = 0;
      memset(v117, 0, sizeof(v117));
      v14 = 0;
      v15 = 0;
      memset(v124, 0, 36);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v118[5] = 0x100000001;
      v118[4] = 0x100000001;
      HIDWORD(v124[4]) = 1;
    }
    else
    {
      -[RFFormattedText is_italic](self, "is_italic");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFFormattedText is_italic](v5, "is_italic");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v105 == 0) == (v104 != 0))
      {
        memset(v118, 0, 24);
        v11 = 0;
        v12 = 0;
        v13 = 0;
        memset(v117, 0, sizeof(v117));
        v14 = 0;
        v15 = 0;
        memset(v124, 0, 36);
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v118[5] = 0x100000001;
        v118[4] = 0x100000001;
        v118[3] = 1;
        goto LABEL_15;
      }
      -[RFFormattedText is_italic](self, "is_italic");
      v30 = objc_claimAutoreleasedReturnValue();
      LODWORD(v124[4]) = v30 != 0;
      v101 = (void *)v30;
      if (!v30
        || (-[RFFormattedText is_italic](self, "is_italic"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v53 = v5,
            -[RFFormattedText is_italic](v5, "is_italic"),
            v97 = (void *)objc_claimAutoreleasedReturnValue(),
            v98 = v31,
            objc_msgSend(v31, "isEqual:")))
      {
        -[RFFormattedText is_bold](self, "is_bold");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFFormattedText is_bold](v5, "is_bold");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v100 == 0) == (v99 != 0))
        {
          v118[0] = 0;
          v118[1] = 0;
          v11 = 0;
          v12 = 0;
          memset(v124, 0, 32);
          v13 = 0;
          memset(v117, 0, sizeof(v117));
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v19 = 0;
          v118[5] = 0x100000001;
          v118[4] = 0x100000001;
          v118[3] = 0x100000001;
          v118[2] = 1;
          goto LABEL_15;
        }
        -[RFFormattedText is_bold](self, "is_bold");
        v32 = objc_claimAutoreleasedReturnValue();
        HIDWORD(v124[3]) = v32 != 0;
        v96 = (void *)v32;
        if (v32)
        {
          -[RFFormattedText is_bold](self, "is_bold");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFFormattedText is_bold](v5, "is_bold");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v33;
          if (!objc_msgSend(v33, "isEqual:"))
          {
            v118[0] = 0;
            v118[1] = 0;
            v11 = 0;
            v12 = 0;
            v13 = 0;
            memset(v117, 0, sizeof(v117));
            v14 = 0;
            v15 = 0;
            memset(v124, 0, 28);
            v16 = 0;
            v17 = 0;
            v18 = 0;
            v19 = 0;
            v118[5] = 0x100000001;
            v118[4] = 0x100000001;
            v118[3] = 0x100000001;
            v118[2] = 0x100000001;
            HIDWORD(v124[3]) = 1;
            goto LABEL_15;
          }
        }
        -[RFFormattedText text_encapsulation](self, "text_encapsulation");
        v34 = objc_claimAutoreleasedReturnValue();
        -[RFFormattedText text_encapsulation](v5, "text_encapsulation");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = (void *)v34;
        if ((v34 == 0) == (v94 != 0))
        {
          v118[0] = 0;
          v11 = 0;
          v12 = 0;
          v13 = 0;
          memset(v117, 0, sizeof(v117));
          v14 = 0;
          v15 = 0;
          memset(v124, 0, 28);
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v19 = 0;
          v118[5] = 0x100000001;
          v118[4] = 0x100000001;
          v118[3] = 0x100000001;
          v118[2] = 0x100000001;
          v118[1] = 1;
          goto LABEL_15;
        }
        -[RFFormattedText text_encapsulation](self, "text_encapsulation");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v124[3]) = v91 != 0;
        if (v91)
        {
          -[RFFormattedText text_encapsulation](self, "text_encapsulation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFFormattedText text_encapsulation](v5, "text_encapsulation");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v35;
          if (!objc_msgSend(v35, "isEqual:"))
          {
            v118[0] = 0;
            v11 = 0;
            v12 = 0;
            v13 = 0;
            memset(v117, 0, sizeof(v117));
            v14 = 0;
            memset(v124, 0, 24);
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v18 = 0;
            v19 = 0;
            v118[5] = 0x100000001;
            v118[4] = 0x100000001;
            v118[3] = 0x100000001;
            v118[2] = 0x100000001;
            v118[1] = 0x100000001;
            LODWORD(v124[3]) = 1;
            goto LABEL_15;
          }
        }
        -[RFFormattedText is_highlighted](self, "is_highlighted");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFFormattedText is_highlighted](v5, "is_highlighted");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v90 == 0) == (v89 != 0))
        {
          *(_QWORD *)&v117[12] = 0;
          v118[0] = 0;
          v11 = 0;
          v12 = 0;
          *(_QWORD *)v117 = 0;
          v13 = 0;
          v14 = 0;
          memset(v124, 0, 24);
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v19 = 0;
          v118[5] = 0x100000001;
          v118[4] = 0x100000001;
          v118[3] = 0x100000001;
          v118[2] = 0x100000001;
          v118[1] = 0x100000001;
          *(_DWORD *)&v117[8] = 1;
          goto LABEL_15;
        }
        -[RFFormattedText is_highlighted](self, "is_highlighted");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        HIDWORD(v124[2]) = v86 != 0;
        if (v86)
        {
          -[RFFormattedText is_highlighted](self, "is_highlighted");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFFormattedText is_highlighted](v5, "is_highlighted");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v36;
          if (!objc_msgSend(v36, "isEqual:"))
          {
            v11 = 0;
            *(_QWORD *)&v117[12] = 0;
            v12 = 0;
            *(_QWORD *)v117 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            memset(v124, 0, 20);
            v16 = 0;
            v17 = 0;
            v18 = 0;
            v19 = 0;
            v118[5] = 0x100000001;
            v118[4] = 0x100000001;
            v118[3] = 0x100000001;
            v118[2] = 0x100000001;
            v118[1] = 0x100000001;
            *(_DWORD *)&v117[8] = 1;
            v118[0] = 0x100000000;
            HIDWORD(v124[2]) = 1;
            goto LABEL_15;
          }
        }
        -[RFFormattedText background_color](self, "background_color");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFFormattedText background_color](v5, "background_color");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v85 == 0) == (v84 != 0))
        {
          *(_QWORD *)&v117[12] = 0;
          v12 = 0;
          *(_QWORD *)v117 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          memset(v124, 0, 20);
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v19 = 0;
          v118[5] = 0x100000001;
          v118[4] = 0x100000001;
          v118[3] = 0x100000001;
          v118[2] = 0x100000001;
          v118[1] = 0x100000001;
          *(_DWORD *)&v117[8] = 1;
          v118[0] = 0x100000000;
          v11 = 1;
          goto LABEL_15;
        }
        -[RFFormattedText background_color](self, "background_color");
        v37 = objc_claimAutoreleasedReturnValue();
        LODWORD(v124[2]) = v37 != 0;
        v81 = (void *)v37;
        if (v37)
        {
          -[RFFormattedText background_color](self, "background_color");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v5;
          -[RFFormattedText background_color](v5, "background_color");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v38;
          if (!objc_msgSend(v38, "isEqual:"))
          {
            v12 = 0;
            *(_QWORD *)v117 = 0;
            v124[0] = 0;
            v124[1] = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v18 = 0;
            v19 = 0;
            v118[5] = 0x100000001;
            v118[4] = 0x100000001;
            v118[3] = 0x100000001;
            v118[2] = 0x100000001;
            v118[1] = 0x100000001;
            *(_DWORD *)&v117[8] = 1;
            *(_QWORD *)&v117[12] = 0x100000000;
            v118[0] = 0x100000000;
            v11 = 1;
            LODWORD(v124[2]) = 1;
            goto LABEL_156;
          }
        }
        else
        {
          v39 = v5;
        }
        -[RFFormattedText attributions](self, "attributions");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFFormattedText attributions](v39, "attributions");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v80 == 0) == (v79 != 0))
        {
          *(_QWORD *)v117 = 0;
          v124[0] = 0;
          v124[1] = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v19 = 0;
          v118[5] = 0x100000001;
          v118[4] = 0x100000001;
          v118[3] = 0x100000001;
          v118[2] = 0x100000001;
          v118[1] = 0x100000001;
          *(_QWORD *)&v117[8] = 1;
          v118[0] = 0x100000000;
          v11 = 1;
          *(_DWORD *)&v117[16] = 1;
          v12 = 1;
        }
        else
        {
          -[RFFormattedText attributions](self, "attributions");
          v40 = objc_claimAutoreleasedReturnValue();
          HIDWORD(v124[1]) = v40 != 0;
          v76 = (void *)v40;
          if (!v40
            || (-[RFFormattedText attributions](self, "attributions"),
                v41 = (void *)objc_claimAutoreleasedReturnValue(),
                -[RFFormattedText attributions](v39, "attributions"),
                v72 = (void *)objc_claimAutoreleasedReturnValue(),
                v73 = v41,
                objc_msgSend(v41, "isEqual:")))
          {
            -[RFFormattedText highlighted_substrings](self, "highlighted_substrings");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFFormattedText highlighted_substrings](v39, "highlighted_substrings");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v75 == 0) == (v74 != 0))
            {
              *(_QWORD *)&v117[12] = 0x100000000;
              *(_QWORD *)((char *)v124 + 4) = 0;
              *(_QWORD *)v117 = 0x100000000;
              v14 = 0;
              v15 = 0;
              LODWORD(v124[0]) = 0;
              v16 = 0;
              v17 = 0;
              v18 = 0;
              v19 = 0;
              v118[5] = 0x100000001;
              v118[4] = 0x100000001;
              v118[3] = 0x100000001;
              v118[2] = 0x100000001;
              v118[1] = 0x100000001;
              *(_DWORD *)&v117[8] = 1;
              v118[0] = 0x100000000;
              v11 = 1;
              v12 = 1;
              v13 = 1;
            }
            else
            {
              -[RFFormattedText highlighted_substrings](self, "highlighted_substrings");
              v42 = objc_claimAutoreleasedReturnValue();
              LODWORD(v124[1]) = v42 != 0;
              v71 = (void *)v42;
              if (!v42
                || (-[RFFormattedText highlighted_substrings](self, "highlighted_substrings"),
                    v43 = (void *)objc_claimAutoreleasedReturnValue(),
                    -[RFFormattedText highlighted_substrings](v39, "highlighted_substrings"),
                    v67 = (void *)objc_claimAutoreleasedReturnValue(),
                    v68 = v43,
                    objc_msgSend(v43, "isEqual:")))
              {
                -[RFFormattedText font](self, "font");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                -[RFFormattedText font](v39, "font");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v70 == 0) == (v69 != 0))
                {
                  v14 = 0;
                  v124[0] = 0;
                  v15 = 0;
                  v16 = 0;
                  v17 = 0;
                  v18 = 0;
                  v19 = 0;
                  v118[5] = 0x100000001;
                  v118[4] = 0x100000001;
                  v118[3] = 0x100000001;
                  v118[2] = 0x100000001;
                  v118[1] = 0x100000001;
                  *(_DWORD *)&v117[8] = 1;
                  v118[0] = 0x100000000;
                  v11 = 1;
                  *(_QWORD *)&v117[12] = 0x100000001;
                  v12 = 1;
                  v13 = 1;
                  *(_QWORD *)v117 = 0x100000001;
                }
                else
                {
                  -[RFFormattedText font](self, "font");
                  v44 = objc_claimAutoreleasedReturnValue();
                  HIDWORD(v124[0]) = v44 != 0;
                  v66 = (void *)v44;
                  if (!v44
                    || (-[RFFormattedText font](self, "font"),
                        v45 = (void *)objc_claimAutoreleasedReturnValue(),
                        -[RFFormattedText font](v39, "font"),
                        v62 = (void *)objc_claimAutoreleasedReturnValue(),
                        v63 = v45,
                        objc_msgSend(v45, "isEqual:")))
                  {
                    -[RFFormattedText is_underlined](self, "is_underlined");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RFFormattedText is_underlined](v39, "is_underlined");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v65 == 0) == (v64 != 0))
                    {
                      v15 = 0;
                      LODWORD(v124[0]) = 0;
                      v16 = 0;
                      v17 = 0;
                      v18 = 0;
                      v19 = 0;
                      v118[5] = 0x100000001;
                      v118[4] = 0x100000001;
                      v118[3] = 0x100000001;
                      v118[2] = 0x100000001;
                      v118[1] = 0x100000001;
                      *(_DWORD *)&v117[8] = 1;
                      v11 = 1;
                      *(_QWORD *)&v117[12] = 0x100000001;
                      v12 = 1;
                      v13 = 1;
                      *(_QWORD *)v117 = 0x100000001;
                      v14 = 1;
                      v118[0] = 0x100000001;
                    }
                    else
                    {
                      -[RFFormattedText is_underlined](self, "is_underlined");
                      v46 = objc_claimAutoreleasedReturnValue();
                      LODWORD(v124[0]) = v46 != 0;
                      v61 = (void *)v46;
                      if (!v46
                        || (-[RFFormattedText is_underlined](self, "is_underlined"),
                            v47 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[RFFormattedText is_underlined](v39, "is_underlined"),
                            v57 = (void *)objc_claimAutoreleasedReturnValue(),
                            v58 = v47,
                            objc_msgSend(v47, "isEqual:")))
                      {
                        -[RFFormattedText engageable](self, "engageable");
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        -[RFFormattedText engageable](v39, "engageable");
                        v59 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v60 == 0) == (v59 != 0))
                        {
                          v17 = 0;
                          v18 = 0;
                          v19 = 0;
                          v118[5] = 0x100000001;
                          v118[4] = 0x100000001;
                          v118[3] = 0x100000001;
                          v118[2] = 0x100000001;
                          v118[1] = 0x100000001;
                          *(_DWORD *)&v117[8] = 1;
                          v118[0] = 0x100000001;
                          v11 = 1;
                          *(_QWORD *)&v117[12] = 0x100000001;
                          v12 = 1;
                          v13 = 1;
                          *(_QWORD *)v117 = 0x100000001;
                          v14 = 1;
                          v15 = 1;
                          v16 = 1;
                        }
                        else
                        {
                          -[RFFormattedText engageable](self, "engageable");
                          v48 = objc_claimAutoreleasedReturnValue();
                          v54 = v48 != 0;
                          v56 = (void *)v48;
                          if (!v48
                            || (-[RFFormattedText engageable](self, "engageable"),
                                v49 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[RFFormattedText engageable](v39, "engageable"),
                                v55 = v49,
                                v52 = objc_claimAutoreleasedReturnValue(),
                                objc_msgSend(v49, "isEqual:")))
                          {
                            v50 = -[RFFormattedText weight](self, "weight");
                            if (v50 == -[RFFormattedText weight](v39, "weight"))
                            {
                              v51 = -[RFFormattedText design](self, "design");
                              v5 = v39;
                              v19 = v51 == -[RFFormattedText design](v39, "design");
                              v118[5] = 0x100000001;
                              v118[4] = 0x100000001;
                              v118[3] = 0x100000001;
                              v118[2] = 0x100000001;
                              v118[1] = 0x100000001;
                              *(_DWORD *)&v117[8] = 1;
                              v118[0] = 0x100000001;
                              v11 = 1;
                              *(_QWORD *)&v117[12] = 0x100000001;
                              v12 = 1;
                              v13 = 1;
                              *(_QWORD *)v117 = 0x100000001;
                              v14 = 1;
                              v15 = 1;
                              v16 = 1;
                              v17 = 1;
                              v18 = v54;
                              v7 = (void *)v52;
                              goto LABEL_15;
                            }
                            v19 = 0;
                            v118[5] = 0x100000001;
                            v118[4] = 0x100000001;
                            v118[3] = 0x100000001;
                            v118[2] = 0x100000001;
                            v118[1] = 0x100000001;
                            *(_DWORD *)&v117[8] = 1;
                            v118[0] = 0x100000001;
                            v11 = 1;
                            *(_QWORD *)&v117[12] = 0x100000001;
                            v12 = 1;
                            v13 = 1;
                            *(_QWORD *)v117 = 0x100000001;
                            v14 = 1;
                            v15 = 1;
                            v16 = 1;
                            v17 = 1;
                            v18 = v54;
                          }
                          else
                          {
                            v19 = 0;
                            v118[5] = 0x100000001;
                            v118[4] = 0x100000001;
                            v118[3] = 0x100000001;
                            v118[2] = 0x100000001;
                            v118[1] = 0x100000001;
                            *(_DWORD *)&v117[8] = 1;
                            v118[0] = 0x100000001;
                            v11 = 1;
                            *(_QWORD *)&v117[12] = 0x100000001;
                            v12 = 1;
                            v13 = 1;
                            *(_QWORD *)v117 = 0x100000001;
                            v14 = 1;
                            v15 = 1;
                            v16 = 1;
                            v17 = 1;
                            v18 = 1;
                          }
                          v7 = (void *)v52;
                        }
                      }
                      else
                      {
                        v16 = 0;
                        v17 = 0;
                        v18 = 0;
                        v19 = 0;
                        v118[5] = 0x100000001;
                        v118[4] = 0x100000001;
                        v118[3] = 0x100000001;
                        v118[2] = 0x100000001;
                        v118[1] = 0x100000001;
                        *(_DWORD *)&v117[8] = 1;
                        v118[0] = 0x100000001;
                        v11 = 1;
                        *(_QWORD *)&v117[12] = 0x100000001;
                        v12 = 1;
                        v13 = 1;
                        *(_QWORD *)v117 = 0x100000001;
                        v14 = 1;
                        v15 = 1;
                        LODWORD(v124[0]) = 1;
                      }
                    }
                  }
                  else
                  {
                    v15 = 0;
                    v124[0] = 0x100000000;
                    v16 = 0;
                    v17 = 0;
                    v18 = 0;
                    v19 = 0;
                    v118[5] = 0x100000001;
                    v118[4] = 0x100000001;
                    v118[3] = 0x100000001;
                    v118[2] = 0x100000001;
                    v118[1] = 0x100000001;
                    *(_DWORD *)&v117[8] = 1;
                    v118[0] = 0x100000000;
                    v11 = 1;
                    *(_QWORD *)&v117[12] = 0x100000001;
                    v12 = 1;
                    v13 = 1;
                    *(_QWORD *)v117 = 0x100000001;
                    v14 = 1;
                  }
                }
              }
              else
              {
                *(_QWORD *)v117 = 0x100000000;
                v14 = 0;
                v124[0] = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                v18 = 0;
                v19 = 0;
                v118[5] = 0x100000001;
                v118[4] = 0x100000001;
                v118[3] = 0x100000001;
                v118[2] = 0x100000001;
                v118[1] = 0x100000001;
                *(_DWORD *)&v117[8] = 1;
                v118[0] = 0x100000000;
                v11 = 1;
                *(_QWORD *)&v117[12] = 0x100000001;
                v12 = 1;
                v13 = 1;
                LODWORD(v124[1]) = 1;
              }
            }
          }
          else
          {
            v13 = 0;
            *(_QWORD *)&v117[12] = 0x100000000;
            *(_QWORD *)((char *)v124 + 4) = 0;
            *(_QWORD *)v117 = 0x100000000;
            v14 = 0;
            v15 = 0;
            LODWORD(v124[0]) = 0;
            v16 = 0;
            v17 = 0;
            v18 = 0;
            v19 = 0;
            v118[5] = 0x100000001;
            v118[4] = 0x100000001;
            v118[3] = 0x100000001;
            v118[2] = 0x100000001;
            v118[1] = 0x100000001;
            *(_DWORD *)&v117[8] = 1;
            v118[0] = 0x100000000;
            v11 = 1;
            v12 = 1;
            HIDWORD(v124[1]) = 1;
          }
        }
LABEL_156:
        v5 = v39;
        goto LABEL_15;
      }
      memset(v118, 0, 24);
      v11 = 0;
      v12 = 0;
      memset(v124, 0, 32);
      v13 = 0;
      memset(v117, 0, sizeof(v117));
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v118[5] = 0x100000001;
      v118[4] = 0x100000001;
      v118[3] = 0x100000001;
      LODWORD(v124[4]) = 1;
    }
    v5 = v53;
    goto LABEL_15;
  }
  v119 = 0x100000000;
  memset(v118, 0, sizeof(v118));
  v11 = 0;
  v12 = 0;
  v13 = 0;
  memset(v117, 0, sizeof(v117));
  v14 = 0;
  memset(v124, 0, sizeof(v124));
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
LABEL_15:
  if (v18)
  {
    v23 = v14;
    v24 = v15;
    v25 = v16;
    v26 = v17;

    v17 = v26;
    v16 = v25;
    v15 = v24;
    v14 = v23;
  }
  if (v17)

  if (v16)
  {

  }
  if (LODWORD(v124[0]))
  {

  }
  if (v15)

  if (LODWORD(v118[0]))
  {

  }
  if (HIDWORD(v124[0]))
  {

  }
  if (v14)

  if (*(_DWORD *)v117)
  {

  }
  if (LODWORD(v124[1]))
  {

  }
  if (*(_DWORD *)&v117[12])

  if (v13)
  {

  }
  if (HIDWORD(v124[1]))
  {

  }
  if (*(_DWORD *)&v117[4])

  if (v12)
  {

  }
  if (LODWORD(v124[2]))
  {

  }
  if (*(_DWORD *)&v117[16])

  if (v11)
  {

  }
  if (HIDWORD(v124[2]))
  {

  }
  if (HIDWORD(v118[0]))

  if (*(_DWORD *)&v117[8])
  {

  }
  if (LODWORD(v124[3]))
  {

  }
  if (HIDWORD(v118[1]))

  if (LODWORD(v118[1]))
  {

  }
  if (HIDWORD(v124[3]))
  {

  }
  if (HIDWORD(v118[2]))

  if (LODWORD(v118[2]))
  {

  }
  if (LODWORD(v124[4]))
  {

  }
  if (HIDWORD(v118[3]))

  if (LODWORD(v118[3]))
  {

  }
  if (HIDWORD(v124[4]))
  {

  }
  if (HIDWORD(v118[4]))

  if (LODWORD(v118[4]))
  {

  }
  if ((_DWORD)v119)
  {

  }
  if (LODWORD(v118[5]))

  if (HIDWORD(v118[5]))
  {

  }
  if (HIDWORD(v119))
  {

  }
  if (v121 != v120)

LABEL_92:
  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  -[RFFormattedText text](self, "text");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v31, "hash");
  -[RFFormattedText inline_image_element](self, "inline_image_element");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v30, "hash") ^ v3;
  -[RFFormattedText color](self, "color");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v29, "hash");
  -[RFFormattedText is_italic](self, "is_italic");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v28, "hash");
  -[RFFormattedText is_bold](self, "is_bold");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v27, "hash");
  -[RFFormattedText text_encapsulation](self, "text_encapsulation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v26, "hash");
  -[RFFormattedText is_highlighted](self, "is_highlighted");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[RFFormattedText background_color](self, "background_color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[RFFormattedText attributions](self, "attributions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[RFFormattedText highlighted_substrings](self, "highlighted_substrings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[RFFormattedText font](self, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10 ^ v16 ^ objc_msgSend(v17, "hash");
  -[RFFormattedText is_underlined](self, "is_underlined");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  -[RFFormattedText engageable](self, "engageable");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  v23 = v22 ^ -[RFFormattedText weight](self, "weight");
  v24 = v18 ^ v23 ^ -[RFFormattedText design](self, "design");

  return v24;
}

- (NSString)text
{
  return self->_text;
}

- (RFImageElement)inline_image_element
{
  return self->_inline_image_element;
}

- (RFColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (RFOptionalBool)is_italic
{
  return self->_is_italic;
}

- (void)setIs_italic:(id)a3
{
  objc_storeStrong((id *)&self->_is_italic, a3);
}

- (RFOptionalBool)is_bold
{
  return self->_is_bold;
}

- (void)setIs_bold:(id)a3
{
  objc_storeStrong((id *)&self->_is_bold, a3);
}

- (RFTextEncapsulation)text_encapsulation
{
  return self->_text_encapsulation;
}

- (void)setText_encapsulation:(id)a3
{
  objc_storeStrong((id *)&self->_text_encapsulation, a3);
}

- (RFOptionalBool)is_highlighted
{
  return self->_is_highlighted;
}

- (void)setIs_highlighted:(id)a3
{
  objc_storeStrong((id *)&self->_is_highlighted, a3);
}

- (RFColor)background_color
{
  return self->_background_color;
}

- (void)setBackground_color:(id)a3
{
  objc_storeStrong((id *)&self->_background_color, a3);
}

- (NSArray)attributions
{
  return self->_attributions;
}

- (void)setAttributions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)highlighted_substrings
{
  return self->_highlighted_substrings;
}

- (void)setHighlighted_substrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (RFFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (RFOptionalBool)is_underlined
{
  return self->_is_underlined;
}

- (void)setIs_underlined:(id)a3
{
  objc_storeStrong((id *)&self->_is_underlined, a3);
}

- (RFEngageable)engageable
{
  return self->_engageable;
}

- (void)setEngageable:(id)a3
{
  objc_storeStrong((id *)&self->_engageable, a3);
}

- (int)weight
{
  return self->_weight;
}

- (int)design
{
  return self->_design;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engageable, 0);
  objc_storeStrong((id *)&self->_is_underlined, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_highlighted_substrings, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_background_color, 0);
  objc_storeStrong((id *)&self->_is_highlighted, 0);
  objc_storeStrong((id *)&self->_text_encapsulation, 0);
  objc_storeStrong((id *)&self->_is_bold, 0);
  objc_storeStrong((id *)&self->_is_italic, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_inline_image_element, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (RFFormattedText)initWithProtobuf:(id)a3
{
  id v4;
  RFFormattedText *v5;
  void *v6;
  void *v7;
  void *v8;
  RFImageElement *v9;
  void *v10;
  RFImageElement *v11;
  void *v12;
  RFColor *v13;
  void *v14;
  RFColor *v15;
  void *v16;
  RFOptionalBool *v17;
  void *v18;
  RFOptionalBool *v19;
  void *v20;
  RFOptionalBool *v21;
  void *v22;
  RFOptionalBool *v23;
  void *v24;
  RFTextEncapsulation *v25;
  void *v26;
  RFTextEncapsulation *v27;
  void *v28;
  RFOptionalBool *v29;
  void *v30;
  RFOptionalBool *v31;
  void *v32;
  RFColor *v33;
  void *v34;
  RFColor *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  RFAttribution *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  RFHighlightedSubstring *v51;
  void *v52;
  RFFont *v53;
  void *v54;
  RFFont *v55;
  void *v56;
  RFOptionalBool *v57;
  void *v58;
  RFOptionalBool *v59;
  void *v60;
  RFEngageable *v61;
  void *v62;
  RFEngageable *v63;
  RFFormattedText *v64;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  objc_super v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)RFFormattedText;
  v5 = -[RFFormattedText init](&v74, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFFormattedText setText:](v5, "setText:", v7);

    }
    objc_msgSend(v4, "inline_image_element");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [RFImageElement alloc];
      objc_msgSend(v4, "inline_image_element");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[RFImageElement initWithProtobuf:](v9, "initWithProtobuf:", v10);
      -[RFFormattedText setInline_image_element:](v5, "setInline_image_element:", v11);

    }
    objc_msgSend(v4, "color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [RFColor alloc];
      objc_msgSend(v4, "color");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[RFColor initWithProtobuf:](v13, "initWithProtobuf:", v14);
      -[RFFormattedText setColor:](v5, "setColor:", v15);

    }
    objc_msgSend(v4, "is_italic");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [RFOptionalBool alloc];
      objc_msgSend(v4, "is_italic");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[RFOptionalBool initWithProtobuf:](v17, "initWithProtobuf:", v18);
      -[RFFormattedText setIs_italic:](v5, "setIs_italic:", v19);

    }
    objc_msgSend(v4, "is_bold");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [RFOptionalBool alloc];
      objc_msgSend(v4, "is_bold");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[RFOptionalBool initWithProtobuf:](v21, "initWithProtobuf:", v22);
      -[RFFormattedText setIs_bold:](v5, "setIs_bold:", v23);

    }
    objc_msgSend(v4, "text_encapsulation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [RFTextEncapsulation alloc];
      objc_msgSend(v4, "text_encapsulation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[RFTextEncapsulation initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[RFFormattedText setText_encapsulation:](v5, "setText_encapsulation:", v27);

    }
    objc_msgSend(v4, "is_highlighted");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [RFOptionalBool alloc];
      objc_msgSend(v4, "is_highlighted");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[RFOptionalBool initWithProtobuf:](v29, "initWithProtobuf:", v30);
      -[RFFormattedText setIs_highlighted:](v5, "setIs_highlighted:", v31);

    }
    objc_msgSend(v4, "background_color");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [RFColor alloc];
      objc_msgSend(v4, "background_color");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[RFColor initWithProtobuf:](v33, "initWithProtobuf:", v34);
      -[RFFormattedText setBackground_color:](v5, "setBackground_color:", v35);

    }
    objc_msgSend(v4, "attributions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
      v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v37 = 0;

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v4, "attributions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v71 != v41)
            objc_enumerationMutation(v38);
          v43 = -[RFAttribution initWithProtobuf:]([RFAttribution alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i));
          if (v43)
            objc_msgSend(v37, "addObject:", v43);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      }
      while (v40);
    }

    -[RFFormattedText setAttributions:](v5, "setAttributions:", v37);
    objc_msgSend(v4, "highlighted_substrings");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
      v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v45 = 0;

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v4, "highlighted_substrings", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v67 != v49)
            objc_enumerationMutation(v46);
          v51 = -[RFHighlightedSubstring initWithProtobuf:]([RFHighlightedSubstring alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j));
          if (v51)
            objc_msgSend(v45, "addObject:", v51);

        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      }
      while (v48);
    }

    -[RFFormattedText setHighlighted_substrings:](v5, "setHighlighted_substrings:", v45);
    objc_msgSend(v4, "font");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = [RFFont alloc];
      objc_msgSend(v4, "font");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[RFFont initWithProtobuf:](v53, "initWithProtobuf:", v54);
      -[RFFormattedText setFont:](v5, "setFont:", v55);

    }
    objc_msgSend(v4, "is_underlined");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = [RFOptionalBool alloc];
      objc_msgSend(v4, "is_underlined");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[RFOptionalBool initWithProtobuf:](v57, "initWithProtobuf:", v58);
      -[RFFormattedText setIs_underlined:](v5, "setIs_underlined:", v59);

    }
    objc_msgSend(v4, "engageable");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      v61 = [RFEngageable alloc];
      objc_msgSend(v4, "engageable");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[RFEngageable initWithProtobuf:](v61, "initWithProtobuf:", v62);
      -[RFFormattedText setEngageable:](v5, "setEngageable:", v63);

    }
    if (objc_msgSend(v4, "weight"))
      -[RFFormattedText setWeight:](v5, "setWeight:", objc_msgSend(v4, "weight"));
    if (objc_msgSend(v4, "design"))
      -[RFFormattedText setDesign:](v5, "setDesign:", objc_msgSend(v4, "design"));
    v64 = v5;

  }
  return v5;
}

@end
