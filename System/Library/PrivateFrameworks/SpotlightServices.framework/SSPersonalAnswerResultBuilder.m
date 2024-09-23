@implementation SSPersonalAnswerResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.spotlight.events");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (BOOL)supportsResult:(id)a3
{
  id v4;
  char v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SSPersonalAnswerResultBuilder;
  if ((objc_msgSendSuper2(&v8, sel_supportsResult_, v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "applicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.spotlight.events"));

  }
  return v5;
}

- (SSPersonalAnswerResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSPersonalAnswerResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSPersonalAnswerResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v12, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPersonalAnswerResultBuilder setDisplayName:](v5, "setDisplayName:", v6);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6968], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPersonalAnswerResultBuilder processRawTitleString:](v5, "processRawTitleString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPersonalAnswerResultBuilder setTitleString:](v5, "setTitleString:", v8);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA68C8], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPersonalAnswerResultBuilder setStartDate:](v5, "setStartDate:", v9);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA61C8], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPersonalAnswerResultBuilder setEndDate:](v5, "setEndDate:", v10);

  }
  return v5;
}

- (id)processRawTitleString:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("Flight: ")))
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(": "), CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SSPersonalAnswerResultBuilder setIsFlight:](self, "setIsFlight:", 1);
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("Stay: ")))
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Stay: "), &stru_1E6E549F0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SSPersonalAnswerResultBuilder setIsHotel:](self, "setIsHotel:", 1);
  }
  else
  {
    v5 = v4;
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("Reservation: ")))
    {
      objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Reservation: "), &stru_1E6E549F0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[SSPersonalAnswerResultBuilder setIsRestaurant:](self, "setIsRestaurant:", 1);
    }
  }
  v6 = v5;

  return v6;
}

- (id)buildInlineCardSections
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPersonalAnswerResultBuilder;
  -[SSResultBuilder buildInlineCardSections](&v3, sel_buildInlineCardSections);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)buildTitle
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  -[SSPersonalAnswerResultBuilder displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[SSPersonalAnswerResultBuilder displayName](self, "displayName");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[SSPersonalAnswerResultBuilder titleString](self, "titleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[SSPersonalAnswerResultBuilder titleString](self, "titleString");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v5;
    if (v5)
      goto LABEL_6;
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NO_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_9;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSPersonalAnswerResultBuilder displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
    objc_msgSend(v9, "setMaxLines:", 2);
LABEL_10:

  return v9;
}

- (id)buildDescriptions
{
  NSString *v3;
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
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  -[SSPersonalAnswerResultBuilder displayName](self, "displayName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v3 = self->_titleString;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("MMMM d, yyyy"));
  -[SSPersonalAnswerResultBuilder startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDateFormat:", CFSTR("h:mm a"));
  -[SSPersonalAnswerResultBuilder startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SSPersonalAnswerResultBuilder isFlight](self, "isFlight"))
  {
    -[SSPersonalAnswerResultBuilder endDate](self, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ to %@"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Check in at %@"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)buildThumbnail
{
  void *v3;
  const __CFString *v4;

  v3 = (void *)objc_opt_new();
  if (-[SSPersonalAnswerResultBuilder isFlight](self, "isFlight"))
  {
    v4 = CFSTR("airplane.circle.fill");
LABEL_7:
    objc_msgSend(v3, "setSymbolName:", v4);
    goto LABEL_8;
  }
  if (-[SSPersonalAnswerResultBuilder isHotel](self, "isHotel"))
  {
    v4 = CFSTR("bed.double.circle.fill");
    goto LABEL_7;
  }
  if (-[SSPersonalAnswerResultBuilder isRestaurant](self, "isRestaurant"))
  {
    v4 = CFSTR("fork.knife.circle.fill");
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v3, "setPrimaryColor:", 4);
  return v3;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setSymbolName:", CFSTR("envelope.fill"));
  objc_msgSend(v3, "setPrimaryColor:", 7);
  return v3;
}

- (id)buildAction
{
  return 0;
}

- (id)buildButtonItems
{
  return 0;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (BOOL)isFlight
{
  return self->_isFlight;
}

- (void)setIsFlight:(BOOL)a3
{
  self->_isFlight = a3;
}

- (BOOL)isHotel
{
  return self->_isHotel;
}

- (void)setIsHotel:(BOOL)a3
{
  self->_isHotel = a3;
}

- (BOOL)isRestaurant
{
  return self->_isRestaurant;
}

- (void)setIsRestaurant:(BOOL)a3
{
  self->_isRestaurant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
