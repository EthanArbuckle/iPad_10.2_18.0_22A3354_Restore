@implementation SUdYIiwa8PrJA4HA

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _UNKNOWN **v16;
  void *v17;
  id v18;
  void *v19;
  _eipjLVDiD7LNwlPc *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  kjAS9HuCdR1m5txL *v24;
  NSObject *v25;
  NSObject *v26;
  unsigned int var0;
  unsigned int var1;
  id v30;
  uint8_t buf[4];
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  void *v35;
  _QWORD v36[27];

  v9 = os_signpost_id_generate((os_log_t)qword_1005185E0);
  v10 = (id)qword_1005185E0;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "mc", "enableTelemetry=YES", buf, 2u);
  }
  v12 = 166000;

  if ((uint64_t)+[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0) >= CNAuthorizationStatusAuthorized)
  {
    v15 = objc_alloc_init((Class)CNContactStore);
    v36[0] = CNContactNamePrefixKey;
    v36[1] = CNContactGivenNameKey;
    v36[2] = CNContactMiddleNameKey;
    v36[3] = CNContactFamilyNameKey;
    v36[4] = CNContactPreviousFamilyNameKey;
    v36[5] = CNContactNameSuffixKey;
    v36[6] = CNContactNicknameKey;
    v36[7] = CNContactOrganizationNameKey;
    v36[8] = CNContactDepartmentNameKey;
    v36[9] = CNContactJobTitleKey;
    v36[10] = CNContactPhoneticGivenNameKey;
    v36[11] = CNContactPhoneticMiddleNameKey;
    v36[12] = CNContactPhoneticFamilyNameKey;
    v36[13] = CNContactPhoneticOrganizationNameKey;
    v36[14] = CNContactBirthdayKey;
    v36[15] = CNContactNonGregorianBirthdayKey;
    v36[16] = CNContactNoteKey;
    v36[17] = CNContactImageDataAvailableKey;
    v36[18] = CNContactTypeKey;
    v36[19] = CNContactPhoneNumbersKey;
    v36[20] = CNContactEmailAddressesKey;
    v36[21] = CNContactPostalAddressesKey;
    v36[22] = CNContactDatesKey;
    v36[23] = CNContactUrlAddressesKey;
    v36[24] = CNContactRelationsKey;
    v36[25] = CNContactSocialProfilesKey;
    v36[26] = CNContactInstantMessageAddressesKey;
    v16 = &_sScG8IteratorV4next9isolationxSgScA_pSgYi_tYaFTu_ptr;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 27));
    v30 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v17, &v30));
    v18 = v30;
    v19 = v18;
    if (v18)
    {
      v20 = a4;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "domain"));
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("CNErrorDomain"));

      if (!v22)
      {
        v12 = 0;
        a4 = v20;
        v16 = &_sScG8IteratorV4next9isolationxSgScA_pSgYi_tYaFTu_ptr;
        goto LABEL_20;
      }
      v23 = (uint64_t)objc_msgSend(v19, "code");
      if (v23 > 99)
      {
        a4 = v20;
        v16 = &_sScG8IteratorV4next9isolationxSgScA_pSgYi_tYaFTu_ptr;
        if (v23 == 100)
        {
          v12 = 166003;
          goto LABEL_20;
        }
        if (v23 == 200)
        {
          v12 = 166004;
          goto LABEL_20;
        }
      }
      else
      {
        a4 = v20;
        v16 = &_sScG8IteratorV4next9isolationxSgScA_pSgYi_tYaFTu_ptr;
        if (v23 == 1)
        {
          v12 = 166001;
          goto LABEL_20;
        }
        if (v23 == 2)
        {
          v12 = 166002;
LABEL_20:
          if (v14)
          {
            v35 = v14;
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16[319], "arrayWithObjects:count:", &v35, 1));
          }
          else
          {
            v13 = 0;
          }

          goto LABEL_24;
        }
      }
      v12 = 166005;
      goto LABEL_20;
    }
    v12 = 0;
    goto LABEL_20;
  }
  v13 = 0;
  v14 = 0;
LABEL_24:
  v24 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:]([kjAS9HuCdR1m5txL alloc], "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v13, v12);
  v25 = (id)qword_1005185E0;
  v26 = v25;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    var0 = a4->var0;
    var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    v32 = var0;
    v33 = 1026;
    v34 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v9, "mc", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  return v24;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set](NSSet, "set", a3, a4);
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6;
  unint64_t v7;

  v6 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 0);
  objc_msgSend(v6, "encodeInt64:forKey:", 0xE41739AED8186A8ELL, CFSTR("0x5563"));
  v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:](Yp00msaYdVlZesvU, "cv2QAcQ2CDdiHuN6:", v6);

  return v7;
}

@end
