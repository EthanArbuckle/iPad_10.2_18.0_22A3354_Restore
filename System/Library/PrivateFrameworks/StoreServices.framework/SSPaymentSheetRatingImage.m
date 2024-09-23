@implementation SSPaymentSheetRatingImage

- (SSPaymentSheetRatingImage)initWithDictionary:(id)a3
{
  id v4;
  SSPaymentSheetRatingImage *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *value;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSPaymentSheetRatingImage;
  v5 = -[SSPaymentSheetRatingImage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ratingType = -[SSPaymentSheetRatingImage _ratingTypeForType:](v5, "_ratingTypeForType:", v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uppercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    value = v5->_value;
    v5->_value = (NSString *)v9;

  }
  return v5;
}

- (SSPaymentSheetRatingImage)initWithURLString:(id)a3
{
  id v4;
  SSPaymentSheetRatingImage *v5;
  uint64_t v6;
  NSString *urlString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSPaymentSheetRatingImage;
  v5 = -[SSPaymentSheetRatingImage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    v5->_ratingType = 1;
  }

  return v5;
}

- (BOOL)isServerSupplied
{
  return self->_ratingType == 1;
}

- (id)localAssetName
{
  id result;
  NSString **p_value;
  _BOOL4 v5;
  __CFString *v6;
  NSString *v7;
  const __CFString *v8;
  const __CFString *v9;

  switch(self->_ratingType)
  {
    case 3:
      if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("10")))
      {
        result = CFSTR("Rating-Brazil_10");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("12")))
      {
        result = CFSTR("Rating-Brazil_12");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("14")))
      {
        result = CFSTR("Rating-Brazil_14");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("16")))
      {
        result = CFSTR("Rating-Brazil_16");
      }
      else
      {
        if (!-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("18")))
        {
          v5 = -[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("L"));
          v6 = CFSTR("Rating-Brazil_L");
          goto LABEL_20;
        }
        result = CFSTR("Rating-Brazil_18");
      }
      break;
    case 4:
      p_value = &self->_value;
      if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("G")))
      {
        result = CFSTR("Rating-MPAA_G");
      }
      else
      {
        if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("GP")))
          goto LABEL_26;
        if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("PG")))
        {
          result = CFSTR("Rating-MPAA_PG");
        }
        else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("PG-13")))
        {
          result = CFSTR("Rating-MPAA_PG13");
        }
        else
        {
          if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("M")))
            goto LABEL_26;
          if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("R")))
          {
            result = CFSTR("Rating-MPAA_R");
          }
          else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("NC-17")))
          {
            result = CFSTR("Rating-MPAA_NC17");
          }
          else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("UNRATED")))
          {
            result = CFSTR("Rating-MPAA_Unrated");
          }
          else
          {
            if (!-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("NR")))
            {
              v9 = CFSTR("X");
              goto LABEL_97;
            }
            result = CFSTR("Rating-MPAA_NR");
          }
        }
      }
      break;
    case 5:
      if (!-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("CLEAN")))
      {
        v5 = -[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("EXPLICIT"));
        v6 = CFSTR("Rating-RIAA_Explicit");
        goto LABEL_20;
      }
      result = CFSTR("Rating-RIAA_Clean");
      break;
    case 6:
      p_value = &self->_value;
      if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("G")))
      {
        result = CFSTR("Rating-Movie_NZ_G");
      }
      else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("PG")))
      {
        result = CFSTR("Rating-Movie_NZ_PG");
      }
      else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("M")))
      {
        result = CFSTR("Rating-Movie_NZ_M");
      }
      else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("R13")))
      {
        result = CFSTR("Rating-Movie_NZ_R13");
      }
      else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("R15")))
      {
        result = CFSTR("Rating-Movie_NZ_R15");
      }
      else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("R16")))
      {
        result = CFSTR("Rating-Movie_NZ_R16");
      }
      else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("R18")))
      {
        result = CFSTR("Rating-Movie_NZ_R18");
      }
      else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("RP13")))
      {
        result = CFSTR("Rating-Movie_NZ_RP13");
      }
      else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("RP16")))
      {
        result = CFSTR("Rating-Movie_NZ_RP16");
      }
      else
      {
        if (!-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("R")))
        {
          v7 = *p_value;
          v8 = CFSTR("NOT RATED");
          goto LABEL_95;
        }
        result = CFSTR("Rating-Movie_NZ_R");
      }
      break;
    case 7:
      p_value = &self->_value;
      if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("U")))
      {
        result = CFSTR("Rating-Movie_UK_U");
      }
      else
      {
        if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("Uc")))
          goto LABEL_26;
        if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("PG")))
        {
          result = CFSTR("Rating-Movie_UK_PG");
        }
        else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("12")))
        {
          result = CFSTR("Rating-Movie_UK_12");
        }
        else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("12A")))
        {
          result = CFSTR("Rating-Movie_UK_12A");
        }
        else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("15")))
        {
          result = CFSTR("Rating-Movie_UK_15");
        }
        else if (-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("18")))
        {
          result = CFSTR("Rating-Movie_UK_18");
        }
        else
        {
          if (!-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("18R")))
          {
            if (!-[NSString isEqualToString:](*p_value, "isEqualToString:", CFSTR("E")))
            {
              v7 = *p_value;
              v8 = CFSTR("TBC");
LABEL_95:
              if (!-[NSString isEqualToString:](v7, "isEqualToString:", v8))
              {
                v9 = CFSTR("UNRATED");
LABEL_97:
                -[NSString isEqualToString:](*p_value, "isEqualToString:", v9);
              }
            }
            goto LABEL_26;
          }
          result = CFSTR("Rating-Movie_UK_R18");
        }
      }
      break;
    case 8:
      if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("TV-Y")))
      {
        result = CFSTR("Rating-TV_US_Y");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("TV-Y7")))
      {
        result = CFSTR("Rating-TV_US_Y7");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("FV")))
      {
        result = CFSTR("Rating-TV_US_Y7FV");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("TV-14")))
      {
        result = CFSTR("Rating-TV_US_14");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("TV-G")))
      {
        result = CFSTR("Rating-TV_US_G");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("TV-PG")))
      {
        result = CFSTR("Rating-TV_US_PG");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("TV-MA")))
      {
        result = CFSTR("Rating-TV_US_MA");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("D")))
      {
        result = CFSTR("Rating-TV_US_D");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("L")))
      {
        result = CFSTR("Rating-TV_US_L");
      }
      else if (-[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("S")))
      {
        result = CFSTR("Rating-TV_US_S");
      }
      else
      {
        v5 = -[NSString isEqualToString:](self->_value, "isEqualToString:", CFSTR("V"));
        v6 = CFSTR("Rating-TV_US_V");
LABEL_20:
        if (v5)
          result = v6;
        else
          result = 0;
      }
      break;
    default:
LABEL_26:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)tint
{
  return ((self->_ratingType - 4) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (int64_t)_ratingTypeForType:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPS-BRAZIL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GAMES")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("ITUNESGAMES")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("ITUNES-GAMES")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NZ-OFLC")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BBFC")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MPAA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIAA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV-US")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("US-TV")) & 1) != 0
         || objc_msgSend(v3, "isEqualToString:", CFSTR("TV")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SSPaymentSheetRatingImage *v5;
  uint64_t v6;
  NSString *urlString;
  uint64_t v8;
  NSString *value;

  v5 = objc_alloc_init(SSPaymentSheetRatingImage);
  v5->_ratingType = self->_ratingType;
  v6 = -[NSString copyWithZone:](self->_urlString, "copyWithZone:", a3);
  urlString = v5->_urlString;
  v5->_urlString = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  value = v5->_value;
  v5->_value = (NSString *)v8;

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->_ratingType);
  SSXPCDictionarySetObject(v3, "1", self->_urlString);
  SSXPCDictionarySetObject(v3, "2", self->_value);
  return v3;
}

- (SSPaymentSheetRatingImage)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSPaymentSheetRatingImage *v6;
  uint64_t v8;
  uint64_t v9;
  NSString *urlString;
  uint64_t v11;
  uint64_t v12;
  NSString *value;
  objc_super v14;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSPaymentSheetRatingImage;
    v6 = -[SSPaymentSheetRatingImage init](&v14, sel_init);
    if (v6)
    {
      v6->_ratingType = xpc_dictionary_get_int64(v5, "0");
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v8);
      urlString = v6->_urlString;
      v6->_urlString = (NSString *)v9;

      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v11);
      value = v6->_value;
      v6->_value = (NSString *)v12;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (int64_t)ratingType
{
  return self->_ratingType;
}

- (NSString)urlString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
