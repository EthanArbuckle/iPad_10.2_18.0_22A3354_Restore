@implementation SPRReadParameters

- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12 transactionId:(id)a13 preferredSchemes:(id)a14
{
  NSArray *v18;
  NSData *v19;
  NSData *v20;
  NSData *v21;
  NSString *v22;
  NSString *v23;
  NSArray *v24;
  NSArray *vasRequests;
  __int128 v26;
  NSData *currencyCode;
  NSData *v28;
  NSData *merchantCategoryCode;
  NSData *v30;
  NSData *interfaceDeviceSerial;
  NSData *v32;
  NSString *kernelToken;
  NSString *v34;
  NSString *transactionId;
  NSString *v36;
  NSArray *preferredSchemes;
  NSArray *v41;

  v18 = (NSArray *)a4;
  v19 = (NSData *)a6;
  v20 = (NSData *)a8;
  v21 = (NSData *)a9;
  v22 = (NSString *)a10;
  v23 = (NSString *)a13;
  v24 = (NSArray *)a14;
  vasRequests = self->_vasRequests;
  self->_mode = a3;
  self->_vasRequests = v18;
  v41 = v18;

  v26 = *(_OWORD *)a5;
  *(_DWORD *)&self->_amount._mantissa[6] = *(_DWORD *)&a5->var5[6];
  *(_OWORD *)&self->_amount = v26;
  currencyCode = self->_currencyCode;
  self->_currencyCode = v19;
  v28 = v19;

  self->_transactionType = a7;
  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v20;
  v30 = v20;

  interfaceDeviceSerial = self->_interfaceDeviceSerial;
  self->_interfaceDeviceSerial = v21;
  v32 = v21;

  kernelToken = self->_kernelToken;
  self->_kernelToken = v22;
  v34 = v22;

  self->_timeoutReadPay = a11;
  self->_timeoutReadVas = a12;
  transactionId = self->_transactionId;
  self->_transactionId = v23;
  v36 = v23;

  preferredSchemes = self->_preferredSchemes;
  self->_preferredSchemes = v24;

  return self;
}

- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12 transactionId:(id)a13
{
  $2F068FC02377E22BA03580A8162C781E v14;

  v14 = *a5;
  return (SPRReadParameters *)objc_msgSend_initWithMode_vasRequests_amount_currencyCode_transactionType_merchantCategoryCode_interfaceDeviceSerial_kernelToken_timeoutReadPay_timeoutReadVas_transactionId_preferredSchemes_(self, a2, a3, (uint64_t)a4, (uint64_t)&v14, (uint64_t)a6, a7, a8, a9, a10, a11, a12, a13, 0);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  __int128 amount;
  int v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_count(self->_vasRequests, a2, v2, v3, v4, v5))
  {
    objc_msgSend_componentsJoinedByString_(self->_vasRequests, v7, (uint64_t)CFSTR(" "), v8, v9, v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("empty");
  }
  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  v21 = (void *)objc_msgSend_initWithData_encoding_(v12, v13, (uint64_t)self->_interfaceDeviceSerial, 1, v14, v15);
  if (!v21)
  {
    objc_msgSend_asHexString(self->_interfaceDeviceSerial, v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend_count(self->_preferredSchemes, v16, v17, v18, v19, v20))
  {
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v26 = self->_preferredSchemes;
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v76, (uint64_t)v80, 16, v28);
    if (v29)
    {
      v35 = v29;
      v36 = *(_QWORD *)v77;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v77 != v36)
            objc_enumerationMutation(v26);
          objc_msgSend_asHexString(*(void **)(*((_QWORD *)&v76 + 1) + 8 * v37), v30, v31, v32, v33, v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(0, v39, (uint64_t)v38, v40, v41, v42);

          objc_msgSend_appendString_(0, v43, (uint64_t)CFSTR(", "), v44, v45, v46);
          ++v37;
        }
        while (v35 != v37);
        v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v30, (uint64_t)&v76, (uint64_t)v80, 16, v34);
      }
      while (v35);
    }

    v47 = 0;
  }
  else
  {
    objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v22, (uint64_t)CFSTR("empty"), v23, v24, v25);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)MEMORY[0x24BDD17C8];
  SPRReaderModeCopyDescription(self->_mode);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  amount = (__int128)self->_amount;
  v75 = *(_DWORD *)&self->_amount._mantissa[6];
  objc_msgSend_decimalNumberWithDecimal_(MEMORY[0x24BDD1518], v50, (uint64_t)&amount, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asHexString(self->_currencyCode, v55, v56, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  SPRTransactionTypeCopyDescription(self->_transactionType);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asHexString(self->_merchantCategoryCode, v62, v63, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v48, v68, (uint64_t)CFSTR("{mode=%@, vasRequests=%@, amount=%@, currencyCode=%@, transactionType=%@, merchantCategoryCode=%@, interfaceDeviceSerial=%@, timeoutReadPay=%ld, timeoutReadVas=%ld, transactionId=%@, preferredSchemes=%@}"), v69, v70, v71, v49, v11, v54, v60, v61, v67, v21, self->_timeoutReadPay, self->_timeoutReadVas, self->_transactionId, v47);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  return v72;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRReadParameters)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  NSArray *vasRequests;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSData *v30;
  NSData *currencyCode;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSData *v40;
  NSData *merchantCategoryCode;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSData *v46;
  NSData *interfaceDeviceSerial;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  NSString *v52;
  NSString *kernelToken;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  NSString *v66;
  NSString *transactionId;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  NSData *v72;
  NSData *schemePreference;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  NSArray *v85;
  NSArray *preferredSchemes;
  __int128 v88;
  int v89;

  v4 = a3;
  self->_mode = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("mode"), v6, v7, v8);
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend_setWithObjects_(v9, v12, v10, v13, v14, v15, v11, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("vasRequests"), v18, v19);
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  vasRequests = self->_vasRequests;
  self->_vasRequests = v20;

  if (v4)
  {
    objc_msgSend_decodeDecimalForKey_(v4, v22, (uint64_t)CFSTR("amount"), v23, v24, v25);
  }
  else
  {
    v88 = 0uLL;
    v89 = 0;
  }
  *(_OWORD *)&self->_amount = v88;
  *(_DWORD *)&self->_amount._mantissa[6] = v89;
  v26 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("currencyCode"), v28, v29);
  v30 = (NSData *)objc_claimAutoreleasedReturnValue();
  currencyCode = self->_currencyCode;
  self->_currencyCode = v30;

  self->_transactionType = objc_msgSend_decodeIntegerForKey_(v4, v32, (uint64_t)CFSTR("transactionType"), v33, v34, v35);
  v36 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, (uint64_t)CFSTR("merchantCategoryCode"), v38, v39);
  v40 = (NSData *)objc_claimAutoreleasedReturnValue();
  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v40;

  v42 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, (uint64_t)CFSTR("interfaceDeviceSerial"), v44, v45);
  v46 = (NSData *)objc_claimAutoreleasedReturnValue();
  interfaceDeviceSerial = self->_interfaceDeviceSerial;
  self->_interfaceDeviceSerial = v46;

  v48 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v49, v48, (uint64_t)CFSTR("kernelToken"), v50, v51);
  v52 = (NSString *)objc_claimAutoreleasedReturnValue();
  kernelToken = self->_kernelToken;
  self->_kernelToken = v52;

  self->_timeoutReadPay = objc_msgSend_decodeIntegerForKey_(v4, v54, (uint64_t)CFSTR("timeoutReadPay"), v55, v56, v57);
  self->_timeoutReadVas = objc_msgSend_decodeIntegerForKey_(v4, v58, (uint64_t)CFSTR("timeoutReadVas"), v59, v60, v61);
  v62 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v63, v62, (uint64_t)CFSTR("transactionId"), v64, v65);
  v66 = (NSString *)objc_claimAutoreleasedReturnValue();
  transactionId = self->_transactionId;
  self->_transactionId = v66;

  v68 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v68, (uint64_t)CFSTR("schemePreference"), v70, v71);
  v72 = (NSData *)objc_claimAutoreleasedReturnValue();
  schemePreference = self->_schemePreference;
  self->_schemePreference = v72;

  v74 = (void *)MEMORY[0x24BDBCF20];
  v75 = objc_opt_class();
  v76 = objc_opt_class();
  objc_msgSend_setWithObjects_(v74, v77, v75, v78, v79, v80, v76, 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v82, (uint64_t)v81, (uint64_t)CFSTR("preferredSchemes"), v83, v84);
  v85 = (NSArray *)objc_claimAutoreleasedReturnValue();
  preferredSchemes = self->_preferredSchemes;
  self->_preferredSchemes = v85;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t mode;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  $FCF7D23349B6810E0BB445A99467135A amount;

  mode = self->_mode;
  v5 = a3;
  objc_msgSend_encodeInteger_forKey_(v5, v6, mode, (uint64_t)CFSTR("mode"), v7, v8);
  objc_msgSend_encodeObject_forKey_(v5, v9, (uint64_t)self->_vasRequests, (uint64_t)CFSTR("vasRequests"), v10, v11);
  amount = self->_amount;
  objc_msgSend_encodeDecimal_forKey_(v5, v12, (uint64_t)&amount, (uint64_t)CFSTR("amount"), v13, v14);
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)self->_currencyCode, (uint64_t)CFSTR("currencyCode"), v16, v17);
  objc_msgSend_encodeInteger_forKey_(v5, v18, self->_transactionType, (uint64_t)CFSTR("transactionType"), v19, v20);
  objc_msgSend_encodeObject_forKey_(v5, v21, (uint64_t)self->_merchantCategoryCode, (uint64_t)CFSTR("merchantCategoryCode"), v22, v23);
  objc_msgSend_encodeObject_forKey_(v5, v24, (uint64_t)self->_interfaceDeviceSerial, (uint64_t)CFSTR("interfaceDeviceSerial"), v25, v26);
  objc_msgSend_encodeObject_forKey_(v5, v27, (uint64_t)self->_kernelToken, (uint64_t)CFSTR("kernelToken"), v28, v29);
  objc_msgSend_encodeInteger_forKey_(v5, v30, self->_timeoutReadPay, (uint64_t)CFSTR("timeoutReadPay"), v31, v32);
  objc_msgSend_encodeInteger_forKey_(v5, v33, self->_timeoutReadVas, (uint64_t)CFSTR("timeoutReadVas"), v34, v35);
  objc_msgSend_encodeObject_forKey_(v5, v36, (uint64_t)self->_transactionId, (uint64_t)CFSTR("transactionId"), v37, v38);
  objc_msgSend_encodeObject_forKey_(v5, v39, (uint64_t)self->_schemePreference, (uint64_t)CFSTR("schemePreference"), v40, v41);
  objc_msgSend_encodeObject_forKey_(v5, v42, (uint64_t)self->_preferredSchemes, (uint64_t)CFSTR("preferredSchemes"), v43, v44);

}

- (NSArray)vasProtocol
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDBCEB8];
  v8 = objc_msgSend_count(self->_vasRequests, a2, v2, v3, v4, v5);
  objc_msgSend_arrayWithCapacity_(v7, v9, v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = self->_vasRequests;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v36, 16, v16);
  if (v17)
  {
    v23 = v17;
    v24 = *(_QWORD *)v33;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v14);
        objc_msgSend_vasTerminalProtocol(*(void **)(*((_QWORD *)&v32 + 1) + 8 * v25), v18, v19, v20, v21, v22, (_QWORD)v32);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v13, v27, (uint64_t)v26, v28, v29, v30);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, (uint64_t)&v32, (uint64_t)v36, 16, v22);
    }
    while (v23);
  }

  return (NSArray *)v13;
}

- (NSArray)vasPasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDBCEB8];
  v8 = objc_msgSend_count(self->_vasRequests, a2, v2, v3, v4, v5);
  objc_msgSend_arrayWithCapacity_(v7, v9, v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = self->_vasRequests;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v36, 16, v16);
  if (v17)
  {
    v23 = v17;
    v24 = *(_QWORD *)v33;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v14);
        objc_msgSend_merchantId(*(void **)(*((_QWORD *)&v32 + 1) + 8 * v25), v18, v19, v20, v21, v22, (_QWORD)v32);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v13, v27, (uint64_t)v26, v28, v29, v30);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, (uint64_t)&v32, (uint64_t)v36, 16, v22);
    }
    while (v23);
  }

  return (NSArray *)v13;
}

- (NSArray)urls
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDBCEB8];
  v8 = objc_msgSend_count(self->_vasRequests, a2, v2, v3, v4, v5);
  objc_msgSend_arrayWithCapacity_(v7, v9, v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = self->_vasRequests;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v36, 16, v16);
  if (v17)
  {
    v23 = v17;
    v24 = *(_QWORD *)v33;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v14);
        objc_msgSend_vasUrl(*(void **)(*((_QWORD *)&v32 + 1) + 8 * v25), v18, v19, v20, v21, v22, (_QWORD)v32);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v13, v27, (uint64_t)v26, v28, v29, v30);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, (uint64_t)&v32, (uint64_t)v36, 16, v22);
    }
    while (v23);
  }

  return (NSArray *)v13;
}

- (SPRReadParameters)initWithMode:(int64_t)a3 vasPasses:(id)a4 urls:(id)a5 amount:(id *)a6 currencyCode:(id)a7 transactionType:(unsigned __int8)a8 merchantCategoryCode:(id)a9 interfaceDeviceSerial:(id)a10 kernelToken:(id)a11 timeoutReadPay:(int64_t)a12 timeoutReadVas:(int64_t)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  SPRReadParameters *Vas_transactionId_schemePreference;
  unsigned int v39;
  $2F068FC02377E22BA03580A8162C781E v40;

  v39 = a8;
  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a7;
  sub_21596E204(a4, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(MEMORY[0x24BDD1880], v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = *a6;
  Vas_transactionId_schemePreference = (SPRReadParameters *)objc_msgSend_initWithMode_vasRequests_amount_currencyCode_transactionType_merchantCategoryCode_interfaceDeviceSerial_kernelToken_timeoutReadPay_timeoutReadVas_transactionId_schemePreference_(self, v34, a3, (uint64_t)v21, (uint64_t)&v40, (uint64_t)v20, v39, v19, v18, v17, a12, a13, v33, 0);

  return Vas_transactionId_schemePreference;
}

- (SPRReadParameters)initWithMode:(int64_t)a3 vasPasses:(id)a4 urls:(id)a5 amount:(id *)a6 currencyCode:(id)a7 transactionType:(unsigned __int8)a8 merchantCategoryCode:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  SPRReadParameters *Vas_transactionId_schemePreference;
  unsigned int v38;
  $2F068FC02377E22BA03580A8162C781E v39;

  v38 = a8;
  v16 = a10;
  v17 = a9;
  v18 = a7;
  sub_21596E204(a4, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_opt_new();
  objc_msgSend_UUID(MEMORY[0x24BDD1880], v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v26, v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *a6;
  Vas_transactionId_schemePreference = (SPRReadParameters *)objc_msgSend_initWithMode_vasRequests_amount_currencyCode_transactionType_merchantCategoryCode_interfaceDeviceSerial_kernelToken_timeoutReadPay_timeoutReadVas_transactionId_schemePreference_(self, v33, a3, (uint64_t)v19, (uint64_t)&v39, (uint64_t)v18, v38, v17, v20, v16, a11, a12, v32, 0);

  return Vas_transactionId_schemePreference;
}

- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  SPRReadParameters *Vas_transactionId_schemePreference;
  unsigned int v39;
  $2F068FC02377E22BA03580A8162C781E v40;

  v39 = a7;
  v16 = (void *)MEMORY[0x24BDD1880];
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a6;
  v21 = a4;
  objc_msgSend_UUID(v16, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v27, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = *a5;
  Vas_transactionId_schemePreference = (SPRReadParameters *)objc_msgSend_initWithMode_vasRequests_amount_currencyCode_transactionType_merchantCategoryCode_interfaceDeviceSerial_kernelToken_timeoutReadPay_timeoutReadVas_transactionId_schemePreference_(self, v34, a3, (uint64_t)v21, (uint64_t)&v40, (uint64_t)v20, v39, v19, v18, v17, a11, a12, v33, 0);

  return Vas_transactionId_schemePreference;
}

- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12 transactionId:(id)a13 schemePreference:(id)a14
{
  NSArray *v19;
  NSData *v20;
  NSData *v21;
  NSData *v22;
  NSString *v23;
  NSString *v24;
  NSArray *vasRequests;
  id v26;
  __int128 v27;
  NSData *currencyCode;
  NSData *v29;
  NSData *merchantCategoryCode;
  NSData *v31;
  NSData *interfaceDeviceSerial;
  NSData *v33;
  NSString *kernelToken;
  NSString *v35;
  NSString *transactionId;
  NSString *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSArray *v42;
  NSArray *preferredSchemes;
  NSArray *v46;

  v19 = (NSArray *)a4;
  v20 = (NSData *)a6;
  v21 = (NSData *)a8;
  v22 = (NSData *)a9;
  v23 = (NSString *)a10;
  v24 = (NSString *)a13;
  vasRequests = self->_vasRequests;
  self->_mode = a3;
  self->_vasRequests = v19;
  v46 = v19;
  v26 = a14;

  v27 = *(_OWORD *)a5;
  *(_DWORD *)&self->_amount._mantissa[6] = *(_DWORD *)&a5->var5[6];
  *(_OWORD *)&self->_amount = v27;
  currencyCode = self->_currencyCode;
  self->_currencyCode = v20;
  v29 = v20;

  self->_transactionType = a7;
  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v21;
  v31 = v21;

  interfaceDeviceSerial = self->_interfaceDeviceSerial;
  self->_interfaceDeviceSerial = v22;
  v33 = v22;

  kernelToken = self->_kernelToken;
  self->_kernelToken = v23;
  v35 = v23;

  self->_timeoutReadPay = a11;
  self->_timeoutReadVas = a12;
  transactionId = self->_transactionId;
  self->_transactionId = v24;
  v37 = v24;

  objc_msgSend_arrayWithObjects_(MEMORY[0x24BDBCE30], v38, (uint64_t)v26, v39, v40, v41, 0);
  v42 = (NSArray *)objc_claimAutoreleasedReturnValue();

  preferredSchemes = self->_preferredSchemes;
  self->_preferredSchemes = v42;

  return self;
}

- (int64_t)mode
{
  return self->_mode;
}

- (NSArray)vasRequests
{
  return self->_vasRequests;
}

- ($2F068FC02377E22BA03580A8162C781E)amount
{
  *($FCF7D23349B6810E0BB445A99467135A *)retstr = *($FCF7D23349B6810E0BB445A99467135A *)((char *)self + 104);
  return self;
}

- (NSData)currencyCode
{
  return self->_currencyCode;
}

- (unsigned)transactionType
{
  return self->_transactionType;
}

- (NSData)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (NSData)interfaceDeviceSerial
{
  return self->_interfaceDeviceSerial;
}

- (NSString)kernelToken
{
  return self->_kernelToken;
}

- (int64_t)timeoutReadPay
{
  return self->_timeoutReadPay;
}

- (int64_t)timeoutReadVas
{
  return self->_timeoutReadVas;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (NSData)schemePreference
{
  return self->_schemePreference;
}

- (NSArray)preferredSchemes
{
  return self->_preferredSchemes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSchemes, 0);
  objc_storeStrong((id *)&self->_schemePreference, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_kernelToken, 0);
  objc_storeStrong((id *)&self->_interfaceDeviceSerial, 0);
  objc_storeStrong((id *)&self->_merchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_vasRequests, 0);
}

@end
