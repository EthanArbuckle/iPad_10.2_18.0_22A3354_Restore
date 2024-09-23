@implementation ICMusicSubscriptionStatus

- (int64_t)statusType
{
  return self->_statusType;
}

- (ICMusicSubscriptionStatus)initWithResponseDictionary:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t j;
  uint64_t v71;
  ICMusicSubscriptionStatusTerms *v72;
  uint64_t v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  ICMusicSubscriptionStatus *v87;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  id v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint8_t v123[128];
  uint8_t buf[4];
  id v125;
  __int16 v126;
  uint64_t v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ICMusicSubscriptionStatus _init](self, "_init");

  v114 = v5;
  if (!v5)
    goto LABEL_130;
  v6 = v4;
  objc_msgSend(v6, "objectForKey:", CFSTR("_ICMusicSubscriptionStatusAdditionalProperties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("_ICMusicSubscriptionStatusAdditionalProperties"));
    v8 = (void *)objc_msgSend(v9, "copy");

  }
  v10 = objc_msgSend(v8, "copy");
  v11 = (void *)*((_QWORD *)v114 + 1);
  *((_QWORD *)v114 + 1) = v10;

  objc_msgSend(v6, "objectForKey:", CFSTR("account"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v12;
  v111 = v8;
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("isMinor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)v114 + 16) = objc_msgSend(v13, "BOOLValue");
    objc_msgSend(v12, "objectForKey:", CFSTR("studentExpirationDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("verifications"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("student"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        v105 = v4;
        v17 = v7;
        objc_msgSend(v16, "objectForKey:", CFSTR("verificationId"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSString())
        {
          v19 = objc_msgSend(v18, "copy");
          v20 = (void *)*((_QWORD *)v114 + 4);
          *((_QWORD *)v114 + 4) = v19;

        }
        v21 = v6;
        objc_msgSend(v16, "objectForKey:", CFSTR("verifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSString())
        {
          v23 = objc_msgSend(v22, "copy");
          v24 = (void *)*((_QWORD *)v114 + 5);
          *((_QWORD *)v114 + 5) = v23;

        }
        objc_msgSend(v16, "objectForKey:", CFSTR("expirationDate"));
        v25 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v25;
        v7 = v17;
        v12 = v110;
        v8 = v111;
        v6 = v21;
        v4 = v105;
      }

    }
    +[ICMusicSubscriptionStatus dateFromMilliseconds:](ICMusicSubscriptionStatus, "dateFromMilliseconds:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_storeStrong((id *)v114 + 3, v26);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("family"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v113, "objectForKey:", CFSTR("hasFamily"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)v114 + 48) = objc_msgSend(v27, "BOOLValue");
    objc_msgSend(v113, "objectForKey:", CFSTR("hasFamilyGreaterThanOneMember"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)v114 + 49) = objc_msgSend(v28, "BOOLValue");
    objc_msgSend(v113, "objectForKey:", CFSTR("isHoH"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)v114 + 50) = objc_msgSend(v29, "BOOLValue");

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("match"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v112, "objectForKey:", CFSTR("status"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = _NSIsNSString();
    if (v31)
      LOBYTE(v31) = objc_msgSend(v30, "isEqualToString:", CFSTR("Enabled"));
    *((_BYTE *)v114 + 51) = v31;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("music"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v32;
  v109 = v7;
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v32, "objectForKey:", CFSTR("expirationDate"));
    v103 = objc_claimAutoreleasedReturnValue();
    +[ICMusicSubscriptionStatus dateFromMilliseconds:](ICMusicSubscriptionStatus, "dateFromMilliseconds:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      objc_storeStrong((id *)v114 + 7, v33);
    objc_msgSend(v32, "objectForKey:", CFSTR("initialPurchaseTimestamp"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICMusicSubscriptionStatus dateFromMilliseconds:](ICMusicSubscriptionStatus, "dateFromMilliseconds:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      objc_storeStrong((id *)v114 + 8, v34);
    v94 = v34;
    objc_msgSend(v32, "objectForKey:", CFSTR("serviceBeginsTimestamp"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICMusicSubscriptionStatus dateFromMilliseconds:](ICMusicSubscriptionStatus, "dateFromMilliseconds:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      objc_storeStrong((id *)v114 + 9, v35);
    objc_msgSend(v32, "objectForKey:", CFSTR("hasOfflineSlots"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)v114 + 80) = objc_msgSend(v102, "BOOLValue");
    objc_msgSend(v32, "objectForKey:", CFSTR("isAutoRenewEnabled"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)v114 + 81) = objc_msgSend(v101, "BOOLValue");
    objc_msgSend(v32, "objectForKey:", CFSTR("isInFreeTrial"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)v114 + 82) = objc_msgSend(v100, "BOOLValue");
    v106 = v4;
    objc_msgSend(v32, "objectForKey:", CFSTR("isNotEligibleForFreeTrial"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)v114 + 83) = objc_msgSend(v99, "BOOLValue") ^ 1;
    v36 = v35;
    objc_msgSend(v32, "objectForKey:", CFSTR("isPurchaser"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_BYTE *)v114 + 84) = objc_msgSend(v98, "BOOLValue");
    v37 = v33;
    objc_msgSend(v32, "objectForKey:", CFSTR("source"));
    v38 = objc_claimAutoreleasedReturnValue();
    v92 = (void *)v38;
    if (_NSIsNSString())
      v39 = (void *)v38;
    else
      v39 = 0;
    v40 = v39;
    v41 = v40;
    if (v40)
    {
      if ((objc_msgSend(v40, "isEqualToString:", CFSTR("Apple")) & 1) != 0)
      {
        v42 = 1;
      }
      else
      {
        if (!objc_msgSend(v41, "isEqualToString:", CFSTR("Carrier")))
          goto LABEL_56;
        v42 = 2;
      }
      *((_QWORD *)v114 + 13) = v42;
    }
LABEL_56:
    objc_msgSend(v32, "objectForKey:", CFSTR("reason"));
    v43 = objc_claimAutoreleasedReturnValue();
    v91 = (void *)v43;
    if (_NSIsNSString())
      v44 = (void *)v43;
    else
      v44 = 0;
    v107 = v44;
    objc_msgSend(v32, "objectForKey:", CFSTR("status"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v37;
    v46 = v36;
    v4 = v106;
    if (_NSIsNSString())
    {
      if (!objc_msgSend(v97, "isEqualToString:", CFSTR("Enabled")))
      {
        if (objc_msgSend(v97, "isEqualToString:", CFSTR("Glide")))
        {
          v48 = 3;
        }
        else
        {
          if (!objc_msgSend(v97, "isEqualToString:", CFSTR("Disabled")))
          {
            if (objc_msgSend(v97, "isEqualToString:", CFSTR("Discovery")))
            {
              *((_BYTE *)v114 + 121) = 1;
            }
            else if (objc_msgSend(v97, "isEqualToString:", CFSTR("Unlinked")))
            {
              *((_QWORD *)v114 + 14) = 1;
              *((_QWORD *)v114 + 11) = 2;
            }
            else
            {
              *((_QWORD *)v114 + 14) = 0;
            }
            goto LABEL_71;
          }
          v48 = 2;
        }
        *((_QWORD *)v114 + 14) = v48;
        goto LABEL_71;
      }
      *((_QWORD *)v114 + 14) = 1;
      v47 = *((_QWORD *)v114 + 13);
      if (v47)
      {
        if (v47 != 2)
          goto LABEL_71;
        goto LABEL_70;
      }
      if (objc_msgSend(v107, "isEqualToString:", CFSTR("Carrier")))
LABEL_70:
        *((_QWORD *)v114 + 11) = 1;
    }
LABEL_71:
    objc_msgSend(v32, "objectForKey:", CFSTR("isUnlinked"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v96, "BOOLValue"))
      *((_QWORD *)v114 + 11) = 2;
    if (!v107)
      goto LABEL_84;
    if ((objc_msgSend(v107, "isEqualToString:", CFSTR("Individual")) & 1) != 0)
    {
      v49 = 1;
    }
    else if ((objc_msgSend(v107, "isEqualToString:", CFSTR("Family")) & 1) != 0)
    {
      v49 = 2;
    }
    else if ((objc_msgSend(v107, "isEqualToString:", CFSTR("Member")) & 1) != 0)
    {
      v49 = 3;
    }
    else
    {
      if (!objc_msgSend(v107, "isEqualToString:", CFSTR("InvalidToken")))
      {
LABEL_84:
        *((_BYTE *)v114 + 168) = objc_msgSend(v32, "ic_BOOLValueForKey:", CFSTR("isPartOfBundle"));
        *((_BYTE *)v114 + 169) = objc_msgSend(v32, "ic_BOOLValueForKey:", CFSTR("ownsBundle"));
        objc_msgSend(v32, "objectForKey:", CFSTR("eligibleOffers"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)v103;
        if (_NSIsNSArray())
        {
          v90 = v41;
          v104 = v6;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v50, "count"));
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = v50;
          v54 = (void *)v52;
          v119 = 0u;
          v120 = 0u;
          v121 = 0u;
          v122 = 0u;
          v89 = v53;
          v55 = v53;
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
          if (v56)
          {
            v57 = v56;
            v58 = *(_QWORD *)v120;
            do
            {
              for (i = 0; i != v57; ++i)
              {
                if (*(_QWORD *)v120 != v58)
                  objc_enumerationMutation(v55);
                v60 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i);
                if (_NSIsNSString())
                {
                  objc_msgSend(v54, "addObject:", v60);
                }
                else
                {
                  v61 = os_log_create("com.apple.amp.iTunesCloud", "Default");
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v125 = v114;
                    v126 = 2114;
                    v127 = v60;
                    _os_log_impl(&dword_1A03E3000, v61, OS_LOG_TYPE_FAULT, "%{public}@ skipping invalid offer value %{public}@", buf, 0x16u);
                  }

                }
              }
              v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
            }
            while (v57);
          }

          v62 = objc_msgSend(v54, "copy");
          v63 = (void *)*((_QWORD *)v114 + 22);
          *((_QWORD *)v114 + 22) = v62;

          v6 = v104;
          v4 = v106;
          v7 = v109;
          v12 = v110;
          v8 = v111;
          v51 = (void *)v103;
          v50 = v89;
          v41 = v90;
        }

        goto LABEL_99;
      }
      v49 = 4;
    }
    *((_QWORD *)v114 + 12) = v49;
    goto LABEL_84;
  }
LABEL_99:
  objc_msgSend(v6, "objectForKey:", CFSTR("terms"), v89);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v65 = v64;
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
    if (v66)
    {
      v67 = v66;
      v68 = 0;
      v69 = *(_QWORD *)v116;
      do
      {
        for (j = 0; j != v67; ++j)
        {
          if (*(_QWORD *)v116 != v69)
            objc_enumerationMutation(v65);
          v71 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j);
          if (_NSIsNSDictionary())
          {
            v72 = -[ICMusicSubscriptionStatusTerms initWithResponseTermsDictionary:]([ICMusicSubscriptionStatusTerms alloc], "initWithResponseTermsDictionary:", v71);
            if (v72)
            {
              if (!v68)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v65, "count"));
                v68 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v68, "addObject:", v72);
            }

          }
        }
        v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
      }
      while (v67);
    }
    else
    {
      v68 = 0;
    }

    v7 = v109;
    v12 = v110;
    v8 = v111;
  }
  else
  {
    v68 = 0;
  }
  objc_storeStrong((id *)v114 + 16, v68);
  objc_msgSend(v6, "ic_numberValueForKey:", CFSTR("acceptSilentAuth"));
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)*((_QWORD *)v114 + 24);
  *((_QWORD *)v114 + 24) = v73;

  if (_NSIsNSDictionary())
  {
    v75 = v7;
    objc_msgSend(v75, "objectForKey:", CFSTR("phoneNumber"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v77 = objc_msgSend(v76, "copy");
      v78 = (void *)*((_QWORD *)v114 + 17);
      *((_QWORD *)v114 + 17) = v77;

    }
    objc_msgSend(v75, "objectForKey:", CFSTR("cellularOperatorName"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v80 = objc_msgSend(v79, "copy");
      v81 = (void *)*((_QWORD *)v114 + 18);
      *((_QWORD *)v114 + 18) = v80;

    }
    objc_msgSend(v75, "objectForKey:", CFSTR("sessionIdentifier"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v83 = objc_msgSend(v82, "copy");
      v84 = (void *)*((_QWORD *)v114 + 19);
      *((_QWORD *)v114 + 19) = v83;

    }
    objc_msgSend(v75, "objectForKey:", CFSTR("carrierBundlingErrorCode"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_QWORD *)v114 + 20) = objc_msgSend(v85, "integerValue");
    objc_msgSend(v75, "objectForKey:", CFSTR("carrierBundlingStatusType"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_QWORD *)v114 + 11) = objc_msgSend(v86, "integerValue");

    v7 = v109;
    v12 = v110;
    v8 = v111;
  }

LABEL_130:
  v87 = (ICMusicSubscriptionStatus *)v114;

  return v87;
}

+ (id)dateFromMilliseconds:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  }
  else
  {
    if (!_NSIsNSString())
    {
      v5 = 0;
      goto LABEL_8;
    }
    v4 = strtoull((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), 0, 10);
  }
  v5 = (void *)v4;
  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)v4 / 1000.0);
LABEL_8:

  return v5;
}

- (BOOL)hasCapability:(unint64_t)a3
{
  return (a3 & ~-[ICMusicSubscriptionStatus capabilities](self, "capabilities")) == 0;
}

- (id)description
{
  unint64_t carrierBundlingStatusType;
  unint64_t sourceType;
  const __CFString *v5;
  __CFString *v6;
  unint64_t statusType;
  unint64_t reasonType;
  __CFString *v9;
  NSArray *eligibleOffers;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;

  carrierBundlingStatusType = self->_carrierBundlingStatusType;
  if (carrierBundlingStatusType > 4)
    v29 = 0;
  else
    v29 = off_1E43914B0[carrierBundlingStatusType];
  sourceType = self->_sourceType;
  if (sourceType > 2)
    v28 = 0;
  else
    v28 = off_1E43914D8[sourceType];
  if (self->_carrierBundlingErrorCode)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" carrierBundlingErrorCode:%ld"), self->_carrierBundlingErrorCode);
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E4391778;
  }
  if (self->_isMatchEnabled)
    v6 = CFSTR("yes");
  else
    v6 = CFSTR("no");
  statusType = self->_statusType;
  if (statusType > 3)
    v27 = 0;
  else
    v27 = off_1E43914F0[statusType];
  reasonType = self->_reasonType;
  v33 = (__CFString *)v5;
  if (reasonType > 4)
    v9 = 0;
  else
    v9 = off_1E4391510[reasonType];
  v32 = v6;
  ICMusicSubscriptionStatusCapabilitiesGetDescription(-[ICMusicSubscriptionStatus capabilities](self, "capabilities"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  eligibleOffers = self->_eligibleOffers;
  if (eligibleOffers)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[NSArray componentsJoinedByString:](eligibleOffers, "componentsJoinedByString:", CFSTR(","));
    v12 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(" eligibleOffers:%@"), v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v9 = v12;
  }
  else
  {
    v14 = &stru_1E4391778;
  }
  v31 = (void *)MEMORY[0x1E0CB3940];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAutoRenewEnabled);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInFreeTrial);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEligibleForFreeTrial);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSince1970](self->_initialPurchaseTimestamp, "timeIntervalSince1970");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSince1970](self->_serviceBeginsTimestamp, "timeIntervalSince1970");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSince1970](self->_studentExpirationDate, "timeIntervalSince1970");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@ %p statusType:%@, matchEnabled=%@, carrierBundlingStatusType:%@, reasonType:%@, sourceType:%@%@, capabilities:%@, eligibleOffers:[%@], isAutoRenewEnabled:%@, isInFreeTrial:%@, isEligibleForFreeTrial:%@, initialPurchaseTimestamp:%@, serviceBeginsTimestamp:%@, studentExpirationDate:%@, studentVerifier:%@, studentVerificationId:%@>"), v30, self, v27, v32, v29, v9, v28, v33, v34, v14, v16, v17, v18, v20, v22, v24,
    self->_studentVerifier,
    self->_studentVerificationId);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (unint64_t)capabilities
{
  return objc_msgSend((id)objc_opt_class(), "_capabilitiesForStatusType:carrierBundlingStatusType:isMatchEnabled:", self->_statusType, self->_carrierBundlingStatusType, self->_isMatchEnabled);
}

+ (unint64_t)_capabilitiesForStatusType:(int64_t)a3 carrierBundlingStatusType:(int64_t)a4 isMatchEnabled:(BOOL)a5
{
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;
  _BOOL8 v9;
  uint64_t v10;
  unint64_t v12;

  v6 = a3 == 1 && a4 != 2;
  v7 = a5 || v6;
  v8 = a4 != 2 && a3 == 1;
  if (a4 == 1)
  {
    v7 = 1;
    v8 = 1;
  }
  v9 = (unint64_t)(a4 - 1) < 2 || a3 == 1;
  v10 = v9 | 0x82;
  if (a3 != 3 && !v9)
    v10 = v9;
  if (v7)
    v12 = v10 | 0x100;
  else
    v12 = v10;
  if (v8)
    v12 |= 0x200uLL;
  if (v9)
    return v12 | 0x10000;
  else
    return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *responseDictionary;
  id v5;

  responseDictionary = self->_responseDictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", responseDictionary, CFSTR("responseDictionary"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMinorAccountHolder, CFSTR("isMinorAccountHolder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_studentVerificationId, CFSTR("studentVerificationId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_studentVerifier, CFSTR("studentVerifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_studentExpirationDate, CFSTR("studentExpirationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasFamily, CFSTR("hasFamily"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasFamilyGreaterThanOneMember, CFSTR("hasFamilyGreaterThanOneMember"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isHeadOfHousehold, CFSTR("isHeadOfHousehold"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMatchEnabled, CFSTR("isMatchEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initialPurchaseTimestamp, CFSTR("initialPurchaseTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceBeginsTimestamp, CFSTR("serviceBeginsTimestamp"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasOfflineSlots, CFSTR("hasOfflineSlots"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAutoRenewEnabled, CFSTR("isAutoRenewEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isInFreeTrial, CFSTR("isInFreeTrial"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isEligibleForFreeTrial, CFSTR("isEligibleForFreeTrial"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPurchaser, CFSTR("isPurchaser"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_carrierBundlingStatusType, CFSTR("carrierBundlingStatusType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reasonType, CFSTR("reasonType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sourceType, CFSTR("sourceType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_statusType, CFSTR("statusType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAdministrator, CFSTR("isAdministrator"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDiscoveryModeEligible, CFSTR("isDiscoveryModeEligible"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsStatusList, CFSTR("termsStatusList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cellularOperatorName, CFSTR("cellularOperatorName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_carrierBundlingErrorCode, CFSTR("carrierBundlingErrorCode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPartOfBundle, CFSTR("isPartOfBundle"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isBundleOwner, CFSTR("isBundleOwner"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eligibleOffers, CFSTR("eligibleOffers"));

}

- (int64_t)reasonType
{
  return self->_reasonType;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (int64_t)carrierBundlingStatusType
{
  return self->_carrierBundlingStatusType;
}

- (ICMusicSubscriptionStatus)initWithCoder:(id)a3
{
  id v4;
  ICMusicSubscriptionStatus *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *responseDictionary;
  uint64_t v9;
  NSDate *studentExpirationDate;
  uint64_t v11;
  NSString *studentVerificationId;
  uint64_t v13;
  NSString *studentVerifier;
  uint64_t v15;
  NSDate *expirationDate;
  uint64_t v17;
  NSDate *initialPurchaseTimestamp;
  uint64_t v19;
  NSDate *serviceBeginsTimestamp;
  uint64_t v21;
  NSArray *termsStatusList;
  uint64_t v23;
  NSString *phoneNumber;
  uint64_t v25;
  NSString *cellularOperatorName;
  uint64_t v27;
  NSString *sessionIdentifier;
  void *v29;
  uint64_t v30;
  NSArray *eligibleOffers;
  unint64_t v32;
  unint64_t v33;

  v4 = a3;
  if (initWithCoder__sAllowedClassesForPropertyListRepresentationOnceToken != -1)
    dispatch_once(&initWithCoder__sAllowedClassesForPropertyListRepresentationOnceToken, &__block_literal_global_36413);
  if (initWithCoder__sAllowedClassesForTermsStatusListOnceToken != -1)
    dispatch_once(&initWithCoder__sAllowedClassesForTermsStatusListOnceToken, &__block_literal_global_155);
  v5 = -[ICMusicSubscriptionStatus _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__sAllowedClassesForPropertyListRepresentation, CFSTR("responseDictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v7;

    v5->_isMinorAccountHolder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMinorAccountHolder"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("studentExpirationDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    studentExpirationDate = v5->_studentExpirationDate;
    v5->_studentExpirationDate = (NSDate *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("studentVerificationId"));
    v11 = objc_claimAutoreleasedReturnValue();
    studentVerificationId = v5->_studentVerificationId;
    v5->_studentVerificationId = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("studentVerifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    studentVerifier = v5->_studentVerifier;
    v5->_studentVerifier = (NSString *)v13;

    v5->_hasFamily = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasFamily"));
    v5->_hasFamilyGreaterThanOneMember = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasFamilyGreaterThanOneMember"));
    v5->_isHeadOfHousehold = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHeadOfHousehold"));
    v5->_isMatchEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMatchEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialPurchaseTimestamp"));
    v17 = objc_claimAutoreleasedReturnValue();
    initialPurchaseTimestamp = v5->_initialPurchaseTimestamp;
    v5->_initialPurchaseTimestamp = (NSDate *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceBeginsTimestamp"));
    v19 = objc_claimAutoreleasedReturnValue();
    serviceBeginsTimestamp = v5->_serviceBeginsTimestamp;
    v5->_serviceBeginsTimestamp = (NSDate *)v19;

    v5->_hasOfflineSlots = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasOfflineSlots"));
    v5->_isAutoRenewEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutoRenewEnabled"));
    v5->_isInFreeTrial = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInFreeTrial"));
    v5->_isEligibleForFreeTrial = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEligibleForFreeTrial"));
    v5->_isPurchaser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPurchaser"));
    v5->_carrierBundlingStatusType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("carrierBundlingStatusType"));
    v5->_reasonType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reasonType"));
    v5->_sourceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceType"));
    v5->_isAdministrator = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAdministrator"));
    v5->_isDiscoveryModeEligible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDiscoveryModeEligible"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__sAllowedClassesForTermsStatusList, CFSTR("termsStatusList"));
    v21 = objc_claimAutoreleasedReturnValue();
    termsStatusList = v5->_termsStatusList;
    v5->_termsStatusList = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v23 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cellularOperatorName"));
    v25 = objc_claimAutoreleasedReturnValue();
    cellularOperatorName = v5->_cellularOperatorName;
    v5->_cellularOperatorName = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v27 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v27;

    v5->_carrierBundlingErrorCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("carrierBundlingErrorCode"));
    v5->_isPartOfBundle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPartOfBundle"));
    v5->_isBundleOwner = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBundleOwner"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__sAllowedClassesForPropertyListRepresentation, CFSTR("eligibleOffers"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    eligibleOffers = v5->_eligibleOffers;
    v5->_eligibleOffers = (NSArray *)v30;

    v32 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("statusType"));
    if (v32 >= 4)
      v33 = 0;
    else
      v33 = v32;
    v5->_statusType = v33;
  }

  return v5;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICMusicSubscriptionStatus;
  return -[ICMusicSubscriptionStatus init](&v3, sel_init);
}

- (NSArray)termsStatusList
{
  return self->_termsStatusList;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)isMinorAccountHolder
{
  return self->_isMinorAccountHolder;
}

- (BOOL)isMatchEnabled
{
  return self->_isMatchEnabled;
}

- (BOOL)isHeadOfHousehold
{
  return self->_isHeadOfHousehold;
}

- (BOOL)isDiscoveryModeEligible
{
  return self->_isDiscoveryModeEligible;
}

- (BOOL)hasFamily
{
  return self->_hasFamily;
}

- (BOOL)hasFamilyGreaterThanOneMember
{
  return self->_hasFamilyGreaterThanOneMember;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  ICMusicSubscriptionStatus *v4;
  BOOL v5;

  v4 = (ICMusicSubscriptionStatus *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[ICMusicSubscriptionStatus isEqualToStatus:](self, "isEqualToStatus:", v4);
  }

  return v5;
}

- (BOOL)isEqualToStatus:(id)a3
{
  ICMusicSubscriptionStatus *v4;
  NSDictionary *responseDictionary;
  NSDate *studentExpirationDate;
  NSString *studentVerificationId;
  NSString *studentVerifier;
  NSDate *expirationDate;
  NSDate *initialPurchaseTimestamp;
  NSDate *serviceBeginsTimestamp;
  NSArray *termsStatusList;
  NSString *phoneNumber;
  NSString *cellularOperatorName;
  NSString *sessionIdentifier;
  NSArray *eligibleOffers;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  char v20;

  v4 = (ICMusicSubscriptionStatus *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    responseDictionary = self->_responseDictionary;
    if (responseDictionary != v4->_responseDictionary
      && !-[NSDictionary isEqualToDictionary:](responseDictionary, "isEqualToDictionary:"))
    {
      goto LABEL_45;
    }
    if (self->_isMinorAccountHolder != v4->_isMinorAccountHolder)
      goto LABEL_45;
    studentExpirationDate = self->_studentExpirationDate;
    if (studentExpirationDate != v4->_studentExpirationDate
      && !-[NSDate isEqualToDate:](studentExpirationDate, "isEqualToDate:"))
    {
      goto LABEL_45;
    }
    studentVerificationId = self->_studentVerificationId;
    if (studentVerificationId != v4->_studentVerificationId
      && !-[NSString isEqualToString:](studentVerificationId, "isEqualToString:"))
    {
      goto LABEL_45;
    }
    studentVerifier = self->_studentVerifier;
    if (studentVerifier != v4->_studentVerifier && !-[NSString isEqualToString:](studentVerifier, "isEqualToString:"))
      goto LABEL_45;
    if (self->_hasFamily == v4->_hasFamily
      && self->_hasFamilyGreaterThanOneMember == v4->_hasFamilyGreaterThanOneMember
      && self->_isHeadOfHousehold == v4->_isHeadOfHousehold
      && self->_isMatchEnabled == v4->_isMatchEnabled
      && ((expirationDate = self->_expirationDate, expirationDate == v4->_expirationDate)
       || -[NSDate isEqualToDate:](expirationDate, "isEqualToDate:"))
      && ((initialPurchaseTimestamp = self->_initialPurchaseTimestamp,
           initialPurchaseTimestamp == v4->_initialPurchaseTimestamp)
       || -[NSDate isEqualToDate:](initialPurchaseTimestamp, "isEqualToDate:"))
      && ((serviceBeginsTimestamp = self->_serviceBeginsTimestamp, serviceBeginsTimestamp == v4->_serviceBeginsTimestamp)
       || -[NSDate isEqualToDate:](serviceBeginsTimestamp, "isEqualToDate:"))
      && self->_hasOfflineSlots == v4->_hasOfflineSlots
      && self->_isAutoRenewEnabled == v4->_isAutoRenewEnabled
      && self->_isInFreeTrial == v4->_isInFreeTrial
      && self->_isEligibleForFreeTrial == v4->_isEligibleForFreeTrial
      && self->_isPurchaser == v4->_isPurchaser
      && self->_carrierBundlingStatusType == v4->_carrierBundlingStatusType
      && self->_reasonType == v4->_reasonType
      && self->_sourceType == v4->_sourceType
      && self->_statusType == v4->_statusType
      && self->_isAdministrator == v4->_isAdministrator
      && self->_isDiscoveryModeEligible == v4->_isDiscoveryModeEligible
      && ((termsStatusList = self->_termsStatusList, termsStatusList == v4->_termsStatusList)
       || -[NSArray isEqualToArray:](termsStatusList, "isEqualToArray:"))
      && ((phoneNumber = self->_phoneNumber, phoneNumber == v4->_phoneNumber)
       || -[NSString isEqualToString:](phoneNumber, "isEqualToString:"))
      && ((cellularOperatorName = self->_cellularOperatorName, cellularOperatorName == v4->_cellularOperatorName)
       || -[NSString isEqualToString:](cellularOperatorName, "isEqualToString:"))
      && ((sessionIdentifier = self->_sessionIdentifier, sessionIdentifier == v4->_sessionIdentifier)
       || -[NSString isEqualToString:](sessionIdentifier, "isEqualToString:"))
      && self->_carrierBundlingErrorCode == v4->_carrierBundlingErrorCode
      && self->_isPartOfBundle == v4->_isPartOfBundle
      && self->_isBundleOwner == v4->_isBundleOwner)
    {
      eligibleOffers = self->_eligibleOffers;
      v17 = v4->_eligibleOffers;
      v18 = eligibleOffers;
      v19 = v18;
      if (v18 == v17)
        v20 = 1;
      else
        v20 = -[NSArray isEqual:](v18, "isEqual:", v17);

    }
    else
    {
LABEL_45:
      v20 = 0;
    }
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptSilentAuth, 0);
  objc_storeStrong((id *)&self->_eligibleOffers, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_cellularOperatorName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_termsStatusList, 0);
  objc_storeStrong((id *)&self->_serviceBeginsTimestamp, 0);
  objc_storeStrong((id *)&self->_initialPurchaseTimestamp, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_studentVerifier, 0);
  objc_storeStrong((id *)&self->_studentVerificationId, 0);
  objc_storeStrong((id *)&self->_studentExpirationDate, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

void __43__ICMusicSubscriptionStatus_initWithCoder___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__sAllowedClassesForTermsStatusList;
  initWithCoder__sAllowedClassesForTermsStatusList = v2;

}

void __43__ICMusicSubscriptionStatus_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)initWithCoder__sAllowedClassesForPropertyListRepresentation;
  initWithCoder__sAllowedClassesForPropertyListRepresentation = v6;

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5;

  v5 = -[ICMusicSubscriptionStatus _init]([ICMutableMusicSubscriptionStatus alloc], "_init");
  -[ICMusicSubscriptionStatus _copySubscriptionStatusPropertiesToStatus:withZone:](self, "_copySubscriptionStatusPropertiesToStatus:withZone:", v5, a3);
  return v5;
}

- (BOOL)hasCatalogPlaybackCapability
{
  return -[ICMusicSubscriptionStatus hasCapability:](self, "hasCapability:", 1);
}

- (BOOL)hasAddToCloudLibraryCapability
{
  return -[ICMusicSubscriptionStatus hasCapability:](self, "hasCapability:", 256);
}

- (BOOL)isCloudMusicServiceEnabled
{
  return -[ICMusicSubscriptionStatus hasCapability:](self, "hasCapability:", 256);
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *phoneNumber;
  NSString *cellularOperatorName;
  NSString *sessionIdentifier;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
    objc_msgSend(v3, "setObject:forKey:", phoneNumber, CFSTR("phoneNumber"));
  cellularOperatorName = self->_cellularOperatorName;
  if (cellularOperatorName)
    objc_msgSend(v4, "setObject:forKey:", cellularOperatorName, CFSTR("cellularOperatorName"));
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  if (self->_carrierBundlingErrorCode)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("carrierBundlingErrorCode"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_carrierBundlingStatusType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("carrierBundlingStatusType"));

  v10 = (id)-[NSDictionary mutableCopy](self->_responseDictionary, "mutableCopy");
  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("_ICMusicSubscriptionStatusAdditionalProperties"));

  v12 = (void *)objc_msgSend(v10, "copy");
  return (NSDictionary *)v12;
}

- (void)_copySubscriptionStatusPropertiesToStatus:(id)a3 withZone:(_NSZone *)a4
{
  NSDictionary *responseDictionary;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;

  responseDictionary = self->_responseDictionary;
  v7 = a3;
  v8 = -[NSDictionary copyWithZone:](responseDictionary, "copyWithZone:", a4);
  v9 = (void *)v7[1];
  v7[1] = v8;

  *((_BYTE *)v7 + 16) = self->_isMinorAccountHolder;
  v10 = -[NSDate copyWithZone:](self->_studentExpirationDate, "copyWithZone:", a4);
  v11 = (void *)v7[3];
  v7[3] = v10;

  v12 = -[NSString copyWithZone:](self->_studentVerificationId, "copyWithZone:", a4);
  v13 = (void *)v7[4];
  v7[4] = v12;

  v14 = -[NSString copyWithZone:](self->_studentVerifier, "copyWithZone:", a4);
  v15 = (void *)v7[5];
  v7[5] = v14;

  *((_BYTE *)v7 + 48) = self->_hasFamily;
  *((_BYTE *)v7 + 49) = self->_hasFamilyGreaterThanOneMember;
  *((_BYTE *)v7 + 50) = self->_isHeadOfHousehold;
  *((_BYTE *)v7 + 51) = self->_isMatchEnabled;
  v16 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a4);
  v17 = (void *)v7[7];
  v7[7] = v16;

  v18 = -[NSDate copyWithZone:](self->_initialPurchaseTimestamp, "copyWithZone:", a4);
  v19 = (void *)v7[8];
  v7[8] = v18;

  v20 = -[NSDate copyWithZone:](self->_serviceBeginsTimestamp, "copyWithZone:", a4);
  v21 = (void *)v7[9];
  v7[9] = v20;

  *((_BYTE *)v7 + 80) = self->_hasOfflineSlots;
  *((_BYTE *)v7 + 81) = self->_isAutoRenewEnabled;
  *((_BYTE *)v7 + 82) = self->_isInFreeTrial;
  *((_BYTE *)v7 + 83) = self->_isEligibleForFreeTrial;
  *((_BYTE *)v7 + 84) = self->_isPurchaser;
  v7[11] = self->_carrierBundlingStatusType;
  v7[12] = self->_reasonType;
  v7[13] = self->_sourceType;
  v7[14] = self->_statusType;
  *((_BYTE *)v7 + 120) = self->_isAdministrator;
  *((_BYTE *)v7 + 121) = self->_isDiscoveryModeEligible;
  v22 = -[NSArray copyWithZone:](self->_termsStatusList, "copyWithZone:", a4);
  v23 = (void *)v7[16];
  v7[16] = v22;

  v24 = -[NSString copyWithZone:](self->_phoneNumber, "copyWithZone:", a4);
  v25 = (void *)v7[17];
  v7[17] = v24;

  v26 = -[NSString copyWithZone:](self->_cellularOperatorName, "copyWithZone:", a4);
  v27 = (void *)v7[18];
  v7[18] = v26;

  v28 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a4);
  v29 = (void *)v7[19];
  v7[19] = v28;

  v7[20] = self->_carrierBundlingErrorCode;
  *((_BYTE *)v7 + 168) = self->_isPartOfBundle;
  *((_BYTE *)v7 + 169) = self->_isBundleOwner;
  v30 = -[NSArray copyWithZone:](self->_eligibleOffers, "copyWithZone:", a4);
  v31 = (id)v7[22];
  v7[22] = v30;

}

- (NSDate)studentExpirationDate
{
  return self->_studentExpirationDate;
}

- (NSString)studentVerificationId
{
  return self->_studentVerificationId;
}

- (NSString)studentVerifier
{
  return self->_studentVerifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDate)initialPurchaseTimestamp
{
  return self->_initialPurchaseTimestamp;
}

- (NSDate)serviceBeginsTimestamp
{
  return self->_serviceBeginsTimestamp;
}

- (BOOL)hasOfflineSlots
{
  return self->_hasOfflineSlots;
}

- (BOOL)isAutoRenewEnabled
{
  return self->_isAutoRenewEnabled;
}

- (BOOL)isInFreeTrial
{
  return self->_isInFreeTrial;
}

- (BOOL)isEligibleForFreeTrial
{
  return self->_isEligibleForFreeTrial;
}

- (BOOL)isPurchaser
{
  return self->_isPurchaser;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (BOOL)isAdministrator
{
  return self->_isAdministrator;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)cellularOperatorName
{
  return self->_cellularOperatorName;
}

- (int64_t)carrierBundlingErrorCode
{
  return self->_carrierBundlingErrorCode;
}

- (BOOL)isPartOfBundle
{
  return self->_partOfBundle;
}

- (BOOL)isBundleOnwer
{
  return self->_bundleOwner;
}

- (NSArray)eligibleOffers
{
  return self->_eligibleOffers;
}

- (BOOL)isInGlidePreview
{
  return self->_inGlidePreview;
}

- (NSNumber)acceptSilentAuth
{
  return self->_acceptSilentAuth;
}

@end
