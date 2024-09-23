@implementation WBSCreditCardFormatter

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[WBSCreditCardFormatter _formattedStringForNormalizedNumber:showCreditCardNumber:showLastFourDigits:isVirtualCard:](WBSCreditCardFormatter, "_formattedStringForNormalizedNumber:showCreditCardNumber:showLastFourDigits:isVirtualCard:", v4, -[WBSCreditCardFormatter showCreditCardNumber](self, "showCreditCardNumber"), -[WBSCreditCardFormatter showLastFourDigits](self, "showLastFourDigits"), -[WBSCreditCardFormatter isVirtualCard](self, "isVirtualCard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v7;
  void *v8;
  BOOL v9;

  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    WBSNormalizedCreditCardNumber();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (-[WBSCreditCardFormatter allowsUnknownCardTypes](self, "allowsUnknownCardTypes")
       || WBSCreditCardTypeFromNumber()))
    {
      if (a3)
        *a3 = objc_retainAutorelease(v8);
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = a3;
  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    WBSNormalizedCreditCardNumber();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a4)
      {
        +[WBSCreditCardFormatter _formattedStringForNormalizedNumber:showCreditCardNumber:showLastFourDigits:isVirtualCard:](WBSCreditCardFormatter, "_formattedStringForNormalizedNumber:showCreditCardNumber:showLastFourDigits:isVirtualCard:", v9, 1, -[WBSCreditCardFormatter showLastFourDigits](self, "showLastFourDigits"), -[WBSCreditCardFormatter isVirtualCard](self, "isVirtualCard"));
        v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
        *a4 = v10;
      }
    }
    else if (a4)
    {
      v10 = 0;
      goto LABEL_7;
    }

  }
  return v8 == 0;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSUInteger v19;

  length = a6.length;
  location = a6.location;
  v12 = a5;
  v13 = objc_msgSend(*a3, "length");
  if (v13)
  {
    WBSNormalizedCreditCardNumber();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = -[WBSCreditCardFormatter _normalizedSelectionRangeForFormattedCreditCardNumber:withOriginalSelectionRange:](self, "_normalizedSelectionRangeForFormattedCreditCardNumber:withOriginalSelectionRange:", *a3, a4->location, a4->length);
      v17 = v16;
      +[WBSCreditCardFormatter _formattedStringForNormalizedNumber:showCreditCardNumber:showLastFourDigits:isVirtualCard:](WBSCreditCardFormatter, "_formattedStringForNormalizedNumber:showCreditCardNumber:showLastFourDigits:isVirtualCard:", v14, 1, -[WBSCreditCardFormatter showLastFourDigits](self, "showLastFourDigits"), -[WBSCreditCardFormatter isVirtualCard](self, "isVirtualCard"));
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v18;
      a4->location = -[WBSCreditCardFormatter _selectionRangeInFormattedCreditCardNumber:forNormalizedSelectionRange:inNormalizedCreditCardNumber:](self, "_selectionRangeInFormattedCreditCardNumber:forNormalizedSelectionRange:inNormalizedCreditCardNumber:", v18, v15, v17, v14);
      a4->length = v19;

    }
    else
    {
      *a3 = (id)objc_msgSend(v12, "copy");
      a4->location = location;
      a4->length = length;
    }

  }
  return v13 == 0;
}

+ (id)formattedStringForNormalizedNumber:(id)a3 showCreditCardNumber:(BOOL)a4
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  +[WBSCreditCardFormatter _formattedStringForNormalizedNumber:showCreditCardNumber:showLastFourDigits:isVirtualCard:](WBSCreditCardFormatter, "_formattedStringForNormalizedNumber:showCreditCardNumber:showLastFourDigits:isVirtualCard:", a3, a4, 0, 0);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E4B40D18;
  v6 = v4;

  return v6;
}

+ (id)_formattedStringForNormalizedNumber:(id)a3 showCreditCardNumber:(BOOL)a4 showLastFourDigits:(BOOL)a5 isVirtualCard:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t i;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(uint64_t, NSUInteger, NSUInteger);
  void *v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = objc_msgSend(v9, "length");
  if (!v10)
  {
    v13 = 0;
    goto LABEL_24;
  }
  v11 = v10 - 4;
  if (v10 > 4 || !v6 || a4)
  {
    if (v7)
    {
      if (v10 > 3)
      {
        v14 = 4;
      }
      else
      {
        v11 = 0;
        v14 = v10;
      }
    }
    else
    {
      v14 = 0;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __116__WBSCreditCardFormatter__formattedStringForNormalizedNumber_showCreditCardNumber_showLastFourDigits_isVirtualCard___block_invoke;
    v32 = &unk_1E4B385D0;
    v37 = a4;
    v34 = v10;
    v35 = v11;
    v36 = v14;
    v15 = v9;
    v33 = v15;
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](&v29);
    v17 = WBSCreditCardTypeFromNumberAllowingPartialMatch();
    if (v17 == 4)
    {
      if (objc_msgSend(v15, "length") == 14)
      {
        v18 = (void *)MEMORY[0x1E0C99D20];
        v16[2](v16, 0, 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, 4, 6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, 10, 4);
        goto LABEL_17;
      }
    }
    else if (v17 == 3)
    {
      v18 = (void *)MEMORY[0x1E0C99D20];
      v16[2](v16, 0, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, 4, 6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, 10, 5);
LABEL_17:
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayWithObjects:", v19, v20, v21, 0, v29, v30, v31, v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR(" "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v15, "length");
    if (v23)
    {
      v24 = v23;
      for (i = 0; i < v24; i += 4)
      {
        v16[2](v16, i, 4);
        v26 = objc_claimAutoreleasedReturnValue();
        if (!v26)
          break;
        v27 = (void *)v26;
        objc_msgSend(v19, "addObject:", v26);

      }
    }
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(" "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  objc_msgSend(CFSTR("•••• •••• •••• ••••"), "substringToIndex:", objc_msgSend(CFSTR("•••• •••• •••• ••••"), "length") - v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v13;
}

id __116__WBSCreditCardFormatter__formattedStringForNormalizedNumber_showCreditCardNumber_showLastFourDigits_isVirtualCard___block_invoke(uint64_t a1, NSUInteger a2, NSUInteger a3)
{
  NSUInteger v3;
  NSUInteger v6;
  NSUInteger v7;
  id v8;
  NSUInteger v10;
  void *v11;
  NSRange v12;
  void *v13;
  NSRange v14;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3 <= a2)
  {
    v8 = 0;
  }
  else
  {
    if (a2 + a3 <= v3)
      v6 = a3;
    else
      v6 = v3 - a2;
    if (*(_BYTE *)(a1 + 64) || (v7 = *(_QWORD *)(a1 + 48), v7 < a2))
    {
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 >= v6 + a2)
        v10 = v6;
      else
        v10 = v7 - a2;
      objc_msgSend(&stru_1E4B40D18, "stringByPaddingToLength:withString:startingAtIndex:", v10, CFSTR("•"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14.location = a2;
      v14.length = v6;
      v12 = NSIntersectionRange(v14, *(NSRange *)(a1 + 48));
      if (v12.length)
      {
        objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v12.location, v12.length);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingString:", v13);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = v11;
      }

    }
  }
  return v8;
}

- (_NSRange)_normalizedSelectionRangeForFormattedCreditCardNumber:(id)a3 withOriginalSelectionRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  NSUInteger v7;
  void *v8;
  NSUInteger v9;
  NSUInteger v10;
  int v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v7 = location + length;
  WBSAllowedCreditCardNumberSeparatorCharacters();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (location + length)
  {
    v9 = 0;
    v10 = location;
    do
    {
      v11 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", v9));
      v12 = length - 1;
      v13 = v10 - 1;
      if (v9 > location)
        v13 = v10;
      else
        v12 = length;
      if (v11)
      {
        length = v12;
        v10 = v13;
      }
      ++v9;
    }
    while (v7 != v9);
  }
  else
  {
    v10 = location;
  }

  v14 = v10;
  v15 = length;
  result.length = v15;
  result.location = v14;
  return result;
}

- (_NSRange)_selectionRangeInFormattedCreditCardNumber:(id)a3 forNormalizedSelectionRange:(_NSRange)a4 inNormalizedCreditCardNumber:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  _QWORD v21[4];
  _NSRange result;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  if (location == objc_msgSend(v9, "length"))
  {
    v10 = objc_msgSend(v8, "length");
    v11 = 0;
  }
  else
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3010000000;
    v19 = &unk_1A3FCC9DF;
    v20 = xmmword_1A3F5BAA0;
    v12 = objc_msgSend(v8, "length");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __126__WBSCreditCardFormatter__selectionRangeInFormattedCreditCardNumber_forNormalizedSelectionRange_inNormalizedCreditCardNumber___block_invoke;
    v15[3] = &unk_1E4B385F8;
    v15[4] = v21;
    v15[5] = &v16;
    v15[6] = location;
    v15[7] = length;
    objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v12, 515, v15);
    v10 = v17[4];
    v11 = v17[5];
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(v21, 8);
  }

  v13 = v10;
  v14 = v11;
  result.length = v14;
  result.location = v13;
  return result;
}

_QWORD *__126__WBSCreditCardFormatter__selectionRangeInFormattedCreditCardNumber_forNormalizedSelectionRange_inNormalizedCreditCardNumber___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v7 = *(_QWORD *)(result[4] + 8);
  v8 = *(_QWORD *)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v8 + a4;
  v9 = *(_QWORD *)(result[5] + 8);
  if (*(_QWORD *)(v9 + 32) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = result[6];
    if (v10 > *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24))
      return result;
    *(_QWORD *)(v9 + 32) = a3 - v8 + v10;
  }
  v11 = result[7] + result[6];
  if (v11 <= *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 40) = a3
                                                     + v11
                                                     - (v8
                                                      + *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 32));
    *a7 = 1;
  }
  return result;
}

- (BOOL)showLastFourDigits
{
  return self->_showLastFourDigits;
}

- (void)setShowLastFourDigits:(BOOL)a3
{
  self->_showLastFourDigits = a3;
}

- (BOOL)showCreditCardNumber
{
  return self->_showCreditCardNumber;
}

- (void)setShowCreditCardNumber:(BOOL)a3
{
  self->_showCreditCardNumber = a3;
}

- (BOOL)allowsUnknownCardTypes
{
  return self->_allowsUnknownCardTypes;
}

- (void)setAllowsUnknownCardTypes:(BOOL)a3
{
  self->_allowsUnknownCardTypes = a3;
}

- (BOOL)isVirtualCard
{
  return self->_isVirtualCard;
}

- (void)setIsVirtualCard:(BOOL)a3
{
  self->_isVirtualCard = a3;
}

@end
