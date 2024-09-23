@implementation TTSAUMessagingHost

- (TTSAUMessagingHost)initWithMessageChannel:(id)a3
{
  id v5;
  TTSAUMessagingHost *v6;
  TTSAUMessagingHost *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TTSAUMessagingHost;
  v6 = -[TTSAUMessagingHost init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_channel, a3);
    objc_msgSend__loadProtocolMethods(v7, v8, v9, v10, v11);
  }

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *ArgumentTypeAtIndex;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  id v79;

  v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6, v7, v8);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_methodSignature(v4, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_numberOfArguments(v18, v19, v20, v21, v22);

  if (v23 >= 3)
  {
    objc_msgSend_methodSignature(v4, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_numberOfArguments(v28, v29, v30, v31, v32);

    if (v33 >= 3)
    {
      v34 = 2;
      do
      {
        objc_msgSend_methodSignature(v4, v24, v25, v26, v27);
        v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        ArgumentTypeAtIndex = (const char *)objc_msgSend_getArgumentTypeAtIndex_(v35, v36, v34, v37, v38);

        if (!strcmp(ArgumentTypeAtIndex, "@"))
        {
          v79 = 0;
          objc_msgSend_getArgument_atIndex_(v4, v40, (uint64_t)&v79, v34, v43);
          objc_msgSend_addObject_(v13, v44, (uint64_t)v79, v45, v46);
        }
        ++v34;
        objc_msgSend_methodSignature(v4, v40, v41, v42, v43);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend_numberOfArguments(v47, v48, v49, v50, v51);

      }
      while (v34 < v52);
    }
  }
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v24, v25, v26, v27);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (const char *)objc_msgSend_selector(v4, v54, v55, v56, v57);
  NSStringFromSelector(v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v53, v60, (uint64_t)v59, (uint64_t)CFSTR("TTSMessageChannelMessageSelectorKey"), v61);

  objc_msgSend_setObject_forKeyedSubscript_(v53, v62, (uint64_t)v13, (uint64_t)CFSTR("TTSMessageChannelMessageArgumentsKey"), v63);
  objc_msgSend_channel(self, v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callAudioUnit_(v68, v69, (uint64_t)v53, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v72, v73, (uint64_t)CFSTR("TTSMessageChannelMessageReturnValueKey"), v74, v75);
  v79 = (id)objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    objc_msgSend_setReturnValue_(v4, v76, (uint64_t)&v79, v77, v78);

  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  NSStringFromSelector(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_methods(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_loadProtocolMethods
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *v8;
  NSDictionary *methods;

  v3 = (void *)objc_opt_class();
  objc_msgSend__validSelectorsForProtocol(v3, v4, v5, v6, v7);
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  methods = self->_methods;
  self->_methods = v8;

}

+ (id)_validSelectorsForProtocol
{
  void *v2;
  objc_method_description *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t *p_types;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  unsigned int outCount;

  outCount = 0;
  v2 = &unk_1EE6EC250;
  v3 = protocol_copyMethodDescriptionList((Protocol *)v2, 1, 1, &outCount);
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (outCount)
  {
    v12 = 0;
    p_types = (uint64_t *)&v3->types;
    do
    {
      v14 = (const char *)*(p_types - 1);
      objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v8, *p_types, v9, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v15, (uint64_t)v16, v18);

      ++v12;
      p_types += 2;
    }
    while (v12 < outCount);
  }
  free(v3);

  return v11;
}

- (AUMessageChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (NSDictionary)methods
{
  return self->_methods;
}

- (void)setMethods:(id)a3
{
  objc_storeStrong((id *)&self->_methods, a3);
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (void)setAllowedClasses:(id)a3
{
  objc_storeStrong((id *)&self->_allowedClasses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedClasses, 0);
  objc_storeStrong((id *)&self->_methods, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

@end
