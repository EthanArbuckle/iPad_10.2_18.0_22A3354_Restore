@implementation VUILabelFactory

+ (id)labelWithElement:(id)a3 textLayout:(id)a4 existingLabel:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v7, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "length")
      && objc_msgSend(v13, "isEqualToString:", CFSTR("rentalExpiration"))
      && objc_msgSend(v11, "length")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v11, "doubleValue");
      objc_msgSend(v14, "dateWithTimeIntervalSince1970:", v15 / 1000.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIRentalExpirationLabel labelWithExpirationDate:textLayout:existingLabel:locStringPrefix:](VUIRentalExpirationLabel, "labelWithExpirationDate:textLayout:existingLabel:locStringPrefix:", v16, v8, v9, CFSTR("EXPIRATION_IN"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v11, v8, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "transferLayoutStylesFromElement:", v7);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
