@implementation RTMapItemExtendedAttributesMO

+ (id)managedObjectWithExtendedAttributes:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithExtendedAttributes:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithExtendedAttributes:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _BYTE *v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[RTMapItemExtendedAttributesMO managedObjectWithExtendedAttributes:managedObject:inManagedObjectContext:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 31;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext (in %s:%d)", buf, 0x12u);
    }

    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v19 = __Block_byref_object_copy__84;
  v20 = __Block_byref_object_dispose__84;
  v21 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__RTMapItemExtendedAttributesMO_managedObjectWithExtendedAttributes_managedObject_inManagedObjectContext___block_invoke;
  v13[3] = &unk_1E92987D0;
  v17 = buf;
  v14 = v8;
  v15 = v9;
  v16 = v7;
  objc_msgSend(v15, "performBlockAndWait:", v13);
  v10 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
LABEL_8:

  return v10;
}

void __106__RTMapItemExtendedAttributesMO_managedObjectWithExtendedAttributes_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  RTMapItemExtendedAttributesMO *v2;
  RTMapItemExtendedAttributesMO *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(RTMapItemExtendedAttributesMO **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = -[RTMapItemExtendedAttributesMO initWithContext:]([RTMapItemExtendedAttributesMO alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 48), "addressIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAddressIdentifier:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "isMe"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIsMe:", v6);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "wifiConfidence");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setWifiConfidence:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "wifiFingerprintLabelType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setWifiFingerprintLabelType:", v9);

}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTMapItemExtendedAttributesMO"));
}

@end
