@implementation VKCFormRegion

- (VKCFormRegion)initWithSourceRegion:(id)a3
{
  id v4;
  VKCFormRegion *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  VKCFormRegion *v19;

  v4 = a3;
  v5 = -[VKCFormRegion init](self, "init");
  -[VKCFormRegion setFieldType:](v5, "setFieldType:", objc_msgSend(v4, "fieldType"));
  objc_msgSend(v4, "boundingQuad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vkQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCFormRegion setQuad:](v5, "setQuad:", v7);

  v8 = objc_opt_class();
  VKDynamicCast(v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCFormRegion setContentType:](v5, "setContentType:", objc_msgSend(v9, "textContentType"));
  -[VKCFormRegion setFieldSource:](v5, "setFieldSource:", objc_msgSend(v9, "fieldSource"));
  -[VKCFormRegion setMaxCharacterCount:](v5, "setMaxCharacterCount:", objc_msgSend(v9, "maxCharacterCount"));
  objc_msgSend(v9, "suggestedLineHeight");
  -[VKCFormRegion setSuggestedLineHeight:](v5, "setSuggestedLineHeight:");
  objc_msgSend(v9, "labelRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCFormRegion setLabelText:](v5, "setLabelText:", v11);

  if (!v9)
  {
    -[VKCFormRegion quad](v5, "quad");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "maxHeight");
    -[VKCFormRegion setSuggestedLineHeight:](v5, "setSuggestedLineHeight:");

  }
  objc_msgSend(v4, "contentsWithTypes:", 0x2000);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  if (objc_msgSend(v13, "count"))
  {
    v15 = 0;
    do
    {
      v16 = objc_opt_class();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      VKDynamicCast(v16, (uint64_t)v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[VKCFormRegion initWithSourceRegion:]([VKCFormRegion alloc], "initWithSourceRegion:", v18);
      objc_msgSend(v14, "addObject:", v19);

      ++v15;
    }
    while (objc_msgSend(v13, "count") > v15);
  }
  -[VKCFormRegion setChildren:](v5, "setChildren:", v14);
  -[VKCFormRegion setAutofillNewContextStart:](v5, "setAutofillNewContextStart:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VKCFormRegion setAutofillNewContextStart:](v5, "setAutofillNewContextStart:", objc_msgSend(v9, "autofillNewContextStart"));

  return v5;
}

- (id)crFormFieldWithSize:(CGSize)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x1E0DBECD8]);
  -[VKCFormRegion quad](self, "quad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingBox");
  v6 = (void *)objc_msgSend(v4, "initWithNormalizedBoundingBox:size:");

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBEC88]), "initWithQuad:type:source:value:contentType:maxCharacterCount:", v6, -[VKCFormRegion fieldType](self, "fieldType"), -[VKCFormRegion fieldSource](self, "fieldSource"), &stru_1E94661A8, -[VKCFormRegion contentType](self, "contentType"), -[VKCFormRegion maxCharacterCount](self, "maxCharacterCount"));
  return v7;
}

- (unint64_t)regionType
{
  unint64_t v3;

  v3 = -[VKCFormRegion fieldType](self, "fieldType");
  if (v3 == 2)
    return 3;
  if (v3 != 1)
    return v3 == 0;
  if (-[VKCFormRegion contentType](self, "contentType") == 50)
    return 4;
  return 2;
}

+ (id)autoFillContentTypeForCRContentType:(unint64_t)a3
{
  id *v3;
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 0x12uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x29uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x3CuLL:
    case 0x3DuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
    case 0x41uLL:
      getAFTextContentTypeNone();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      getAFTextContentTypeName();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      getAFTextContentTypeNamePrefix();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      getAFTextContentTypeGivenName();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      getAFTextContentTypeMiddleName();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 6uLL:
      getAFTextContentTypeFamilyName();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 7uLL:
      getAFTextContentTypeNameSuffix();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 8uLL:
      getAFTextContentTypeNickname();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 9uLL:
      getAFTextContentTypeJobTitle();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xAuLL:
      getAFTextContentTypeOrganizationName();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xBuLL:
      getAFTextContentTypeLocation();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xCuLL:
      getAFTextContentTypeFullStreetAddress();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xDuLL:
      getAFTextContentTypeStreetAddressLine1();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xEuLL:
      getAFTextContentTypeStreetAddressLine2();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xFuLL:
      getAFTextContentTypeAddressCity();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x10uLL:
      getAFTextContentTypeAddressState();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x11uLL:
      getAFTextContentTypeAddressCityAndState();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x13uLL:
      getAFTextContentTypeCountryName();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x14uLL:
      getAFTextContentTypePostalCode();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x15uLL:
      getAFTextContentTypeEmailAddress();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x16uLL:
      getAFTextContentTypeURL();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x17uLL:
      getAFTextContentTypePassword();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x18uLL:
      getAFTextContentTypeCreditCardName();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x19uLL:
      getAFTextContentTypeCreditCardGivenName();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1AuLL:
      getAFTextContentTypeCreditCardMiddleName();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1BuLL:
      getAFTextContentTypeCreditCardFamilyName();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1CuLL:
      getAFTextContentTypeCreditCardNumber();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1DuLL:
      getAFTextContentTypeCreditCardExpiration();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1EuLL:
      getAFTextContentTypeCreditCardExpirationMonth();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1FuLL:
      getAFTextContentTypeCreditCardExpirationYear();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x20uLL:
      getAFTextContentTypeCreditCardSecurityCode();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x21uLL:
      getAFTextContentTypeCreditCardType();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x25uLL:
      getAFTextContentTypeBirthdate();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x26uLL:
      getAFTextContentTypeBirthdateDay();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x27uLL:
      getAFTextContentTypeBirthdateMonth();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x28uLL:
      getAFTextContentTypeBirthdateYear();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x2AuLL:
      getAFTextContentTypeTelephoneNumber();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x2BuLL:
      getAFTextContentTypeTelephoneCountryCode();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x2CuLL:
      getAFTextContentTypeTelephoneNationalNumber();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x2DuLL:
      getAFTextContentTypeTelephoneAreaCode();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
      goto LABEL_7;
    case 0x31uLL:
      getAFTextContentTypeTelephoneExtension();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
      v8 = 0;
      v9 = &v8;
      v10 = 0x2020000000;
      v3 = (id *)getAFTextContentTypeDateTimeSymbolLoc_ptr;
      v11 = getAFTextContentTypeDateTimeSymbolLoc_ptr;
      if (!getAFTextContentTypeDateTimeSymbolLoc_ptr)
      {
        v4 = (void *)AutoFillCoreLibrary();
        v3 = (id *)dlsym(v4, "AFTextContentTypeDateTime");
        v9[3] = (uint64_t)v3;
        getAFTextContentTypeDateTimeSymbolLoc_ptr = (uint64_t)v3;
      }
      _Block_object_dispose(&v8, 8);
      if (!v3)
      {
        getkDDRVInteractionDidFinishNotification_cold_1();
LABEL_7:
        v8 = 0;
        v9 = &v8;
        v10 = 0x2020000000;
        v3 = (id *)getAFTextContentTypeTelephoneLocalNumberSymbolLoc_ptr;
        v11 = getAFTextContentTypeTelephoneLocalNumberSymbolLoc_ptr;
        if (!getAFTextContentTypeTelephoneLocalNumberSymbolLoc_ptr)
        {
          v5 = (void *)AutoFillCoreLibrary();
          v3 = (id *)dlsym(v5, "AFTextContentTypeTelephoneLocalNumber");
          v9[3] = (uint64_t)v3;
          getAFTextContentTypeTelephoneLocalNumberSymbolLoc_ptr = (uint64_t)v3;
        }
        _Block_object_dispose(&v8, 8);
        if (!v3)
        {
          v7 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
          _Block_object_dispose(&v8, 8);
          _Unwind_Resume(v7);
        }
      }
      a1 = *v3;
      break;
    default:
      return a1;
  }
  return a1;
}

- (NSString)autoFillContentType
{
  return (NSString *)+[VKCFormRegion autoFillContentTypeForCRContentType:](VKCFormRegion, "autoFillContentTypeForCRContentType:", self->_contentType);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v25;
  unint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[VKCFormRegion autoFillContentType](self, "autoFillContentType");
  v4 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0CB3940];
  v26 = -[VKCFormRegion regionType](self, "regionType");
  v5 = -[VKCFormRegion fieldSource](self, "fieldSource");
  v6 = -[VKCFormRegion contentType](self, "contentType");
  v7 = -[VKCFormRegion maxCharacterCount](self, "maxCharacterCount");
  if (v7 == -1)
  {
    v8 = CFSTR("uint_max");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[VKCFormRegion maxCharacterCount](self, "maxCharacterCount"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[VKCFormRegion suggestedLineHeight](self, "suggestedLineHeight");
  v10 = v9;
  v11 = -[VKCFormRegion autofillNewContextStart](self, "autofillNewContextStart");
  -[VKCFormRegion children](self, "children");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v11;
  v13 = (void *)v4;
  objc_msgSend(v27, "stringWithFormat:", CFSTR("[VKCFormRegion] regionType:%lu source:%lu contentType:%lu autoFillType:%@, maxCharacterCount:%@ suggestedLineHeight:%lf autofillNewContextStart:%d #children:%lu"), v26, v5, v6, v4, v8, v10, v25, objc_msgSend(v12, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  if (v7 != -1)
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[VKCFormRegion children](self, "children");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "debugDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("- %@"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v22);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v17);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (unint64_t)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(unint64_t)a3
{
  self->_fieldType = a3;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (unint64_t)fieldSource
{
  return self->_fieldSource;
}

- (void)setFieldSource:(unint64_t)a3
{
  self->_fieldSource = a3;
}

- (NSString)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
  objc_storeStrong((id *)&self->_labelText, a3);
}

- (BOOL)autofillNewContextStart
{
  return self->_autofillNewContextStart;
}

- (void)setAutofillNewContextStart:(BOOL)a3
{
  self->_autofillNewContextStart = a3;
}

- (int64_t)maxCharacterCount
{
  return self->_maxCharacterCount;
}

- (void)setMaxCharacterCount:(int64_t)a3
{
  self->_maxCharacterCount = a3;
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
  objc_storeStrong((id *)&self->_quad, a3);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (double)suggestedLineHeight
{
  return self->_suggestedLineHeight;
}

- (void)setSuggestedLineHeight:(double)a3
{
  self->_suggestedLineHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
}

@end
