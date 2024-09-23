void sub_100002174(uint64_t a1)
{
  NSString *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v1 = NSStringFromClass(*(Class *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1));
  v2 = os_log_create("com.apple.email", (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)qword_100012300;
  qword_100012300 = (uint64_t)v2;

}

void sub_1000021D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100002284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1000022A8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "daemonInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountRepository"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "receivingAccounts"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_map:", &stru_10000C3E0));
  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(objc_alloc((Class)INObjectCollection), "initWithItems:", v4);
  (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v6, 0);

}

void sub_100002358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

MFIntentAccount *__cdecl sub_10000239C(id a1, EMReceivingAccount *a2)
{
  EMReceivingAccount *v2;
  void *v3;
  void *v4;
  void *v5;
  MFIntentAccount *v6;
  void *v7;
  MFIntentAccount *v8;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EMReceivingAccount objectID](v2, "objectID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serializedRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 0));

  v6 = [MFIntentAccount alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EMReceivingAccount name](v2, "name"));
  v8 = -[MFIntentAccount initWithIdentifier:displayString:](v6, "initWithIdentifier:displayString:", v5, v7);

  -[MFIntentAccount setSerializedRepresentation:](v8, "setSerializedRepresentation:", v5);
  return v8;
}

void sub_100002444(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000252C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1000025A0(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncSchedulerWithQualityOfService:](EFScheduler, "globalAsyncSchedulerWithQualityOfService:", 25));
  v2 = (void *)qword_100012310;
  qword_100012310 = v1;

}

void sub_10000269C(uint64_t a1)
{
  NSString *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v1 = NSStringFromClass(*(Class *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1));
  v2 = os_log_create("com.apple.email", (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)qword_100012320;
  qword_100012320 = (uint64_t)v2;

}

void sub_1000026F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100002780(uint64_t a1)
{
  NSString *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v1 = NSStringFromClass(*(Class *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1));
  v2 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)qword_100012330;
  qword_100012330 = (uint64_t)v2;

}

void sub_1000027DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100002A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_100002B2C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[GetMailboxIntentHandler log](GetMailboxIntentHandler, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v20 = objc_msgSend(v5, "count");
      v21 = 2114;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetch mailboxes returned %lu mailboxes:\n%{public}@", buf, 0x16u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "daemonInterface"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vipManager"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100002D40;
    v15[3] = &unk_10000C4F0;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v16 = v10;
    v17 = v11;
    v18 = v12;
    objc_msgSend(v9, "getAllVIPsWithCompletion:", v15);

  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[GetMailboxIntentHandler log](GetMailboxIntentHandler, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
      sub_1000071EC(v14, (uint64_t)buf, v13);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_100002CE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100002D40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[GetMailboxIntentHandler log](GetMailboxIntentHandler, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
      sub_100007234(v8, (uint64_t)&v18, v7);
    }

  }
  v9 = objc_alloc_init((Class)NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ef_groupByObject:", &stru_10000C488));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ef_filter:", &stru_10000C4C8));
  v12 = objc_alloc((Class)INObjectSection);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_smartMailboxesWithInboxes:hasVIPs:", v11, objc_msgSend(v5, "count") != 0));
  v14 = objc_msgSend(v12, "initWithTitle:items:", &stru_10000C818, v13);

  objc_msgSend(v9, "addObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_convertMailboxesIntoSections:", v10));
  objc_msgSend(v9, "addObjectsFromArray:", v15);

  v16 = *(_QWORD *)(a1 + 48);
  v17 = objc_msgSend(objc_alloc((Class)INObjectCollection), "initWithSections:", v9);
  (*(void (**)(uint64_t, id, _QWORD))(v16 + 16))(v16, v17, 0);

}

void sub_100002F0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

EMReceivingAccount *__cdecl sub_100002F8C(id a1, EMMailbox *a2)
{
  return (EMReceivingAccount *)(id)objc_claimAutoreleasedReturnValue(-[EMMailbox account](a2, "account"));
}

BOOL sub_100002FA8(id a1, EMMailbox *a2)
{
  return -[EMMailbox isInboxMailbox](a2, "isInboxMailbox");
}

void sub_100003328(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100003A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

NSString *__cdecl sub_100003C38(id a1, EMMailbox *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EMMailbox objectID](a2, "objectID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serializedRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));

  return (NSString *)v4;
}

void sub_100003C90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100003D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

int64_t sub_100003DB8(id a1, EMAccount *a2, EMAccount *a3)
{
  EMAccount *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EMAccount name](a2, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EMAccount name](v4, "name"));
  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);

  return (int64_t)v7;
}

void sub_100003E24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

id sub_100003E50(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3));
  if (objc_msgSend(v4, "count"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100003F78;
    v10[3] = &unk_10000C5C0;
    v10[4] = *(_QWORD *)(a1 + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_compactMap:", v10));
    v6 = objc_alloc((Class)INObjectSection);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    v8 = objc_msgSend(v6, "initWithTitle:items:", v7, v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_100003F40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id sub_100003F78(uint64_t a1, uint64_t a2)
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_intentMailboxFromMailbox:", a2));
}

void sub_10000430C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100004460(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000474C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = v18;

  _Unwind_Resume(a1);
}

id sub_1000047EC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000048A4;
  v6[3] = &unk_10000C610;
  v7 = *(id *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "ef_map:", v6));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_filter:", EFIsNotNull));

  return v4;
}

void sub_100004884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

id sub_1000048A4(uint64_t a1, uint64_t a2)
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transformedValue:", a2));
}

void sub_100004938(uint64_t a1)
{
  NSString *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v1 = NSStringFromClass(*(Class *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1));
  v2 = os_log_create("com.apple.email", (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)qword_100012340;
  qword_100012340 = (uint64_t)v2;

}

void sub_100004994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100004A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100004E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1000050BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

int64_t sub_1000050F8(id a1, NSDictionary *a2, NSDictionary *a3)
{
  NSDictionary *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = MSResultsKeyDateSent;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", MSResultsKeyDateSent));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v5));
  v8 = objc_msgSend(v6, "compare:", v7);

  return (int64_t)v8;
}

void sub_100005178(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000052C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

MSIntentMail *__cdecl sub_100005304(id a1, NSDictionary *a2)
{
  NSDictionary *v2;
  id v3;

  v2 = a2;
  v3 = objc_msgSend(objc_alloc((Class)MSIntentMail), "initWithDictionary:", v2);

  return (MSIntentMail *)v3;
}

void sub_100005344(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000543C(uint64_t a1)
{
  NSString *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v1 = NSStringFromClass(*(Class *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1));
  v2 = os_log_create("com.apple.email", (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)qword_100012350;
  qword_100012350 = (uint64_t)v2;

}

void sub_100005498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000555C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000055E0(uint64_t a1)
{
  NSString *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v1 = NSStringFromClass(*(Class *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1));
  v2 = os_log_create("com.apple.email", (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)qword_100012360;
  qword_100012360 = (uint64_t)v2;

}

void sub_10000563C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1000056C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000580C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_100005900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

NSArray *__cdecl sub_100005940(id a1, MFMailAccountProxy *a2)
{
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(-[MFMailAccountProxy emailAddresses](a2, "emailAddresses"));
}

void sub_1000059B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100005B28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

id sub_100005B84(uint64_t a1, uint64_t a2)
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_resolutionResultForPerson:", a2));
}

void sub_100005CE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

id sub_100005D40(uint64_t a1, uint64_t a2)
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_resolutionResultForPerson:", a2));
}

void sub_100005EA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

id sub_100005EFC(uint64_t a1, uint64_t a2)
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_resolutionResultForPerson:", a2));
}

void sub_100005FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1000060DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000619C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000637C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1000063EC()
{
  JUMPOUT(0x1000063D8);
}

void sub_1000063F4()
{
  JUMPOUT(0x1000063DCLL);
}

void sub_1000063FC(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v7 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (a2)
    v6 = objc_msgSend(objc_alloc((Class)MSSendMailIntentResponse), "initWithCode:userActivity:", 4, 0);
  else
    v6 = objc_msgSend(objc_alloc((Class)MSSendMailIntentResponse), "initWithCode:userActivity:", 5, 0);
  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void sub_100006490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000064B4(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v7;
  id v8;
  id v9;

  v9 = a4;
  v7 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    if (a3)
      v8 = objc_msgSend(objc_alloc((Class)MSSendMailIntentResponse), "initWithCode:userActivity:", 100, 0);
    else
      v8 = objc_msgSend(objc_alloc((Class)MSSendMailIntentResponse), "initWithCode:userActivity:", 4, 0);
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)MSSendMailIntentResponse), "initWithCode:userActivity:", 5, 0);
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

}

void sub_100006580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000066D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1000067F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

id sub_10000682C(uint64_t a1, uint64_t a2)
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "reverseTransformedValue:", a2));
}

void sub_10000690C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100006CB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

MFMessageFileWrapper *__cdecl sub_100006DCC(id a1, INFile *a2)
{
  INFile *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  v3 = objc_alloc((Class)MFMessageFileWrapper);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[INFile data](v2, "data"));
  v5 = objc_msgSend(v3, "initRegularFileWithContents:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[INFile filename](v2, "filename"));
  objc_msgSend(v5, "setPreferredFilename:", v6);

  return (MFMessageFileWrapper *)v5;
}

void sub_100006E50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100006F30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100006FE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000071EC(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100004460((void *)&_mh_execute_header, a2, a3, "Fetch mailboxes failed with error: %{public}@", (uint8_t *)a2);

}

void sub_100007234(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100004460((void *)&_mh_execute_header, a2, a3, "Failed to fetch VIPs: %{public}@", (uint8_t *)a2);

}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__convertMailboxesIntoSections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_convertMailboxesIntoSections:");
}

id objc_msgSend__emailAddressesFromPersons_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_emailAddressesFromPersons:");
}

id objc_msgSend__intentMailboxFromMailbox_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_intentMailboxFromMailbox:");
}

id objc_msgSend__messageFromSendMailIntent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_messageFromSendMailIntent:");
}

id objc_msgSend__resolutionResultForPerson_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolutionResultForPerson:");
}

id objc_msgSend__smartMailboxesWithInboxes_hasVIPs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_smartMailboxesWithInboxes:hasVIPs:");
}

id objc_msgSend__validateIntent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateIntent:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "account");
}

id objc_msgSend_accountProxyContainingEmailAddress_includingInactive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountProxyContainingEmailAddress:includingInactive:");
}

id objc_msgSend_accountProxyGenerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountProxyGenerator");
}

id objc_msgSend_accountRepository(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountRepository");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accounts");
}

id objc_msgSend_activeAccountProxiesOriginatingBundleID_sourceAccountManagement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeAccountProxiesOriginatingBundleID:sourceAccountManagement:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allVIPWaitForResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allVIPWaitForResult");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachments");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bcc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bcc");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "body");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_cc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cc");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createMessageWithHTMLStringAndMIMECharset_plainTextAlternative_otherHtmlStringsAndAttachments_headers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createMessageWithHTMLStringAndMIMECharset:plainTextAlternative:otherHtmlStringsAndAttachments:headers:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemonInterface");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultMailAccountProxyForDeliveryOriginatingBundleID_sourceAccountManagement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMailAccountProxyForDeliveryOriginatingBundleID:sourceAccountManagement:");
}

id objc_msgSend_defaultSenderForSendMail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSenderForSendMail:");
}

id objc_msgSend_ec_descriptionForMimeHeaders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ec_descriptionForMimeHeaders");
}

id objc_msgSend_ef_compactMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_compactMap:");
}

id objc_msgSend_ef_filter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_filter:");
}

id objc_msgSend_ef_flatMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_flatMap:");
}

id objc_msgSend_ef_groupByObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_groupByObject:");
}

id objc_msgSend_ef_insertObject_usingComparator_allowDuplicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_insertObject:usingComparator:allowDuplicates:");
}

id objc_msgSend_ef_map_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_map:");
}

id objc_msgSend_ef_publicDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_publicDescription");
}

id objc_msgSend_ef_repeatedStringTimes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_repeatedStringTimes:");
}

id objc_msgSend_emailAddressValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emailAddressValue");
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emailAddresses");
}

id objc_msgSend_externalURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalURL");
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filename");
}

id objc_msgSend_findMessageData_matchingCriterion_options_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findMessageData:matchingCriterion:options:delegate:");
}

id objc_msgSend_firstEmailAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstEmailAddress");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fullUserName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullUserName");
}

id objc_msgSend_getAllVIPsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAllVIPsWithCompletion:");
}

id objc_msgSend_globalAsyncSchedulerWithQualityOfService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalAsyncSchedulerWithQualityOfService:");
}

id objc_msgSend_initRegularFileWithContents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRegularFileWithContents:");
}

id objc_msgSend_initWithAllowsRestrictedAccounts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAllowsRestrictedAccounts:");
}

id objc_msgSend_initWithCode_userActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCode:userActivity:");
}

id objc_msgSend_initWithCriteria_allRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCriteria:allRequired:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithIdentifier_displayString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:displayString:");
}

id objc_msgSend_initWithIdentifier_displayString_subtitleString_displayImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:displayString:subtitleString:displayImage:");
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItems:");
}

id objc_msgSend_initWithSections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSections:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTargetClass_predicate_sortDescriptors_queryOptions_label_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:");
}

id objc_msgSend_initWithTitle_items_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:items:");
}

id objc_msgSend_initWithType_qualifier_expression_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:qualifier:expression:");
}

id objc_msgSend_isDraft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDraft");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kind");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStandardCompare:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_mailboxRepository(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailboxRepository");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_messageData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageData");
}

id objc_msgSend_mf_utf8HTMLStringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mf_utf8HTMLStringWithString:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_needsValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsValue");
}

id objc_msgSend_notRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notRequired");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectID");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parent");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performQuery_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performQuery:completionHandler:");
}

id objc_msgSend_personHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personHandle");
}

id objc_msgSend_predicateForMailboxType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForMailboxType:");
}

id objc_msgSend_readStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readStatus");
}

id objc_msgSend_receivingAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivingAccounts");
}

id objc_msgSend_recipient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipient");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_reverseTransformedValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseTransformedValue:");
}

id objc_msgSend_saveMessageData_forAccountWithID_autosaveIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveMessageData:forAccountWithID:autosaveIdentifier:completionBlock:");
}

id objc_msgSend_scheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduler");
}

id objc_msgSend_sendMessageData_autosaveIdentifier_isHMEMessage_sendLaterDate_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessageData:autosaveIdentifier:isHMEMessage:sendLaterDate:completionBlock:");
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sender");
}

id objc_msgSend_serializedRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedRepresentation");
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAccounts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccounts:");
}

id objc_msgSend_setAddressListForBcc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddressListForBcc:");
}

id objc_msgSend_setAddressListForCc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddressListForCc:");
}

id objc_msgSend_setAddressListForSender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddressListForSender:");
}

id objc_msgSend_setAddressListForTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddressListForTo:");
}

id objc_msgSend_setBcc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBcc:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setCc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCc:");
}

id objc_msgSend_setDateSent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateSent:");
}

id objc_msgSend_setDisplayImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayImage:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setHeader_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeader:forKey:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setKind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKind:");
}

id objc_msgSend_setMails_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMails:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setPreferredFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredFilename:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSender:");
}

id objc_msgSend_setSerializedRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerializedRepresentation:");
}

id objc_msgSend_setSerializedRepresentations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerializedRepresentations:");
}

id objc_msgSend_setSubject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubject:");
}

id objc_msgSend_setTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTo:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserActivity:");
}

id objc_msgSend_signpostID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signpostID");
}

id objc_msgSend_signpostLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signpostLog");
}

id objc_msgSend_sortDescriptorForDisplayOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorForDisplayOrder");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subject");
}

id objc_msgSend_successWithResolvedPerson_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedPerson:");
}

id objc_msgSend_successWithResolvedString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedString:");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_to(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "to");
}

id objc_msgSend_transformedValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transformedValue:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueID");
}

id objc_msgSend_unsupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsupported");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_vipManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vipManager");
}
