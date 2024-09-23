@implementation SEMOntologyMapper

+ (id)ontologyGraphFromSpanMatch:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  int v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  siri::ontology::oname::graph::ontology_init *v40;
  uint64_t v41;
  const char *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  void *v48;
  const char *v49;
  uint64_t v50;
  unsigned int v51;
  const char *v52;
  void *v53;
  id v54;
  uint8_t v55[4];
  const char *v56;
  __int16 v57;
  id v58;
  uint8_t buf[40];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_entityInfo(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_entityType(v6, v7, v8);

  if (v9 == 1)
  {
    v10 = objc_alloc_init(MEMORY[0x24BEA3A80]);
    v11 = (void *)objc_opt_class();
    if (v11)
    {
      objc_msgSend__ontologyMappingFromCascadeSpanMatch_(v11, v12, (uint64_t)v3);
      if (buf[24])
      {
        v54 = *(id *)&buf[16];
        objc_msgSend_spanInfo(v3, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend_spanRange(v15, v16, v17);
        v20 = (int)v19;
        objc_msgSend_createEntityNode_(v10, v19, *(uint64_t *)buf);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_spanValue(v3, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_createStringNode_(v10, v25, (uint64_t)v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (v18 + v20);
        objc_msgSend_addUtteranceAlignmentWithAsrIndex_StartIndex_endIndex_startUnicodeScalarIndex_endUnicodeScalarIndex_(v26, v28, 0, v18, v27, v18, v27);
        v29 = (void *)objc_opt_class();
        objc_msgSend__entitySpanForCascadeMatch_startIndex_endIndex_label_(v29, v30, (uint64_t)v3, v18, v27, v54);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addEntitySpan_(v26, v32, (uint64_t)v31);
        v33 = (void *)objc_opt_class();
        objc_msgSend_score(v3, v34, v35);
        objc_msgSend__setIdentifiersOnEdgeNode_entitySpan_spanInfo_probability_(v33, v36, (uint64_t)v26, v31, v15);
        objc_msgSend_setSuccessor_successor_enumeration_(v21, v37, *(uint64_t *)&buf[8], v26, 0);
        objc_msgSend_getRoot(v10, v38, v39);
        v40 = (siri::ontology::oname::graph::ontology_init *)objc_claimAutoreleasedReturnValue();
        v41 = siri::ontology::oname::graph::ontology_init::Argument_entity(v40);
        objc_msgSend_setSuccessor_successor_enumeration_(v40, v42, v41, v21, 0);

        v43 = v10;
LABEL_12:
        if (buf[24])

        goto LABEL_14;
      }
    }
    else
    {
      memset(buf, 0, 32);
    }
    v46 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v55 = 136315394;
      v56 = "+[SEMOntologyMapper ontologyGraphFromSpanMatch:]";
      v57 = 2112;
      v58 = v3;
      _os_log_error_impl(&dword_2462C4000, v46, OS_LOG_TYPE_ERROR, "%s No ontology mapping is defined for spanMatch: %@", v55, 0x16u);
    }
    v43 = 0;
    goto LABEL_12;
  }
  v10 = (id)qword_25441F970;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_entityInfo(v3, v44, v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend_entityType(v48, v49, v50);
    SEMEntityTypeDescription(v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "+[SEMOntologyMapper ontologyGraphFromSpanMatch:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v53;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v3;
    _os_log_error_impl(&dword_2462C4000, v10, OS_LOG_TYPE_ERROR, "%s Ontology conversion not supported for entity type (%@) of match: %@", buf, 0x20u);

  }
  v43 = 0;
LABEL_14:

  return v43;
}

+ (optional<std::tuple<const)_ontologyMappingFromCascadeSpanMatch:(NSString *const>> *__return_ptr)retstr
{
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  char *v23;
  const char *v24;
  std::__shared_weak_count *v25;
  char *v26;
  std::__shared_weak_count *v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  id v33;
  char *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  const char *v41;
  uint64_t v42;
  id *v43;
  NSObject *v44;
  NSObject *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  optional<std::tuple<const siri::ontology::OntologyNodeName *, const siri::ontology::OntologyEdgeName *, NSString *const>> *result;
  id v53;
  id v54;
  char *v55;
  std::__shared_weak_count *v56;
  char *v57;
  std::__shared_weak_count *v58;
  _BYTE buf[24];
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v53 = a4;
  objc_msgSend_entityInfo(v53, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2462EAC48(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend_fieldMatches(v53, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v57 = 0;
    v58 = 0;
    v55 = 0;
    v56 = 0;
    do
    {
      objc_msgSend_objectAtIndex_(v12, v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_entityFieldInfo(v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2462EAD88(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_40;
      v21 = objc_msgSend_fieldType(v18, v19, v20);
      objc_msgSend__ontologyMappingFromFieldType_(SEMOntologyMapper, v22, v21);
      v23 = (char *)operator new(0x38uLL);
      v25 = (std::__shared_weak_count *)v23;
      *((_QWORD *)v23 + 1) = 0;
      *((_QWORD *)v23 + 2) = 0;
      *(_QWORD *)v23 = &off_251782B88;
      v23[24] = 0;
      v26 = v23 + 24;
      v23[48] = 0;
      if ((_BYTE)v60)
      {
        *(_OWORD *)(v23 + 24) = *(_OWORD *)buf;
        *((_QWORD *)v23 + 5) = *(id *)&buf[16];
        LOBYTE(v25[2].__vftable) = 1;
      }
      v27 = v56;
      v55 = v26;
      v56 = v25;
      if (v27)
      {
        p_shared_owners = (unint64_t *)&v27->__shared_owners_;
        do
          v29 = __ldaxr(p_shared_owners);
        while (__stlxr(v29 - 1, p_shared_owners));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
      if ((_BYTE)v60)

      if (v13)
      {
        v54 = 0;
        v30 = objc_msgSend_itemTypeForFieldType_error_(MEMORY[0x24BE5B238], v24, v21, &v54);
        v33 = v54;
        if (v33 || v30 != objc_msgSend_itemType(v8, v31, v32))
        {
          v44 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "+[SEMOntologyMapper _ontologyMappingFromCascadeSpanMatch:]";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v53;
            *(_WORD *)&buf[22] = 2112;
            v60 = v33;
            _os_log_error_impl(&dword_2462C4000, v44, OS_LOG_TYPE_ERROR, "%s Span match has unexpected fieldType: %@ error: %@", buf, 0x20u);
          }
          retstr->var0.var0 = 0;
          retstr->var1 = 0;

          goto LABEL_41;
        }
        v34 = v55;
        if (!v55[24] || !v57[24])
          sub_2462F1C9C();
        if (*(_QWORD *)v55 != *(_QWORD *)v57
          || *((_QWORD *)v55 + 1) != *((_QWORD *)v57 + 1)
          || *((_QWORD *)v55 + 2) != *((_QWORD *)v57 + 2))
        {
          v45 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "+[SEMOntologyMapper _ontologyMappingFromCascadeSpanMatch:]";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v53;
            _os_log_error_impl(&dword_2462C4000, v45, OS_LOG_TYPE_ERROR, "%s Merged fields of span match: %@ not homologous to a single ontology mapping", buf, 0x16u);
          }
LABEL_40:
          retstr->var0.var0 = 0;
          retstr->var1 = 0;
LABEL_41:

          goto LABEL_42;
        }
      }
      else
      {
        v34 = v55;
      }
      v35 = v56;
      if (v56)
      {
        v36 = (unint64_t *)&v56->__shared_owners_;
        do
          v37 = __ldxr(v36);
        while (__stxr(v37 + 1, v36));
      }
      v38 = v58;
      v57 = v34;
      v58 = v35;
      if (v38)
      {
        v39 = (unint64_t *)&v38->__shared_owners_;
        do
          v40 = __ldaxr(v39);
        while (__stlxr(v40 - 1, v39));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
      }

      ++v13;
    }
    while (v13 < objc_msgSend_count(v12, v41, v42));
    v43 = (id *)v57;
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
    if (*((_BYTE *)v43 + 24))
    {
      *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v43;
      retstr->var0.var1.var0.var2 = v43[2];
      retstr->var1 = 1;
    }
LABEL_42:
    v46 = v56;
    if (v56)
    {
      v47 = (unint64_t *)&v56->__shared_owners_;
      do
        v48 = __ldaxr(v47);
      while (__stlxr(v48 - 1, v47));
      if (!v48)
      {
        ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
        std::__shared_weak_count::__release_weak(v46);
      }
    }
    v49 = v58;
    if (v58)
    {
      v50 = (unint64_t *)&v58->__shared_owners_;
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }

  }
  else
  {
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
  }

  return result;
}

+ (optional<std::tuple<const)_ontologyMappingFromFieldType:(NSString *const>> *__return_ptr)retstr
{
  siri::ontology::oname::graph::ontology_init *v5;
  OntologyEdgeName *v6;
  __CFString *v7;
  int v8;
  BOOL v9;

  if ((int)a4 <= 19678)
  {
    if ((int)a4 > 14818)
    {
      if ((int)a4 > 16253)
      {
        switch(a4)
        {
          case 0x487Bu:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("musicAlbum");
            goto LABEL_131;
          case 0x487Cu:
          case 0x4884u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("musicArtist");
            goto LABEL_131;
          case 0x487Du:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("audiobookTitle");
            goto LABEL_131;
          case 0x487Eu:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("audiobookAuthor");
            goto LABEL_131;
          case 0x487Fu:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("musicGenre");
            goto LABEL_131;
          case 0x4880u:
          case 0x4886u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("mediaTitle");
            goto LABEL_131;
          case 0x4881u:
            goto LABEL_68;
          case 0x4882u:
            goto LABEL_82;
          case 0x4883u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("musicTitle");
            goto LABEL_131;
          case 0x4885u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("mediaEpisodeTitle");
            goto LABEL_131;
          default:
            if (a4 != 16254)
              goto LABEL_115;
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Organization((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("paymentsOrganizationName");
            break;
        }
        goto LABEL_131;
      }
      if ((a4 - 15768) < 6)
      {
        v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_PostalAddress((siri::ontology::oname::graph::ontology_init *)result);
        v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_value(v5);
        v7 = CFSTR("location");
        goto LABEL_131;
      }
      if (a4 == 14819)
      {
        v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
        v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
        v7 = CFSTR("carProfileName");
        goto LABEL_131;
      }
      if (a4 != 15575)
        goto LABEL_115;
LABEL_74:
      v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
      v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
      v7 = CFSTR("appShowTitle");
      goto LABEL_131;
    }
    if ((int)a4 <= 7824)
    {
      if ((int)a4 > 7700)
      {
        switch(a4)
        {
          case 0x1E15u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
            v7 = CFSTR("homeAutomationHome");
            goto LABEL_131;
          case 0x1E16u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
            v7 = CFSTR("homeAutomationAccessoryName");
            goto LABEL_131;
          case 0x1E18u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
            v7 = CFSTR("homeAutomationRoom");
            goto LABEL_131;
          case 0x1E19u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
            v7 = CFSTR("homeAutomationScene");
            goto LABEL_131;
          case 0x1E1Au:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
            v7 = CFSTR("homeAutomationServiceName");
            goto LABEL_131;
          case 0x1E1Cu:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
            v7 = CFSTR("homeAutomationServiceGroup");
            goto LABEL_131;
          case 0x1E1Du:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
            v7 = CFSTR("homeAutomationTrigger");
            goto LABEL_131;
          case 0x1E1Eu:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
            v7 = CFSTR("homeAutomationZone");
            goto LABEL_131;
          case 0x1E2Au:
            goto LABEL_88;
          default:
            goto LABEL_115;
        }
      }
      switch(a4)
      {
        case 0x323u:
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
          v7 = CFSTR("carName");
          goto LABEL_131;
        case 0xE24u:
LABEL_88:
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = CFSTR("appMusicArtistName");
          goto LABEL_131;
        case 0x15DEu:
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_NoteFolder((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = CFSTR("notebookFolderTitle");
          goto LABEL_131;
      }
      goto LABEL_115;
    }
    if ((int)a4 <= 12998)
    {
      if ((int)a4 <= 8198)
      {
        if (a4 == 7825 || a4 == 7830)
        {
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_AppEntity((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = CFSTR("appEntity");
          goto LABEL_131;
        }
        goto LABEL_115;
      }
      if (a4 != 8199)
      {
        v8 = 12013;
LABEL_120:
        if (a4 == v8)
        {
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_VoiceCommand((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = CFSTR("voiceCommandName");
          goto LABEL_131;
        }
        goto LABEL_115;
      }
    }
    else
    {
      if ((int)a4 <= 14029)
      {
        if ((a4 - 12999) < 2)
        {
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Medication((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = CFSTR("medicationName");
          goto LABEL_131;
        }
        goto LABEL_115;
      }
      if (a4 == 14030)
        goto LABEL_89;
      if (a4 != 14709)
        goto LABEL_115;
    }
    v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
    v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
    v7 = CFSTR("appAudiobookTitle");
    goto LABEL_131;
  }
  if ((int)a4 > 38253)
  {
    if ((int)a4 > 53616)
    {
      if ((int)a4 > 61512)
      {
        switch(a4)
        {
          case 0xF2CFu:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("learnedMediaSong");
            goto LABEL_131;
          case 0xF2D0u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("learnedMediaArtist");
            goto LABEL_131;
          case 0xF2D1u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("learnedMediaAlbum");
            goto LABEL_131;
          case 0xF2D2u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("learnedMediaEntity");
            goto LABEL_131;
          default:
            if (a4 == 61513)
              goto LABEL_95;
            if (a4 != 63372)
              goto LABEL_115;
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Group((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("smsGroupName");
            break;
        }
        goto LABEL_131;
      }
      if ((int)a4 <= 54388)
      {
        if (a4 == 53617)
        {
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_WorkoutInstructor((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = CFSTR("workoutInstructorName");
          goto LABEL_131;
        }
        if (a4 == 54388)
        {
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_CalendarEvent((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = CFSTR("calendarEventTopic");
          goto LABEL_131;
        }
        goto LABEL_115;
      }
      if (a4 == 54389)
      {
        v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_PointOfInterest((siri::ontology::oname::graph::ontology_init *)result);
        v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = CFSTR("calendarEventLocation");
        goto LABEL_131;
      }
      if (a4 != 61355)
      {
        if (a4 == 61512)
        {
LABEL_95:
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserProfile((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = CFSTR("userAccount");
          goto LABEL_131;
        }
        goto LABEL_115;
      }
      goto LABEL_41;
    }
    if ((int)a4 > 49068)
    {
      switch(a4)
      {
        case 0xBFADu:
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_RadioStation((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = CFSTR("carRadioStationName");
          goto LABEL_131;
        case 0xBFAEu:
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_RadioStation((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = CFSTR("carRadioStationCallSign");
          goto LABEL_131;
        case 0xBFAFu:
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_RadioStation((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_frequencyName(v5);
          v7 = CFSTR("carRadioFrequency");
          goto LABEL_131;
        case 0xBFB0u:
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_RadioStation((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_frequencyName(v5);
          v7 = CFSTR("carRadioChannel");
          goto LABEL_131;
        default:
          if (a4 != 53604)
            goto LABEL_115;
          v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Person((siri::ontology::oname::graph::ontology_init *)result);
          v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
          v7 = CFSTR("learnedContact");
          break;
      }
      goto LABEL_131;
    }
    if ((int)a4 > 42188)
    {
      if (a4 == 42189 || a4 == 42190)
      {
LABEL_68:
        v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
        v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = CFSTR("mediaPlayerItem");
        goto LABEL_131;
      }
      if (a4 == 44938)
      {
        v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Workout((siri::ontology::oname::graph::ontology_init *)result);
        v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = CFSTR("healthActivity");
        goto LABEL_131;
      }
      goto LABEL_115;
    }
    if (a4 != 38254)
    {
      if (a4 == 42188)
      {
LABEL_82:
        v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
        v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = CFSTR("playlistTitle");
        goto LABEL_131;
      }
      goto LABEL_115;
    }
LABEL_89:
    v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
    v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
    v7 = CFSTR("appAudiobookAuthor");
    goto LABEL_131;
  }
  if ((int)a4 <= 25885)
  {
    if ((int)a4 > 19692)
    {
      if ((int)a4 > 19757)
      {
        switch(a4)
        {
          case 0x4D2Eu:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_PersonRelationship((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_relationshipType(v5);
            v7 = CFSTR("personRelationship");
            goto LABEL_131;
          case 0x4D2Fu:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Person((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("RelatedPerson");
            goto LABEL_131;
          case 0x4D35u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_ContactAddress((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_label(v5);
            v7 = CFSTR("emailType");
            goto LABEL_131;
        }
      }
      else
      {
        switch(a4)
        {
          case 0x4CEDu:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Organization((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
            v7 = CFSTR("personCompany");
            goto LABEL_131;
          case 0x4D23u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_ContactAddress((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_label(v5);
            v7 = CFSTR("contactType");
            goto LABEL_131;
          case 0x4D25u:
            v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_ContactAddress((siri::ontology::oname::graph::ontology_init *)result);
            v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_label(v5);
            v7 = CFSTR("addressType");
LABEL_131:
            result = v7;
            retstr->var0.var1.var0.var0 = (OntologyNodeName *)v5;
            retstr->var0.var1.var0.var1 = v6;
            retstr->var0.var1.var0.var2 = result;
            v9 = 1;
            goto LABEL_132;
        }
      }
      goto LABEL_115;
    }
    if ((a4 - 19679) >= 5)
      goto LABEL_115;
LABEL_41:
    v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Person((siri::ontology::oname::graph::ontology_init *)result);
    v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
    v7 = CFSTR("personFullName");
    goto LABEL_131;
  }
  if ((int)a4 > 32967)
  {
    if ((int)a4 <= 36063)
    {
      if (a4 == 32968 || a4 == 34312)
      {
        v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem((siri::ontology::oname::graph::ontology_init *)result);
        v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = CFSTR("appPlaylistTitle");
        goto LABEL_131;
      }
      goto LABEL_115;
    }
    if (a4 != 36064)
    {
      if (a4 == 36439 || a4 == 36441)
      {
        v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_App((siri::ontology::oname::graph::ontology_init *)result);
        v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
        v7 = CFSTR("appName");
        goto LABEL_131;
      }
      goto LABEL_115;
    }
    goto LABEL_74;
  }
  if ((int)a4 > 27130)
  {
    if ((a4 - 27131) < 2)
    {
      v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Person((siri::ontology::oname::graph::ontology_init *)result);
      v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
      v7 = CFSTR("findMyDeviceOwnerName");
      goto LABEL_131;
    }
    v8 = 30601;
    goto LABEL_120;
  }
  switch(a4)
  {
    case 0x651Eu:
      v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_PaymentAccount((siri::ontology::oname::graph::ontology_init *)result);
      v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
      v7 = CFSTR("paymentsAccountName");
      goto LABEL_131;
    case 0x6793u:
      v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_ReminderList((siri::ontology::oname::graph::ontology_init *)result);
      v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_name(v5);
      v7 = CFSTR("notebookTitle");
      goto LABEL_131;
    case 0x69F6u:
      v5 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity((siri::ontology::oname::graph::ontology_init *)result);
      v6 = (OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_names(v5);
      v7 = CFSTR("findMyDeviceName");
      goto LABEL_131;
  }
LABEL_115:
  v9 = 0;
  retstr->var0.var0 = 0;
LABEL_132:
  retstr->var1 = v9;
  return result;
}

+ (void)_setIdentifiersOnEdgeNode:(id)a3 entitySpan:(id)a4 spanInfo:(id)a5 probability:(float)a6
{
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v33 = a4;
  objc_msgSend_originAppId(v33, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originEntityId(v33, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addIdentifierWithValue_appBundleId_namespaceString_probability_nluComponent_(v34, v14, (uint64_t)v13, v10, *MEMORY[0x24BEA38F0], a6, 1, 0x100000001);

  if (qword_25441F920 != -1)
    dispatch_once(&qword_25441F920, &unk_251782B30);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend_properties(v33, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v35, v39, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v17);
        v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v25 = (void *)qword_25441F918;
        objc_msgSend_key(v24, v19, v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v25) = objc_msgSend_containsObject_(v25, v27, (uint64_t)v26);

        if ((_DWORD)v25)
        {
          objc_msgSend_valueString(v24, v19, v20);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_key(v24, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addIdentifierWithValue_appBundleId_namespaceString_probability_nluComponent_(v34, v32, (uint64_t)v28, v10, v31, a6, 1, 0x100000001);

        }
      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v35, v39, 16);
    }
    while (v21);
  }

}

+ (id)_entitySpanForCascadeMatch:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5 label:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  int v19;
  void *matched;
  int v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  id v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  const char *v44;
  id v46;

  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a6;
  v46 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend_entityInfo(v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2462EAC48(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v17 = objc_msgSend_itemType(v14, v15, v16);
    if (v17 > 25882)
    {
      if (v17 > 38250)
      {
        if (v17 > 53600)
        {
          if (v17 > 62157)
          {
            if (v17 != 62158)
            {
              v19 = 63369;
              goto LABEL_51;
            }
          }
          else
          {
            if (v17 != 53601)
            {
              v19 = 61352;
              goto LABEL_51;
            }
            objc_msgSend__appendSpanProperties_forLearnedContactMatch_entityInfo_(SEMOntologyMapper, v18, (uint64_t)v46, v9, v14);
          }
          objc_msgSend__appendSpanProperties_forLearnedMediaEntityMatch_entityInfo_(SEMOntologyMapper, v18, (uint64_t)v46, v9, v14);
          goto LABEL_53;
        }
        if (v17 > 49065)
        {
          if (v17 == 49066)
          {
            objc_msgSend__appendSpanProperties_forRadioStationMatch_entityInfo_(SEMOntologyMapper, v18, (uint64_t)v46, v9, v14);
            goto LABEL_53;
          }
          v19 = 53482;
          goto LABEL_51;
        }
        if (v17 != 38251)
        {
          v19 = 44935;
          goto LABEL_51;
        }
        goto LABEL_52;
      }
      if (v17 <= 32964)
      {
        if (v17 == 25883 || v17 == 26512)
          goto LABEL_52;
        v19 = 30598;
LABEL_51:
        if (v17 == v19)
          goto LABEL_52;
LABEL_53:
        v22 = objc_alloc(MEMORY[0x24BEA3A98]);
        objc_msgSend_spanValue(v9, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend_initWithKey_valueString_(v22, v26, *MEMORY[0x24BEA3920], v25);
        objc_msgSend_addObject_(v46, v28, (uint64_t)v27);

        sub_2462EAA94(v9);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v10;
        v31 = v8;
        objc_msgSend_sourceItemIdentifier(v29, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = objc_alloc(MEMORY[0x24BEA3A78]);
        objc_msgSend_sourceIdentifierOrConstant(v14, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_spanInfo(v9, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2462E7954(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v35;
        v10 = v30;
        matched = (void *)objc_msgSend_initWithOriginAppId_sourceComponent_label_matchInfo_properties_startIndex_endIndex_alternatives_originEntityId_(v43, v44, (uint64_t)v38, 1, v30, v42, v46, v31, a5, 0, v34);

        goto LABEL_54;
      }
      if (v17 > 36058)
      {
        if (v17 != 36059)
        {
          if (v17 == 36434)
            objc_msgSend__appendSpanProperties_forInstalledAppMatch_(SEMOntologyMapper, v18, (uint64_t)v46, v9);
          goto LABEL_53;
        }
        goto LABEL_45;
      }
      if (v17 != 32965)
      {
        v21 = 34307;
LABEL_40:
        if (v17 != v21)
          goto LABEL_53;
        goto LABEL_45;
      }
    }
    else
    {
      if (v17 > 12009)
      {
        if (v17 <= 14815)
        {
          if (v17 <= 14024)
          {
            if (v17 == 12010)
            {
              objc_msgSend__appendSpanProperties_forAppShortcutPhraseMatch_entityInfo_(SEMOntologyMapper, v18, (uint64_t)v46, v9, v14);
              goto LABEL_53;
            }
            v19 = 13884;
            goto LABEL_51;
          }
          if (v17 != 14025)
          {
            v19 = 14706;
            goto LABEL_51;
          }
LABEL_45:
          objc_msgSend__appendSpanProperties_forGlobalTermMatch_entityInfo_(SEMOntologyMapper, v18, (uint64_t)v46, v9, v14);
          goto LABEL_53;
        }
        if (v17 > 16250)
        {
          if (v17 != 16251)
          {
            if (v17 == 19668)
              objc_msgSend__appendSpanProperties_forContactMatch_entityInfo_(SEMOntologyMapper, v18, (uint64_t)v46, v9, v14);
            goto LABEL_53;
          }
          goto LABEL_52;
        }
        if (v17 != 14816)
        {
          v19 = 15572;
          goto LABEL_51;
        }
        goto LABEL_52;
      }
      if (v17 > 7689)
      {
        if (v17 <= 7821)
        {
          if (v17 == 7690)
          {
            objc_msgSend__appendSpanProperties_forHomeMatch_entityInfo_(SEMOntologyMapper, v18, (uint64_t)v46, v9, v14);
            goto LABEL_53;
          }
          v19 = 7719;
          goto LABEL_51;
        }
        if (v17 == 7822)
        {
          objc_msgSend__appendSpanProperties_forAppShortcutEntityMatch_entityInfo_(SEMOntologyMapper, v18, (uint64_t)v46, v9, v14);
          goto LABEL_53;
        }
        v21 = 8194;
        goto LABEL_40;
      }
      if (v17 != 800)
      {
        if (v17 != 3615)
        {
          v19 = 5595;
          goto LABEL_51;
        }
        goto LABEL_45;
      }
    }
LABEL_52:
    objc_msgSend__appendSpanProperties_forCustomTermMatch_entityInfo_(SEMOntologyMapper, v18, (uint64_t)v46, v9, v14);
    goto LABEL_53;
  }
  matched = 0;
LABEL_54:

  return matched;
}

+ (void)_appendSpanProperties:(id)a3 forCustomTermMatch:(id)a4 entityInfo:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  char v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  id v41;

  v41 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend_content(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0
    && (objc_msgSend_content(v8, v13, v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_vocabularyIdentifier(v15, v16, v17),
        v18 = objc_claimAutoreleasedReturnValue(),
        v15,
        v18))
  {
    v19 = objc_alloc(MEMORY[0x24BEA3A98]);
    v21 = (void *)objc_msgSend_initWithKey_valueString_(v19, v20, *MEMORY[0x24BEA38E8], v18);
    objc_msgSend_addObject_(v41, v22, (uint64_t)v21);

    v23 = (void *)v18;
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend_fieldMatches(v7, v13, v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entityFieldInfo(v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2462EAD88(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_fieldType(v31, v32, v33) == 803)
  {
    v34 = objc_alloc(MEMORY[0x24BEA3A98]);
    objc_msgSend_spanValue(v7, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend_initWithKey_valueString_(v34, v38, *MEMORY[0x24BEA38A8], v37);
    objc_msgSend_addObject_(v41, v40, (uint64_t)v39);

  }
}

+ (void)_appendSpanProperties:(id)a3 forContactMatch:(id)a4 entityInfo:(id)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  id v24;
  const char *v25;
  const char *v26;
  id v27;
  const char *v28;
  const char *v29;
  id v30;
  const char *v31;
  const char *v32;
  id v33;
  const char *v34;
  const char *v35;
  id v36;
  const char *v37;
  const char *v38;
  __CFString *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend_fieldMatches(a4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v40, v44, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v41;
    v39 = CFSTR("personGivenName");
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend_entityFieldInfo(*(void **)(*((_QWORD *)&v40 + 1) + 8 * i), v11, v12, v39);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2462EAD88(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          switch(objc_msgSend_fieldType(v17, v18, v19))
          {
            case 0x4CDFu:
              v20 = objc_alloc(MEMORY[0x24BEA3A98]);
              v22 = (void *)objc_msgSend_initWithKey_(v20, v21, (uint64_t)v39);
              objc_msgSend_addObject_(v6, v23, (uint64_t)v22);
              goto LABEL_14;
            case 0x4CE0u:
              v24 = objc_alloc(MEMORY[0x24BEA3A98]);
              v22 = (void *)objc_msgSend_initWithKey_(v24, v25, 0x251785B70);
              objc_msgSend_addObject_(v6, v26, (uint64_t)v22);
              goto LABEL_14;
            case 0x4CE1u:
              v27 = objc_alloc(MEMORY[0x24BEA3A98]);
              v22 = (void *)objc_msgSend_initWithKey_(v27, v28, 0x251785B90);
              objc_msgSend_addObject_(v6, v29, (uint64_t)v22);
              goto LABEL_14;
            case 0x4CE2u:
              v30 = objc_alloc(MEMORY[0x24BEA3A98]);
              v22 = (void *)objc_msgSend_initWithKey_(v30, v31, 0x251785BB0);
              objc_msgSend_addObject_(v6, v32, (uint64_t)v22);
              goto LABEL_14;
            case 0x4CE3u:
              v36 = objc_alloc(MEMORY[0x24BEA3A98]);
              v22 = (void *)objc_msgSend_initWithKey_(v36, v37, 0x251785BD0);
              objc_msgSend_addObject_(v6, v38, (uint64_t)v22);
              goto LABEL_14;
            case 0x4CEDu:
              v33 = objc_alloc(MEMORY[0x24BEA3A98]);
              v22 = (void *)objc_msgSend_initWithKey_(v33, v34, 0x251785BF0);
              objc_msgSend_addObject_(v6, v35, (uint64_t)v22);
LABEL_14:

              break;
            default:
              break;
          }
        }

      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v40, v44, 16);
    }
    while (v13);
  }

}

+ (void)_appendSpanProperties:(id)a3 forInstalledAppMatch:(id)a4
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  id v18;

  v18 = a3;
  objc_msgSend_spanInfo(a4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isPartialMatch(v7, v8, v9) & 1) != 0
    || (objc_msgSend_isApproximateMatch(v7, v10, v11) & 1) != 0
    || objc_msgSend_isAliasMatch(v7, v12, v13))
  {
    v14 = objc_alloc(MEMORY[0x24BEA3A98]);
    v16 = (void *)objc_msgSend_initWithKey_valueString_(v14, v15, *MEMORY[0x24BEA38B0], *MEMORY[0x24BEA38B0]);
    objc_msgSend_addObject_(v18, v17, (uint64_t)v16);

  }
}

+ (void)_appendSpanProperties:(id)a3 forHomeMatch:(id)a4 entityInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  unsigned int v15;
  NSObject *v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  objc_class *v21;
  id v22;
  objc_class *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  id v30;
  const char *v31;
  void *v32;
  const char *v33;
  NSObject *v34;
  int v35;
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_content(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_msgSend_entityType(v12, v13, v14) - 1;
    if (v15 >= 8)
    {
      v25 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v35 = 136315394;
        v36 = "+[SEMOntologyMapper _appendSpanProperties:forHomeMatch:entityInfo:]";
        v37 = 2112;
        v38 = v8;
        _os_log_error_impl(&dword_2462C4000, v25, OS_LOG_TYPE_ERROR, "%s Could not extract identifier value matched entity, omitting home entity type identifiers. %@", (uint8_t *)&v35, 0x16u);
      }
      v16 = 0;
    }
    else
    {
      v16 = **((id **)&unk_251782BC8 + (int)v15);
      if (v16)
      {
        v17 = objc_alloc(MEMORY[0x24BEA3A98]);
        v19 = (void *)objc_msgSend_initWithKey_valueString_(v17, v18, *MEMORY[0x24BEA38D8], v16);
        objc_msgSend_addObject_(v7, v20, (uint64_t)v19);

      }
    }
    sub_2462EAA94(v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend_assistantHomeKitIdentifier(v26, v27, v28),
          (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v30 = objc_alloc(MEMORY[0x24BEA3A98]);
      v32 = (void *)objc_msgSend_initWithKey_valueString_(v30, v31, *MEMORY[0x24BEA38A0], v29);
      objc_msgSend_addObject_(v7, v33, (uint64_t)v32);

    }
    else
    {
      v34 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v35 = 136315394;
        v36 = "+[SEMOntologyMapper _appendSpanProperties:forHomeMatch:entityInfo:]";
        v37 = 2112;
        v38 = v8;
        _os_log_error_impl(&dword_2462C4000, v34, OS_LOG_TYPE_ERROR, "%s Could not find assistantHomeKitId for span match: %@", (uint8_t *)&v35, 0x16u);
      }
    }

  }
  else
  {
    v16 = (id)qword_25441F970;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 136315906;
      v36 = "+[SEMOntologyMapper _appendSpanProperties:forHomeMatch:entityInfo:]";
      v37 = 2112;
      v38 = v22;
      v39 = 2112;
      v40 = v24;
      v41 = 2112;
      v42 = v8;
      _os_log_error_impl(&dword_2462C4000, v16, OS_LOG_TYPE_ERROR, "%s Unexpected content class: %@ expected: %@ for match: %@", (uint8_t *)&v35, 0x2Au);

    }
  }

}

+ (void)_appendSpanProperties:(id)a3 forAppShortcutPhraseMatch:(id)a4 entityInfo:(id)a5
{
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  id v23;

  v23 = a3;
  objc_msgSend_content(a5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_baseTemplate(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_templateParameterValue(v8, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v15 = objc_alloc(MEMORY[0x24BEA3A98]);
      v17 = (void *)objc_msgSend_initWithKey_valueString_(v15, v16, 0x251785E90, v11);
      objc_msgSend_addObject_(v23, v18, (uint64_t)v17);

    }
    if (v14)
    {
      v19 = objc_alloc(MEMORY[0x24BEA3A98]);
      v21 = (void *)objc_msgSend_initWithKey_valueString_(v19, v20, 0x251785EB0, v14);
      objc_msgSend_addObject_(v23, v22, (uint64_t)v21);

    }
  }
  else
  {
    v11 = 0;
  }

}

+ (void)_appendSpanProperties:(id)a3 forAppShortcutEntityMatch:(id)a4 entityInfo:(id)a5
{
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  id v25;

  v25 = a3;
  objc_msgSend_content(a5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_providerClass(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entityInstanceIdentifier(v8, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v16 = objc_alloc(MEMORY[0x24BEA3A98]);
      v18 = (void *)objc_msgSend_initWithKey_valueString_(v16, v17, *MEMORY[0x24BEA3898], v11);
      objc_msgSend_addObject_(v25, v19, (uint64_t)v18);

    }
    if (v15)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v14, (uint64_t)CFSTR("%@"), v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x24BEA3A98]);
      v23 = (void *)objc_msgSend_initWithKey_valueString_(v21, v22, *MEMORY[0x24BEA3890], v20);
      objc_msgSend_addObject_(v25, v24, (uint64_t)v23);

    }
  }
  else
  {
    v11 = 0;
  }

}

+ (void)_appendSpanProperties:(id)a3 forRadioStationMatch:(id)a4 entityInfo:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  const char *v14;
  char v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend_content(a5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_2462F150C;
  v18[3] = &unk_251782B58;
  v12 = v8;
  v19 = v12;
  v13 = v7;
  v20 = v13;
  v15 = objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v11, v14, (uint64_t)&v21, v18);
  v16 = v21;

  if ((v15 & 1) == 0)
  {
    v17 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "+[SEMOntologyMapper _appendSpanProperties:forRadioStationMatch:entityInfo:]";
      v24 = 2112;
      v25 = v12;
      v26 = 2112;
      v27 = v16;
      _os_log_error_impl(&dword_2462C4000, v17, OS_LOG_TYPE_ERROR, "%s Failed to enumerate radio station fields: %@ error: %@", buf, 0x20u);
    }
  }

}

+ (void)_appendSpanProperties:(id)a3 forGlobalTermMatch:(id)a4 entityInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  int v20;
  __CFString **v21;
  __CFString *v22;
  __CFString *v23;
  id v24;
  const char *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  int v29;
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  sub_2462EAA94(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sourceItemIdentifier(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend_rangeOfString_(v13, v14, (uint64_t)CFSTR("#"));
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_substringFromIndex_(v13, v16, (uint64_t)&v16[v15]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
LABEL_18:

      goto LABEL_19;
    }
    v20 = objc_msgSend_itemType(v9, v17, v18);
    if (v20 <= 14024)
    {
      if (v20 == 3615)
      {
        v21 = off_251783060;
      }
      else
      {
        if (v20 != 8194)
          goto LABEL_16;
        v21 = off_251783068;
      }
    }
    else
    {
      switch(v20)
      {
        case 14025:
          v21 = off_251783070;
          break;
        case 34307:
          v21 = off_251783058;
          break;
        case 36059:
          v21 = off_251783078;
          break;
        default:
          goto LABEL_16;
      }
    }
    v22 = *v21;
    if (v22)
    {
      v23 = v22;
      v24 = objc_alloc(MEMORY[0x24BEA3A98]);
      v26 = (void *)objc_msgSend_initWithKey_valueString_(v24, v25, (uint64_t)v23, v19);
      objc_msgSend_addObject_(v7, v27, (uint64_t)v26);

      goto LABEL_18;
    }
LABEL_16:
    v28 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v29 = 136315394;
      v30 = "+[SEMOntologyMapper _appendSpanProperties:forGlobalTermMatch:entityInfo:]";
      v31 = 2112;
      v32 = v8;
      _os_log_error_impl(&dword_2462C4000, v28, OS_LOG_TYPE_ERROR, "%s Could not extract identifier namespace from span match: %@, omitting global term identifiers.", (uint8_t *)&v29, 0x16u);
    }
    goto LABEL_18;
  }
LABEL_19:

}

+ (void)_appendSpanProperties:(id)a3 forLearnedContactMatch:(id)a4 entityInfo:(id)a5
{
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  id v16;

  v16 = a3;
  objc_msgSend_content(a5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_suggestedContactId(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x24BEA3A98]);
      v14 = (void *)objc_msgSend_initWithKey_valueString_(v12, v13, 0x251786050, v11);
      objc_msgSend_addObject_(v16, v15, (uint64_t)v14);

    }
  }

}

+ (void)_appendSpanProperties:(id)a3 forLearnedMediaEntityMatch:(id)a4 entityInfo:(id)a5
{
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  id v23;

  v23 = a3;
  objc_msgSend_content(a5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_suggestedAdamId(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userPhrasedVersion(v8, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v15 = objc_alloc(MEMORY[0x24BEA3A98]);
      v17 = (void *)objc_msgSend_initWithKey_valueString_(v15, v16, 0x251786110, v11);
      objc_msgSend_addObject_(v23, v18, (uint64_t)v17);

    }
    if (v14)
    {
      v19 = objc_alloc(MEMORY[0x24BEA3A98]);
      v21 = (void *)objc_msgSend_initWithKey_valueString_(v19, v20, 0x2517860F0, v14);
      objc_msgSend_addObject_(v23, v22, (uint64_t)v21);

    }
  }
  else
  {
    v11 = 0;
  }

}

+ (id)_radioStationSignalTypeAsString:(unsigned int)a3
{
  if (a3 - 1 > 4)
    return CFSTR("Unknown");
  else
    return off_251782C08[a3 - 1];
}

@end
