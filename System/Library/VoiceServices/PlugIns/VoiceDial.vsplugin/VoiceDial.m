uint64_t _ResultHandlerAddressBookCallback(void *a1, void *a2, const void *a3, ABMultiValueIdentifier a4, ABPropertyID a5, int a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  CFTypeRef v19;
  const void *v20;
  CFIndex IndexForIdentifier;
  CFIndex v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  char v40;
  void *v41;
  char v42;
  int v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;
  __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  int v77;
  id v78;
  id v79;
  int v80;
  id v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  id v87;
  int v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i;
  void *v95;
  void *v96;
  int v97;
  id v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t j;
  void *v103;
  void *v104;
  int v105;
  id v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  int v122;
  uint64_t v123;
  int v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  ABMultiValueRef multiValue;
  id v129;
  void *v130;
  ABPropertyID v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  CFIndex v136;
  void *v137;
  CFIndex v138;
  const __CFString *cf;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  uint64_t v153;

  v13 = a1;
  v14 = a2;
  v15 = a7;
  v16 = v15;
  v153 = 0;
  if (a3)
  {
    objc_msgSend(v15, "nameToMatch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v16, "nameToMatch");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      a6 = objc_msgSend(v13, "matchingNameType:fromTypes:forPerson:", v18, objc_msgSend(v13, "nameTypes") & 0xFFFFFFFFFFFFFFF7, a3);

    }
    if (a6 != -1
      && (objc_msgSend(v16, "requiredNameMatchType") == -1
       || objc_msgSend(v16, "requiredNameMatchType") == a6))
    {
      v19 = ABRecordCopyValue(a3, a5);
      if (v19)
      {
        v20 = v19;
        IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v19, a4);
        if (IndexForIdentifier == -1
          || (v22 = IndexForIdentifier,
              (v23 = (const __CFString *)ABMultiValueCopyValueAtIndex(v20, IndexForIdentifier)) == 0))
        {
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = 0;
LABEL_59:
          CFRelease(v20);

          goto LABEL_60;
        }
        v24 = v23;
        cf = v23;
        if (CFStringGetLength(v23) < 1)
          goto LABEL_21;
        v131 = a5;
        if ((objc_msgSend(v16, "allowFirstFT") & 1) == 0)
        {
          IMCleanupPhoneNumber();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE502F8], "sharedInstance");
          v136 = v22;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE50370], "facetimeService");
          v134 = v14;
          v27 = v24;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v26, "statusForID:onService:", v25, v28);

          v24 = v27;
          v14 = v134;

          v22 = v136;
          v30 = v29 == 1;
          a5 = v131;
          if (!v30)
          {
LABEL_21:
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v137 = 0;
            v33 = 0;
            v140 = 0;
            v31 = 0;
LABEL_58:
            CFRelease(cf);

            v34 = v137;
            v32 = v140;
            goto LABEL_59;
          }
        }
        if (objc_msgSend(v16, "contactInfo"))
        {
          objc_msgSend(v16, "setResultStatus:", 1);
          v126 = *MEMORY[0x24BE028C0];
          if (*MEMORY[0x24BE028C0] == a5 && !objc_msgSend(v16, "matchedLabelType")
            || *MEMORY[0x24BE02718] == a5 && objc_msgSend(v16, "matchedLabelType") == 1)
          {
            objc_msgSend(v16, "setMatchedLabelType:", 2);
          }
        }
        else
        {
          objc_msgSend(v16, "setResultStatus:", 2);
          v126 = *MEMORY[0x24BE028C0];
          objc_msgSend(v16, "setMatchedLabelType:", *MEMORY[0x24BE028C0] == a5);
          objc_msgSend(v16, "setResultPerson:", a3);
          CFRetain(a3);
          objc_msgSend(v16, "setContactInfo:", CFRetain(v24));
        }
        multiValue = v20;
        if (a6 == 3)
          objc_msgSend(v16, "setNicknameMatchCount:", objc_msgSend(v16, "nicknameMatchCount") + 1);
        v153 = objc_msgSend(v13, "indexOfMainNameOfType:", 2);
        v39 = objc_msgSend(v13, "personNameCount");
        v40 = objc_msgSend(v13, "nameTypes");
        if (v153 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v132 = 0;
          v133 = 0;
          v140 = 0;
          v33 = 0;
          v41 = 0;
          v129 = 0;
          v130 = 0;
          v135 = 0;
LABEL_37:
          v137 = v41;
          v52 = (__CFString *)ABMultiValueCopyLabelAtIndex(v20, v22);
          if (v52)
          {
            v53 = v52;
            v54 = (const __CFString *)VoiceDialCopySpokenLocalizedLabel(v52);
            if (v54)
            {
              v55 = v54;
              if (v126 == v131)
              {
                objc_msgSend(v16, "unlocalizedPhoneLabels");
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v56)
                {
                  v57 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                  objc_msgSend(v16, "setUnlocalizedPhoneLabels:", v57);

                }
                if (CFStringGetLength(v55))
                {
                  objc_msgSend(v16, "localizedPhoneLabels");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v58)
                  {
                    v59 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                    objc_msgSend(v16, "setLocalizedPhoneLabels:", v59);

                  }
                  objc_msgSend(v16, "localizedPhoneLabels");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "addObject:", v55);

                }
                objc_msgSend(v16, "unlocalizedPhoneLabels");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "addObject:", v53);

              }
              if (*MEMORY[0x24BE02718] == v131)
              {
                objc_msgSend(v16, "unlocalizedEmailLabels");
                v62 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v62)
                {
                  v63 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                  objc_msgSend(v16, "setUnlocalizedEmailLabels:", v63);

                }
                if (CFStringGetLength(v55))
                {
                  objc_msgSend(v16, "localizedEmailLabels");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v64)
                  {
                    v65 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                    objc_msgSend(v16, "setLocalizedEmailLabels:", v65);

                  }
                  objc_msgSend(v16, "localizedEmailLabels");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "addObject:", v55);

                }
                objc_msgSend(v16, "unlocalizedEmailLabels");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "addObject:", v53);

              }
              CFRelease(v55);
            }
            CFRelease(v53);
          }
          v31 = v132;
          v35 = v133;
          v36 = v135;
          v38 = v129;
          v37 = v130;
          goto LABEL_58;
        }
        v42 = v40;
        v138 = v22;
        v151 = 0;
        v152 = 0;
        v43 = objc_msgSend(v13, "getNth:name:phoneticName:ofType:nameIndex:forPerson:", 0, &v152, &v151, 2, &v153, a3);
        v44 = v152;
        v140 = v151;
        v132 = v44;
        if (!v43 || !objc_msgSend(v44, "length"))
        {
          v33 = 0;
          v41 = 0;
          v129 = 0;
          v130 = 0;
          v133 = 0;
          v135 = 0;
          goto LABEL_36;
        }
        objc_msgSend(v16, "compositeNames");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v127 = v39;
        if (!v45)
        {
          v46 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v16, "setCompositeNames:", v46);

          v47 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v16, "setTopLevelNonNickNames:", v47);

          v48 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v16, "setSpokenCompositeNames:", v48);

          v49 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v16, "setPhoneticNamesByName:", v49);

        }
        v50 = objc_msgSend(v13, "matchingNameType:fromTypes:forPerson:", v14, 3, a3);
        if ((_DWORD)v50 != -1
          && ((v51 = v50, objc_msgSend(v16, "lastNameMatchType") == -1)
           || objc_msgSend(v16, "lastNameMatchType") == (_DWORD)v51))
        {
          objc_msgSend(v16, "setLastNameMatchType:", v51);
        }
        else
        {
          objc_msgSend(v16, "setAllNamesMatchedType:", 0);
        }
        objc_msgSend(v16, "compositeNames");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObject:", v44);

        objc_msgSend(v16, "spokenCompositeNames");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v140, "length"))
          v71 = v140;
        else
          v71 = v44;
        objc_msgSend(v70, "addObject:", v71);

        if (v140 && v44 && objc_msgSend(v140, "caseInsensitiveCompare:", v44))
        {
          objc_msgSend(v16, "phoneticNamesByName");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setObject:forKey:", v140, v44);

        }
        v73 = objc_msgSend(v13, "indexOfMainNameOfType:", 0);
        v74 = objc_msgSend(v13, "indexOfMainNameOfType:", 1);
        v123 = v73;
        v125 = v74;
        if (v73 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v75 = 0;
          v76 = 0;
        }
        else
        {
          v149 = 0;
          v150 = 0;
          v77 = objc_msgSend(v13, "getName:phoneticName:atIndex:forPerson:", &v150, &v149, v73, a3);
          v75 = v150;
          v76 = v149;
          if (v77 && objc_msgSend(v75, "length"))
          {
            if ((v42 & 1) != 0)
            {
              objc_msgSend(v16, "lastNamesByFirstNames");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "objectForKey:", v75);
              v109 = objc_claimAutoreleasedReturnValue();

              v135 = (void *)v109;
              if (!v109)
              {
                objc_msgSend(v16, "lastNamesByFirstNames");
                v110 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v110)
                {
                  v111 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                  objc_msgSend(v16, "setLastNamesByFirstNames:", v111);

                }
                v112 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                objc_msgSend(v16, "lastNamesByFirstNames");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                v135 = v112;
                objc_msgSend(v113, "setObject:forKey:", v112, v75);

              }
            }
            else
            {
              v135 = 0;
            }
            objc_msgSend(v16, "topLevelNonNickNames");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "addObject:", v75);

            if (v76 && v75 && objc_msgSend(v76, "caseInsensitiveCompare:", v75))
            {
              objc_msgSend(v16, "phoneticNamesByName");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "setObject:forKey:", v76, v75);

            }
            v75 = v75;
            v129 = v75;
            v74 = v125;
LABEL_76:
            if (v74 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v78 = 0;
              v133 = 0;
              v79 = v76;
            }
            else
            {
              v147 = v76;
              v148 = v75;
              v80 = objc_msgSend(v13, "getName:phoneticName:atIndex:forPerson:", &v148, &v147, v74, a3);
              v81 = v148;

              v79 = v147;
              if (v80)
              {
                v82 = v127;
                if (objc_msgSend(v81, "length"))
                {
                  if ((v42 & 2) != 0)
                  {
                    objc_msgSend(v16, "firstNamesByLastNames");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v116, "objectForKey:", v81);
                    v83 = (id)objc_claimAutoreleasedReturnValue();

                    v84 = v123;
                    if (!v83)
                    {
                      objc_msgSend(v16, "firstNamesByLastNames");
                      v117 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v117)
                      {
                        v118 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                        objc_msgSend(v16, "setFirstNamesByLastNames:", v118);

                      }
                      v83 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                      objc_msgSend(v16, "firstNamesByLastNames");
                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v119, "setObject:forKey:", v83, v81);

                    }
                  }
                  else
                  {
                    v83 = 0;
                    v84 = v123;
                  }
                  v133 = v83;
                  objc_msgSend(v16, "topLevelNonNickNames");
                  v120 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v120, "addObject:", v81);

                  if (v79 && v81 && objc_msgSend(v79, "caseInsensitiveCompare:", v81))
                  {
                    objc_msgSend(v16, "phoneticNamesByName");
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v121, "setObject:forKey:", v79, v81);

                  }
                  v75 = v81;
                  v78 = v75;
                  v82 = v127;
                  goto LABEL_85;
                }
                v78 = 0;
                v133 = 0;
                v75 = v81;
LABEL_84:
                v84 = v123;
LABEL_85:
                v130 = v78;
                if (v82)
                {
                  v85 = 0;
                  while (1)
                  {
                    if (v85 == v153)
                    {
                      objc_msgSend(v16, "topLevelNonNickNames");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = v132;
                      objc_msgSend(v86, "addObject:", v132);

                      v82 = v127;
                      objc_msgSend(v135, "addObject:", v132);
                    }
                    else
                    {
                      if (v84 == v85)
                        goto LABEL_90;
                      if (v125 == v85)
                        goto LABEL_90;
                      v88 = objc_msgSend(v13, "typeOfNameAtIndex:", v85);
                      if (v88 == 3)
                        goto LABEL_90;
                      v122 = v88;
                      v146 = v75;
                      v145 = v79;
                      v124 = objc_msgSend(v13, "getName:phoneticName:atIndex:forPerson:", &v146, &v145, v85, a3);
                      v33 = v146;

                      v89 = v145;
                      if (!v124 || !objc_msgSend(v33, "length"))
                      {
                        v79 = v89;
                        v84 = v123;
                        goto LABEL_91;
                      }
                      objc_msgSend(v16, "topLevelNonNickNames");
                      v90 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v90, "addObject:", v33);

                      v79 = v89;
                      if (v89 && v33 && objc_msgSend(v89, "caseInsensitiveCompare:", v33))
                      {
                        objc_msgSend(v16, "phoneticNamesByName");
                        v91 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v91, "setObject:forKey:", v89, v33);

                      }
                      v84 = v123;
                      if (v122)
                      {
                        objc_msgSend(v135, "addObject:", v33);
                        v75 = v33;
                        if (v122 == 1)
                          goto LABEL_91;
                      }
                      else
                      {
                        v75 = v33;
                      }
                    }
                    objc_msgSend(v133, "addObject:", v33);
LABEL_90:
                    v33 = v75;
LABEL_91:
                    ++v85;
                    v87 = v79;
                    v75 = v33;
                    if (v82 == v85)
                      goto LABEL_108;
                  }
                }
                v33 = v75;
                v87 = v79;
LABEL_108:
                if (v133)
                {
                  v41 = v87;
                  if (v129)
                  {
                    objc_msgSend(v133, "addObject:");
                  }
                  else
                  {
                    v92 = objc_msgSend(v13, "countOfNamesOfType:");
                    if (v92)
                    {
                      v93 = v92;
                      for (i = 0; i != v93; ++i)
                      {
                        v95 = v33;
                        v96 = v41;
                        v143 = v41;
                        v144 = v33;
                        v97 = objc_msgSend(v13, "getNth:name:phoneticName:ofType:nameIndex:forPerson:", i, &v144, &v143, 0, 0, a3);
                        v33 = v144;

                        v98 = v143;
                        if (v97)
                        {
                          if (objc_msgSend(v33, "length"))
                          {
                            objc_msgSend(v133, "addObject:", v33);
                            if (v98)
                            {
                              if (v33 && objc_msgSend(v98, "caseInsensitiveCompare:", v33))
                              {
                                objc_msgSend(v16, "phoneticNamesByName");
                                v99 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v99, "setObject:forKey:", v98, v33);

                              }
                            }
                          }
                        }
                        v41 = v98;
                      }
                    }
                  }
                }
                else
                {
                  v41 = v87;
                }
                if (v135)
                {
                  v20 = multiValue;
                  v22 = v138;
                  if (v130)
                  {
                    objc_msgSend(v135, "addObject:");
                    goto LABEL_37;
                  }
                  v100 = objc_msgSend(v13, "countOfNamesOfType:", 1);
                  if (!v100)
                  {
                    v130 = 0;
                    goto LABEL_37;
                  }
                  v101 = v100;
                  for (j = 0; j != v101; ++j)
                  {
                    v103 = v33;
                    v104 = v41;
                    v141 = v41;
                    v142 = v33;
                    v105 = objc_msgSend(v13, "getNth:name:phoneticName:ofType:nameIndex:forPerson:", j, &v142, &v141, 1, 0, a3);
                    v33 = v142;

                    v106 = v141;
                    if (v105)
                    {
                      if (objc_msgSend(v33, "length"))
                      {
                        objc_msgSend(v135, "addObject:", v33);
                        if (v106)
                        {
                          if (v33 && objc_msgSend(v106, "caseInsensitiveCompare:", v33))
                          {
                            objc_msgSend(v16, "phoneticNamesByName");
                            v107 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v107, "setObject:forKey:", v106, v33);

                          }
                        }
                      }
                    }
                    v41 = v106;
                  }
                  v130 = 0;
                }
                else
                {
                  v135 = 0;
                }
LABEL_36:
                v20 = multiValue;
                v22 = v138;
                goto LABEL_37;
              }
              v78 = 0;
              v133 = 0;
              v75 = v81;
            }
            v82 = v127;
            goto LABEL_84;
          }
        }
        v129 = 0;
        v135 = 0;
        goto LABEL_76;
      }
    }
  }
LABEL_60:

  return 1;
}

id _CommaSeparatedStringFromArray(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t i;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(v1, "mutableCopy");
    objc_msgSend(v4, "sortUsingSelector:", sel_caseInsensitiveCompare_);
    v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v6 = 0;
    for (i = 0; i != v3; ++i)
    {
      if (i)
      {
        if (v3 - 1 == i)
          v8 = CFSTR("MULTIPLE_ITEM_SEPARATOR_WORD");
        else
          v8 = CFSTR("MULTIPLE_ITEM_SEPARATOR_CHAR");
        VoiceDialSpokenLocalizedString(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v9);

        objc_msgSend(v4, "objectAtIndex:", i);
        v10 = v6;
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "objectAtIndex:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "capitalizedString");
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v11;
      }

      objc_msgSend(v5, "appendString:", v6);
    }
  }
  else
  {
    v5 = 0;
    v4 = 0;
    v6 = 0;
  }
  v12 = v5;

  return v12;
}

id PHDefaultLog()
{
  if (PHDefaultLog_onceToken != -1)
    dispatch_once(&PHDefaultLog_onceToken, &__block_literal_global);
  return (id)PHDefaultLog_PHDefaultLog;
}

id PHOversizedLog()
{
  if (PHOversizedLog_onceToken != -1)
    dispatch_once(&PHOversizedLog_onceToken, &__block_literal_global_30);
  return (id)PHOversizedLog_PHOversizedLog;
}

id PHOversizedLogQueue()
{
  if (PHOversizedLogQueue_onceToken != -1)
    dispatch_once(&PHOversizedLogQueue_onceToken, &__block_literal_global_32);
  return (id)PHOversizedLogQueue_PHOversizedLogQueue;
}

void DigitDialPhoneNumberFromResult(void *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  __CFString *v18;
  int v19;
  id v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  _QWORD *v24;
  id *v25;
  void *v26;
  id v27;
  int v28;
  __CFString *v29;
  id v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id *v54;
  uint64_t v55;
  void *v56;
  _QWORD *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  _QWORD *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  __CFString *v75;
  __CFString *v76;
  id v77[2];

  v68 = a1;
  v5 = objc_msgSend(v68, "elementCount");
  v6 = v5;
  v65 = a3;
  if (a3 && v5 >= 1)
  {
    VoiceDialBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)VSRecognitionModelCopyLanguageResourceURL();

    if (v8)
      v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v8);
    else
      v64 = 0;
  }
  else
  {
    v8 = 0;
    v61 = 0;
    v64 = 0;
    v67 = 0;
    v69 = 0;
    v9 = 0;
    v10 = 0;
    v58 = 0;
    v60 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    if (v5 < 1)
    {
      if (!a2)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  v56 = v8;
  v57 = a2;
  v14 = 0;
  v60 = 0;
  v61 = 0;
  v58 = 0;
  v13 = 0;
  v12 = 0;
  v11 = 0;
  v10 = 0;
  v9 = 0;
  v69 = 0;
  v15 = 0;
  v67 = 0;
  v16 = &v72;
  if (!v65)
    v16 = 0;
  v54 = v16;
  v55 = v6 - 1;
  do
  {
    v17 = v6;
    v18 = v9;

    v76 = v9;
    v77[0] = v69;
    v19 = objc_msgSend(v68, "getElementClassIdentifier:value:atIndex:", v77, &v76, v15);
    v20 = v77[0];

    v9 = v76;
    v69 = v20;
    if (!v19)
    {
      v10 = 0;
      v12 = 0;
      v13 = 0;
      goto LABEL_30;
    }
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("plus")))
    {
      VoiceDialSpokenLocalizedString(CFSTR("SPOKEN_PLUS_AT_BEGINNING_OF_PHONE_NUMBER"));

LABEL_23:
      _SpokenValueFromElementValue(v64, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      v21 = objc_msgSend(v14, "count");
      v13 = 0;
      v66 = v11;
      v22 = v9;
      v23 = v15;
      v24 = v65;
      goto LABEL_25;
    }
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("digit")) & 1) != 0
      || (objc_msgSend(v20, "isEqualToString:", CFSTR("nonzero-digit")) & 1) != 0
      || (objc_msgSend(v20, "isEqualToString:", CFSTR("teens")) & 1) != 0
      || (objc_msgSend(v20, "isEqualToString:", CFSTR("one-digit")) & 1) != 0)
    {
      goto LABEL_23;
    }
    if (!objc_msgSend(v20, "isEqualToString:", CFSTR("tens")))
    {
      if (objc_msgSend(v20, "isEqualToString:", CFSTR("hundred")))
      {
        _SpokenValueFromElementValue(v64, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = CFSTR("00");
      }
      else
      {
        if (!objc_msgSend(v20, "isEqualToString:", CFSTR("thousand")))
        {
          v10 = 0;
          v12 = 0;
          v13 = 0;
          goto LABEL_30;
        }
        _SpokenValueFromElementValue(v64, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = CFSTR("000");
      }
      goto LABEL_24;
    }
    if (v15 >= v55)
    {
      v12 = 0;
      goto LABEL_24;
    }
    v74 = v11;
    v75 = v60;
    v53 = v15 + 1;
    v28 = objc_msgSend(v68, "getElementClassIdentifier:value:atIndex:", &v75, &v74);
    v29 = v75;

    v30 = v74;
    if (!v28)
    {
      v12 = 0;
      v60 = v29;
LABEL_50:
      v11 = v30;
      goto LABEL_24;
    }
    if (-[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("digit"))
      && (-[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("0")) & 1) == 0)
    {

      v31 = CFSTR("nonzero-digit");
    }
    else
    {
      v31 = v29;
    }
    v60 = v31;
    if (!-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("nonzero-digit")))
    {
      v12 = 0;
      goto LABEL_50;
    }
    v66 = v30;
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x24BDD17C8];
    v33 = -[__CFString length](v9, "length");
    if (v33)
    {
      -[__CFString substringToIndex:](v9, "substringToIndex:", 1);
      v34 = v64;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      _SpokenValueFromElementValue(v64, v51);
      v35 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v35;
      v36 = v52;
    }
    else
    {
      v34 = v64;
      _SpokenValueFromElementValue(v64, CFSTR("0"));
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
    }
    _SpokenValueFromElementValue(v34, v66);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%@ 0 %@"), v35, v37);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v36;
    v39 = v36;
    if (v33)
    {

      v38 = v51;
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v66, "intValue") + -[__CFString intValue](v9, "intValue"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v40 = objc_msgSend(v14, "count");
    v21 = v40;
    v41 = v61;
    v52 = v39;
    if (v10)
    {
      if (v40)
      {
        v42 = 0;
        v43 = (uint64_t)v58;
        do
        {
          v62 = v41;
          v59 = (void *)v43;
          objc_msgSend(v14, "objectAtIndex:", v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "mutableCopy");

          v63 = v45;
          objc_msgSend(v14, "addObject:", v45);
          objc_msgSend(v67, "objectAtIndex:", v42);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v46, "mutableCopy");

          if (v43)
            objc_msgSend(v67, "addObject:", v43);
          ++v42;
          v47 = (void *)v63;
          v41 = (void *)v63;
        }
        while (v21 != v42);
      }
      else
      {
        v47 = v61;
        v43 = (uint64_t)v58;
      }
      v58 = (void *)v43;
      v73 = v14;
      if (v65)
        v72 = v67;
      _AppendValueToPhoneNumbersInRange(&v73, v54, v10, v13, v21, v21);
      v48 = v73;

      v6 = v17;
      if (!v65)
      {
        v25 = 0;
        v12 = 0;
        v71 = v48;
        v14 = v48;
        v61 = v47;
        v24 = 0;
        v23 = v53;
        goto LABEL_27;
      }
      v49 = v72;

      v12 = 0;
      v71 = v48;
      v14 = v48;
      v61 = v47;
      v67 = v49;
      v24 = v65;
      v23 = v53;
LABEL_26:
      v70 = v67;
      v25 = &v70;
      goto LABEL_27;
    }
    v12 = 0;
    v24 = v65;
    v23 = v53;
LABEL_25:
    v10 = 0;
    v25 = 0;
    v71 = v14;
    if (v24)
      goto LABEL_26;
LABEL_27:
    v26 = v14;
    _AppendValueToPhoneNumbersInRange(&v71, v25, v22, v12, 0, v21);
    v14 = v71;

    if (v24)
    {
      v27 = v70;

      v67 = v27;
    }
    v15 = v23;
    v9 = v22;
    v11 = v66;
LABEL_30:
    ++v15;
  }
  while (v15 < v6);
  v8 = v56;
  a2 = v57;
  if (v57)
LABEL_7:
    *a2 = objc_retainAutorelease(v14);
LABEL_8:
  if (v65)
    *v65 = objc_retainAutorelease(v67);

}

id _SpokenValueFromElementValue(void *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(a1, "objectForKey:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = v3;

  return v4;
}

void _AppendValueToPhoneNumbersInRange(id *a1, id *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v11 = a4;
  if (a6)
  {
    v12 = 0;
    v13 = 0;
  }
  else
  {
    if (!*a1)
      *a1 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    objc_msgSend(*a1, "addObject:", v12);
    if (a2)
    {
      if (!*a2)
        *a2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v13 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      objc_msgSend(*a2, "addObject:", v13);
    }
    else
    {
      v13 = 0;
    }
    a5 = objc_msgSend(*a1, "count") - 1;
    a6 = 1;
  }
  v14 = a5 - 1;
  v18 = v11;
  if (v11)
    v15 = v11;
  else
    v15 = v19;
  do
  {
    v16 = v12;
    objc_msgSend(*a1, "objectAtIndex:", v14 + a6, v18);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "appendString:", v19);
    if (a2)
    {
      objc_msgSend(*a2, "objectAtIndex:", v14 + a6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "appendString:", v15);
      objc_msgSend(v17, "appendString:", CFSTR(" "));
      v13 = v17;
    }
    --a6;
  }
  while (a6);

}

void _CreateNameDataSourceMap()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("VoiceDialNameDataSources"), CFSTR("plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__nameSourceMap;
    __nameSourceMap = v1;

  }
}

CFStringRef VoiceDialMaidenNameDataSourceCreateMaidenNameFromLastName(const __CFString *a1)
{
  CFIndex Length;
  CFIndex v3;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v6;
  id v7;
  id v8;
  int64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  UniChar v15;
  int64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  CFIndex v22;
  int v23;
  CFIndex v24;
  __int128 v25;
  CFIndex v26;
  CFStringRef v27;
  const __CFAllocator **v28;
  CFIndex v29;
  uint64_t v30;
  uint64_t IsNamePrefixString;
  uint64_t v32;
  CFRange v33;
  CFIndex v34;
  NSObject *v35;
  unint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  CFIndex v39;
  uint64_t v40;
  _BOOL4 v41;
  CFComparisonResult v42;
  uint64_t v43;
  const __CFAllocator *v44;
  uint64_t v45;
  __int128 v47;
  CFIndex range;
  void *range_8;
  const __CFAllocator *alloc;
  CFIndex v51;
  uint64_t v52;
  UniChar buffer[8];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  CFStringRef theString;
  const UniChar *v62;
  const char *v63;
  uint64_t v64;
  CFIndex v65;
  int64_t v66;
  int64_t v67;
  uint8_t buf[4];
  const __CFString *v69;
  __int16 v70;
  CFIndex v71;
  __int16 v72;
  CFIndex v73;
  uint64_t v74;
  CFRange v75;
  CFRange v76;
  CFRange v77;

  v74 = *MEMORY[0x24BDAC8D0];
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  *(_OWORD *)buffer = 0u;
  v54 = 0u;
  Length = CFStringGetLength(a1);
  if (Length < 1)
  {
    v27 = 0;
    v8 = 0;
    v7 = 0;
    goto LABEL_69;
  }
  v3 = Length;
  v51 = Length - 1;
  theString = a1;
  v64 = 0;
  v65 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v62 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v66 = 0;
  v67 = 0;
  v63 = CStringPtr;
  v11 = 1;
  v12 = 64;
  do
  {
    if ((unint64_t)v9 >= 4)
      v13 = 4;
    else
      v13 = v9;
    v14 = v65;
    if (v65 <= v9)
      goto LABEL_29;
    if (v62)
    {
      v15 = v62[v9 + v64];
    }
    else if (v63)
    {
      v15 = v63[v64 + v9];
    }
    else
    {
      v16 = v66;
      if (v67 <= v9 || v66 > v9)
      {
        v18 = -v13;
        v19 = v13 + v6;
        v20 = v12 - v13;
        v21 = v9 + v18;
        v22 = v21 + 64;
        if (v21 + 64 >= v65)
          v22 = v65;
        v66 = v21;
        v67 = v22;
        if (v65 >= v20)
          v14 = v20;
        v75.length = v14 + v19;
        v75.location = v21 + v64;
        CFStringGetCharacters(theString, v75, buffer);
        v16 = v66;
      }
      v15 = buffer[v9 - v16];
    }
    if (v15 == 32)
    {
      if (!v11)
      {
        if (!v8)
          v8 = objc_alloc_init(MEMORY[0x24BDD1698]);
        objc_msgSend(v8, "addIndex:", v9 - 1);
      }
      v23 = 0;
      v11 = 1;
    }
    else
    {
LABEL_29:
      if (v11 == 1)
      {
        if (!v7)
          v7 = objc_alloc_init(MEMORY[0x24BDD1698]);
        objc_msgSend(v7, "addIndex:", v9);
        v11 = 0;
        ++v10;
      }
      else
      {
        v11 = 0;
      }
      v23 = 1;
    }
    ++v9;
    --v6;
    ++v12;
  }
  while (v3 != v9);
  if (v23)
    objc_msgSend(v8, "addIndex:", v51);
  if (v10 < 2)
    goto LABEL_41;
  v24 = objc_msgSend(v7, "firstIndex");
  v26 = v24;
  if (v10 == 2)
  {
    if (_IsNamePrefixString(a1, v24) != -1)
    {
LABEL_41:
      v27 = 0;
      goto LABEL_69;
    }
    v45 = objc_msgSend(v8, "indexGreaterThanOrEqualToIndex:", v26);
    v44 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
LABEL_68:
    v77.length = v45 - v26 + 1;
    v77.location = v26;
    v27 = CFStringCreateWithSubstring(v44, a1, v77);
    goto LABEL_69;
  }
  v28 = (const __CFAllocator **)MEMORY[0x24BDBD240];
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_66;
  alloc = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v52 = 0;
  *(_QWORD *)&v25 = 138412802;
  v47 = v25;
  v29 = v24;
  range = v24;
  range_8 = v8;
  do
  {
    v30 = objc_msgSend(v8, "indexGreaterThanOrEqualToIndex:", v29, v47);
    IsNamePrefixString = _IsNamePrefixString(a1, v29);
    ++v52;
    if (IsNamePrefixString == -1)
    {
      v27 = 0;
    }
    else
    {
      if (v29 == v26)
      {
        v30 = objc_msgSend(v8, "indexGreaterThanOrEqualToIndex:", objc_msgSend(v7, "indexGreaterThanIndex:", IsNamePrefixString - 1));
        v32 = v30 - v26;
        v33.location = v26;
      }
      else
      {
        v34 = CFStringGetLength(a1);
        PHDefaultLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v47;
          v69 = a1;
          v70 = 2048;
          v71 = v29;
          v72 = 2048;
          v73 = v34;
          _os_log_impl(&dword_21DBE2000, v35, OS_LOG_TYPE_DEFAULT, "_IsNameJoinerString name: %@ searchIndex: %lld wordLen: %lld", buf, 0x20u);
        }

        v36 = 0;
        v37 = -1;
        do
        {
          v38 = __SingleNameJoiners[v36];
          v39 = CFStringGetLength(v38);
          v40 = v39 + v29;
          if (v39 + v29 <= v34)
          {
            v76.length = v39;
            v76.location = v29;
            v42 = CFStringCompareWithOptions(a1, v38, v76, 1uLL);
            v41 = v42 == kCFCompareEqualTo;
            if (v42 == kCFCompareEqualTo)
              v37 = v40;
          }
          else
          {
            v41 = 0;
          }
          if (v36 > 1)
            break;
          ++v36;
        }
        while (!v41);
        if (v37 == -1 || (unint64_t)(v10 - v52) < 2)
        {
          v8 = range_8;
          v30 = objc_msgSend(range_8, "indexLessThanIndex:", v29);
          v26 = range;
          v32 = v30 - range;
          v33.location = range;
        }
        else
        {
          v8 = range_8;
          v32 = objc_msgSend(range_8, "indexGreaterThanOrEqualToIndex:", objc_msgSend(v7, "indexGreaterThanIndex:", v37 - 1));
          v33.location = 0;
          v30 = v32;
          v26 = range;
        }
      }
      v33.length = v32 + 1;
      v27 = CFStringCreateWithSubstring(alloc, a1, v33);
    }
    v43 = objc_msgSend(v7, "indexGreaterThanIndex:", v30);
    if (v43 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v29 = v43;
  }
  while (!v27);
  v28 = (const __CFAllocator **)MEMORY[0x24BDBD240];
  if (!v27)
  {
LABEL_66:
    v44 = *v28;
    v45 = objc_msgSend(v8, "indexGreaterThanOrEqualToIndex:", v26);
    goto LABEL_68;
  }
LABEL_69:

  return v27;
}

uint64_t _IsNamePrefixString(const __CFString *a1, CFIndex a2)
{
  CFIndex Length;
  NSObject *v5;
  unint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  CFIndex v9;
  CFIndex v10;
  int v13;
  const __CFString *v14;
  __int16 v15;
  CFIndex v16;
  __int16 v17;
  CFIndex v18;
  uint64_t v19;
  CFRange v20;

  v19 = *MEMORY[0x24BDAC8D0];
  Length = CFStringGetLength(a1);
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = a1;
    v15 = 2048;
    v16 = a2;
    v17 = 2048;
    v18 = Length;
    _os_log_impl(&dword_21DBE2000, v5, OS_LOG_TYPE_DEFAULT, "_IsNamePrefixString name: %@ searchIndex: %lld wordLen: %lld", (uint8_t *)&v13, 0x20u);
  }

  v6 = 0;
  v7 = -1;
  while (1)
  {
    v8 = __SingleNamePrefixes[v6];
    v9 = CFStringGetLength(v8);
    v10 = v9 + a2;
    if (v9 + a2 <= Length)
    {
      v20.length = v9;
      v20.location = a2;
      if (CFStringCompareWithOptions(a1, v8, v20, 1uLL) == kCFCompareEqualTo)
        break;
    }
    if (v6++ >= 4)
      return v7;
  }
  return v10;
}

void VoiceDialCopyNameLabelAndTypeFromRecognitionResult(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, id *a5)
{
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  _QWORD *v18;
  char v19;
  int v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;

  v9 = a1;
  v10 = v9;
  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (v9)
  {
    v22 = objc_msgSend(v9, "elementCount");
    if (v22 >= 1)
    {
      v11 = 0;
      v12 = 0;
      for (i = 0; i != v22; ++i)
      {
        v14 = v12;
        v15 = v11;
        if ((!a2 || *a2) && (!a3 || *a3))
        {
          if (a4)
          {
            if (!a5 && *a4)
              break;
          }
          else if (!a5)
          {
            break;
          }
        }
        v23 = v11;
        v24 = v12;
        objc_msgSend(v10, "getElementClassIdentifier:value:atIndex:", &v24, &v23, i);
        v12 = v24;

        v11 = v23;
        if (v11 && v12)
        {
          if (a2)
          {
            if (!*a2)
            {
              v16 = objc_msgSend(v12, "isEqualToString:", CFSTR("name"));
              v17 = v11;
              v18 = a2;
              if ((v16 & 1) != 0)
                goto LABEL_34;
            }
          }
          if (a3 && !*a3 && objc_msgSend(v12, "isEqualToString:", CFSTR("label")))
            *a3 = objc_retainAutorelease(v11);
          if (a4)
          {
            if (!*a4)
            {
              v19 = objc_msgSend(v12, "isEqualToString:", CFSTR("labeltype-phone"));
              v17 = v12;
              v18 = a4;
              if ((v19 & 1) != 0
                || (v20 = objc_msgSend(v12, "isEqualToString:", CFSTR("labeltype-email")), v17 = v12, v18 = a4, v20))
              {
LABEL_34:
                *v18 = objc_retainAutorelease(v17);
              }
            }
          }
        }
        if (a5 && v11)
        {
          if (*a5)
          {
            objc_msgSend(*a5, "appendString:", CFSTR(" "));
            v21 = *a5;
          }
          else
          {
            v21 = objc_alloc_init(MEMORY[0x24BDD16A8]);
            *a5 = v21;
          }
          objc_msgSend(v21, "appendString:", v11);
        }
      }

    }
  }

}

void VoiceDialCopyNamesLabelAndTypeFromRecognitionResults(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = v7;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v19 = a2;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v22;
    while (1)
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v15);

        v20 = 0;
        if (a3)
        {
          if (*a3)
            v17 = 0;
          else
            v17 = a3;
          if (!a4)
          {
LABEL_19:
            v18 = 0;
            goto LABEL_20;
          }
        }
        else
        {
          v17 = 0;
          if (!a4)
            goto LABEL_19;
        }
        if (*a4)
          v18 = 0;
        else
          v18 = a4;
LABEL_20:
        VoiceDialCopyNameLabelAndTypeFromRecognitionResult(v13, &v20, v17, v18, 0);
        v12 = v20;
        if (v12)
        {
          if (!v11)
            v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v11, "addObject:", v12, v19);
        }
        ++v15;
        v16 = v13;
      }
      while (v10 != v15);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v10)
      {

        a2 = v19;
        if (v19)
          goto LABEL_27;
        goto LABEL_28;
      }
    }
  }
  v11 = 0;
  v12 = 0;
  if (a2)
LABEL_27:
    *a2 = objc_retainAutorelease(v11);
LABEL_28:

}

void VoiceDialSendNameAndExtendedLabelMatches(const void *a1, void *a2, int a3, int a4, void *a5, void *a6, void *a7, uint64_t (*a8)(id, __CFString *, const void *, uint64_t, _QWORD, _QWORD, uint64_t), uint64_t a9)
{
  id v15;
  id v16;
  uint64_t v17;
  const __CFArray *v18;
  const __CFArray *v19;
  CFIndex Count;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFTypeRef v24;
  CFTypeRef v25;
  CFIndex v26;
  const void *ValueAtIndex;
  CFIndex v28;
  CFIndex v29;
  CFIndex v30;
  int v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  const void *v35;
  uint64_t v36;
  uint64_t IdentifierAtIndex;
  CFIndex v38;
  CFIndex v39;
  CFIndex v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  const void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  CFIndex v48;
  const __CFArray *v49;
  int v50;
  int v51;
  unint64_t v52;
  CFIndex v53;
  unsigned int v54;
  unsigned int property;
  void *v56;
  unsigned int v58;
  id v59;
  __CFString *v60;

  v59 = a2;
  v60 = a5;
  v15 = a6;
  v16 = a7;
  v56 = v15;
  v17 = objc_msgSend(v15, "length");
  if (v16)
  {
    v51 = objc_msgSend(v16, "isEqualToString:", CFSTR("labeltype-phone"));
    v50 = objc_msgSend(v16, "isEqualToString:", CFSTR("labeltype-email"));
    if (!a1)
      goto LABEL_55;
  }
  else
  {
    v50 = 1;
    v51 = 1;
    if (!a1)
      goto LABEL_55;
  }
  if (v60)
  {
    v18 = ABAddressBookCopyPeopleWithName(a1, v60);
    v19 = v18;
    v47 = v16;
    if (v18)
      Count = CFArrayGetCount(v18);
    else
      Count = 0;
    v21 = objc_msgSend(v59, "nameTypes");
    v22 = v21 | 3;
    if (!a3)
      v22 = v21;
    v23 = 8;
    if (!a4)
      v23 = 0;
    if (Count >= 1)
    {
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v52 = v22 & 0xFFFFFFFFFFFFFFF7 | v23;
      property = *MEMORY[0x24BE028C0];
      v54 = *MEMORY[0x24BE02718];
      v48 = Count;
      v49 = v19;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v19, v26);
        v58 = objc_msgSend(v59, "matchingNameType:fromTypes:forPerson:", v60, v52, ValueAtIndex);
        if (v58 == -1)
        {
          v31 = 1;
          goto LABEL_51;
        }
        if (v51)
          v25 = ABRecordCopyValue(ValueAtIndex, property);
        if (v50)
          v24 = ABRecordCopyValue(ValueAtIndex, v54);
        v53 = v26;
        if (v25)
        {
          v28 = ABMultiValueGetCount(v25);
          if (v28 >= 1)
          {
            v29 = v28;
            v30 = 0;
            v31 = 1;
            while (v17)
            {
              v32 = (__CFString *)ABMultiValueCopyLabelAtIndex(v25, v30);
              if (v32)
              {
                v33 = v32;
                v34 = VoiceDialCopySpokenLocalizedLabel(v32);
                if (v34)
                {
                  v35 = v34;
                  v36 = objc_msgSend(v56, "caseInsensitiveCompare:", v34);
                  CFRelease(v35);
                  CFRelease(v33);
                  if (!v36)
                    break;
                }
                else
                {
                  CFRelease(v33);
                }
              }
LABEL_30:
              if (v29 == ++v30)
                goto LABEL_36;
            }
            IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v25, v30);
            if ((_DWORD)IdentifierAtIndex != -1)
              v31 = a8(v59, v60, ValueAtIndex, IdentifierAtIndex, property, v58, a9);
            goto LABEL_30;
          }
          v31 = 1;
LABEL_36:
          CFRelease(v25);
          if (!v24)
            goto LABEL_48;
        }
        else
        {
          v31 = 1;
          if (!v24)
            goto LABEL_48;
        }
        if (v31)
        {
          v38 = ABMultiValueGetCount(v24);
          if (v38 >= 1)
          {
            v39 = v38;
            v40 = 0;
            while (v17)
            {
              v41 = (__CFString *)ABMultiValueCopyLabelAtIndex(v24, v40);
              if (v41)
              {
                v42 = v41;
                v43 = VoiceDialCopySpokenLocalizedLabel(v41);
                if (v43)
                {
                  v44 = v43;
                  v45 = objc_msgSend(v56, "caseInsensitiveCompare:", v43);
                  CFRelease(v44);
                  CFRelease(v42);
                  if (!v45)
                    break;
                }
                else
                {
                  CFRelease(v42);
                }
              }
LABEL_47:
              if (v39 == ++v40)
                goto LABEL_48;
            }
            v46 = ABMultiValueGetIdentifierAtIndex(v24, v40);
            if ((_DWORD)v46 != -1)
              v31 = a8(v59, v60, ValueAtIndex, v46, v54, v58, a9);
            goto LABEL_47;
          }
LABEL_49:
          Count = v48;
          v19 = v49;
          v26 = v53;
          CFRelease(v24);
          goto LABEL_51;
        }
LABEL_48:
        if (v24)
          goto LABEL_49;
        Count = v48;
        v19 = v49;
        v26 = v53;
LABEL_51:
        ++v26;
      }
      while (v26 < Count && v31 == 1);
    }
    v16 = v47;
    if (v19)
      CFRelease(v19);
  }
LABEL_55:

}

void *VoiceDialCopySpokenLocalizedLabel(void *key)
{
  void *Value;

  if (!key)
    return 0;
  if (!__VoiceDialLocalizedLabels
    || (Value = (void *)CFDictionaryGetValue((CFDictionaryRef)__VoiceDialLocalizedLabels, key)) == 0)
  {
    Value = key;
  }
  CFRetain(Value);
  return Value;
}

id VoiceDialCopyMostLikelyNumberWithPersonAndLabel(uint64_t a1, uint64_t a2)
{
  id result;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  result = 0;
  v33 = *MEMORY[0x24BDAC8D0];
  if (a1 && a2)
  {
    objc_msgSend(MEMORY[0x24BDBACA0], "contactFromPerson:keysToFetch:");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBAD20], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)v5;
    objc_msgSend(v6, "entriesForContact:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (!v9)
    {
      v25 = 0;
      goto LABEL_18;
    }
    v10 = v9;
    v25 = 0;
    v26 = a2;
    v11 = *(_QWORD *)v29;
    v12 = *MEMORY[0x24BDBA210];
    v13 = *MEMORY[0x24BDBA208];
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "contactProperty");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "actionType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqual:", v12) & 1) == 0)
          goto LABEL_13;
        objc_msgSend(v15, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isEqual:", v13) & 1) == 0)
        {

LABEL_13:
          goto LABEL_14;
        }
        objc_msgSend(v16, "label");
        v19 = v12;
        v20 = v11;
        v21 = v13;
        v22 = v8;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v23, "caseInsensitiveCompare:", v26);

        v8 = v22;
        v13 = v21;
        v11 = v20;
        v12 = v19;

        if (!v27)
          v25 = stringValueForContactProperty(v16);
LABEL_14:

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (!v10)
      {
LABEL_18:

        return v25;
      }
    }
  }
  return result;
}

id stringValueForContactProperty(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "stringValue");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = 0;
      goto LABEL_7;
    }
    v2 = v1;
  }
  v3 = v2;
LABEL_7:

  return v3;
}

void *VoiceDialGetMostLikelyFacetimeContactWithPersonAndLabel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x24BDBACA0], "contactFromPerson:keysToFetch:", a1, MEMORY[0x24BDBD1A8]);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBAD20], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)v3;
  objc_msgSend(v4, "entriesForContact:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  v40 = a2;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    v9 = *MEMORY[0x24BDBA248];
    v10 = *MEMORY[0x24BDBA200];
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v8)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v11);
      objc_msgSend(v12, "contactProperty");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "actionType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "isEqual:", v9))
        goto LABEL_13;
      objc_msgSend(v12, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "isEqual:", v10))
        break;
      if (!a2)
      {

LABEL_17:
        v18 = stringValueForContactProperty(v13);
        if (v18)
        {
          v35 = v18;
LABEL_39:
          v34 = v37;

          goto LABEL_40;
        }
        goto LABEL_14;
      }
      objc_msgSend(v13, "label");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "caseInsensitiveCompare:", v40);

      a2 = v40;
      if (!v17)
        goto LABEL_17;
LABEL_14:

      if (v7 == ++v11)
      {
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        v7 = v19;
        if (v19)
          goto LABEL_4;
        goto LABEL_20;
      }
    }

LABEL_13:
    goto LABEL_14;
  }
LABEL_20:

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v39 = obj;
  v20 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v43;
    v23 = 0x24BE50000uLL;
    v24 = 0x24BE50000uLL;
    while (2)
    {
      v25 = 0;
      v38 = v21;
      do
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v39);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v25), "contactProperty");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        stringValueForContactProperty(v13);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        IMCleanupPhoneNumber();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v23 + 760), "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v24 + 880), "facetimeService");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "statusForID:onService:", v26, v28) == 1)
        {
          if (v40)
          {
            objc_msgSend(v13, "label");
            v29 = v23;
            v30 = v22;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "caseInsensitiveCompare:", v40);

            v22 = v30;
            v23 = v29;
            v24 = 0x24BE50000;

            if (v32)
              v33 = 1;
            else
              v33 = v35 == 0;
            v21 = v38;
            if (!v33)
            {
LABEL_38:

              goto LABEL_39;
            }
          }
          else
          {

            v21 = v38;
            if (v35)
              goto LABEL_38;
          }
        }
        else
        {

        }
        ++v25;
      }
      while (v21 != v25);
      v21 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      v35 = 0;
      v34 = v37;
      if (v21)
        continue;
      break;
    }
  }
  else
  {
    v35 = 0;
    v34 = v37;
  }
LABEL_40:

  return v35;
}

BOOL VoiceDialPersonIsCompany(const void *a1)
{
  const __CFNumber *v1;
  const __CFNumber *v2;
  _BOOL8 v3;

  v1 = (const __CFNumber *)ABRecordCopyValue(a1, *MEMORY[0x24BE02808]);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = CFNumberCompare(v1, (CFNumberRef)*MEMORY[0x24BE027F8], 0) == kCFCompareEqualTo;
  CFRelease(v2);
  return v3;
}

void VoiceDialAppendCompositeNamePropertyValue(CFMutableStringRef *a1, ABRecordRef record, ABPropertyID property, ABPropertyID a4, ABPropertyID a5, char a6, _BYTE *a7, const __CFString *cf, int a9)
{
  const __CFString *v9;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  __CFString *Mutable;

  v9 = cf;
  if ((a6 & 1) != 0 || *MEMORY[0x24BE02848] != property)
  {
    if (property == a9)
    {
      if (!cf)
        return;
      CFRetain(cf);
    }
    else
    {
      v9 = (const __CFString *)ABRecordCopyValue(record, property);
      if (!v9)
        return;
    }
    if (CFStringGetLength(v9) < 1)
    {
      v16 = v9;
LABEL_22:
      CFRelease(v16);
      return;
    }
    if ((a6 & 2) == 0)
      goto LABEL_10;
    v17 = (const __CFString *)ABRecordCopyValue(record, a4);
    if (v17)
    {
      v16 = v17;
      if (CFStringGetLength(v17))
      {
LABEL_17:
        CFRelease(v9);
        *a7 = 1;
        goto LABEL_18;
      }
      CFRelease(v16);
    }
    v18 = (const __CFString *)ABRecordCopyValue(record, a5);
    if (v18)
    {
      v16 = v18;
      if (CFStringGetLength(v18))
        goto LABEL_17;
      CFRelease(v16);
    }
LABEL_10:
    v16 = v9;
LABEL_18:
    if (*a1)
    {
      CFStringAppend(*a1, CFSTR(" "));
      Mutable = *a1;
    }
    else
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      *a1 = Mutable;
    }
    CFStringAppend(Mutable, v16);
    goto LABEL_22;
  }
}

CFMutableStringRef VoiceDialPersonCopyCompositeNameWithSubstitution(ABRecordRef record, const __CFString *a2, int a3, char a4)
{
  ABPropertyID *v8;
  const __CFString *v9;
  CFMutableStringRef v10;
  CFIndex Length;
  const __CFString *v12;
  _BOOL4 v13;
  ABPersonCompositeNameFormat CompositeNameFormatForRecord;
  ABPropertyID v15;
  ABPropertyID v16;
  ABPropertyID v17;
  ABPropertyID v18;
  ABPropertyID v19;
  ABPropertyID v20;
  ABPropertyID v21;
  ABPropertyID v22;
  ABPropertyID v23;
  ABPropertyID v24;
  char v26;
  CFMutableStringRef v27;

  v27 = 0;
  v26 = 0;
  v8 = (ABPropertyID *)MEMORY[0x24BE02848];
  if ((a4 & 8) != 0)
  {
    v9 = (const __CFString *)ABRecordCopyValue(record, *MEMORY[0x24BE02848]);
    v10 = (CFMutableStringRef)v9;
    if (!v9)
      return v10;
    Length = CFStringGetLength(v9);
    CFRelease(v10);
    if (!Length)
      return 0;
  }
  if (VoiceDialPersonIsCompany(record))
  {
    v12 = (const __CFString *)ABRecordCopyValue(record, *MEMORY[0x24BE02868]);
    v27 = (CFMutableStringRef)v12;
    if (v12)
    {
      v10 = (CFMutableStringRef)v12;
      if (CFStringGetLength(v12))
      {
        v13 = 1;
        goto LABEL_37;
      }
      CFRelease(v10);
      v27 = 0;
    }
  }
  CompositeNameFormatForRecord = ABPersonGetCompositeNameFormatForRecord(0);
  if (CompositeNameFormatForRecord)
    v15 = *MEMORY[0x24BE02838];
  else
    v15 = *MEMORY[0x24BE02810];
  if (CompositeNameFormatForRecord)
    v16 = *MEMORY[0x24BE02748];
  else
    v16 = *MEMORY[0x24BE02838];
  if (CompositeNameFormatForRecord)
    v17 = *MEMORY[0x24BE02810];
  else
    v17 = *MEMORY[0x24BE02748];
  if (CompositeNameFormatForRecord)
    v18 = *MEMORY[0x24BE02840];
  else
    v18 = *MEMORY[0x24BE02818];
  if (CompositeNameFormatForRecord)
    v19 = *MEMORY[0x24BE02750];
  else
    v19 = *MEMORY[0x24BE02840];
  if (CompositeNameFormatForRecord)
    v20 = *MEMORY[0x24BE02818];
  else
    v20 = *MEMORY[0x24BE02750];
  v21 = *v8;
  if (CompositeNameFormatForRecord)
    v22 = *v8;
  else
    v22 = *MEMORY[0x24BE02820];
  if (CompositeNameFormatForRecord)
    v23 = *MEMORY[0x24BE02758];
  else
    v23 = v21;
  if (CompositeNameFormatForRecord)
    v24 = *MEMORY[0x24BE02820];
  else
    v24 = *MEMORY[0x24BE02758];
  VoiceDialAppendCompositeNamePropertyValue(&v27, record, v24, v20, v17, a4, &v26, a2, a3);
  VoiceDialAppendCompositeNamePropertyValue(&v27, record, v23, v19, v16, a4, &v26, a2, a3);
  VoiceDialAppendCompositeNamePropertyValue(&v27, record, v22, v18, v15, a4, &v26, a2, a3);
  v10 = v27;
  v13 = v26 == 0;
LABEL_37:
  if ((a4 & 4) != 0 && v13 && v10)
  {
    CFRelease(v10);
    return 0;
  }
  return v10;
}

CFMutableStringRef VoiceDialPersonCopyCompositeName(const void *a1, char a2)
{
  return VoiceDialPersonCopyCompositeNameWithSubstitution(a1, 0, -1, a2);
}

id VoiceDialCopyErrorActionForResult(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *Status;
  const __CFString *v13;

  v1 = (objc_class *)MEMORY[0x24BE04788];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = objc_msgSend(v3, "airplaneMode");

  objc_msgSend(v2, "valueOfFirstElementWithClassIdentifier:", CFSTR("facetime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "recognitionAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v6, "sensitiveActionsEnabled");
  if ((v2 & 1) != 0)
  {
    if (!v4)
    {
      if (v5)
      {
        if ((objc_msgSend(MEMORY[0x24BEB4930], "isFaceTimeVideoAvailable") & 1) == 0)
        {
          v7 = objc_alloc(MEMORY[0x24BEC0DD8]);
          v8 = CFSTR("FACETIME_NOT_ENABLED");
          goto LABEL_5;
        }
      }
      else
      {
        Status = (const __CFString *)CTRegistrationGetStatus();
        if (Status)
        {
          v13 = Status;
          if (CFStringCompare(Status, (CFStringRef)*MEMORY[0x24BDC2C60], 0))
          {
            if (CFStringCompare(v13, (CFStringRef)*MEMORY[0x24BDC2C68], 0))
            {
              v7 = objc_alloc(MEMORY[0x24BEC0DD8]);
              v8 = CFSTR("NOT_REGISTERED");
              goto LABEL_5;
            }
          }
        }
      }
      v10 = 0;
      return v10;
    }
    v7 = objc_alloc(MEMORY[0x24BEC0DD8]);
    v8 = CFSTR("AIRPLANE_MODE_ON");
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BEC0DD8]);
    v8 = CFSTR("SENSITIVE_ACTIONS_OFF");
  }
LABEL_5:
  VoiceDialSpokenLocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithSpokenFeedbackString:willTerminate:", v9, 1);

  return v10;
}

id VoiceDialSpokenLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  VoiceDialSpokenLocalizedStringIfAvailable(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    VoiceDialBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", v1, &stru_24E19F250, CFSTR("Feedback"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id VoiceDialBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)VoiceDialBundle___vdBundle;
  if (!VoiceDialBundle___vdBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)VoiceDialBundle___vdBundle;
    VoiceDialBundle___vdBundle = v1;

    v0 = (void *)VoiceDialBundle___vdBundle;
  }
  return v0;
}

id VoiceDialSpokenLocalizedStringIfAvailable(void *a1)
{
  id v1;
  const void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v1 = a1;
  v2 = (const void *)VSPreferencesCopySpokenLanguageIdentifier();
  pthread_mutex_lock(&VoiceDialSpokenLocalizedStringIfAvailable___locStringCacheLock);
  if (VoiceDialSpokenLocalizedStringIfAvailable___locStringCache)
  {
    v3 = objc_msgSend((id)VoiceDialSpokenLocalizedStringIfAvailable___locStringCachedLanguageID, "isEqualToString:", v2);
    v4 = (void *)VoiceDialSpokenLocalizedStringIfAvailable___locStringCache;
    if ((v3 & 1) != 0)
    {
      v5 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    v4 = 0;
  }
  VoiceDialSpokenLocalizedStringIfAvailable___locStringCache = 0;

  if (VoiceDialSpokenLocalizedStringIfAvailable___locStringCachedLanguageID)
    CFRelease((CFTypeRef)VoiceDialSpokenLocalizedStringIfAvailable___locStringCachedLanguageID);
  VoiceDialSpokenLocalizedStringIfAvailable___locStringCachedLanguageID = 0;
  if (v2)
  {
    VoiceDialBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSRecognitionModelCopyResourceURL();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v5);
      v8 = (void *)VoiceDialSpokenLocalizedStringIfAvailable___locStringCache;
      VoiceDialSpokenLocalizedStringIfAvailable___locStringCache = v7;

    }
    VoiceDialSpokenLocalizedStringIfAvailable___locStringCachedLanguageID = (uint64_t)v2;
    CFRetain(v2);
  }
  else
  {
    v5 = 0;
  }
  v4 = (void *)VoiceDialSpokenLocalizedStringIfAvailable___locStringCache;
  if (!VoiceDialSpokenLocalizedStringIfAvailable___locStringCache)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    v10 = (void *)VoiceDialSpokenLocalizedStringIfAvailable___locStringCache;
    VoiceDialSpokenLocalizedStringIfAvailable___locStringCache = (uint64_t)v9;

    v4 = (void *)VoiceDialSpokenLocalizedStringIfAvailable___locStringCache;
  }
LABEL_14:
  objc_msgSend(v4, "objectForKey:", v1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(&VoiceDialSpokenLocalizedStringIfAvailable___locStringCacheLock);
  if (v2)
    CFRelease(v2);

  return v11;
}

void VoiceDialConfigureSpokenLocalizedLabel(int a1)
{
  void *v1;
  uint64_t v2;
  const void *v3;
  char v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a1)
  {
    MEMORY[0x22079BD98]();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "count"))
    {
      objc_msgSend(v1, "objectAtIndex:", 0);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (const void *)__VoiceDialLocalizedLabels;
      if (!__VoiceDialLocalizedLabels)
      {
        v9 = (id)v2;
        v5 = 0;
LABEL_15:
        if (v1 && !v5)
        {
          __VoiceDialLocalizedLabels = ABAddressBookCopyLocalizedStringsForLanguageArray();
          v6 = v9;
          goto LABEL_18;
        }
        goto LABEL_19;
      }
      if (v2)
      {
        v9 = (id)v2;
        v4 = objc_msgSend((id)__VoiceDialLocalizedLabelLanguageCode, "isEqualToString:");
        v3 = (const void *)__VoiceDialLocalizedLabels;
        v5 = __VoiceDialLocalizedLabels;
        if ((v4 & 1) != 0)
          goto LABEL_15;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
      v5 = 0;
      v3 = (const void *)__VoiceDialLocalizedLabels;
      if (!__VoiceDialLocalizedLabels)
        goto LABEL_15;
    }
    CFRelease(v3);
    __VoiceDialLocalizedLabels = 0;
    v7 = (void *)__VoiceDialLocalizedLabelLanguageCode;
    __VoiceDialLocalizedLabelLanguageCode = 0;

    v5 = __VoiceDialLocalizedLabels;
    goto LABEL_15;
  }
  if (__VoiceDialLocalizedLabels)
  {
    CFRelease((CFTypeRef)__VoiceDialLocalizedLabels);
    v6 = 0;
    v1 = 0;
    __VoiceDialLocalizedLabels = 0;
LABEL_18:
    v9 = v6;
    v8 = (void *)__VoiceDialLocalizedLabelLanguageCode;
    __VoiceDialLocalizedLabelLanguageCode = (uint64_t)v6;

    goto LABEL_19;
  }
  v9 = 0;
  v1 = 0;
LABEL_19:

}

id VoiceDialNumberToDialForNumber(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = VoiceDialNumberToDialForNumber___InternationalAssistFunction;
  if (VoiceDialNumberToDialForNumber___InternationalAssistFunction
    || ((v3 = (void *)VoiceDialTelephonyUtilitiesFrameworkHandle()) == 0
      ? (v2 = VoiceDialNumberToDialForNumber___InternationalAssistFunction)
      : (v2 = dlsym(v3, "TUNumberToDial"), VoiceDialNumberToDialForNumber___InternationalAssistFunction = v2),
        v4 = v1,
        v2))
  {
    ((void (*)(id, _QWORD, _QWORD, _QWORD, _QWORD))v2)(v1, 0, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t VoiceDialTelephonyUtilitiesFrameworkHandle()
{
  uint64_t result;
  id v1;

  result = VoiceDialTelephonyUtilitiesFrameworkHandle___TelephonyUtilitiesHandle;
  if (!VoiceDialTelephonyUtilitiesFrameworkHandle___TelephonyUtilitiesHandle)
  {
    objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities"));
    v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    VoiceDialTelephonyUtilitiesFrameworkHandle___TelephonyUtilitiesHandle = (uint64_t)dlopen((const char *)objc_msgSend(v1, "fileSystemRepresentation"), 2);

    return VoiceDialTelephonyUtilitiesFrameworkHandle___TelephonyUtilitiesHandle;
  }
  return result;
}

uint64_t _VoiceDialAddressBookChangedCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_handleAddressBookChanged");
}

void sub_21DBEBBB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_21DBEC604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DBEC9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Block_object_dispose((const void *)(v29 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t _VoiceDialAddressBookPrefsChangedCallBack()
{
  return VSRecognitionModelDataProviderChanged();
}

uint64_t _VoiceDialPreferencesChangedCallBack()
{
  return VSRecognitionModelDataProviderChanged();
}

uint64_t _ResultValidationAddressBookCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if (a7)
    *a7 = 1;
  return 0;
}

uint64_t _ResultDisambiguationAddressBookCallback(void *a1, void *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void **v30;
  void *v31;
  uint64_t v32;
  id v34;
  unint64_t v35;
  id v36;

  v10 = a1;
  v11 = a2;
  v12 = a7;
  v13 = (void *)ABRecordCopyValue(a3, objc_msgSend(v12, "previousNameProperty"));
  if (!v13
    || (objc_msgSend(v12, "previousName"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v13, "caseInsensitiveCompare:", v14),
        v14,
        v15))
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_22;
  }
  v34 = v11;
  v18 = objc_msgSend(v10, "personNameCount");
  if (v18)
  {
    v19 = v18;
    v35 = 0;
    v17 = 0;
    v16 = 0;
    v20 = 0;
    while (1)
    {
      if (objc_msgSend(v10, "typeOfNameAtIndex:", v20) == 2)
      {
        v36 = v16;
        v21 = objc_msgSend(v10, "getName:phoneticName:atIndex:forPerson:", &v36, 0, v20, a3);
        v22 = v36;

        if (!v21)
          goto LABEL_12;
        objc_msgSend(v12, "matchedName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "caseInsensitiveCompare:", v23);

        if (!v24)
        {
          v16 = v22;
          goto LABEL_21;
        }
        if (!v22)
        {
          v16 = 0;
          goto LABEL_14;
        }
        v25 = objc_msgSend(v22, "length");
        if (v25 > v35)
        {
          v26 = v25;
          v16 = v22;

          v17 = v16;
          v35 = v26;
        }
        else
        {
LABEL_12:
          v16 = v22;
        }
      }
LABEL_14:
      if (++v20 >= v19)
        goto LABEL_17;
    }
  }
  v16 = 0;
  v17 = 0;
LABEL_17:
  objc_msgSend(v12, "matchedName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "caseInsensitiveCompare:", v13);

  if (v28 && v17)
  {
    objc_msgSend(*(id *)objc_msgSend(v12, "result"), "recognitionResultByReplacingValueForClassIdentifier:withValue:", CFSTR("name"), v17);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void **)objc_msgSend(v12, "result");
    v31 = *v30;
    *v30 = (void *)v29;

  }
LABEL_21:
  v11 = v34;
  objc_msgSend(v12, "setResultFound:", 1);
LABEL_22:
  v32 = objc_msgSend(v12, "resultFound") ^ 1;

  return v32;
}

uint64_t ABAddressBookCopyAllLabelsForProperty()
{
  return MEMORY[0x24BE022E0]();
}

uint64_t ABAddressBookCopyChangesSinceSequenceNumber()
{
  return MEMORY[0x24BE02320]();
}

CFStringRef ABAddressBookCopyLocalizedLabel(CFStringRef label)
{
  return (CFStringRef)MEMORY[0x24BE02338](label);
}

uint64_t ABAddressBookCopyLocalizedStringsForLanguageArray()
{
  return MEMORY[0x24BE02340]();
}

CFArrayRef ABAddressBookCopyPeopleWithName(ABAddressBookRef addressBook, CFStringRef name)
{
  return (CFArrayRef)MEMORY[0x24BE02350](addressBook, name);
}

uint64_t ABAddressBookCopyUniqueIdentifier()
{
  return MEMORY[0x24BE02368]();
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return (ABAddressBookRef)MEMORY[0x24BE02380](options, error);
}

CFIndex ABAddressBookGetPersonCount(ABAddressBookRef addressBook)
{
  return MEMORY[0x24BE02390](addressBook);
}

uint64_t ABAddressBookGetSequenceNumber()
{
  return MEMORY[0x24BE023A8]();
}

uint64_t ABAddressBookInvalidateCaches()
{
  return MEMORY[0x24BE023B0]();
}

void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
  MEMORY[0x24BE023C8](addressBook, callback, context);
}

void ABAddressBookRevert(ABAddressBookRef addressBook)
{
  MEMORY[0x24BE023E0](addressBook);
}

void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
  MEMORY[0x24BE02410](addressBook, callback, context);
}

uint64_t ABCopyArrayOfPeopleAtOffset()
{
  return MEMORY[0x24BE02448]();
}

CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFStringRef)MEMORY[0x24BE024A0](multiValue, index);
}

CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFTypeRef)MEMORY[0x24BE024A8](multiValue, index);
}

CFIndex ABMultiValueGetCount(ABMultiValueRef multiValue)
{
  return MEMORY[0x24BE024C0](multiValue);
}

ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return MEMORY[0x24BE024C8](multiValue, index);
}

CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef multiValue, ABMultiValueIdentifier identifier)
{
  return MEMORY[0x24BE024D0](multiValue, *(_QWORD *)&identifier);
}

ABPersonCompositeNameFormat ABPersonGetCompositeNameFormatForRecord(ABRecordRef record)
{
  return MEMORY[0x24BE02530](record);
}

CFStringRef ABRecordCopyCompositeName(ABRecordRef record)
{
  return (CFStringRef)MEMORY[0x24BE02598](record);
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x24BE025A0](record, *(_QWORD *)&property);
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x24BE025B8](record);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x24BDBC098](number, otherNumber, context);
}

uint64_t CFPhoneNumberCopyUnformattedRepresentation()
{
  return MEMORY[0x24BE04610]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x24BE04618]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4E0](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

uint64_t CTRegistrationGetStatus()
{
  return MEMORY[0x24BDC2678]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x24BE3D630]();
}

uint64_t IMCleanupPhoneNumber()
{
  return MEMORY[0x24BE50658]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t PNIsValidPhoneNumberForCountry()
{
  return MEMORY[0x24BE047A8]();
}

uint64_t TUFormattedPhoneNumber()
{
  return MEMORY[0x24BEB4B38]();
}

uint64_t TUHomeCountryCode()
{
  return MEMORY[0x24BEB4B48]();
}

uint64_t TUNetworkCountryCode()
{
  return MEMORY[0x24BEB4B50]();
}

uint64_t TUStringsAreEqualOrNil()
{
  return MEMORY[0x24BEB4B80]();
}

uint64_t VSPreferencesCopySpokenLanguageIdentifier()
{
  return MEMORY[0x24BEC0E88]();
}

uint64_t VSRecognitionModelCopyActiveLanguageIdentifier()
{
  return MEMORY[0x24BEC0E98]();
}

uint64_t VSRecognitionModelCopyActiveLanguageIdentifierArray()
{
  return MEMORY[0x24BEC0EA0]();
}

uint64_t VSRecognitionModelCopyLanguageResourceURL()
{
  return MEMORY[0x24BEC0EA8]();
}

uint64_t VSRecognitionModelCopyResourceURL()
{
  return MEMORY[0x24BEC0EB0]();
}

uint64_t VSRecognitionModelDataProviderChanged()
{
  return MEMORY[0x24BEC0EB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

