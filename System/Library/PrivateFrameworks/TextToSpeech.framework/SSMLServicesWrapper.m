@implementation SSMLServicesWrapper

- (SSMLServicesWrapper)init
{
  SSMLServicesWrapper *v2;
  uint64_t v3;
  SSMLParserWrapperInternal *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSMLServicesWrapper;
  v2 = -[SSMLServicesWrapper init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    underlyingObject = v2->_underlyingObject;
    v2->_underlyingObject = (SSMLParserWrapperInternal *)v3;

  }
  return v2;
}

- (id)generateSSMLFromString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend_underlyingObject(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_generateSSMLFromString_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)generateSSMLFromPlainTalkString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend_underlyingObject(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_generateSSMLFromPlainTalkString_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)generateSSMLFromAVSpeechUtterance:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend_underlyingObject(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_generateSSMLFromAVSpeechUtterance_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)parseSSMLToPlainText:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend_underlyingObject(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parseSSMLToPlainText_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)parseSSMLToPlainTalk:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend_underlyingObject(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parseSSMLToPlainTalk_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SSMLParserWrapperInternal)underlyingObject
{
  return self->_underlyingObject;
}

- (SSMLRangeConverterInternal)converter
{
  return self->_converter;
}

- (void)setConverter:(id)a3
{
  objc_storeStrong((id *)&self->_converter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_converter, 0);
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

- (id)convertRange:(_NSRange)a3 forSSML:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  char isEqualToString;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  SSMLRangeConverterInternal *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  objc_msgSend_converter(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ssml(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17
    || (objc_msgSend_converter(self, v18, v19, v20, v21),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_ssml(v22, v23, v24, v25, v26),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqualToString = objc_msgSend_isEqualToString_(v27, v28, (uint64_t)v7, v29, v30),
        v27,
        v22,
        (isEqualToString & 1) == 0))
  {
    v36 = [SSMLRangeConverterInternal alloc];
    v40 = (void *)objc_msgSend_initWithSSML_(v36, v37, (uint64_t)v7, v38, v39);
    objc_msgSend_setConverter_(self, v41, (uint64_t)v40, v42, v43);

  }
  objc_msgSend_converter(self, v32, v33, v34, v35);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_plainString(v44, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_converter(self, v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_stringRangeFrom_(v54, v55, location, length, v56);
  v59 = v58;

  if (v57 | v59)
  {
    v60 = (void *)objc_opt_new();
    objc_msgSend_substringWithRange_(v49, v61, v57, v59, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPlainString_(v60, v64, (uint64_t)v63, v65, v66);

    objc_msgSend_setConvertedRange_(v60, v67, v57, v59, v68);
  }
  else
  {
    v60 = 0;
  }

  return v60;
}

@end
