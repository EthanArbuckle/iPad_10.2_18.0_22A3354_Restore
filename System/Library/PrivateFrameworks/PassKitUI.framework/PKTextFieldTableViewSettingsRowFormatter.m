@implementation PKTextFieldTableViewSettingsRowFormatter

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_formatPaddingCharacters);
  v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKTextFieldTableViewSettingsRowFormatter *v4;
  PKTextFieldTableViewSettingsRowFormatter *v5;
  char v6;

  v4 = (PKTextFieldTableViewSettingsRowFormatter *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = PKEqualObjects();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)formattedValueFromInput:(id)a3
{
  return a3;
}

- (id)submissionValueFromFormattedInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(v4, "copy");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PKTextFieldTableViewSettingsRowFormatter formatPaddingCharacters](self, "formatPaddingCharacters", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        v11 = v5;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), &stru_1E3E7D690);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          ++v10;
          v11 = v5;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSSet)formatPaddingCharacters
{
  return self->_formatPaddingCharacters;
}

- (void)setFormatPaddingCharacters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatPaddingCharacters, 0);
}

@end
