@implementation TTSAUMessagingAU

- (void)setCallHostBlock:(id)a3
{
  ((void (*)(TTSAUMessagingAU *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_setHostBlock_, a3);
}

- (id)echo:(id)a3
{
  return a3;
}

- (id)callAudioUnit:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  SEL v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("TTSMessageChannelMessageSelectorKey"), v6, v7);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v12
    && (objc_msgSend__validSelectorsForProtocol(TTSAUMessagingHost, v8, v9, v10, v11),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v12, v15, v16),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v13,
        v17))
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v18, (uint64_t)CFSTR("TTSMessageChannelMessageArgumentsKey"), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = NSSelectorFromString(v12);
    objc_msgSend_owningAudioUnit(self, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_methodSignatureForSelector_(v27, v28, (uint64_t)v22, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_invocationWithMethodSignature_(MEMORY[0x1E0C99DB8], v32, (uint64_t)v31, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSelector_(v35, v36, (uint64_t)v22, v37, v38);
    objc_msgSend_owningAudioUnit(self, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTarget_(v35, v44, (uint64_t)v43, v45, v46);

    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v47 = v21;
    v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v80, (uint64_t)v85, 16);
    if (v49)
    {
      v52 = v49;
      v53 = *(_QWORD *)v81;
      v54 = 2;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v81 != v53)
            objc_enumerationMutation(v47);
          v84 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
          objc_msgSend_setArgument_atIndex_(v35, v50, (uint64_t)&v84, v54 + i, v51, (_QWORD)v80);
        }
        v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v50, (uint64_t)&v80, (uint64_t)v85, 16);
        v54 += i;
      }
      while (v52);
    }

    objc_msgSend_retainArguments(v35, v56, v57, v58, v59);
    objc_msgSend_invoke(v35, v60, v61, v62, v63);
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    v69 = objc_retainAutorelease(v31);
    if (*(_BYTE *)objc_msgSend_methodReturnType(v69, v70, v71, v72, v73) != 118)
    {
      objc_msgSend_getReturnValue_(v35, v74, (uint64_t)&v84, v75, v76);
      if (v84)
        objc_msgSend_setObject_forKeyedSubscript_(v68, v77, v84, (uint64_t)CFSTR("TTSMessageChannelMessageReturnValueKey"), v78);
    }

  }
  else
  {
    v68 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v68;
}

- (id)hostBlock
{
  return self->_hostBlock;
}

- (void)setHostBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (TTSFirstPartyAudioUnit)owningAudioUnit
{
  return (TTSFirstPartyAudioUnit *)objc_loadWeakRetained((id *)&self->_owningAudioUnit);
}

- (void)setOwningAudioUnit:(id)a3
{
  objc_storeWeak((id *)&self->_owningAudioUnit, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningAudioUnit);
  objc_storeStrong(&self->_hostBlock, 0);
}

@end
