@implementation TTSSynthesisProviderComponentRecord

- (NSArray)voices
{
  return self->_voices;
}

- (TTSSynthesisProviderComponentRecord)initWithCoder:(id)a3
{
  id v4;
  TTSSynthesisProviderComponentRecord *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  TTSSynthesisProviderComponentRecord *v106;
  _DWORD v108[5];
  objc_super v109;

  v4 = a3;
  v109.receiver = self;
  v109.super_class = (Class)TTSSynthesisProviderComponentRecord;
  v5 = -[TTSSynthesisProviderComponentRecord init](&v109, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v10, v7, v11, v12, v8, v9, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v13, (uint64_t)CFSTR("voices"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVoices_(v5, v17, (uint64_t)v16, v18, v19);

    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, (uint64_t)CFSTR("isFirstParty"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_BOOLValue(v23, v24, v25, v26, v27);
    objc_msgSend_setIsFirstParty_(v5, v29, v28, v30, v31);

    v32 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, (uint64_t)CFSTR("bundleIdentifier"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBundleIdentifier_(v5, v36, (uint64_t)v35, v37, v38);

    v39 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, (uint64_t)CFSTR("containerBundleIdentifier"), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainerBundleIdentifier_(v5, v43, (uint64_t)v42, v44, v45);

    v46 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, (uint64_t)CFSTR("version"), v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVersion_(v5, v50, (uint64_t)v49, v51, v52);

    v53 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v54, v53, (uint64_t)CFSTR("parameterCount"), v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParameterCount_(v5, v57, (uint64_t)v56, v58, v59);

    v60 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v61, v60, (uint64_t)CFSTR("auDescType"), v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v56) = objc_msgSend_intValue(v63, v64, v65, v66, v67);

    v68 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v68, (uint64_t)CFSTR("auDescSubType"), v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v63) = objc_msgSend_intValue(v71, v72, v73, v74, v75);

    v76 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v76, (uint64_t)CFSTR("auDescManufacturer"), v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend_intValue(v79, v80, v81, v82, v83);

    v85 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v86, v85, (uint64_t)CFSTR("auDescFlags"), v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend_unsignedIntValue(v88, v89, v90, v91, v92);

    v94 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v95, v94, (uint64_t)CFSTR("auDescFlagsMask"), v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend_unsignedIntValue(v97, v98, v99, v100, v101);

    v108[0] = (_DWORD)v56;
    v108[1] = (_DWORD)v63;
    v108[2] = v84;
    v108[3] = v93;
    v108[4] = v102;
    objc_msgSend_setComponentDescription_(v5, v103, (uint64_t)v108, v104, v105);
    v106 = v5;

  }
  return v5;
}

- (void)setVoices:(id)a3
{
  objc_storeStrong((id *)&self->_voices, a3);
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void)setParameterCount:(id)a3
{
  objc_storeStrong((id *)&self->_parameterCount, a3);
}

- (void)setIsFirstParty:(BOOL)a3
{
  self->_isFirstParty = a3;
}

- (void)setContainerBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerBundleIdentifier, a3);
}

- (void)setComponentDescription:(AudioComponentDescription *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->componentType;
  self->_componentDescription.componentFlagsMask = a3->componentFlagsMask;
  *(_OWORD *)&self->_componentDescription.componentType = v3;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (AudioComponentDescription)componentDescription
{
  *retstr = *(AudioComponentDescription *)((char *)self + 56);
  return self;
}

- (NSNumber)parameterCount
{
  return self->_parameterCount;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t isFirstParty;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;

  v86 = 0;
  v87 = 0;
  v88 = 0;
  v4 = a3;
  objc_msgSend_componentDescription(self, v5, v6, v7, v8);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v9, v86, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("auDescType"), v14);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v15, HIDWORD(v86), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("auDescSubType"), v20);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v21, v87, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v24, (uint64_t)CFSTR("auDescManufacturer"), v26);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v27, HIDWORD(v87), v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)v30, (uint64_t)CFSTR("auDescFlags"), v32);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v33, v88, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v37, (uint64_t)v36, (uint64_t)CFSTR("auDescFlagsMask"), v38);

  objc_msgSend_bundleIdentifier(self, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v43, (uint64_t)CFSTR("bundleIdentifier"), v45);

  objc_msgSend_containerBundleIdentifier(self, v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v51, (uint64_t)v50, (uint64_t)CFSTR("containerBundleIdentifier"), v52);

  objc_msgSend_version(self, v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v58, (uint64_t)v57, (uint64_t)CFSTR("version"), v59);

  v60 = (void *)MEMORY[0x1E0CB37E8];
  isFirstParty = objc_msgSend_isFirstParty(self, v61, v62, v63, v64);
  objc_msgSend_numberWithBool_(v60, v66, isFirstParty, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v70, (uint64_t)v69, (uint64_t)CFSTR("isFirstParty"), v71);

  objc_msgSend_voices(self, v72, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v77, (uint64_t)v76, (uint64_t)CFSTR("voices"), v78);

  objc_msgSend_parameterCount(self, v79, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v84, (uint64_t)v83, (uint64_t)CFSTR("parameterCount"), v85);

}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v20.receiver = self;
  v20.super_class = (Class)TTSSynthesisProviderComponentRecord;
  -[TTSSynthesisProviderComponentRecord description](&v20, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_voices(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("%@ %@ %@"), v16, v17, v4, v9, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)version
{
  return self->_version;
}

- (BOOL)isFirstParty
{
  return self->_isFirstParty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterCount, 0);
  objc_storeStrong((id *)&self->_voices, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
