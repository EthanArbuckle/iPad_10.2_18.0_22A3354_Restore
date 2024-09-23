@implementation APOdmlAppVector

- (APOdmlAppVector)initWithVersion:(id)a3 header:(APOdmlAppVectorHeader *)a4 floats:(float *)a5
{
  APOdmlAppVector *v5;
  uint64_t var2;
  APOdmlAppVector *v8;
  APOdmlAppVector *v9;
  NSObject *v10;
  id v11;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v5 = self;
  v16 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    var2 = a4->var2;
    v13.receiver = self;
    v13.super_class = (Class)APOdmlAppVector;
    v8 = -[APOdmlVector initWithVersion:length:floats:](&v13, sel_initWithVersion_length_floats_, a3, var2, a5);
    if (v8)
      v8->_adamID = a4->var0;
    v5 = v8;
    v9 = v5;
  }
  else
  {
    OdmlLogForCategory(2uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = (id)objc_opt_class();
      v11 = v15;
      _os_log_impl(&dword_1B69D6000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Attempt to construct APOdmlAppVector without a header.", buf, 0xCu);

    }
    v9 = 0;
  }

  return v9;
}

- (APOdmlAppVector)initWithString:(id)a3 version:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  unsigned int v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  APOdmlAppVector *v44;
  APOdmlAppVector *v45;
  id v46;
  NSObject *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  id v53;
  unsigned int v55;
  NSObject *v56;
  id v57;
  objc_super v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = a4;
  if (v6)
  {
    objc_msgSend_componentsSeparatedByString_(v6, v7, (uint64_t)CFSTR("\t"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_integerValue(v12, v13, v14);

    if (objc_msgSend_count(v9, v16, v17) == 2)
    {
      v57 = v8;
      v55 = v15;
      if (qword_1EF142B38 != -1)
        dispatch_once(&qword_1EF142B38, &unk_1E6A29760);
      objc_msgSend_objectAtIndex_(v9, v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByTrimmingCharactersInSet_(v19, v23, (uint64_t)v22);
      v24 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v24;
      objc_msgSend_componentsSeparatedByString_(v24, v28, (uint64_t)CFSTR(","));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v29, v30, v31))
      {
        v33 = 0;
        while (1)
        {
          objc_msgSend_objectAtIndex_(v29, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberFromString_((void *)qword_1EF142B30, v35, (uint64_t)v34);
          v36 = objc_claimAutoreleasedReturnValue();
          if (!v36)
            break;
          v39 = (void *)v36;
          objc_msgSend_numberFromString_((void *)qword_1EF142B30, v37, (uint64_t)v34);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v27, v41, (uint64_t)v40);

          if (++v33 >= (unint64_t)objc_msgSend_count(v29, v42, v43))
            goto LABEL_9;
        }
        objc_msgSend_doubleValue(v34, v37, v38);
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v49, (uint64_t)CFSTR("The provided string (%@) for doubleValue %.7lf at index %lu was not able to be converted to a number. Full line:\n%@"), v34, v50, v33, v6);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        OdmlLogForCategory(2uLL);
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v60 = (id)objc_opt_class();
          v61 = 2112;
          v62 = v51;
          v53 = v60;
          _os_log_impl(&dword_1B69D6000, v52, OS_LOG_TYPE_ERROR, "[%@] ERROR: %@", buf, 0x16u);

        }
        APOdmlSimulateCrash(2880291038, v51, 0);

        v45 = 0;
        v8 = v57;
      }
      else
      {
LABEL_9:
        v58.receiver = self;
        v58.super_class = (Class)APOdmlAppVector;
        v8 = v57;
        v44 = -[APOdmlVector initWithVersion:andArray:](&v58, sel_initWithVersion_andArray_, v57, v27);
        if (v44)
          v44->_adamID = v55;
        self = v44;
        v45 = self;
      }
      v47 = v56;

    }
    else
    {
      OdmlLogForCategory(2uLL);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v60 = (id)objc_opt_class();
        v61 = 2112;
        v62 = v6;
        v48 = v60;
        _os_log_impl(&dword_1B69D6000, v47, OS_LOG_TYPE_ERROR, "[%@]: ERROR: The line does not conform to our expectations: %@", buf, 0x16u);

      }
      v45 = 0;
    }

  }
  else
  {
    OdmlLogForCategory(2uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v60 = (id)objc_opt_class();
      v61 = 2112;
      v62 = 0;
      v46 = v60;
      _os_log_impl(&dword_1B69D6000, v9, OS_LOG_TYPE_ERROR, "[%@]: ERROR: nil datastring passed into parser: %@.", buf, 0x16u);

    }
    v45 = 0;
  }

  return v45;
}

- (id)data
{
  uint64_t v2;
  int v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  objc_super v15;
  uint64_t v16;
  int v17;
  int v18;

  v4 = objc_msgSend_length(self, a2, v2);
  objc_msgSend_dataWithCapacity_(MEMORY[0x1E0C99DF0], v5, (4 * v4 + 16));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 1447253074;
  v16 = objc_msgSend_adamID(self, v7, v8);
  v18 = objc_msgSend_length(self, v9, v10);
  objc_msgSend_appendBytes_length_(v6, v11, (uint64_t)&v16, 16);
  v15.receiver = self;
  v15.super_class = (Class)APOdmlAppVector;
  -[APOdmlVector data](&v15, sel_data);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendData_(v6, v13, (uint64_t)v12);

  return v6;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend_arrayOfNumbers(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("adamID");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_msgSend_adamID(self, v6, v7);
  objc_msgSend_stringWithFormat_(v5, v9, (uint64_t)CFSTR("%llu"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("vector");
  v18[0] = v10;
  v18[1] = v4;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v18, v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_description(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unint64_t)adamID
{
  return self->_adamID;
}

@end
