@implementation NSDateFormatter(HKSPSleep)

- (id)hksp_timeStringFromDate:()HKSPSleep designatorString:designatorIsBeforeTime:
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  __CFString *v32;

  v8 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__11;
  v31 = __Block_byref_object_dispose__11;
  v32 = &stru_1E4E3E220;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3010000000;
  v25 = "";
  v26 = xmmword_1A4F671C0;
  objc_msgSend(a1, "_attributedStringWithFieldsFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__NSDateFormatter_HKSPSleep__hksp_timeStringFromDate_designatorString_designatorIsBeforeTime___block_invoke;
  v18[3] = &unk_1E4E3D480;
  v20 = &v27;
  v11 = v9;
  v19 = v11;
  v21 = &v22;
  objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v18);
  *a4 = objc_retainAutorelease((id)v28[5]);
  *a5 = v23[4] == 0;
  objc_msgSend(a1, "stringFromDate:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = v23[4];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:options:range:", v28[5], &stru_1E4E3E220, 0, v14, v23[5]);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  objc_msgSend(v13, "hk_stringByReplacingSpacesWithString:", &stru_1E4E3E220);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v27, 8);

  return v16;
}

@end
