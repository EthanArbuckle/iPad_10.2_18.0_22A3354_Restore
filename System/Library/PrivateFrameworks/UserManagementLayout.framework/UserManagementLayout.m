id sub_249991310(void *a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    sub_249994B80(MEMORY[0x24BDD1880], a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "UUIDString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t sub_249991360(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  int v4;

  if (!a1)
    return 0;
  objc_msgSend(a1, "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "BOOLValue");
    v4 = 0;
  }
  else
  {
    v3 = 0;
    v4 = 2;
  }
  *__error() = v4;

  return v3;
}

uint64_t sub_2499913E4(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  int v5;

  if (!a1)
    return 0;
  objc_msgSend(a1, "objectForKey:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend(v4, "intValue");
    v5 = 0;
  }
  else
  {
    v5 = 2;
  }
  *__error() = v5;

  return a3;
}

uint64_t sub_249991468(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  int v5;

  if (!a1)
    return 0;
  objc_msgSend(a1, "objectForKey:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend(v4, "unsignedIntValue");
    v5 = 0;
  }
  else
  {
    v5 = 2;
  }
  *__error() = v5;

  return a3;
}

uint64_t sub_2499914EC(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  int v5;

  if (!a1)
    return 0;
  objc_msgSend(a1, "objectForKey:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend(v4, "longLongValue");
    v5 = 0;
  }
  else
  {
    v5 = 2;
  }
  *__error() = v5;

  return a3;
}

uint64_t sub_249991570(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  int v5;

  if (!a1)
    return 0;
  objc_msgSend(a1, "objectForKey:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend(v4, "unsignedLongLongValue");
    v5 = 0;
  }
  else
  {
    v5 = 2;
  }
  *__error() = v5;

  return a3;
}

id sub_2499915F4(void *a1, uint64_t a2)
{
  void *v2;
  char isKindOfClass;
  int *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "objectForKey:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *v4 = 0;
      v5 = v2;
    }
    else
    {
      v5 = 0;
      *v4 = 2;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id sub_249991670(void *a1, uint64_t a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  objc_msgSend(a1, "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            *__error() = 2;

            v8 = 0;
            goto LABEL_14;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *__error() = 0;
LABEL_14:

  }
  else
  {
    v8 = 0;
    *__error() = 2;
  }

  return v8;
}

id sub_249991808(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  int v4;

  if (a1)
  {
    objc_msgSend(a1, "objectForKey:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sub_249994B80(MEMORY[0x24BDD1880], v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 2 * (v3 == 0);
    }
    else
    {
      v3 = 0;
      v4 = 2;
    }
    *__error() = v4;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id sub_2499918A0(void *a1, uint64_t a2)
{
  void *v2;
  char isKindOfClass;
  int *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "objectForKey:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *v4 = 0;
      v5 = v2;
    }
    else
    {
      v5 = 0;
      *v4 = 2;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id sub_24999191C(void *a1, uint64_t a2)
{
  void *v2;
  char isKindOfClass;
  int *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "objectForKey:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *v4 = 0;
      v5 = v2;
    }
    else
    {
      v5 = 0;
      *v4 = 2;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id sub_249991998(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a1, 200, 0, &v9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v9;
  if (!v1)
  {
    if (qword_2578B0DB0 != -1)
      dispatch_once(&qword_2578B0DB0, &unk_251AD47D8);
    v3 = (id)qword_2578B0DA8;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = sub_249998C68();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        v5 = v4;
      else
        v5 = v4 & 0xFFFFFFFE;
      if (v5)
      {
        v10 = 138543362;
        v11 = v2;
        v6 = _os_log_send_and_compose_impl();
        v7 = (void *)v6;
        if (v6)
          sub_249998C90(v6);
      }
      else
      {
        v7 = 0;
      }
      free(v7);
    }

  }
  return v1;
}

id sub_249991B14(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a1, 200, 0, &v9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v9;
  if (!v1)
  {
    if (qword_2578B0DB0 != -1)
      dispatch_once(&qword_2578B0DB0, &unk_251AD47D8);
    v3 = (id)qword_2578B0DA8;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = sub_249998C68();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        v5 = v4;
      else
        v5 = v4 & 0xFFFFFFFE;
      if (v5)
      {
        v10 = 138412290;
        v11 = v2;
        v6 = _os_log_send_and_compose_impl();
        v7 = (void *)v6;
        if (v6)
          sub_249998C90(v6);
      }
      else
      {
        v7 = 0;
      }
      free(v7);
    }

  }
  return v1;
}

id sub_249991C90(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a1, 0, 0, &v15);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v15;
    if (v1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_2578B0DB0 != -1)
          dispatch_once(&qword_2578B0DB0, &unk_251AD47D8);
        v3 = (id)qword_2578B0DA8;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          v16[0] = 0;
          v4 = sub_249998C68();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
            v5 = v4;
          else
            v5 = v4 & 0xFFFFFFFE;
          if (v5)
          {
            v6 = _os_log_send_and_compose_impl();
            v7 = (void *)v6;
            if (v6)
              sub_249998C90(v6);
          }
          else
          {
            v7 = 0;
          }
          free(v7);
        }

        v13 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (qword_2578B0DB0 != -1)
        dispatch_once(&qword_2578B0DB0, &unk_251AD47D8);
      v8 = (id)qword_2578B0DA8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = sub_249998C68();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          v10 = v9;
        else
          v10 = v9 & 0xFFFFFFFE;
        if (v10)
        {
          LODWORD(v16[0]) = 138543362;
          *(_QWORD *)((char *)v16 + 4) = v2;
          v11 = _os_log_send_and_compose_impl();
          v12 = (void *)v11;
          if (v11)
            sub_249998C90(v11);
        }
        else
        {
          v12 = 0;
        }
        free(v12);
      }

    }
    v13 = v1;
LABEL_29:

    return v13;
  }
  return 0;
}

id sub_249991F0C(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a1, 0, 0, &v15);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v15;
    if (v1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_2578B0DB0 != -1)
          dispatch_once(&qword_2578B0DB0, &unk_251AD47D8);
        v3 = (id)qword_2578B0DA8;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          v16[0] = 0;
          v4 = sub_249998C68();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
            v5 = v4;
          else
            v5 = v4 & 0xFFFFFFFE;
          if (v5)
          {
            v6 = _os_log_send_and_compose_impl();
            v7 = (void *)v6;
            if (v6)
              sub_249998C90(v6);
          }
          else
          {
            v7 = 0;
          }
          free(v7);
        }

        v13 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (qword_2578B0DB0 != -1)
        dispatch_once(&qword_2578B0DB0, &unk_251AD47D8);
      v8 = (id)qword_2578B0DA8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = sub_249998C68();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          v10 = v9;
        else
          v10 = v9 & 0xFFFFFFFE;
        if (v10)
        {
          LODWORD(v16[0]) = 138543362;
          *(_QWORD *)((char *)v16 + 4) = v2;
          v11 = _os_log_send_and_compose_impl();
          v12 = (void *)v11;
          if (v11)
            sub_249998C90(v11);
        }
        else
        {
          v12 = 0;
        }
        free(v12);
      }

    }
    v13 = v1;
LABEL_29:

    return v13;
  }
  return 0;
}

void sub_249992188()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_2578B0DA0, "default");
  v1 = (void *)qword_2578B0DA8;
  qword_2578B0DA8 = (uint64_t)v0;

}

id sub_2499921BC(void *a1, void *a2)
{
  id v3;

  v3 = a2;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(&stru_251AD4900, "dataUsingEncoding:", 4);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v3;
    a1 = v3;
  }

  return a1;
}

void sub_249994B4C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_2578B0DA0, "sideeffect");
  v1 = (void *)qword_2544B43D0;
  qword_2544B43D0 = (uint64_t)v0;

}

id sub_249994B80(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v2);

  return v3;
}

id sub_249994BCC(uint64_t a1, const __CFUUID *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *v5;

  objc_opt_self();
  if (a2)
  {
    v3 = (__CFString *)CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x24BDBD240], a2);
    if (!v3)
      sub_24999EF50();
    v4 = v3;
    sub_249994B80(MEMORY[0x24BDD1880], v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

CFUUIDRef sub_249994C3C(void *a1)
{
  const __CFAllocator *v1;
  __CFString *v2;
  CFUUIDRef v3;

  if (!a1)
    return 0;
  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  objc_msgSend(a1, "UUIDString");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = CFUUIDCreateFromString(v1, v2);

  if (!v3)
    sub_24999EF50();
  return v3;
}

id sub_249994C98()
{
  objc_opt_self();
  if (qword_2578B0DC0 != -1)
    dispatch_once(&qword_2578B0DC0, &unk_251AD4818);
  return (id)qword_2578B0DB8;
}

void sub_249994CDC()
{
  UMLProviderSideEffects *v0;
  void *v1;

  v0 = objc_alloc_init(UMLProviderSideEffects);
  v1 = (void *)qword_2578B0DB8;
  qword_2578B0DB8 = (uint64_t)v0;

}

id sub_249994D90()
{
  return sub_249994C98();
}

uint64_t sub_249994D9C(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

void sub_249994DA8(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

uint64_t sub_249994DB8(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

void sub_249994DC4(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

uint64_t sub_249996704(uint64_t a1, void *a2, _removefile_state *a3, _QWORD *a4)
{
  id v7;
  int v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  _BYTE *v35;
  uint64_t v36;
  _BYTE v37[24];
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  if (a1)
  {
    if (a4)
      *a4 = 0;
    HIDWORD(v36) = 0;
    if (removefile_state_set(a3, 3u, sub_249996D24))
    {
      v8 = *__error();
      HIDWORD(v36) = v8;
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v9 = (id)qword_2544B43D8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)v37 = 0;
        v10 = sub_249998C68();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          v11 = v10;
        else
          v11 = v10 & 0xFFFFFFFE;
        if (v11)
        {
          LODWORD(v38[0]) = 67109120;
          HIDWORD(v38[0]) = v8;
          LODWORD(v36) = 8;
          v35 = v38;
          goto LABEL_22;
        }
        goto LABEL_24;
      }
      goto LABEL_26;
    }
    if (removefile_state_set(a3, 4u, (char *)&v36 + 4))
    {
      HIDWORD(v36) = *__error();
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v9 = (id)qword_2544B43D8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)v37 = 0;
        v12 = sub_249998C68();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          v13 = v12;
        else
          v13 = v12 & 0xFFFFFFFE;
        if (v13)
        {
          LODWORD(v38[0]) = 67109120;
          HIDWORD(v38[0]) = HIDWORD(v36);
          LODWORD(v36) = 8;
          v35 = v38;
LABEL_22:
          v14 = _os_log_send_and_compose_impl();
          v15 = (void *)v14;
          if (v14)
            sub_249998C90(v14);
          goto LABEL_25;
        }
LABEL_24:
        v15 = 0;
LABEL_25:
        free(v15);
      }
LABEL_26:

      if (a4)
      {
LABEL_27:
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], SHIDWORD(v36), 0, v35, v36, *(_QWORD *)v37, *(_OWORD *)&v37[8]);
        a1 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_73;
      }
LABEL_72:
      a1 = 0;
      goto LABEL_73;
    }
    v16 = objc_retainAutorelease(v7);
    if (removefile((const char *)objc_msgSend(v16, "UTF8String"), a3, 1u))
    {
      HIDWORD(v36) = *__error();
      if (HIDWORD(v36) != 2)
      {
        if (qword_2544B43E8 != -1)
          dispatch_once(&qword_2544B43E8, &unk_251AD4838);
        v22 = (id)qword_2544B43D8;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v38[0] = 0;
          v23 = sub_249998C68();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            v24 = v23;
          else
            v24 = v23 & 0xFFFFFFFE;
          if (v24)
          {
LABEL_58:
            *(_DWORD *)v37 = 138543618;
            *(_QWORD *)&v37[4] = v16;
            *(_WORD *)&v37[12] = 1024;
            *(_DWORD *)&v37[14] = HIDWORD(v36);
            LODWORD(v36) = 18;
            v35 = v37;
            v27 = _os_log_send_and_compose_impl();
            v28 = (void *)v27;
            if (v27)
              sub_249998C90(v27);
            goto LABEL_70;
          }
LABEL_69:
          v28 = 0;
LABEL_70:
          free(v28);
        }
LABEL_71:

        if (a4)
          goto LABEL_27;
        goto LABEL_72;
      }
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v17 = (id)qword_2544B43D8;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v38[0] = 0;
        v18 = sub_249998C68();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          v19 = v18;
        else
          v19 = v18 & 0xFFFFFFFE;
        if (v19)
        {
          *(_DWORD *)v37 = 138543362;
          *(_QWORD *)&v37[4] = v16;
          LODWORD(v36) = 12;
          v35 = v37;
          v20 = _os_log_send_and_compose_impl();
          v21 = (void *)v20;
          if (v20)
            sub_249998C90(v20);
        }
        else
        {
          v21 = 0;
        }
        free(v21);
      }

    }
    if ((v36 & 0xFFFFFFFD00000000) != 0)
    {
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v22 = (id)qword_2544B43D8;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v38[0] = 0;
        v25 = sub_249998C68();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          v26 = v25;
        else
          v26 = v25 & 0xFFFFFFFE;
        if (v26)
          goto LABEL_58;
        goto LABEL_69;
      }
      goto LABEL_71;
    }
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v29 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v38[0] = 0;
      v30 = sub_249998C68();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        v31 = v30;
      else
        v31 = v30 & 0xFFFFFFFE;
      if (v31)
      {
        *(_DWORD *)v37 = 138543362;
        *(_QWORD *)&v37[4] = v16;
        v32 = _os_log_send_and_compose_impl();
        v33 = (void *)v32;
        if (v32)
          sub_249998C90(v32);
      }
      else
      {
        v33 = 0;
      }
      free(v33);
    }

    a1 = 1;
  }
LABEL_73:

  return a1;
}

uint64_t sub_249996D24(_removefile_state *a1, const char *a2, _DWORD *a3)
{
  int v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  unsigned int v24;
  unsigned int v25;
  NSObject *v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  int v31;
  unsigned int v32;
  unsigned int v33;
  NSObject *v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  int dst;
  _BYTE v40[12];
  __int16 v41;
  int v42;
  stat v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    v5 = *__error();
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v6 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)&v43.st_dev = 0;
      v7 = sub_249998C68();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        v8 = v7;
      else
        v8 = v7 & 0xFFFFFFFE;
      if (v8)
      {
        *(_DWORD *)v40 = 67109120;
        *(_DWORD *)&v40[4] = v5;
        v9 = _os_log_send_and_compose_impl();
        v10 = (void *)v9;
        if (v9)
          sub_249998C90(v9);
      }
      else
      {
        v10 = 0;
      }
      free(v10);
    }

    return 0;
  }
  v11 = dst;
  if (dst == 1)
  {
    memset(&v43, 0, sizeof(v43));
    if (lstat(a2, &v43))
    {
      v17 = *__error();
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v18 = (id)qword_2544B43D8;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_74;
      v19 = sub_249998C68();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        v20 = v19;
      else
        v20 = v19 & 0xFFFFFFFE;
      if (v20)
        goto LABEL_30;
      goto LABEL_72;
    }
    if ((v43.st_flags & 2) != 0)
    {
      if (lchflags(a2, v43.st_flags & 0xFFFFFFFD))
      {
        v17 = *__error();
        if (qword_2544B43E8 != -1)
          dispatch_once(&qword_2544B43E8, &unk_251AD4838);
        v18 = (id)qword_2544B43D8;
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          goto LABEL_74;
        v24 = sub_249998C68();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          v25 = v24;
        else
          v25 = v24 & 0xFFFFFFFE;
        if (v25)
        {
LABEL_30:
          *(_DWORD *)v40 = 136446466;
          *(_QWORD *)&v40[4] = a2;
          v41 = 1024;
          v42 = v17;
          goto LABEL_31;
        }
LABEL_72:
        v22 = 0;
LABEL_73:
        free(v22);
LABEL_74:

        goto LABEL_75;
      }
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v26 = (id)qword_2544B43D8;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = sub_249998C68();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          v28 = v27;
        else
          v28 = v27 & 0xFFFFFFFE;
        if (v28)
        {
          *(_DWORD *)v40 = 136446210;
          *(_QWORD *)&v40[4] = a2;
          v29 = _os_log_send_and_compose_impl();
          v30 = (void *)v29;
          if (v29)
            sub_249998C90(v29);
        }
        else
        {
          v30 = 0;
        }
        free(v30);
      }

      if (unlink(a2))
      {
        v31 = *__error();
        if (v31 != 2)
        {
          if (qword_2544B43E8 != -1)
            dispatch_once(&qword_2544B43E8, &unk_251AD4838);
          v18 = (id)qword_2544B43D8;
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            goto LABEL_74;
          v32 = sub_249998C68();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            v33 = v32;
          else
            v33 = v32 & 0xFFFFFFFE;
          if (v33)
          {
            *(_DWORD *)v40 = 136446466;
            *(_QWORD *)&v40[4] = a2;
            v41 = 1024;
            v42 = v31;
LABEL_31:
            v21 = _os_log_send_and_compose_impl();
            v22 = (void *)v21;
            if (v21)
              sub_249998C90(v21);
            goto LABEL_73;
          }
          goto LABEL_72;
        }
      }
      dst = 0;
    }
LABEL_75:
    v11 = dst;
    goto LABEL_76;
  }
  if (dst == 2)
  {
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v12 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_QWORD *)v40 = 0;
      v13 = sub_249998C68();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if (v14)
      {
        v43.st_dev = 136446210;
        *(_QWORD *)&v43.st_mode = a2;
        v15 = _os_log_send_and_compose_impl();
        v16 = (void *)v15;
        if (v15)
          sub_249998C90(v15);
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

    return 0;
  }
LABEL_76:
  if (v11)
  {
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v34 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)v40 = 0;
      v35 = sub_249998C68();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        v36 = v35;
      else
        v36 = v35 & 0xFFFFFFFE;
      if (v36)
      {
        v43.st_dev = 136446466;
        *(_QWORD *)&v43.st_mode = a2;
        WORD2(v43.st_ino) = 1024;
        *(_DWORD *)((char *)&v43.st_ino + 6) = dst;
        v37 = _os_log_send_and_compose_impl();
        v38 = (void *)v37;
        if (v37)
          sub_249998C90(v37);
      }
      else
      {
        v38 = 0;
      }
      free(v38);
    }

    if (!*a3)
      *a3 = dst;
  }
  return 0;
}

uint64_t sub_249997EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v10;
  void *v11;
  uint64_t (**v12)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v13;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x24BCFCC74](a6);
  v13 = ((uint64_t (**)(_QWORD, uint64_t, uint64_t, void *, void *))v12)[2](v12, a1, a2, v10, v11);

  return v13;
}

void sub_249997F48()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_2578B0DA0, "sideeffect");
  v1 = (void *)qword_2544B43D8;
  qword_2544B43D8 = (uint64_t)v0;

}

uint64_t UMLCreatePrimaryUserLayout(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v13;

  +[UMLManager sharedManager](UMLManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v8, "createUserLayoutForUserwithUserID:withAKSSetup:onUserVolumePath:fromSystemVolumePath:withError:", 501, a3, a2, a1, &v13);
  v10 = v13;
  v11 = v10;
  if (a4 && (v9 & 1) == 0 && v10)
    *a4 = v10;

  return v9;
}

void sub_249998C00()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_2578B0DA0, "userlayout");
  v1 = (void *)qword_2578B0DC8;
  qword_2578B0DC8 = (uint64_t)v0;

}

void UMLSetLogHandler()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x24BCFCC74]();
  v1 = (void *)qword_2578B0DD8;
  qword_2578B0DD8 = v0;

}

void *UMLSetInternalLogHandlers(void *result, void *a2)
{
  off_2544B43C0 = result;
  off_2544B43C8 = a2;
  return result;
}

uint64_t sub_249998C68()
{
  if (off_2544B43C0)
    return off_2544B43C0();
  else
    return 2 * (qword_2578B0DD8 != 0);
}

uint64_t sub_249998C90(uint64_t a1)
{
  if (off_2544B43C8)
    return off_2544B43C8(a1);
  if (!qword_2578B0DD8)
    sub_24999EF68();
  return (*(uint64_t (**)(void))(qword_2578B0DD8 + 16))();
}

void sub_249998D10()
{
  UMLManager *v0;
  id *v1;
  void *v2;
  id v3;

  v0 = [UMLManager alloc];
  sub_249994D90();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = sub_249998D6C((id *)&v0->super.isa, v3);
  v2 = (void *)qword_2578B0DE0;
  qword_2578B0DE0 = (uint64_t)v1;

}

id *sub_249998D6C(id *a1, void *a2)
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)UMLManager;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    if (!v5)
      sub_24999EF50();
    a1 = v5;

    objc_storeStrong(a1 + 1, a2);
    v6 = objc_opt_new();
    v7 = a1[2];
    a1[2] = (id)v6;

  }
  return a1;
}

uint64_t sub_24999A134(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5)
{
  id v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  char v19;
  NSObject *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;

  v8 = a4;
  v9 = a5;
  if (a3 == 2)
  {
    if (qword_2578B0DF8 != -1)
      dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
    v10 = (id)qword_2578B0DF0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = sub_249998C68();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        v12 = v11;
      else
        v12 = v11 & 0xFFFFFFFE;
      if (v12)
      {
        v13 = _os_log_send_and_compose_impl();
        v14 = (void *)v13;
        if (v13)
          sub_249998C90(v13);
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

    v16 = *(_QWORD **)(a1 + 32);
    if (v16)
      v16 = (_QWORD *)v16[1];
    v17 = v16;
    sub_249994DB8((uint64_t)v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "chownPath:toUser:group:error:", v9, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 40), 0);

    if ((v19 & 1) != 0)
    {
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v20 = (id)qword_2578B0DF0;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v21 = sub_249998C68();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          v22 = v21;
        else
          v22 = v21 & 0xFFFFFFFE;
        if (v22)
        {
          v23 = _os_log_send_and_compose_impl();
          v24 = (void *)v23;
          if (v23)
            sub_249998C90(v23);
        }
        else
        {
          v24 = 0;
        }
        free(v24);
      }
      v15 = 0;
    }
    else
    {
      if (qword_2578B0DF8 != -1)
        dispatch_once(&qword_2578B0DF8, &unk_251AD48C0);
      v20 = (id)qword_2578B0DF0;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v25 = sub_249998C68();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          v26 = v25;
        else
          v26 = v25 & 0xFFFFFFFE;
        if (v26)
        {
          v27 = _os_log_send_and_compose_impl();
          v28 = (void *)v27;
          if (v27)
            sub_249998C90(v27);
        }
        else
        {
          v28 = 0;
        }
        free(v28);
      }
      v15 = 2;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_24999B93C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_2578B0DA0, "userlayout");
  v1 = (void *)qword_2578B0DF0;
  qword_2578B0DF0 = (uint64_t)v0;

}

void sub_24999EF1C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_2578B0DA0, "userlayout");
  v1 = (void *)qword_2578B0E00;
  qword_2578B0E00 = (uint64_t)v0;

}

void sub_24999EF50()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_24999EF68()
{
  _os_crash();
  __break(1u);
  AKSIdentityAddPersona();
}

uint64_t AKSIdentityAddPersona()
{
  return MEMORY[0x24BE07888]();
}

uint64_t AKSIdentityCreate()
{
  return MEMORY[0x24BE07890]();
}

uint64_t AKSIdentityDelete()
{
  return MEMORY[0x24BE07898]();
}

uint64_t AKSIdentityDeletePersona()
{
  return MEMORY[0x24BE078A0]();
}

uint64_t AKSIdentityLoad()
{
  return MEMORY[0x24BE078A8]();
}

uint64_t AKSIdentityLogin()
{
  return MEMORY[0x24BE078B0]();
}

uint64_t AKSIdentityUnload()
{
  return MEMORY[0x24BE078B8]();
}

uint64_t AKSVolumeBootstrapFS()
{
  return MEMORY[0x24BE078C0]();
}

uint64_t AKSVolumeMap()
{
  return MEMORY[0x24BE078C8]();
}

uint64_t AKSVolumeUnmap()
{
  return MEMORY[0x24BE078D0]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D8](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t aks_get_system()
{
  return MEMORY[0x24BE07908]();
}

uint64_t aks_unlock_device()
{
  return MEMORY[0x24BE07928]();
}

uint64_t aks_unwrap_key()
{
  return MEMORY[0x24BE07930]();
}

uint64_t aks_wrap_key()
{
  return MEMORY[0x24BE07938]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x24BDADBB8](from, to, state, *(_QWORD *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x24BDADBC0]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x24BDADBC8](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x24BDADBD8](s, *(_QWORD *)&flag, src);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x24BDAE528](*(_QWORD *)&a1);
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x24BDAEA18](a1, *(_QWORD *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEA20](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAEA28](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x24BDAEF60](path, omode);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x24BDAFB40](path, state, *(_QWORD *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x24BDAFB48]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x24BDAFB50](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x24BDAFB58](state, *(_QWORD *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x24BDAFB60](state, *(_QWORD *)&key, value);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x24BDAFB90](a1, a2, *(_QWORD *)&a3);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

