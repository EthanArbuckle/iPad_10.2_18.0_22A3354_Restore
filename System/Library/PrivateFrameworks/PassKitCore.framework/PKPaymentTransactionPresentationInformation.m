@implementation PKPaymentTransactionPresentationInformation

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransactionPresentationInformation *v4;
  PKPaymentTransactionPresentationInformation *v5;
  PKPaymentTransactionPresentationInformation *v6;
  NSString *primaryString;
  NSString *v8;
  BOOL v9;
  NSString *secondaryString;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  _BOOL4 v14;
  NSString *tertiaryString;
  NSString *v16;
  NSString *badgeString;
  NSString *v18;
  NSString *valueString;
  NSString *v20;

  v4 = (PKPaymentTransactionPresentationInformation *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        primaryString = self->_primaryString;
        v8 = v6->_primaryString;
        if (primaryString && v8)
        {
          if ((-[NSString isEqual:](primaryString, "isEqual:") & 1) == 0)
            goto LABEL_37;
        }
        else if (primaryString != v8)
        {
          goto LABEL_37;
        }
        secondaryString = v6->_secondaryString;
        v11 = self->_secondaryString;
        v12 = secondaryString;
        if (v11 == v12)
        {

        }
        else
        {
          v13 = v12;
          if (!v11 || !v12)
          {

            goto LABEL_37;
          }
          v14 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

          if (!v14)
            goto LABEL_37;
        }
        tertiaryString = self->_tertiaryString;
        v16 = v6->_tertiaryString;
        if (tertiaryString && v16)
        {
          if ((-[NSString isEqual:](tertiaryString, "isEqual:") & 1) == 0)
            goto LABEL_37;
        }
        else if (tertiaryString != v16)
        {
          goto LABEL_37;
        }
        badgeString = self->_badgeString;
        v18 = v6->_badgeString;
        if (badgeString && v18)
        {
          if ((-[NSString isEqual:](badgeString, "isEqual:") & 1) == 0)
            goto LABEL_37;
        }
        else if (badgeString != v18)
        {
          goto LABEL_37;
        }
        valueString = self->_valueString;
        v20 = v6->_valueString;
        if (valueString && v20)
        {
          if ((-[NSString isEqual:](valueString, "isEqual:") & 1) == 0)
            goto LABEL_37;
        }
        else if (valueString != v20)
        {
          goto LABEL_37;
        }
        if (self->_destructiveSecondaryString == v6->_destructiveSecondaryString
          && self->_shouldShowDisclosure == v6->_shouldShowDisclosure
          && self->_shouldStrikeValue == v6->_shouldStrikeValue)
        {
          v9 = self->_shouldGrayValue == v6->_shouldGrayValue;
LABEL_38:

          goto LABEL_39;
        }
LABEL_37:
        v9 = 0;
        goto LABEL_38;
      }
    }
    v9 = 0;
  }
LABEL_39:

  return v9;
}

- (NSString)primaryString
{
  return self->_primaryString;
}

- (void)setPrimaryString:(id)a3
{
  objc_storeStrong((id *)&self->_primaryString, a3);
}

- (NSString)secondaryString
{
  return self->_secondaryString;
}

- (void)setSecondaryString:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryString, a3);
}

- (NSString)tertiaryString
{
  return self->_tertiaryString;
}

- (void)setTertiaryString:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryString, a3);
}

- (BOOL)destructiveSecondaryString
{
  return self->_destructiveSecondaryString;
}

- (void)setDestructiveSecondaryString:(BOOL)a3
{
  self->_destructiveSecondaryString = a3;
}

- (NSString)badgeString
{
  return self->_badgeString;
}

- (void)setBadgeString:(id)a3
{
  objc_storeStrong((id *)&self->_badgeString, a3);
}

- (NSString)valueString
{
  return self->_valueString;
}

- (void)setValueString:(id)a3
{
  objc_storeStrong((id *)&self->_valueString, a3);
}

- (BOOL)shouldGrayValue
{
  return self->_shouldGrayValue;
}

- (void)setShouldGrayValue:(BOOL)a3
{
  self->_shouldGrayValue = a3;
}

- (BOOL)shouldStrikeValue
{
  return self->_shouldStrikeValue;
}

- (void)setShouldStrikeValue:(BOOL)a3
{
  self->_shouldStrikeValue = a3;
}

- (BOOL)shouldShowDisclosure
{
  return self->_shouldShowDisclosure;
}

- (void)setShouldShowDisclosure:(BOOL)a3
{
  self->_shouldShowDisclosure = a3;
}

- (NSString)secondaryBadgeSymbol
{
  return self->_secondaryBadgeSymbol;
}

- (void)setSecondaryBadgeSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryBadgeSymbol, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryBadgeSymbol, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_badgeString, 0);
  objc_storeStrong((id *)&self->_tertiaryString, 0);
  objc_storeStrong((id *)&self->_secondaryString, 0);
  objc_storeStrong((id *)&self->_primaryString, 0);
}

@end
