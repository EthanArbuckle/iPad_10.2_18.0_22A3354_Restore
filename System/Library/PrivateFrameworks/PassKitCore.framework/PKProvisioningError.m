@implementation PKProvisioningError

- (PKProvisioningError)init
{

  return 0;
}

- (PKProvisioningError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{

  return 0;
}

- (id)_initWithSeverity:(unint64_t)a3 userInfo:(id)a4
{
  id v6;
  PKProvisioningError *v7;
  PKProvisioningError *v8;
  void *v9;
  id v10;
  NSMutableArray *v11;
  NSMutableArray *internalDebugDescriptions;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKProvisioningError;
  v7 = -[PKProvisioningError initWithDomain:code:userInfo:](&v14, sel_initWithDomain_code_userInfo_, CFSTR("PKProvisioningErrorDomain"), a3, v6);
  v8 = v7;
  if (v7)
  {
    v7->_severity = a3;
    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    v10 = v9;
    if (!v9)
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_storeStrong((id *)&v8->_userInfo, v10);
    if (!v9)

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    internalDebugDescriptions = v8->_internalDebugDescriptions;
    v8->_internalDebugDescriptions = v11;

  }
  return v8;
}

- (id)_initWithSeverity:(unint64_t)a3 localizedTitle:(id)a4 localizedMessage:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v10 = a4;
  v11 = objc_alloc_init(v8);
  v12 = (void *)objc_msgSend(v10, "copy");

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB2D50]);
  v13 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB2D80]);
  v14 = -[PKProvisioningError _initWithSeverity:userInfo:](self, "_initWithSeverity:userInfo:", a3, v11);

  return v14;
}

+ (id)errorWithTitleKey:(id)a3 messageKey:(id)a4 severity:(unint64_t)a5
{
  NSString *v7;
  NSString *v8;
  PKProvisioningError *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = (NSString *)a4;
  v8 = (NSString *)a3;
  v9 = [PKProvisioningError alloc];
  PKLocalizedPaymentString(v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedPaymentString(v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PKProvisioningError _initWithSeverity:localizedTitle:localizedMessage:](v9, "_initWithSeverity:localizedTitle:localizedMessage:", a5, v10, v11);
  return v12;
}

+ (id)errorWithTitle:(id)a3 message:(id)a4 severity:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = -[PKProvisioningError _initWithSeverity:localizedTitle:localizedMessage:]([PKProvisioningError alloc], "_initWithSeverity:localizedTitle:localizedMessage:", a5, v8, v7);

  return v9;
}

+ (id)errorWithCommonType:(unint64_t)a3 severity:(unint64_t)a4
{
  void *v5;
  void *v6;

  PKDisplayableErrorForCommonType(a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKProvisioningError errorWithUnderlyingError:defaultSeverity:](PKProvisioningError, "errorWithUnderlyingError:defaultSeverity:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorWithUnderlyingError:(id)a3 defaultSeverity:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  PKProvisioningError *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  void *v42;
  _QWORD aBlock[4];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v6 = a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__23;
  v62 = __Block_byref_object_dispose__23;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__23;
  v56 = __Block_byref_object_dispose__23;
  v57 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = a4;
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKProvisioningError_errorWithUnderlyingError_defaultSeverity___block_invoke;
  aBlock[3] = &unk_1E2AC9940;
  v9 = v6;
  v44 = v9;
  v45 = &v58;
  v46 = &v52;
  v47 = &v48;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v9, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "code");
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("PKProvisioningErrorDomain")))
  {
    v13 = (id *)objc_msgSend(v9, "copy");
    goto LABEL_25;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("PKDisplayableError")))
  {
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"), 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v59[5];
      v59[5] = v20;

      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"), 0);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v53[5];
      v53[5] = v22;

      v24 = v49;
      v18 = 0;
      if (v12 == -1005)
        v25 = 2;
      else
        v25 = 4;
      goto LABEL_18;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("PKWebServiceErrorDomain")))
    {
      v18 = 0;
      v19 = 1;
      if (v12 > 40455)
      {
        if (((unint64_t)(v12 - 60039) > 0x33 || ((1 << (v12 + 121)) & 0x9100000007FFFLL) == 0)
          && (unint64_t)(v12 - 40456) >= 2
          && (unint64_t)(v12 - 60009) >= 2)
        {
          goto LABEL_20;
        }
LABEL_12:
        v18 = 0;
        v24 = v49;
        v25 = 3;
LABEL_18:
        v24[3] = v25;
LABEL_19:
        v19 = 1;
        goto LABEL_20;
      }
      if (v12 <= 1)
      {
        if (v12)
        {
          if (v12 == 1)
          {
            v18 = 0;
            v19 = 1;
            v49[3] = 1;
          }
          goto LABEL_20;
        }
      }
      else if ((unint64_t)(v12 - 2) >= 4)
      {
        if (v12 != 40107)
          goto LABEL_20;
        goto LABEL_12;
      }
      objc_msgSend(v9, "localizedFailureReason");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_19;
      goto LABEL_40;
    }
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("PKPaymentWebServiceErrorDomain")))
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("PKDisplayableError")))
      {
        v10[2](v10);
LABEL_41:
        v18 = 0;
        goto LABEL_19;
      }
LABEL_40:
      objc_msgSend(v9, "localizedFailureReason");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v59[5];
      v59[5] = v35;

      objc_msgSend(v9, "localizedRecoverySuggestion");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v53[5];
      v53[5] = v37;

      goto LABEL_41;
    }
    objc_msgSend(v9, "localizedFailureReason");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v59[5];
    v59[5] = v26;

    objc_msgSend(v9, "localizedRecoverySuggestion");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v53[5];
    v53[5] = v28;

    v30 = 3;
    if (v12 > 40500)
    {
      switch(v12)
      {
        case 60000:
        case 60001:
        case 60002:
        case 60003:
        case 60005:
        case 60006:
        case 60007:
        case 60008:
        case 60011:
        case 60018:
        case 60022:
        case 60028:
        case 60031:
        case 60032:
        case 60033:
        case 60034:
        case 60035:
        case 60036:
        case 60037:
        case 60057:
        case 60060:
        case 60061:
        case 60066:
        case 60067:
        case 60068:
        case 60075:
        case 60076:
        case 60077:
        case 60078:
        case 60079:
        case 60080:
        case 60084:
        case 60085:
        case 60086:
        case 60088:
        case 60089:
        case 60091:
        case 60103:
        case 60104:
          goto LABEL_16;
        case 60004:
        case 60009:
        case 60010:
        case 60015:
        case 60016:
        case 60017:
        case 60019:
        case 60020:
        case 60021:
        case 60023:
        case 60024:
        case 60025:
        case 60039:
        case 60040:
        case 60041:
        case 60042:
        case 60043:
        case 60044:
        case 60045:
        case 60046:
        case 60047:
        case 60048:
        case 60049:
        case 60050:
        case 60051:
        case 60052:
        case 60053:
        case 60056:
        case 60058:
        case 60059:
        case 60064:
        case 60065:
        case 60069:
        case 60070:
        case 60071:
        case 60083:
        case 60087:
        case 60090:
        case 60093:
          goto LABEL_67;
        case 60012:
        case 60013:
        case 60014:
        case 60026:
        case 60027:
        case 60029:
        case 60030:
        case 60038:
        case 60054:
        case 60055:
        case 60062:
        case 60063:
        case 60092:
          goto LABEL_66;
        case 60072:
        case 60073:
        case 60074:
        case 60081:
        case 60082:
        case 60094:
        case 60095:
        case 60096:
        case 60097:
        case 60098:
        case 60099:
        case 60100:
        case 60101:
        case 60102:
          goto LABEL_68;
        default:
          if (v12 == 40601)
            goto LABEL_16;
          v39 = 40501;
          goto LABEL_65;
      }
    }
    if (v12 > 40307)
    {
      v40 = v12 + 49;
      if ((unint64_t)(v12 - 40399) <= 0x3A)
      {
        if (((1 << v40) & 0x80000001400013) != 0)
          goto LABEL_16;
        if (((1 << v40) & 0x600000000000000) != 0)
          goto LABEL_67;
      }
      if (v12 == 40308)
        goto LABEL_16;
      v41 = 40319;
    }
    else
    {
      if (v12 > 40101)
      {
        if (v12 > 40109)
        {
          if (v12 != 40110)
          {
            if (v12 == 40301)
            {
LABEL_66:
              v30 = 4;
              goto LABEL_67;
            }
            v39 = 40307;
LABEL_65:
            if (v12 != v39)
              goto LABEL_68;
            goto LABEL_66;
          }
        }
        else if ((unint64_t)(v12 - 40106) >= 2)
        {
          v39 = 40102;
          goto LABEL_65;
        }
LABEL_67:
        v49[3] = v30;
        goto LABEL_68;
      }
      if (v12 > 40012)
      {
        if ((unint64_t)(v12 - 40013) < 2)
          goto LABEL_67;
        if (v12 != 40016)
        {
LABEL_68:
          objc_msgSend(v8, "PKNumberForKey:", CFSTR("PKErrorHTTPResponseStatusCodeKey"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v42;
          v19 = v42 == 0;
          if (v42 && objc_msgSend(v42, "integerValue") == 500)
            v49[3] = 5;
          if (!v59[5])
            v10[2](v10);
          goto LABEL_20;
        }
LABEL_16:
        v30 = 5;
        goto LABEL_67;
      }
      if (!v12)
        goto LABEL_16;
      v41 = 40001;
    }
    if (v12 == v41)
      goto LABEL_67;
    goto LABEL_68;
  }
  PKTitleForDisplayableError(v9);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v59[5];
  v59[5] = v14;

  objc_msgSend(v9, "localizedRecoverySuggestion");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v53[5];
  v53[5] = v16;

  v18 = 0;
  v19 = 0;
LABEL_20:
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v59[5], *MEMORY[0x1E0CB2D50]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v53[5], *MEMORY[0x1E0CB2D80]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CB3388]);
  v31 = [PKProvisioningError alloc];
  v13 = -[PKProvisioningError _initWithSeverity:userInfo:](v31, "_initWithSeverity:userInfo:", v49[3], v8);
  objc_storeStrong(v13 + 9, a3);
  if (v19)
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Underlying(D: %@, Code: %ld)"), v11, v12);
    objc_msgSend(v13, "addInternalDebugDescription:", v32);

  }
  if (v18)
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Received HTTP %@"), v18);
    objc_msgSend(v13, "addInternalDebugDescription:", v33);

  }
LABEL_25:

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  return v13;
}

void __64__PKProvisioningError_errorWithUnderlyingError_defaultSeverity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v12 = 0;
  _PKSharingDisplayableError(*(void **)(a1 + 32), &v12, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    PKTitleForDisplayableError(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    objc_msgSend(v3, "localizedRecoverySuggestion");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v12)
      v11 = 5;
    else
      v11 = *(_QWORD *)(v10 + 24);
    *(_QWORD *)(v10 + 24) = v11;
  }

}

+ (id)errorWithSeverity:(unint64_t)a3
{
  return -[PKProvisioningError _initWithSeverity:userInfo:]([PKProvisioningError alloc], "_initWithSeverity:userInfo:", a3, 0);
}

+ (id)userCancelError
{
  return -[PKProvisioningError _initWithSeverity:userInfo:]([PKProvisioningError alloc], "_initWithSeverity:userInfo:", 1, 0);
}

- (void)addInternalDebugDescription:(id)a3
{
  -[NSMutableArray insertObject:atIndex:](self->_internalDebugDescriptions, "insertObject:atIndex:", a3, 0);
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_userInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("COULD_NOT_SET_UP_TITLE"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

- (void)setLocalizedTitle:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userInfo, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB2D50]);

}

- (NSString)localizedMessage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_userInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D80]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("COULD_NOT_SET_UP_MESSAGE"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (!os_variant_has_internal_ui())
  {
    v10 = v6;
LABEL_15:
    v13 = v10;
    goto LABEL_16;
  }
  v7 = -[NSMutableArray count](self->_internalDebugDescriptions, "count");
  v8 = self->_severity - 1;
  if (!v7)
  {
    if (v8 > 6)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E2AC9960[v8];
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\n[INTERNAL] - %@"), v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v8 > 6)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E2AC9960[v8];
  -[NSMutableArray componentsJoinedByString:](self->_internalDebugDescriptions, "componentsJoinedByString:", CFSTR("\n• "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\n[INTERNAL] - %@ \n• %@"), v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return (NSString *)v13;
}

- (void)setLocalizedMessage:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userInfo, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB2D80]);

}

- (BOOL)hasLocalizedTitleAndMessage
{
  void *v3;
  void *v4;
  BOOL v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_userInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D80]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_userInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSError)displayableError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKProvisioningError localizedTitle](self, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningError localizedMessage](self, "localizedMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningError underlyingError](self, "underlyingError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningError userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustomWithType(-1, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v7;
}

- (NSString)localizedRecoveryDescription
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_userInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D78]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLocalizedRecoveryDescription:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userInfo, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2D78], v7, v8);

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userInfo, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CB2D78]);
    v6 = 0;
  }

}

- (NSURL)recoveryUrl
{
  return (NSURL *)-[NSMutableDictionary objectForKeyedSubscript:](self->_userInfo, "objectForKeyedSubscript:", CFSTR("PKErrorRecoveryURL"));
}

- (void)setRecoveryUrl:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userInfo, "setObject:forKeyedSubscript:", a3, CFSTR("PKErrorRecoveryURL"));
}

- (id)userInfo
{
  return (id)-[NSMutableDictionary copy](self->_userInfo, "copy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = -[PKProvisioningError _initWithSeverity:userInfo:]([PKProvisioningError alloc], "_initWithSeverity:userInfo:", self->_severity, self->_userInfo);
  v5 = -[NSError copy](self->_underlyingError, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSMutableArray mutableCopy](self->_internalDebugDescriptions, "mutableCopy");
  v8 = (void *)v4[6];
  v4[6] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKProvisioningError)initWithCoder:(id)a3
{
  id v4;
  PKProvisioningError *v5;
  uint64_t v6;
  NSError *underlyingError;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *internalDebugDescriptions;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableDictionary *userInfo;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKProvisioningError;
  v5 = -[PKProvisioningError initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("underlyingError"));
    v6 = objc_claimAutoreleasedReturnValue();
    underlyingError = v5->_underlyingError;
    v5->_underlyingError = (NSError *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("severity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_severity = PKProvisioningErrorSeverityFromString(v8);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("internalDebugDescriptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "mutableCopy");
    internalDebugDescriptions = v5->_internalDebugDescriptions;
    v5->_internalDebugDescriptions = (NSMutableArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("userInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "mutableCopy");
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSMutableDictionary *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKProvisioningError;
  -[PKProvisioningError encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_underlyingError, CFSTR("underlyingError"));
  v5 = self->_severity - 1;
  if (v5 > 6)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AC9960[v5];
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("severity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_internalDebugDescriptions, CFSTR("internalDebugDescriptions"));
  v7 = (void *)-[NSMutableDictionary copy](self->_userInfo, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("userInfo"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: "), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_severity - 1;
  if (v7 > 6)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2AC9960[v7];
  objc_msgSend(v6, "appendFormat:", CFSTR("severity: '%@'; "), v8);
  objc_msgSend(v6, "appendFormat:", CFSTR("internalDebugDescriptions: '%@'; "), self->_internalDebugDescriptions);
  objc_msgSend(v6, "appendFormat:", CFSTR("underlyingError: '%@'; "), self->_underlyingError);
  objc_msgSend(v6, "appendFormat:", CFSTR("userInfo: '%@'; "), self->_userInfo);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)severity
{
  return self->_severity;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingError, a3);
}

- (void)setHasLocalizedTitleAndMessage:(BOOL)a3
{
  self->_hasLocalizedTitleAndMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_internalDebugDescriptions, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
