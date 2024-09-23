@implementation PSPhoneNumberSpecifier

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cellObject")))
  {
    objc_msgSend(v6, "editableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

  }
  v9.receiver = self;
  v9.super_class = (Class)PSPhoneNumberSpecifier;
  -[PSSpecifier setProperty:forKey:](&v9, sel_setProperty_forKey_, v6, v7);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  unint64_t length;
  NSUInteger location;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "text");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (location + length <= objc_msgSend(v11, "length"))
  {
    v35 = v10;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v11, "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "length");
    if (v13 - 1 >= 0)
    {
      v14 = v13;
      do
      {
        objc_msgSend(v11, "substringWithRange:", --v14, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(CFSTR("()- /"), "rangeOfString:", v15) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v12, "insertString:atIndex:", v15, 0);
        }
        else if (v14 >= location)
        {
          length = (__PAIR128__(length, v14) - (length + location)) >> 64;
        }
        else
        {
          --location;
        }

      }
      while (v14 > 0);
    }
    objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v16;
    v18 = objc_msgSend(v35, "length");
    -[PSPhoneNumberSpecifier countryCode](self, "countryCode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)PSPNCreateFormattedStringWithCountry((uint64_t)v17, objc_msgSend(v19, "lowercaseString"));

    v21 = 0;
    if (objc_msgSend(v17, "length"))
    {
      v22 = v18 + location;
      if (v18 + location)
      {
        v23 = 0;
        v21 = 0;
        do
        {
          v24 = objc_msgSend(v17, "characterAtIndex:", v23);
          while (v21 < objc_msgSend(v20, "length") && objc_msgSend(v20, "characterAtIndex:", v21) != v24)
            ++v21;
          ++v21;
          ++v23;
        }
        while (v23 < objc_msgSend(v17, "length") && v23 < v22);
      }
    }
    if (!textField_shouldChangeCharactersInRange_replacementString__asciiMaker)
    {
      v25 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      v26 = (void *)textField_shouldChangeCharactersInRange_replacementString__asciiMaker;
      textField_shouldChangeCharactersInRange_replacementString__asciiMaker = (uint64_t)v25;

    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v20, "length"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
    {
      v28 = 0;
      do
      {
        objc_msgSend(v20, "substringWithRange:", v28, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)textField_shouldChangeCharactersInRange_replacementString__asciiMaker, "numberFromString:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          objc_msgSend(v30, "stringValue");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "appendString:", v32);

        }
        else
        {
          objc_msgSend(v27, "appendString:", v29);
        }

        ++v28;
      }
      while (v28 < objc_msgSend(v20, "length"));
    }
    v11 = v27;

    objc_msgSend(v9, "setText:", v11);
    objc_msgSend(v9, "setSelectionRange:", v21, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "postNotificationName:object:", *MEMORY[0x1E0CEBD20], v9);

    v10 = v35;
  }

  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "text");
  -[PSPhoneNumberSpecifier countryCode](self, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)PSPNCreateFormattedStringWithCountry(v5, objc_msgSend(v6, "lowercaseString"));

  objc_msgSend(v4, "setText:", v7);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
