void sub_22AD1A20C(objc_class *a1)
{
  objc_method *InstanceMethod;
  objc_method *v3;

  InstanceMethod = class_getInstanceMethod(a1, sel_prepareLayout);
  v3 = class_getInstanceMethod(a1, sel_tmlPrepareLayout);
  method_exchangeImplementations(InstanceMethod, v3);
}

uint64_t sub_22AD1A250(void *a1, const char *a2, double a3)
{
  const char *v4;
  double v5;

  objc_msgSend_tmlPrepareLayout(a1, a2, a3);
  return objc_msgSend_emitTMLSignal_withArguments_(a1, v4, v5, CFSTR("prepareLayout"), 0);
}

void sub_22AD1A328(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("83847776g&}/eWZKBaN-@%-{yB/0iXwWE{+Cd>8:9CsIf1y.]uA7AZd%%nrfce4{f%BugoTwJusfXm*-.uFiUKZjF)IP7M{55vL.?O)ek!X0]r442uT)1)GL(g.8ni]M&17j:DY!rj:?gmWOH7UrEP#v$8<nC9i<VAaOgiDO3C=-I98/HeBz(hhp&ZF+BZ]I]x>qGQz/fVqz!%l3AV#b62XmH.wOkB[wFbh=vRPE:Btw^Q3mG.evpShPz!a02Bxrf#xI-bTvqPN$wPz&Vz/6DfwPRT8zBeeTv}#RR8w&!*Aa9=}zdN*2A=R<2wnbK}x(v($A^nMu3j*S+ze:r5BzkVhltQNIyz3!Wy&r*0a$vzEvpShPz!a02Bxrf#xI-bTvqPN$wPz&Mv@Dj6y?mZ5z/d)Tz!0Mzb76.yq+H5hz/Pz=A=kGhv@$:=wP{HWzGG]qy&0W6l$HgCxjk)[b2!)<Ab](cBZ]I]x>qGQz/fVqz!%l3AZTRLmRM:OB7=9=8zhvbC4>JilVl<:A=k=gwPwz6q+H5hz/Pz=A=kGhv@$:=wP{HWzGG]qy&0W6c&$>9mSiA!wmoN]z/b");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "83847776g&}/eWZKBaN-@%-{yB/0iXwWE{+Cd>8:9CsIf1y.]uA7AZd%%nrfce4{f%BugoTwJusfXm*-.uFiUKZjF)IP7M{55vL.?O)ek!X0]r442uT)1)GL(g.8ni]M&17j:DY!rj:?gmWOH7UrEP#v$8<nC9i<VAaOgiDO3C=-I98/HeBz(hhp&ZF+BZ]I]x>qGQz/fVqz!%l3AV#b62XmH.wOkB[wFbh=vRPE:Btw^Q3mG.evpShPz!a02Bxrf#xI-bTvqPN$wPz&Vz/6DfwPRT8zBeeTv}#RR8w&!*Aa9=}zdN*2A=R<2wnbK}x(v($A^nMu3j*S+ze:r5BzkVhltQNIyz3!Wy&r*0a$vzEvpShPz!a02Bxrf#xI-bTvqPN$wPz&Mv@Dj6y?mZ5z/d)Tz!0Mzb76.yq+H5hz/Pz=A=kGhv@$:=wP{HWzGG]qy&0W6l$HgCxjk)[b2!)<Ab](cBZ]I]x>qGQz/fVqz!%l3AZTRLmRM:OB7=9=8zhvbC4>JilVl<:A=k=gwPwz6q+H5hz/Pz=A=kGhv@$:=wP{HWzGG]qy&0W6c&$>9mSiA!wmoN]z/b", v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

void sub_22AD1A558(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen(a83847776kajGqq);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, a83847776kajGqq, v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

id sub_22AD1A7EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;

  v6 = (void *)MEMORY[0x24BE6ED78];
  v7 = (void *)MEMORY[0x24BDD1518];
  v8 = a2;
  objc_msgSend_decimalNumberWithString_(v7, v9, v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_summaryItemWithLabel_amount_type_(v6, v12, v13, v8, v11, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id sub_22AD1A870(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  const char *v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v12;

  v2 = (objc_class *)MEMORY[0x24BE6EBD8];
  v3 = a2;
  v4 = [v2 alloc];
  v12 = 0;
  v7 = (void *)objc_msgSend_initWithData_error_(v4, v5, v6, v3, &v12);

  v8 = v12;
  v9 = v8;
  if (v8)
  {
    NSLog(CFSTR("Wrong pass data:%@"), v8);
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

uint64_t sub_22AD1A904()
{
  Class v0;
  double v1;

  v0 = NSClassFromString(CFSTR("PKPaymentAuthorizationViewController"));
  return MEMORY[0x24BEDD108](v0, sel_canMakePayments, v1);
}

uint64_t sub_22AD1A920(uint64_t a1, void *a2)
{
  id v2;
  Class v3;
  const char *v4;
  double v5;
  uint64_t PaymentsUsingNetworks;

  v2 = a2;
  v3 = NSClassFromString(CFSTR("PKPaymentAuthorizationViewController"));
  PaymentsUsingNetworks = objc_msgSend_canMakePaymentsUsingNetworks_(v3, v4, v5, v2);

  return PaymentsUsingNetworks;
}

uint64_t sub_22AD1A960(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  Class v5;
  const char *v6;
  double v7;
  uint64_t PaymentsUsingNetworks_capabilities;

  v4 = a2;
  v5 = NSClassFromString(CFSTR("PKPaymentAuthorizationViewController"));
  PaymentsUsingNetworks_capabilities = objc_msgSend_canMakePaymentsUsingNetworks_capabilities_(v5, v6, v7, v4, a3);

  return PaymentsUsingNetworks_capabilities;
}

void sub_22AD1B55C()
{
  TMLAspectsRegistration *v0;
  void *v1;

  v0 = objc_alloc_init(TMLAspectsRegistration);
  v1 = (void *)qword_255B519B8;
  qword_255B519B8 = (uint64_t)v0;

}

void sub_22AD1B958(uint64_t a1, void *a2, double a3)
{
  char *v4;
  double v5;
  char *v6;

  objc_msgSend_object(a2, (const char *)a2, a3);
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend_addObject_(*(void **)(a1 + 32), v4, v5, v4);
    v4 = v6;
  }

}

void sub_22AD1C158(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen(a83847776dxapYv);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, a83847776dxapYv, v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

id sub_22AD1C2C8()
{
  return objc_alloc_init(MEMORY[0x24BDC74E8]);
}

id sub_22AD1C2E4(double a1, uint64_t a2, const char *a3)
{
  if (!a3)
    return 0;
  objc_msgSend_eventWithEventStore_(MEMORY[0x24BDC74E0], a3, a1, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_22AD1C314()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDC7468], sel_alarmWithRelativeOffset_, 0.0);
}

uint64_t sub_22AD1C324(double a1)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDC7468], sel_alarmWithRelativeOffset_, a1);
}

id sub_22AD1C330(double a1, uint64_t a2, const char *a3)
{
  if (!a3)
    return 0;
  objc_msgSend_alarmWithAbsoluteDate_(MEMORY[0x24BDC7468], a3, a1, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_22AD1C65C(uint64_t a1)
{
  const char *v1;
  double v2;
  const char *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  id v7;

  NSStringFromClass(*(Class *)(a1 + 32));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend_UTF8String(v7, v1, v2);
  dispatch_get_global_queue(-2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create_with_target_V2(v3, 0, v4);
  v6 = (void *)qword_255B519D0;
  qword_255B519D0 = (uint64_t)v5;

}

void sub_22AD1C6D4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend_isObject(v6, v9, v10) && (objc_msgSend_isObject(v8, v11, v12) & 1) != 0)
  {
    objc_msgSend_toString(v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_convertJsValue_toType_(TMLJSEnvironment, v14, v15, v7, 16);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v17, v18, "@");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v20, v21, v8, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = qword_255B519D0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22AD1C8A0;
    block[3] = &unk_24F4FD310;
    v38 = v13;
    v39 = v16;
    v40 = v22;
    v24 = v22;
    v25 = v16;
    v26 = v13;
    dispatch_async(v23, block);

  }
  else
  {
    v27 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v11, v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v27, v29, v30, CFSTR("Block is not a function"), v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v34, v35, v36, v31);

  }
}

void sub_22AD1C8A0(uint64_t a1, const char *a2, double a3)
{
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend_executeFunction_argument_(TMLBackgroundBlock, a2, a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD1C940;
  v7[3] = &unk_24F4FD2E8;
  v5 = *(id *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t sub_22AD1C940(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_22AD1C990()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDDA738]);
  v1 = (void *)qword_255B519E0;
  qword_255B519E0 = (uint64_t)v0;

}

uint64_t sub_22AD1CB98(uint64_t a1, double a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_handleException_, a2);
}

void sub_22AD1CD64(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  double v8;
  id v9;

  v9 = a3;
  v4 = sub_22AD1CDDC(v9);
  if (v4)
  {
    v5 = v4;
    sub_22AD1CE54(v9, v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addTarget_action_forControlEvents_(a1, v7, v8, v6, sel_controlAction_forEvent_, v5);

  }
}

uint64_t sub_22AD1CDDC(void *a1)
{
  uint64_t v1;
  const char *v2;
  id v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  uint64_t v8;

  v1 = qword_255B51A08;
  v3 = a1;
  if (v1 != -1)
    dispatch_once(&qword_255B51A08, &unk_24F4FD3D0);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51A00, v2, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend_unsignedIntegerValue(v5, v6, v7);
  return v8;
}

id sub_22AD1CE54(void *a1, uint64_t a2, int a3)
{
  const char *v5;
  id v6;
  double v7;
  void *v8;
  BOOL v9;
  TMLUIControlActionTarget *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;

  v6 = a1;
  if (qword_255B519F8 != -1)
    dispatch_once(&qword_255B519F8, &unk_24F4FD3B0);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_255B519F0, v5, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 1;
  else
    v9 = a3 == 0;
  if (!v9)
  {
    v10 = [TMLUIControlActionTarget alloc];
    v8 = (void *)objc_msgSend_initWithSignal_controlEvent_(v10, v11, v12, v6, a2);
    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_255B519F0, v13, v14, v8, v6);
  }

  return v8;
}

void sub_22AD1CF0C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a3;
  v4 = sub_22AD1CDDC(v9);
  v5 = v9;
  if (v4)
  {
    sub_22AD1CE54(v9, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend_removeTarget_action_forControlEvents_(a1, v6, v8, v7, sel_controlAction_forEvent_, v4);

    v5 = v9;
  }

}

void sub_22AD1D0A4()
{
  id v0;
  const char *v1;
  double v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x24BDBCED8]);
  v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 14);
  v4 = (void *)qword_255B519F0;
  qword_255B519F0 = v3;

}

void sub_22AD1D0D4()
{
  void *v0;

  v0 = (void *)qword_255B51A00;
  qword_255B51A00 = (uint64_t)&unk_24F534868;

}

void sub_22AD1D194(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("83847776LGhrPtbps#)ww/)[iNQevE7814Oi-tO>e29f<:MGWDO%$.oUDBak=%l7)X>={BDrKdK6>70>0/[?2OU265ulRM@f<Q&pR5Z{9es^HN#o@(8#4gyMqQ$KdRd2>t.XmBE$=Ey^{pUs:1Z%u+GZTo.%n&!m@<SPoftV3zdta8avg!C4CMkmpZaOr+Vb?lVl<:A=k=gwPwz0ry]}]C4>O$BzkVhlVl<:A=k=gwPw$a3i+0:wO#P52sRoOC4CMka@Q!1wN]H%r+Vb?l$HgCxjk)[5^An-ygQ)%a@Q^}wP?T5Bw)p1A+b<(mn36)wO#P*Bz(hhg9u]kv{%m+wO:!Cx([6bxaL7/4p-*:v}xEBwncd1zF6rJ0sxAcog9c7wO#3!AZKIUz/YGg5!F5mr+Vb?lVl<:A=k=gwPw$h3j?h>z*cm<z/fbMB-..zzw07Yz/oCo7yyT[wO+{/BzkVhq/)q3wFb8VzGDY@a}+j*wmYN*xjk)[5^An-ygQ)%a@H.1B7/GoB3<wNv}xEyB-..zzw07Yz/oCo8vv6$wO+{/By!#IvqGH)wmoI15^q3eq!p4TG-II}mn36)wO#P<x>qGQz/fVqz!%l3AUn{-nMGLpCscp^BAhqoy?mSh9srJ&y&13lB3<wLwO#3!A.{^/C4>Ji5^hVZz!{Qg3j7fNy?ml/By=6?z^)D)v@@[f3jQAWy&sJsmpZaOx(mL@1y=p/y:6z$1.z<*zGDG@mn36)wO#PlJSxF2mn36)wO#P<x>qGRwO+{<vru68Cm20{C4CMkr+Vb?lVl<:A=k=gwPws.8y2N@v@DmbA=k=gwPwy#mn36)wO#P<x>qGQz/fVqz!%l3AVbw]24q1-x(v(418hT{a$veEwO#P<x>qGQz/fVqz!%l3AYN-Bwj7oLAbo9cwMJO/xHccIx(v(Ibk83A8avg=vqGH)wmoHCxM4*gwPygIy?ml/By=T:3k^nYy?mG{vra.Gz/oYdAZTRLmRM:OB7=9=8ybU2v{%g+zE^f@v}Y!0B7Gw85K/tWvqGH)wmoHCxM4*gwPxg2b18+Pv{%g+zE^f@lUHyRB7GwWx>fOtzEWl]5ciW{3j*SPy?mG{vrb<>z/oYdAUn%Mog9c7wO#3!AZKIUz/YGgc&$O!3l-[/y?mG{vra.Gz/oYdA-lK=wN/*@z/d%Swj73szF9I(0u9i<4}x3:wO#3!A:@^3z/YGg5!NM9lT:!xzE^f@lUHyRB7Gwu0Wri$3kVc7mrSlWBvx.OBxi9!Csl1UwOkB[wG>K&gg+SuzGFrTx()x&wP{HWzGG]qy&0W6l$G$sB.(d!vqGH)wmoHFz/OP:CsuW^zGG}h5e(]63s!0(BAhqoy?mS18avg!C4CMkmpZaOr+Vb?lVl<:A=k=gwPxg2b7/[67Id=3zGFrTx()x&wP{HWzGG]qy&0W65ciW%3jpoYzGG]qy&0W65/BbhmrSlWBvx.OBxi9!Cscp^BAhqoy?mS94giqFv@#B6zw04=zGE6PwP?T5Bvx.OBxi9!Cscp^BAhqoy?mSFwnbNwz/6DfwPRG+x([2Ov@#B6zAolMmrSlWBw3s&");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "83847776LGhrPtbps#)ww/)[iNQevE7814Oi-tO>e29f<:MGWDO%$.oUDBak=%l7)X>={BDrKdK6>70>0/[?2OU265ulRM@f<Q&pR5Z{9es^HN#o@(8#4gyMqQ$KdRd2>t.XmBE$=Ey^{pUs:1Z%u+GZTo.%n&!m@<SPoftV3zdta8avg!C4CMkmpZaOr+Vb?lVl<:A=k=gwPwz0ry]}]C4>O$BzkVhlVl<:A=k=gwPw$a3i+0:wO#P52sRoOC4CMka@Q!1wN]H%r+Vb?l$HgCxjk)[5^An-ygQ)%a@Q^}wP?T5Bw)p1A+b<(mn36)wO#P*Bz(hhg9u]kv{%m+wO:!Cx([6bxaL7/4p-*:v}xEBwncd1zF6rJ0sxAcog9c7wO#3!AZKIUz/YGg5!F5mr+Vb?lVl<:A=k=gwPw$h3j?h>z*cm<z/fbMB-..zzw07Yz/oCo7yyT[wO+{/BzkVhq/)q3wFb8VzGDY@a}+j*wmYN*xjk)[5^An-ygQ)%a@H.1B7/GoB3<wNv}xEyB-..zzw07Yz/oCo8vv6$wO+{/By!#IvqGH)wmoI15^q3eq!p4TG-II}mn36)wO#P<x>qGQz/fVqz!%l3AUn{-nMGLpCscp^BAhqoy?mSh9srJ&y&13lB3<wLwO#3!A.{^/C4>Ji5^hVZz!{Qg3j7fNy?ml/By=6?z^)D)v@@[f3jQAWy&sJsmpZaOx(mL@1y=p/y:6z$1.z<*zGDG@mn36)wO#PlJSxF2mn36)wO#P<x>qGRwO+{<vru68Cm20{C4CMkr+Vb?lVl<:A=k=gwPws.8y2N@v@DmbA=k=gwPwy#mn36)wO#P<x>qGQz/fVqz!%l3AVbw]24q1-x(v(418hT{a$veEwO#P<x>qGQz/fVqz!%l3AYN-Bwj7oLAbo9cwMJO/xHccIx(v(Ibk83A8avg=vqGH)wmoHCxM4*gwPygIy?ml/By=T:3k^nYy?mG{vra.Gz/oYdAZTRLmRM:OB7=9=8ybU2v{%g+zE^f@v}Y!0B7Gw85K/tWvqGH)wmoHCxM4*gwPxg2b18+Pv{%g+zE^f@lUHyRB7GwWx>fOtzEWl]5ciW{3j*SPy?mG{vrb<>z/oYdAUn%Mog9c7wO#3!AZKIUz/YGgc&$O!3l-[/y?mG{vra.Gz/oYdA-lK=wN/*@z/d%Swj73szF9I(0u9i<4}x3:wO#3!A:@^3z/YGg5!NM9lT:!xzE^f@lUHyRB7Gwu0Wri$3kVc7mrSlWBvx.OBxi9!Csl1UwOkB[wG>K&gg+SuzGFrTx()x&wP{HWzGG]qy&0W6l$G$sB.(d!vqGH)wmoHFz/OP:CsuW^zGG}h5e(]63s!0(BAhqoy?mS18avg!C4CMkmpZaOr+Vb?lVl<:A=k=gwPxg2b7/[67Id=3zGFrTx()x&wP{HWzGG]qy&0W65ciW%3jpoYzGG]qy&0W65/BbhmrSlWBvx.OBxi9!Cscp^BAhqoy?mS94giqFv@#B6zw04=zGE6PwP?T5Bvx.OBxi9!Cscp^BAhqoy?mSFwnbNwz/6DfwPRG+x([2Ov@#B6zAolMmrSlWBw3s&", v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

void sub_22AD1D38C(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("83847776JKtlZRFuLw0CK9.-67bNgQu@3{B)=^F6zuMaKS.&.Ao!gB>j0Ry=pe0@eNbhH)iH]cw?Nrzy9(Dp*2H=RAl0Qv-ZV>LTrR#/5T&<74Z%xYVOOZONx)k<r:yRFOu}*ko37828/vPx1KW9{NQTJ8px)5?UNZFt.&x)3G86{2sz6Iz!%uja}L7+xl4M{zw0a+y&r:77Y+/]3jpoYy&st)Aa9l/5^98{AU[*35deOHy&B5@5^q(-z^^-80u@S[6MXwpx(mMYwPhW3B7Glhvruj4zw0d{BAh8kxbyT[4*&CGy&%q41.IN?vrrs!a}s}ZA+e+]1.IN?vrrs!a@*}5zGP/9wPyNUlVl*Xz/fc7BAn5$B.L-n7Y=x]3kE5?y&st}x([2^wN[qKwO2:Cy&%q25e>(.0DF!Rw]8x]Bq+F[0Cr2Gw]8x]Bq+F[0B=VBw]8x]BrROMv@Dg4A-V%%xI@zLi+JFAwO%Lry&%qIghEpnx(mTbs7#+&qE%xeA+e*1ltQ^Ql2pHNvgS$*3jl/O5^q(-z^^-a3jl/D5^q(-z^^-a3jl/y5^q(-z^^-a3jl/x5^q(-z^^-i9CGz9Bxrf#xI@zLi+JFAwO%Lry&%qIvqG)@vlcez3kvh(x()A<BzaM-wjHVKwO%?JB.89}8vu/LAUnK/y&r:78vu/Lxa+wWy&r:78vu/LvIe&Ry&r:7a@s%hx()A<BzaM-wiavzwO2:uvR*f#iX&M15mYS{z/O][Bza3ilVl^VAU5^23KM]A5^z&TBA}?pa}=zoz!%ujs7#+&lQ%HZy&stPgbogEx(mTbs7#+&lQ%HZy&st95e>]-0B(-Dv}G?dAaHj8x(mTbs7#+&lQ%HZy&stPgh^Hrv@Dg4A-V%%xI@zLm@&fLzBeeZwKgcKxKIC-8vu/LAUnK/y&r:78vu/Lxa+wWy&r:78vu/LvIe&Ry&r:78vu/Lvg&-Qy&r:7a%esBz!%ujs7#+&qE%x1xl4M{zAqlyB.9Qxy&B5@iX&@c4}xJ]z/O][BzaP{A+PA75d/-%3j.8/Ab]JhwO#P#BzkVh5^AA0A+PA7a}Vtnz!%ujs7#+&q/)4]zF80qX=SoBlRf:Yy&<lea@7B(z/{evB-Zn/D2<P4vrcx%C]cMa7ZZT?B-.OBBv*sTxjRXXlRf<^vp%c*0u@6Z1A4T+wFbh*BAh8kxbyT[6BCdXzG6-uoj-x&5^qY:A::kg0u@A?3sO3#A+P09By/Ia3s)<XBzkVhvrcSg0wVFs4RxA>By/F]x([2-vqPM!5e(2=1A4T+wFbh*BAh8kxcE)qw[=76wPy<^BzaATzdL:-As9>3x(4)5A-V%%xII#MwMJO/xI08XB-ZC*A:-/@By/Gl5d/-&3iUlPzdKs:B98CpzF6>43i>DTA:-*a5^&e-v@#B6zEENha%XWJx(4)5A-V%%xII#MwJC3HBzal-Acln0vrb^[wPRH7B2(6A3j.b*Bxh*^B.a3XA.x$?5ciWW3i+PYy&%q425^%=wN/*24gihMwQa))B98CpzF7d8B7GC]vqH6$i+AqJoj-xfgaS+uC42ifwKZPUoj-wW5e>#+18zE[5^AA0A+PA7a}eT6y&%qUz/OGZC@^Y23jy]^BvoXLvrDydA$wu@3V/)3l$G$sB.(ev3jd4AlRf<^vp%c");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "83847776JKtlZRFuLw0CK9.-67bNgQu@3{B)=^F6zuMaKS.&.Ao!gB>j0Ry=pe0@eNbhH)iH]cw?Nrzy9(Dp*2H=RAl0Qv-ZV>LTrR#/5T&<74Z%xYVOOZONx)k<r:yRFOu}*ko37828/vPx1KW9{NQTJ8px)5?UNZFt.&x)3G86{2sz6Iz!%uja}L7+xl4M{zw0a+y&r:77Y+/]3jpoYy&st)Aa9l/5^98{AU[*35deOHy&B5@5^q(-z^^-80u@S[6MXwpx(mMYwPhW3B7Glhvruj4zw0d{BAh8kxbyT[4*&CGy&%q41.IN?vrrs!a}s}ZA+e+]1.IN?vrrs!a@*}5zGP/9wPyNUlVl*Xz/fc7BAn5$B.L-n7Y=x]3kE5?y&st}x([2^wN[qKwO2:Cy&%q25e>(.0DF!Rw]8x]Bq+F[0Cr2Gw]8x]Bq+F[0B=VBw]8x]BrROMv@Dg4A-V%%xI@zLi+JFAwO%Lry&%qIghEpnx(mTbs7#+&qE%xeA+e*1ltQ^Ql2pHNvgS$*3jl/O5^q(-z^^-a3jl/D5^q(-z^^-a3jl/y5^q(-z^^-a3jl/x5^q(-z^^-i9CGz9Bxrf#xI@zLi+JFAwO%Lry&%qIvqG)@vlcez3kvh(x()A<BzaM-wjHVKwO%?JB.89}8vu/LAUnK/y&r:78vu/Lxa+wWy&r:78vu/LvIe&Ry&r:7a@s%hx()A<BzaM-wiavzwO2:uvR*f#iX&M15mYS{z/O][Bza3ilVl^VAU5^23KM]A5^z&TBA}?pa}=zoz!%ujs7#+&lQ%HZy&stPgbogEx(mTbs7#+&lQ%HZy&st95e>]-0B(-Dv}G?dAaHj8x(mTbs7#+&lQ%HZy&stPgh^Hrv@Dg4A-V%%xI@zLm@&fLzBeeZwKgcKxKIC-8vu/LAUnK/y&r:78vu/Lxa+wWy&r:78vu/LvIe&Ry&r:78vu/Lvg&-Qy&r:7a%esBz!%ujs7#+&qE%x1xl4M{zAqlyB.9Qxy&B5@iX&@c4}xJ]z/O][BzaP{A+PA75d/-%3j.8/Ab]JhwO#P#BzkVh5^AA0A+PA7a}Vtnz!%ujs7#+&q/)4]zF80qX=SoBlRf:Yy&<lea@7B(z/{evB-Zn/D2<P4vrcx%C]cMa7ZZT?B-.OBBv*sTxjRXXlRf<^vp%c*0u@6Z1A4T+wFbh*BAh8kxbyT[6BCdXzG6-uoj-x&5^qY:A::kg0u@A?3sO3#A+P09By/Ia3s)<XBzkVhvrcSg0wVFs4RxA>By/F]x([2-vqPM!5e(2=1A4T+wFbh*BAh8kxcE)qw[=76wPy<^BzaATzdL:-As9>3x(4)5A-V%%xII#MwMJO/xI08XB-ZC*A:-/@By/Gl5d/-&3iUlPzdKs:B98CpzF6>43i>DTA:-*a5^&e-v@#B6zEENha%XWJx(4)5A-V%%xII#MwJC3HBzal-Acln0vrb^[wPRH7B2(6A3j.b*Bxh*^B.a3XA.x$?5ciWW3i+PYy&%q425^%=wN/*24gihMwQa))B98CpzF7d8B7GC]vqH6$i+AqJoj-xfgaS+uC42ifwKZPUoj-wW5e>#+18zE[5^AA0A+PA7a}eT6y&%qUz/OGZC@^Y23jy]^BvoXLvrDydA$wu@3V/)3l$G$sB.(ev3jd4AlRf<^vp%c", v2,
    0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

uint64_t sub_22AD1E040(void *a1, const char *a2, double a3, uint64_t a4)
{
  return objc_msgSend_tmlValueForKeyPath_inDictionary_(a1, a2, a3, a4, a1);
}

id sub_22AD1E048(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  id v22;
  const char *v23;
  double v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_rangeOfString_(v6, v8, v9, CFSTR("."));
  objc_msgSend_objectForKey_(v7, v11, v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = v13;
    v25 = v22;
  }
  else
  {
    objc_msgSend_substringToIndex_(v6, v14, v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringFromIndex_(v6, v17, v18, v10 + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v7, v20, v21, v16);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_tmlValueForKeyPath_inDictionary_(a1, v23, v24, v19, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }

  }
  return v25;
}

void sub_22AD1E6EC(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0x30uLL, 0x10700407919B52CuLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD1EE6C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend_objectForKeyedSubscript_(v3, v5, v6, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTMLValue_forKeyPath_(*(void **)(a1 + 40), v7, v8, v9, v4);

}

void TouchML_init()
{
  if (qword_255B51A20 != -1)
    dispatch_once(&qword_255B51A20, &unk_24F4FD448);
}

uint64_t sub_22AD1F218(double a1, uint64_t a2, const char *a3)
{
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;

  objc_msgSend_tmlLoadCategory(MEMORY[0x24BEDCDF0], a3, a1);
  objc_msgSend_tmlLoadCategory(MEMORY[0x24BDF6F90], v3, v4);
  objc_msgSend_tmlLoadCategory(MEMORY[0x24BDF6F98], v5, v6);
  objc_msgSend_tmlLoadCategory(MEMORY[0x24BDF6EA8], v7, v8);
  return objc_msgSend_tmlLoadCategory(MEMORY[0x24BDF6918], v9, v10);
}

id TMLAttributedStringForMarkdown(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  id v15;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a2;
  v5 = a1;
  objc_msgSend_dictionaryWithDictionary_(v3, v6, v7, v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parse_tags_withRules_(TMLMarkdownParser, v8, v9, v5, &v15, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_attributedStringWithFormat_attributes_(TMLAttributedString, v11, v12, v10, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id sub_22AD1F5C4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v9;
  const char *v10;

  v9 = objc_alloc(*(Class *)(a1 + 32));
  return (id)objc_msgSend_initWithRect_(v9, v10, a2, a3, a4, a5);
}

BOOL sub_22AD1F610(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  const char *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGRect v25;
  CGRect v26;

  v4 = a3;
  objc_msgSend_rect(a2, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend_rect(v4, v15, v7);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v25.origin.x = v8;
  v25.origin.y = v10;
  v25.size.width = v12;
  v25.size.height = v14;
  v26.origin.x = v17;
  v26.origin.y = v19;
  v26.size.width = v21;
  v26.size.height = v23;
  return CGRectEqualToRect(v25, v26);
}

BOOL sub_22AD1F6A8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  const char *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGRect v25;
  CGRect v26;

  v4 = a3;
  objc_msgSend_rect(a2, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend_rect(v4, v15, v7);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v25.origin.x = v8;
  v25.origin.y = v10;
  v25.size.width = v12;
  v25.size.height = v14;
  v26.origin.x = v17;
  v26.origin.y = v19;
  v26.size.width = v21;
  v26.size.height = v23;
  return CGRectIntersectsRect(v25, v26);
}

BOOL sub_22AD1F740(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  const char *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGRect v25;
  CGRect v26;

  v4 = a3;
  objc_msgSend_rect(a2, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend_rect(v4, v15, v7);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v25.origin.x = v8;
  v25.origin.y = v10;
  v25.size.width = v12;
  v25.size.height = v14;
  v26.origin.x = v17;
  v26.origin.y = v19;
  v26.size.width = v21;
  v26.size.height = v23;
  return CGRectContainsRect(v25, v26);
}

BOOL sub_22AD1F7D8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  const char *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGPoint v21;
  CGRect v22;

  v4 = a3;
  objc_msgSend_rect(a2, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend_point(v4, v15, v7);
  v17 = v16;
  v19 = v18;

  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  v21.x = v17;
  v21.y = v19;
  return CGRectContainsPoint(v22, v21);
}

id sub_22AD1F858(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  const char *v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  const char *v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  const char *v28;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v4 = *(objc_class **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = [v4 alloc];
  objc_msgSend_rect(v6, v8, v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend_rect(v5, v18, v19);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v30.origin.x = v11;
  v30.origin.y = v13;
  v30.size.width = v15;
  v30.size.height = v17;
  v32.origin.x = v21;
  v32.origin.y = v23;
  v32.size.width = v25;
  v32.size.height = v27;
  v31 = CGRectIntersection(v30, v32);
  return (id)objc_msgSend_initWithRect_(v7, v28, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
}

id sub_22AD1F920(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  objc_class *v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  const char *v19;
  CGRect v21;
  CGRect v22;

  v6 = *(objc_class **)(a1 + 32);
  v7 = a2;
  v8 = [v6 alloc];
  objc_msgSend_rect(v7, v9, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v21.origin.x = v12;
  v21.origin.y = v14;
  v21.size.width = v16;
  v21.size.height = v18;
  v22 = CGRectInset(v21, a3, a4);
  return (id)objc_msgSend_initWithRect_(v8, v19, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

id sub_22AD1F9B0(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  const char *v15;
  void *v16;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_CGRectValue(v3, v4, v5);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x24BDBF090];
    v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v14 = objc_alloc(*(Class *)(a1 + 32));
  v16 = (void *)objc_msgSend_initWithRect_(v14, v15, v7, v9, v11, v13);

  return v16;
}

id sub_22AD2015C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  const char *v6;
  double v7;

  v5 = objc_alloc(*(Class *)(a1 + 32));
  return (id)objc_msgSend_initWithRange_(v5, v6, v7, a2, a3);
}

void sub_22AD20954(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_22AD20A34;
  v2[3] = &unk_24F4FD5D0;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  sub_22AD209D4(v2);

}

void sub_22AD209D4(void *a1)
{
  void *v1;
  const char *v2;
  double v3;
  void (**block)(void);

  v1 = (void *)MEMORY[0x24BDD17F0];
  block = a1;
  if (objc_msgSend_isMainThread(v1, v2, v3))
    block[2]();
  else
    dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void sub_22AD20A34(uint64_t a1, const char *a2, double a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_22AD20A78(v3, v4, 0);

}

void sub_22AD20A78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_22AD23690;
  v11[3] = &unk_24F4FD5D0;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend_runInContext_block_(TMLJSEnvironment, v9, v10, a1, v11);

}

void sub_22AD20B24(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_22AD20BC0;
  v5[3] = &unk_24F4FD5F8;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v4 = v3;
  sub_22AD209D4(v5);

}

void sub_22AD20BC0(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4;
  const char *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 48);
  v9 = v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v5, v7, v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD20A78(v4, v6, v10);

  if (!v8)
}

void sub_22AD20C90(uint64_t a1, char a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  char v7;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_22AD20D18;
  v4[3] = &unk_24F4FD648;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  sub_22AD209D4(v4);

}

void sub_22AD20D18(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, v7, *(unsigned __int8 *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v10, v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD20A78(v4, v5, v11);

}

void sub_22AD20DD4(uint64_t a1, float a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  float v7;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_22AD20E64;
  v4[3] = &unk_24F4FD698;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  sub_22AD209D4(v4);

}

void sub_22AD20E64(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4;
  void *v5;
  double v6;
  const char *v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v10, v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD20A78(v4, v5, v11);

}

void sub_22AD20F20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_22AD20FE8;
  v9[3] = &unk_24F4FD6E8;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  sub_22AD209D4(v9);

}

void sub_22AD20FE8(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4;
  const char *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 48);
  v9 = v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v9;
  v10 = *(void **)(a1 + 56);
  v11 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v11;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v5, v7, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD20A78(v4, v6, v12);

  if (!v10)
  {

    if (v8)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v8)
    goto LABEL_9;
LABEL_7:

}

void sub_22AD210F4(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_22AD211A0;
  v8[3] = &unk_24F4FD738;
  v9 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v6;
  v11 = v5;
  v7 = v5;
  sub_22AD209D4(v8);

}

void sub_22AD211A0(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4;
  void *v5;
  const char *v6;
  double v7;
  const char *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, v7, *(unsigned __int8 *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v11 = *(void **)(a1 + 48);
  v12 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v12;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v8, v10, v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD20A78(v4, v5, v13);

  if (!v11)
}

void sub_22AD21290(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_22AD21378;
  v13[3] = &unk_24F4FD788;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  sub_22AD209D4(v13);

}

void sub_22AD21378(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4;
  const char *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 48);
  v9 = v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v9;
  v10 = *(void **)(a1 + 56);
  v11 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v7, v15[0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v11;
  v12 = *(void **)(a1 + 64);
  v13 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v5, v7, v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD20A78(v4, v6, v14);

  if (v12)
  {
    if (v10)
      goto LABEL_9;
LABEL_12:

    if (v8)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v10)
    goto LABEL_12;
LABEL_9:
  if (!v8)
    goto LABEL_13;
LABEL_10:

}

void sub_22AD214BC(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a2;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_22AD2158C;
  v11[3] = &unk_24F4FD7D8;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = v7;
  v16 = a3;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  sub_22AD209D4(v11);

}

void sub_22AD2158C(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4;
  const char *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 48);
  v9 = v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v5, v7, *(unsigned __int8 *)(a1 + 64), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  v13 = *(void **)(a1 + 56);
  v14 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v10, v12, v16, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD20A78(v4, v6, v15);

  if (!v13)
  if (!v8)

}

void sub_22AD216B0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_22AD217C4;
  v17[3] = &unk_24F4FD828;
  v18 = *(id *)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  sub_22AD209D4(v17);

}

void sub_22AD217C4(uint64_t a1, const char *a2, double a3)
{
  const char *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v16 = *(_QWORD *)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 48);
  v8 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v8;
  v9 = *(void **)(a1 + 56);
  v10 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v4, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v10;
  v11 = *(void **)(a1 + 64);
  v12 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v4, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v12;
  v13 = *(void **)(a1 + 72);
  v14 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v4, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v4, v6, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD20A78(v16, v5, v15);

  if (v13)
  {
    if (v11)
      goto LABEL_11;
  }
  else
  {

    if (v11)
    {
LABEL_11:
      if (v9)
        goto LABEL_12;
LABEL_16:

      if (v7)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v9)
    goto LABEL_16;
LABEL_12:
  if (!v7)
    goto LABEL_17;
LABEL_13:

}

uint64_t sub_22AD2193C(uint64_t a1, double a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_removeManagedReference_withOwner_, a2);
}

id sub_22AD21DE8(uint64_t a1, const char *a2, double a3)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD21E30(v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id sub_22AD21E30(void *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  const char *v26;
  void *v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;

  v5 = (void *)MEMORY[0x24BDD17F0];
  v6 = a3;
  v7 = a2;
  v8 = a1;
  objc_msgSend_isMainThread(v5, v9, v10);
  objc_msgSend_currentContext(TMLJSEnvironment, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrentContext_(TMLJSEnvironment, v14, v15, v8);

  objc_msgSend_context(v7, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setException_(v18, v19, v20, 0);

  objc_msgSend_callWithArguments_(v7, v21, v22, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD236E0(v23);
  objc_claimAutoreleasedReturnValue();

  objc_msgSend_toObject(v23, v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend_convertJsValue_toType_(TMLJSEnvironment, v26, v28, v23, 16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }

  objc_msgSend_setCurrentContext_(TMLJSEnvironment, v30, v31, v13);
  return v29;
}

id sub_22AD21F40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  double v6;
  const char *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  if (!v3)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v7, v9, v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD21E30(v4, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return v12;
}

id sub_22AD22024(uint64_t a1, const char *a2, double a3)
{
  void *v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v10, v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD21E30(v4, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD220F4(uint64_t a1, const char *a2, double a3)
{
  int v3;
  void *v4;
  void *v5;
  double v6;
  const char *v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v3 = LODWORD(a3);
  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = v3;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v10, v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD21E30(v4, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD221C4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  if (!v5)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v13;
  v14 = v6;
  if (!v6)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v10, v12, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD21E30(v7, v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {

    if (v5)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v5)
    goto LABEL_9;
LABEL_7:

  return v16;
}

id sub_22AD222F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v10, v11, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v15 = v5;
  if (!v5)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[1] = v15;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, v14, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD21E30(v6, v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  return v17;
}

id sub_22AD223F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v10, v11, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v15 = v5;
  if (!v5)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[1] = v15;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, v14, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD21E30(v6, v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  return v17;
}

id sub_22AD22500(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[0] = v16;
  v17 = v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15, v22[0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v17;
  v18 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v13, v15, v22, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD21E30(v10, v14, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v8)
      goto LABEL_9;
LABEL_12:

    if (v7)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v8)
    goto LABEL_12;
LABEL_9:
  if (!v7)
    goto LABEL_13;
LABEL_10:

  return v20;
}

id sub_22AD22670(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  void *v13;
  double v14;
  void *v15;
  const char *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  v9 = *(void **)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v12, v14, a3, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v19 = v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v19;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, v18, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD21E30(v9, v13, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  if (!v7)

  return v21;
}

id sub_22AD227B8(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(void **)(a1 + 32);
  objc_msgSend_value(*(void **)(a1 + 40), v14, v15);
  v25 = objc_claimAutoreleasedReturnValue();
  v18 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17, v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[0] = v18;
  v19 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[1] = v19;
  v20 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[2] = v20;
  v21 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[3] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, v17, v27, 4, v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD21E30(v13, v26, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v11)
      goto LABEL_11;
  }
  else
  {

    if (v11)
    {
LABEL_11:
      if (v10)
        goto LABEL_12;
LABEL_16:

      if (v9)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v10)
    goto LABEL_16;
LABEL_12:
  if (!v9)
    goto LABEL_17;
LABEL_13:

  return v23;
}

uint64_t sub_22AD22968(uint64_t a1, double a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_removeManagedReference_withOwner_, a2);
}

id sub_22AD22A80(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const __CFString *v29;
  __CFString *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  id v36;
  const char *v37;
  double v38;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend_isObject(v5, v7, v8) & 1) == 0)
  {
    v19 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v19, v20, v21, CFSTR("Value is not a function"), v16);
    goto LABEL_6;
  }
  v11 = objc_msgSend_integerValue(v6, v9, v10);
  if (v11 < 1)
  {
    if ((objc_msgSend_isEqualToString_(v6, v12, v13, CFSTR("undefined")) & 1) == 0)
    {
      sub_22AD22C50(v6);
      v29 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v28 = 0;
        goto LABEL_15;
      }
      goto LABEL_13;
    }
    v29 = &stru_24F505EA8;
    v30 = v6;
LABEL_12:

LABEL_13:
    v36 = objc_alloc(*(Class *)(a1 + 32));
    v28 = (void *)objc_msgSend_initWithFunction_argumentsEncoding_(v36, v37, v38, v5, v29);
    v6 = (__CFString *)v29;
    goto LABEL_14;
  }
  v14 = v11;
  if ((unint64_t)v11 < 5)
  {
    v30 = (__CFString *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    do
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v31, v32, "@");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v30, v34, v35, v33);

      --v14;
    }
    while (v14);
    objc_msgSend_componentsJoinedByString_(v30, v31, v32, &stru_24F505EA8);
    v29 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v15 = (void *)MEMORY[0x24BDDA730];
  objc_msgSend_currentContext(MEMORY[0x24BDDA720], v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueWithNewErrorFromMessage_inContext_(v15, v17, v18, CFSTR("Argument count exceeds maximum supported value"), v16);
LABEL_6:
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentContext(MEMORY[0x24BDDA720], v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setException_(v25, v26, v27, v22);

  v28 = 0;
LABEL_14:

LABEL_15:
  return v28;
}

id sub_22AD22C50(void *a1)
{
  id v1;
  const char *v2;
  double v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v1 = a1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_22AD23798;
  v29 = sub_22AD237A8;
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend_length(v1, v2, v3))
  {
    objc_msgSend_componentsSeparatedByString_(v1, v4, v5, CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_22AD237B0;
    v24[3] = &unk_24F4FDA68;
    v24[4] = &v25;
    objc_msgSend_enumerateObjectsUsingBlock_(v6, v7, COERCE_DOUBLE(3221225472), v24);

  }
  v8 = (void *)v26[5];
  if (v8)
  {
    objc_msgSend_componentsJoinedByString_(v8, v4, v5, &stru_24F505EA8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v4, v5, CFSTR("Unsupported argument type <%@>"), v1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v10, v15, v16, v11, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v20, v21, v22, v17);

    v9 = 0;
  }
  _Block_object_dispose(&v25, 8);

  return v9;
}

void sub_22AD22DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AD22DFC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  void (**v15)(void);
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  int isEqualToString;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  double v39;
  int v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  int v48;
  const char *v49;
  double v50;
  const char *v51;
  double v52;
  void *v53;
  const char *v54;
  double v55;
  int v56;
  const char *v57;
  double v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  int v64;
  const char *v65;
  double v66;
  const char *v67;
  double v68;
  const char *v69;
  double v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  double v74;
  const char *v75;
  void *v76;
  double v77;
  void *v78;
  const char *v79;
  double v80;
  const char *v81;
  void *v82;
  double v83;
  void *v84;
  const char *v85;
  double v86;
  const char *v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  const char *v92;
  double v93;
  const char *v94;
  void *v95;
  double v96;
  void *v97;
  const char *v98;
  double v99;
  const char *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  const char *v105;
  double v106;
  int v107;
  const char *v108;
  double v109;
  const char *v110;
  double v111;
  void *v112;
  const char *v113;
  double v114;
  const char *v115;
  double v116;
  const char *v117;
  double v118;
  const char *v119;
  double v120;
  const char *v121;
  double v122;
  void *v123;
  id v124;

  v124 = a2;
  v6 = a4;
  v7 = a3;
  NSClassFromString(CFSTR("NSBlock"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v8, v9);
    v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v16, v17, v18, CFSTR("Argument is not block"), v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v22, v23, v24, v19);

    v10 = v7;
LABEL_50:

    goto LABEL_51;
  }
  sub_22AD22C50(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    switch(objc_msgSend_length(v10, v11, v12))
    {
      case 0:
        v15 = (void (**)(void))MEMORY[0x22E2E7E44](v124);
        v15[2]();
        goto LABEL_50;
      case 1:
        objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v13, v14, "B");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v10, v26, v27, v25);

        if (isEqualToString)
        {
          v15 = (void (**)(void))MEMORY[0x22E2E7E44](v124);
          objc_msgSend_firstObject(v6, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend_BOOLValue(v33, v34, v35);
          ((void (*)(void (**)(void), uint64_t))v15[2])(v15, v36);
          goto LABEL_49;
        }
        objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v29, v30, "q");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend_isEqualToString_(v10, v62, v63, v61);

        if (v64)
        {
          v15 = (void (**)(void))MEMORY[0x22E2E7E44](v124);
          objc_msgSend_firstObject(v6, v67, v68);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend_integerValue(v33, v69, v70);
          ((void (*)(void (**)(void), uint64_t))v15[2])(v15, v71);
          goto LABEL_49;
        }
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v65, v66, CFSTR("%s"), "@");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = objc_msgSend_isEqualToString_(v10, v105, v106, v104);

        if (!v107)
          goto LABEL_41;
        v15 = (void (**)(void))MEMORY[0x22E2E7E44](v124);
        objc_msgSend_objectAtIndexedSubscript_(v6, v108, v109, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
          objc_msgSend_objectAtIndexedSubscript_(v6, v110, v111, 0);
        else
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v110, v111);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void (**)(void), void *))v15[2])(v15, v91);
        goto LABEL_48;
      case 2:
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, v14, CFSTR("%s%s"), "@", "@");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend_isEqualToString_(v10, v38, v39, v37);

        if (!v40)
          goto LABEL_11;
        v15 = (void (**)(void))MEMORY[0x22E2E7E44](v124);
        objc_msgSend_objectAtIndexedSubscript_(v6, v41, v42, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
          objc_msgSend_objectAtIndexedSubscript_(v6, v43, v44, 0);
        else
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v43, v44);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v6, v119, v120, 1);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        if (v95)
          objc_msgSend_objectAtIndexedSubscript_(v6, v121, v122, 1);
        else
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v121, v122);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void (**)(void), void *, void *))v15[2])(v15, v91, v97);
        goto LABEL_47;
      case 3:
LABEL_11:
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, v14, CFSTR("%s%s%s"), "@", "@", "@");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend_isEqualToString_(v10, v46, v47, v45);

        if (!v48)
          goto LABEL_14;
        v15 = (void (**)(void))MEMORY[0x22E2E7E44](v124);
        objc_msgSend_objectAtIndexedSubscript_(v6, v49, v50, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
          objc_msgSend_objectAtIndexedSubscript_(v6, v51, v52, 0);
        else
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v51, v52);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v6, v92, v93, 1);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        if (v95)
          objc_msgSend_objectAtIndexedSubscript_(v6, v94, v96, 1);
        else
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v94, v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v6, v98, v99, 2);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        if (v101)
          objc_msgSend_objectAtIndexedSubscript_(v6, v100, v102, 2);
        else
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v100, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void (**)(void), void *, void *, void *))v15[2])(v15, v91, v97, v103);

LABEL_47:
        goto LABEL_48;
      case 4:
LABEL_14:
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, v14, CFSTR("%s%s%s%s"), "@", "@", "@", "@");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend_isEqualToString_(v10, v54, v55, v53);

        if (!v56)
          goto LABEL_41;
        v15 = (void (**)(void))MEMORY[0x22E2E7E44](v124);
        objc_msgSend_objectAtIndexedSubscript_(v6, v57, v58, 0);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        if (v123)
          objc_msgSend_objectAtIndexedSubscript_(v6, v59, v60, 0);
        else
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v59, v60);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v6, v73, v74, 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if (v76)
          objc_msgSend_objectAtIndexedSubscript_(v6, v75, v77, 1);
        else
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v75, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v6, v79, v80, 2);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (v82)
          objc_msgSend_objectAtIndexedSubscript_(v6, v81, v83, 2);
        else
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v81, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v6, v85, v86, 3);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (v88)
          objc_msgSend_objectAtIndexedSubscript_(v6, v87, v89, 3);
        else
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v87, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void (**)(void), void *, void *, void *, void *))v15[2])(v15, v72, v78, v84, v90);

        break;
      default:
LABEL_41:
        v112 = (void *)MEMORY[0x24BDDA730];
        objc_msgSend_currentContext(MEMORY[0x24BDDA720], v13, v14);
        v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        objc_msgSend_valueWithNewErrorFromMessage_inContext_(v112, v113, v114, CFSTR("Unsupported block invocation"), v15);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_currentContext(MEMORY[0x24BDDA720], v115, v116);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setException_(v91, v117, v118, v33);
LABEL_48:

LABEL_49:
        break;
    }
    goto LABEL_50;
  }
LABEL_51:

}

id sub_22AD234B4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const __CFString *v29;
  __CFString *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  id v36;
  const char *v37;
  double v38;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend_isObject(v5, v7, v8) & 1) == 0)
  {
    v19 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v19, v20, v21, CFSTR("Value is not a function"), v16);
    goto LABEL_6;
  }
  v11 = objc_msgSend_integerValue(v6, v9, v10);
  if (v11 < 1)
  {
    if ((objc_msgSend_isEqualToString_(v6, v12, v13, CFSTR("undefined")) & 1) == 0)
    {
      sub_22AD22C50(v6);
      v29 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v28 = 0;
        goto LABEL_15;
      }
      goto LABEL_13;
    }
    v29 = &stru_24F505EA8;
    v30 = v6;
LABEL_12:

LABEL_13:
    v36 = objc_alloc(*(Class *)(a1 + 32));
    v28 = (void *)objc_msgSend_initWithFunctionWithValue_argumentsEncoding_(v36, v37, v38, v5, v29);
    v6 = (__CFString *)v29;
    goto LABEL_14;
  }
  v14 = v11;
  if ((unint64_t)v11 < 5)
  {
    v30 = (__CFString *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    do
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v31, v32, "@");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v30, v34, v35, v33);

      --v14;
    }
    while (v14);
    objc_msgSend_componentsJoinedByString_(v30, v31, v32, &stru_24F505EA8);
    v29 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v15 = (void *)MEMORY[0x24BDDA730];
  objc_msgSend_currentContext(MEMORY[0x24BDDA720], v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueWithNewErrorFromMessage_inContext_(v15, v17, v18, CFSTR("Argument count exceeds maximum supported value"), v16);
LABEL_6:
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentContext(MEMORY[0x24BDDA720], v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setException_(v25, v26, v27, v22);

  v28 = 0;
LABEL_14:

LABEL_15:
  return v28;
}

void sub_22AD23690(uint64_t a1, const char *a2, double a3)
{
  void *v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;

  objc_msgSend_context(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setException_(v4, v5, v6, 0);

  objc_msgSend_callWithArguments_(*(void **)(a1 + 32), v7, v8, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

}

id sub_22AD236E0(void *a1)
{
  id v1;
  const char *v2;
  double v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  id v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;

  v1 = a1;
  objc_msgSend_context(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exception(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDBCE88]);
    objc_msgSend_toString(v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend_initWithName_reason_userInfo_(v8, v12, v13, CFSTR("TMLJSException"), v11, 0);
    objc_msgSend_raiseException_(TMLExceptionHandler, v15, v16, v14);

  }
  return v1;
}

uint64_t sub_22AD23798(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22AD237A8(uint64_t a1)
{

}

void sub_22AD237B0(uint64_t a1, const char *a2, double a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  uint64_t v12;
  void *v13;
  char *v14;

  v7 = objc_msgSend_typeForTypeName_(TMLTypeRegistry, a2, a3, a2);
  objc_msgSend_encodedTypeForType_(TMLTypeRegistry, v8, v9, v7);
  v10 = (const char *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  v14 = (char *)v10;
  if (v10)
  {
    objc_msgSend_addObject_(v13, v10, v11, v10);
  }
  else
  {
    *(_QWORD *)(v12 + 40) = 0;

    *a5 = 1;
  }

}

void sub_22AD2392C(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("83847776E(RNtV#K83.35M.b&(f-fA35yuEaB77wH8xXd!2N:Gpem&TlB@-eN7HLfA#1EbA:B3k8UjNjHz:YsIky>2OIO3{9p7Nw2Ev.bt*uM27%DDQU}.dHaQnkCT4:BV.=W[7#/xzQ$-DvE{FVe[3Z0hn8w$/Fpc1&lq(A3FbE?5jn=KwO#QgvqFUDzEEf?AV$#21-[=]By=6!x(n2f0u@c-2XmH.wOkB[wFbh=vRPE:BrRza3tBMWv{%m)x(mL@1y=p/y-0gdvg1i0wPR%bwP?SYwPzH7xK#i)y&-V(BzalRwO#Q7w[+*%A$x066BCjZwmYU2x>z6<A=R&%vrcx%C{jFNwPR%bwP?SYwPzH7xK#i)y&-V(BzalRwO#Q7w[+*%B2(7b0syb]v{%mAz/OV=A+PGawPzi}B606$xJ5F.C4>C$B5c:%x(v)g5ciW:3jH#!A=#ebwMq-4l#@$Avrcx%C]vz82xaN6x(v)g5^&e-v@#B6zEENha$4CwvqXLMA.{s/x(E-%A:-^9s7#+&q!o#)x>7Z}i=w$Vx(v)giX>ET7?mG4zE)s1p?sVYAa&*6vqF.UBzkVhA$wu<8vu*<wPzH7xK#i)y.vdzlqRllx(E-%A:-=56:+g:Acb/jzGuA$wnbK}x(v($A^n&Ev@Dm5wN/*UwPzH7xK#i)y=VGNBzkVhB2(6T3kEn)x()A<Bza6Ny?ml/By!r(wP.L}5e(e*2XmH.wOkB[wFbh=vRPE:Bq+U%1-XV@B.8f&z^)D)v@@[hx(mTbs7#+&l$HgCxjk)[i=PpNB.9P?Ef{%dzFsh]x([2RwO+{<vru6TB.bYbpJgz&z/fRc5e(e*2XmH.wOkB[wFbh=vRPE:Bq+U%1-XV@B.8f&z^)D)v@@R73i$G*BzkVhA$O*<x>8m0z/f07C{jtAzFsh]x([2RwO+{<vru6wADL&nwJB:GBzkVhB2(5(3j7Y{z/wS+vqVRSa{-miz/wS+vqW&q3mG}aBAh8bC4B3VzF<2}By!#VwPzH7xK#i)y&-V(BzaP:A=#ebwPFy@8wAI^x>g^)Bzku3wPz&81Z#B(vr<4CA+fukx>qE0lVl<WwN/*[wkD&Tx(E-%A:-^9s7#+&q!o#)x>7Z}iX<+z8E)h[v}xEMwPzH7xK#i)y^SbUzE)s1x(v(20u8<-3ufM%x(E-%A:-+%3}0uTwPzH7xK#i)y:6*dvqYN^y/1X-x(E-%A:-=Kz/fD7v@#B6zAna:3jGo*p?sVYAa&*6vqEb03iUlPzdKs:B98CpzF6^!a@gH)x>g^)Bzku3wPwy/pe+d)nKKx@baw/A7^*RSwO#QgvqFUDzEEf?AZTFPwOkB[wG)@K3mfg[zGG]cy!XtQvp%d(l${g1x(^^5zF<2}BwMK?x(E-%A:-+}0u8):2v?s.BAg/a5!Ez%lUgdSA:-=UvqYH^wPwXc3jp--A+PGawPzi}5!4b]p?sVYAa&*6vqD?[3i+0YA=k$h2tOh^A=M8sa$WqozGG]cy!XtQvp%d(i+h@nl${ZLz/fD7v@$KUA+PGawPzi}i+rtLz/N(!0Wu+c3ohKbzGG]cy!XtQvp%d(l${g1x(^^5C4CX<wPzH7xK#i)y^zPPwPz)bB7Gi1zGFoPByw6Cq+mJ38xf1*v}xL1A:-+%5jn=KwO#QgvqFUDzEEf?AVb&63ufM%x(E-%A:-+%3}0uTwPzH7xK#i)y-jx55N/i[wPz)bB7Gi1zGGz$Byt^?wnbK}x(v($A^nMk3iUx<B7(l>z^)D)v@@[Sv}xL1A:-=UvqYH^wPx?xx>fRCB7ociwPyQUA+PGawPzi}i:(MxwPz)bB7Gi1zGFoPByvjdq=umGc&$PF0sy2XwO#QgvqFUDzEEf?AZTRLlVl<WwN/*UwPzH7xK#i)y.cQ=8WV*WwO#QgvqDL/lQBdKzGG]cy!XtQvp%d(8x5}&AaK67Aa&*6vqDL+lQBQXA+PGawPzi}a%ZVfzGG]cy!XtQvp%d(i+h@nlVl<WwN/*UwPzH7xK#i)y=S%Cb0unMv}xL1A:-=UvqYH^wPygMwl0OVvru6VByxo55ciW*3i$6LzGG]cy.vpDlpks4BAg/ao<}{FxjV9cCm2y3w"
         "O#QgvqFUDzEEf?A-V%>y/j?=Bz(hhq/(C&wE[>X8WV*WwO#QgvqDL/lQBdKzGG]cy!XtQvp%d(8wiwWwnbK}5^&e-v@#B6zEENha%pxbzGG]cy!"
         "XtQvp%d(i^kpOy/j?=Bz(hhq/(C&wJzjvbc7.Kc$u?aBAg/ao<}{FxjV9Kx>fXwx(3:!lVl<WwN/*UwPzH7xK#i)y.cQ=8WV*WwO#QgvqDL/lQB"
         "dKzGG]cy!XtQvp%d(8x5}&AaK67Aa&*6vqDL+lQBQXA+PGawPzi}8w0kVwPz*fAUnQLq:>.Ez/N3Qv}xL1A:-=UvqYH^wPx?xx>fXwx(3:!lVl<"
         "WwN/*UwPzH7xK#i)y=VcFA=k$Vc&$>9mSiA!wmoN]z/b");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "83847776E(RNtV#K83.35M.b&(f-fA35yuEaB77wH8xXd!2N:Gpem&TlB@-eN7HLfA#1EbA:B3k8UjNjHz:YsIky>2OIO3{9p7Nw2Ev.bt*uM27%DDQU}.dHaQnkCT4:BV.=W[7#/xzQ$-DvE{FVe[3Z0hn8w$/Fpc1&lq(A3FbE?5jn=KwO#QgvqFUDzEEf?AV$#21-[=]By=6!x(n2f0u@c-2XmH.wOkB[wFbh=vRPE:BrRza3tBMWv{%m)x(mL@1y=p/y-0gdvg1i0wPR%bwP?SYwPzH7xK#i)y&-V(BzalRwO#Q7w[+*%A$x066BCjZwmYU2x>z6<A=R&%vrcx%C{jFNwPR%bwP?SYwPzH7xK#i)y&-V(BzalRwO#Q7w[+*%B2(7b0syb]v{%mAz/OV=A+PGawPzi}B606$xJ5F.C4>C$B5c:%x(v)g5ciW:3jH#!A=#ebwMq-4l#@$Avrcx%C]vz82xaN6x(v)g5^&e-v@#B6zEENha$4CwvqXLMA.{s/x(E-%A:-^9s7#+&q!o#)x>7Z}i=w$Vx(v)giX>ET7?mG4zE)s1p?sVYAa&*6vqF.UBzkVhA$wu<8vu*<wPzH7xK#i)y.vdzlqRllx(E-%A:-=56:+g:Acb/jzGuA$wnbK}x(v($A^n&Ev@Dm5wN/*UwPzH7xK#i)y=VGNBzkVhB2(6T3kEn)x()A<Bza6Ny?ml/By!r(wP.L}5e(e*2XmH.wOkB[wFbh=vRPE:Bq+U%1-XV@B.8f&z^)D)v@@[hx(mTbs7#+&l$HgCxjk)[i=PpNB.9P?Ef{%dzFsh]x([2RwO+{<vru6TB.bYbpJgz&z/fRc5e(e*2XmH.wOkB[wFbh=vRPE:Bq+U%1-XV@B.8f&z^)D)v@@R73i$G*BzkVhA$O*<x>8m0z/f07C{jtAzFsh]x([2RwO+{<vru6wADL&nwJB:GBzkVhB2(5(3j7Y{z/wS+vqVRSa{-miz/wS+vqW&q3mG}aBAh8bC4B3VzF<2}By!#VwPzH7xK#i)y&-V(BzaP:A=#ebwPFy@8wAI^x>g^)Bzku3wPz&81Z#B(vr<4CA+fukx>qE0lVl<WwN/*[wkD&Tx(E-%A:-^9s7#+&q!o#)x>7Z}iX<+z8E)h[v}xEMwPzH7xK#i)y^SbUzE)s1x(v(20u8<-3ufM%x(E-%A:-+%3}0uTwPzH7xK#i)y:6*dvqYN^y/1X-x(E-%A:-=Kz/fD7v@#B6zAna:3jGo*p?sVYAa&*6vqEb03iUlPzdKs:B98CpzF6^!a@gH)x>g^)Bzku3wPwy/pe+d)nKKx@baw/A7^*RSwO#QgvqFUDzEEf?AZTFPwOkB[wG)@K3mfg[zGG]cy!XtQvp%d(l${g1x(^^5zF<2}BwMK?x(E-%A:-+}0u8):2v?s.BAg/a5!Ez%lUgdSA:-=UvqYH^wPwXc3jp--A+PGawPzi}5!4b]p?sVYAa&*6vqD?[3i+0YA=k$h2tOh^A=M8sa$WqozGG]cy!XtQvp%d(i+h@nl${ZLz/fD7v@$KUA+PGawPzi}i+rtLz/N(!0Wu+c3ohKbzGG]cy!XtQvp%d(l${g1x(^^5C4CX<wPzH7xK#i)y^zPPwPz)bB7Gi1zGFoPByw6Cq+mJ38xf1*v}xL1A:-+%5jn=KwO#QgvqFUDzEEf?AVb&63ufM%x(E-%A:-+%3}0uTwPzH7xK#i)y-jx55N/i[wPz)bB7Gi1zGGz$Byt^?wnbK}x(v($A^nMk3iUx<B7(l>z^)D)v@@[Sv}xL1A:-=UvqYH^wPx?xx>fRCB7ociwPyQUA+PGawPzi}i:(MxwPz)bB7Gi1zGFoPByvjdq=umGc&$PF0sy"
    "2XwO#QgvqFUDzEEf?AZTRLlVl<WwN/*UwPzH7xK#i)y.cQ=8WV*WwO#QgvqDL/lQBdKzGG]cy!XtQvp%d(8x5}&AaK67Aa&*6vqDL+lQBQXA+PGawPzi"
    "}a%ZVfzGG]cy!XtQvp%d(i+h@nlVl<WwN/*UwPzH7xK#i)y=S%Cb0unMv}xL1A:-=UvqYH^wPygMwl0OVvru6VByxo55ciW*3i$6LzGG]cy.vpDlpks4"
    "BAg/ao<}{FxjV9cCm2y3wO#QgvqFUDzEEf?A-V%>y/j?=Bz(hhq/(C&wE[>X8WV*WwO#QgvqDL/lQBdKzGG]cy!XtQvp%d(8wiwWwnbK}5^&e-v@#B6z"
    "EENha%pxbzGG]cy!XtQvp%d(i^kpOy/j?=Bz(hhq/(C&wJzjvbc7.Kc$u?aBAg/ao<}{FxjV9Kx>fXwx(3:!lVl<WwN/*UwPzH7xK#i)y.cQ=8WV*WwO"
    "#QgvqDL/lQBdKzGG]cy!XtQvp%d(8x5}&AaK67Aa&*6vqDL+lQBQXA+PGawPzi}8w0kVwPz*fAUnQLq:>.Ez/N3Qv}xL1A:-=UvqYH^wPx?xx>fXwx(3"
    ":!lVl<WwN/*UwPzH7xK#i)y=VcFA=k$Vc&$>9mSiA!wmoN]z/b",
    v2,
    0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

id sub_22AD23DD0(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;

  v5 = *(objc_class **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  v9 = *(void **)(a1 + 32);
  objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v10, v11, v6, 20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_attributedStringWithFormat_attributes_(v9, v13, v14, v7, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend_initWithAttributedString_(v8, v16, v17, v15);
  return v18;
}

id sub_22AD23E7C(uint64_t a1, void *a2)
{
  id v2;
  TMLAttributedString_Attributes *v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;

  v2 = a2;
  v3 = objc_alloc_init(TMLAttributedString_Attributes);
  objc_msgSend_setValuesForKeysWithDictionary_(v3, v4, v5, v2);

  objc_msgSend_attributes(v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_22AD23ED4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  id v29;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)MEMORY[0x24BDBCED8];
    v11 = v7;
    objc_msgSend_dictionaryWithDictionary_(v10, v12, v13, v8);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parse_tags_withRules_(TMLMarkdownParser, v14, v15, v11, &v29, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(*(Class *)(a1 + 32));
    v18 = *(void **)(a1 + 32);
    objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v19, v20, v29, 20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_attributedStringWithFormat_attributes_(v18, v22, v23, v16, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend_initWithAttributedString_(v17, v25, v26, v24);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

uint64_t sub_22AD24480(uint64_t a1, void *a2, double a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend_isEqualToString_(a2, (const char *)a2, a3, *(_QWORD *)(a1 + 32));
  *a5 = result;
  return result;
}

void sub_22AD244AC(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  double v16;
  BOOL v17;
  TMLAttributedString_Attributes *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  id v27;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(v5, v7, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_rangeValue(v9, v10, v11);
  v14 = v13;

  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v15, v16, v6);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
    v17 = v27 == 0;
  else
    v17 = 1;
  if (!v17)
  {
    v18 = objc_alloc_init(TMLAttributedString_Attributes);
    objc_msgSend_setValuesForKeysWithDictionary_(v18, v19, v20, v27);
    v21 = *(void **)(a1 + 48);
    objc_msgSend_attributes(v18, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addAttributes_range_(v21, v25, v26, v24, v12, v14);

  }
}

uint64_t sub_22AD24658(uint64_t result, const char *a2, double a3)
{
  if (a2)
    return objc_msgSend_addObject_(*(void **)(result + 32), a2, a3, a2);
  return result;
}

id sub_22AD25864(uint64_t a1, double a2, double a3)
{
  id v5;
  const char *v6;

  v5 = objc_alloc(*(Class *)(a1 + 32));
  return (id)objc_msgSend_initWithSize_(v5, v6, a2, a3);
}

BOOL sub_22AD25898(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  objc_msgSend_size(a2, v5, v6);
  v8 = v7;
  v10 = v9;
  objc_msgSend_size(v4, v11, v7);
  v13 = v12;
  v15 = v14;

  return v10 == v15 && v8 == v13;
}

void sub_22AD25D6C(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("838477766fbYoy<U]]mBh>@>h3EF2g[]2ImjAm3Pg)HD/648eE.=sK$v!fR0/JFLB]pP*wxdm=OEMpfQcNL)xb+<7tOtE/)RhnRM@{<M%iN$uZzy6f!L2cWfVNxnUl3:QTA}TW/CIv}/1FAIsi?OdfDK]H=xd12m<^0pgIV!3pCjco&B#jx>7{&AV#k93#6M!xjTLDy?lQAoCdCIA+(M[a%mjby&r/(y?Xibwjg0Iv@=p5BzkVh5^AA0A+PA77Y:%<3klcjo>wx!vp%dBx)a5Yvr(^lBp]9Uq+Z?AB75Y)oKSi+B-W$C0TYxhq=v^Lv@2T@r+Vb?5^zucr+Vb?a}$v?B98bayH}J02#at%Bzkl2wPw$n3k3Y:x(dp2x(v(SB-H]jx(v(424RT{vR/P)0wU&a4S=-2A=:P+x(dp2x(mL{0u@1{Byxiil2HyNvruj3xegOp4rDSfA6XwQzddK2zF6HYa}nQnz/w0Wx(dp2x(mMs9106/B3TXTzddK2zF6HZa}5aal2HyNvruj3xeiD]6LRD0Bxrf#xHW2JzdMT/x>7{&AU5^24ginJA:-/@5^ik^v@@R63i$S]x>7{&AUnWMq=v^Lv@2T@a@j)gx()A<Bzac:vqPNpB98bayH}JE3k0QQo&B+$B8$=5wLuJTz/{deSrARFo&B+$B8$=5wPHdRA8{W:Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#?q5[bo(x)a5Pz/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(a0u@D&5Pz=4B7Glhvruj4zC$U5y?jjZB.L-n7Y=9J3lS>[wk)OTzGxJlx(v(*z+$E=B7Glhvruj4zC$U5y?jdU8w@>]Ab]JhwO#P#BzkVhq/)q3wFbb*x(n2xn^Vbux>fOtzEWl]q!o&Sx(mL{0u8TV2w[3[B75Y)5^.oho>wx!vp%c&9TSr=z/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(sl<:oix>gaMv}xv$wE[>X6BC7ZwPI{3xjRXZo&B+$B8$=5wF#P%3$Bi[C4CYnvruj4zw0BNq:UFvC4CYnvruj4zyNBH4}Gx+qE%]-xkQ1BBzk]f5ciW<3jHA.zGYPiB76f8z/cf$o&Bz$zGYPiB76f8z/d3&3l:Rcy&06>vqZd2BzkVhrbUPNwPIB2Byxo9z/eG}D2d460u8*.5Pz=4B7Glhvruj4zC$U5y?jjZB.L-ndOf%TwnbNMByxiiq!o&Sx(mL{0u8TV2w[3[B75Y)5^.oho>wx!vp%c&9TSr=z/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(sgZT!rx(4PLwN/T}wKf*Fx)a500u90^3$Bi[C4CYnvruj4zw0BNq:UFvC4CYnvruj4zzz[k2v}K&ze16j5ci%Wwnca4x(!tJqvjmYwPq<7B97l0wPIB2Byxo9z/eG}D2d460u8*.5Pz=4B7Glhvruj4zGx]By?jjZB.L-na@LAjADL&lBwN0?B7Glhvruj4zC$U5y?kTm?#Kf3o&B+$B8$=5wMikTAbn%8wLuJTz/{dm4]2$%wPI{3xjT+BD2E?Ea@*}5BAg/7y?W^1q/#LVvq{s5z/cf(B98CpzF7dh3j?l0vqfK(zF8sBAcb/jzw0d{BAh8kxcF2%3uHu0v{%s#x(v(426j)bx(mMc6BCgYzdd6*rb3C<wFbh*BAh8kxcE/)1.?*ZxjRXVx(do>wG?={3#GM^x<<FBy?lQAoCdCIA+({i3i$6HAcb/jzw0d{BAh8kxcFc04qxV/xjU1:vSVsay?jj-B98CpzF6p:3jfB9q!p2>x(v>@RW0Lso&Bz$zGYPiB76f8z/c:u3j?h?y?m9#wN[IDB8$=5wFbqzq+Z?AB75Y)7Y+*c3l0-0v{%gIvrcE7v}/)<zGFDXwO#Q7w[+*%5^z9frAhQU7Y+*d3lj7$zeTJcp*[x^x>7<@vqZfUwmYU2x>z6<A=R&%vrcx%C]cMqGAhz>x(n06A=:P?BywV)zdNQb5ciWR3iLA>y.u?)A+(Tb3j7lTy?mG)zdKs:B98CpzF6>33jpoYze:r5BzkVh5^q-Xz!0MbiCAwLwPz(UBAy@3xL?r#BujRWBz9%RB"
         "y/Ggvru6Ix(4u#vqPNpv@Dj6y?mZ5z/e9OzE^M{AYL%N3jpG+B7GxlraQq@5ciWV3iUDZCYTM5B98CpzF6>33jpoYze:r5BzkVh5^q-Xz!0Mb9C"
         "GzjwPz((wQ5qTv@Dj6y?mZ5z/e9OzE^M{AYL%Z3jQY!B7Gxlq/(.-yH}I$0u8TV2xL03v@2T@5^.ohq/(.-yH}J86ab7Rz/6DfwPRT8zw0aZy&r"
         "*0a%pPqB7Gxlq/(.-yH}JEv@Dj6y?mZ5z/e9OzE^M{AYL%V3jy]^zE=EMB8$=5wE[>X6BC7ZwPI{3xjRXZo&B+$B8$=5wF#i?3s!0>Abo9cx(v("
         "41.8p^v@0nfB7Gl1o>wx!vp%djv@Dj6y?mZ5z/e9OzE^M{AYL%V3jy]^zE=W/x>7{&AU5l&6BC7^Bzkl2wPwy&o&B#jx>7{&AVbO#3s!0>Abo9c"
         "x(v(41.8p^v@0nfB7Gl1q/(.-yH}JEv@Dj6y?mZ5z/e9OzE^M{AYL%Z3jQY!B7Gxlo>wx!vp%c.0u8TV2w[3[B75Y)5^.oho>wx!vp%c&6ab7Rz"
         "/6DfwPRT8zw0aZy&r*0a%pPqB7Gxlo>wx!vp%djv@Dj6y?mZ5z/e9OzE^M{AYL$a0sxrTwO#3ABAy@3xL?r#BpXD>3jl(TA+(u<B-Ipp5^![Rx("
         "4u#vqPM*26j)bx(mM46ab7Rz/6DfwPRT8zw0aZy&r*0a#:NOzE=4PBywV)zdNQbi^kpWxHcDRwPzV%By^{Qy?mG)zdL+rz/6DfwPRT8zB!hNwnC"
         "*$iX<Cq2Y<M{wk)b+BpXD>4HJtXwQ5qf26j)bx(mM46ab7Rz/6DfwPRT8zw0aZy&r*0a@+PmzE=ZTCYU#Rz/6DfwPRT8zB!hNwnC*$iTQ&F3jfB"
         "9o>wx!vp%c}843N:vr(^lBp]9Uq+Z?AB75Y)oKSi+B-X/P3la4$zE^s0p*[x^x>7<@vqZfUwmYU2x>z6<AUnNKq=M*?l(k}G910r!v}f7>B7]8$"
         "y?X0poKRywy.u}[BAh8kxcF2%40c92B.>OSCYmwqwFbbPz/oCo777p/wPI{bz/cf]o&B#4B8#5lzwSx#5deOLA=M8s5^IfgmriA!AV#k93V*Dcz"
         "ddEgraQq@5^AA0A+PA7a{[UVrz(H619FT2gck*Nx(mTbs7#+&q!p2>x(v(25e(k&2xKD$B7]Mg5^.ohq!p2>x(v(k5nu2@Bxrf#xJ5F-B7]MgiW"
         "$qknLr=tdHFT-B-7.#BzkVh");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "838477766fbYoy<U]]mBh>@>h3EF2g[]2ImjAm3Pg)HD/648eE.=sK$v!fR0/JFLB]pP*wxdm=OEMpfQcNL)xb+<7tOtE/)RhnRM@{<M%iN$uZzy6f!L2cWfVNxnUl3:QTA}TW/CIv}/1FAIsi?OdfDK]H=xd12m<^0pgIV!3pCjco&B#jx>7{&AV#k93#6M!xjTLDy?lQAoCdCIA+(M[a%mjby&r/(y?Xibwjg0Iv@=p5BzkVh5^AA0A+PA77Y:%<3klcjo>wx!vp%dBx)a5Yvr(^lBp]9Uq+Z?AB75Y)oKSi+B-W$C0TYxhq=v^Lv@2T@r+Vb?5^zucr+Vb?a}$v?B98bayH}J02#at%Bzkl2wPw$n3k3Y:x(dp2x(v(SB-H]jx(v(424RT{vR/P)0wU&a4S=-2A=:P+x(dp2x(mL{0u@1{Byxiil2HyNvruj3xegOp4rDSfA6XwQzddK2zF6HYa}nQnz/w0Wx(dp2x(mMs9106/B3TXTzddK2zF6HZa}5aal2HyNvruj3xeiD]6LRD0Bxrf#xHW2JzdMT/x>7{&AU5^24ginJA:-/@5^ik^v@@R63i$S]x>7{&AUnWMq=v^Lv@2T@a@j)gx()A<Bzac:vqPNpB98bayH}JE3k0QQo&B+$B8$=5wLuJTz/{deSrARFo&B+$B8$=5wPHdRA8{W:Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#?q5[bo(x)a5Pz/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(a0u@D&5Pz=4B7Glhvruj4zC$U5y?jjZB.L-n7Y=9J3lS>[wk)OTzGxJlx(v(*z+$E=B7Glhvruj4zC$U5y?jdU8w@>]Ab]JhwO#P#BzkVhq/)q3wFbb*x(n2xn^Vbux>fOtzEWl]q!o&Sx(mL{0u8TV2w[3[B75Y)5^.oho>wx!vp%c&9TSr=z/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(sl<:oix>gaMv}xv$wE[>X6BC7ZwPI{3xjRXZo&B+$B8$=5wF#P%3$Bi[C4CYnvruj4zw0BNq:UFvC4CYnvruj4zyNBH4}Gx+qE%]-xkQ1BBzk]f5ciW<3jHA.zGYPiB76f8z/cf$o&Bz$zGYPiB76f8z/d3&3l:Rcy&06>vqZd2BzkVhrbUPNwPIB2Byxo9z/eG}D2d460u8*.5Pz=4B7Glhvruj4zC$U5y?jjZB.L-ndOf%TwnbNMByxiiq!o&Sx(mL{0u8TV2w[3[B75Y)5^.oho>wx!vp%c&9TSr=z/f-fA=UVhx(v(44OY>?z/f-fA=UVhx(v(sgZT!rx(4PLwN/T}wKf*Fx)a500u90^3$Bi[C4CYnvruj4zw0BNq:UFvC4CYnvruj4zzz[k2v}K&ze16j5ci%Wwnca4x(!tJqvjmYwPq<7B97l0wPIB2Byxo9z/eG}D2d460u8*.5Pz=4B7Glhvruj4zGx]By?jjZB.L-na@LAjADL&lBwN0?B7Glhvruj4zC$U5y?kTm?#Kf3o&B+$B8$=5wMikTAbn%8wLuJTz/{dm4]2$%wPI{3xjT+BD2E?Ea@*}5BAg/7y?W^1q/#LVvq{s5z/cf(B98CpzF7dh3j?l0vqfK(zF8sBAcb/jzw0d{BAh8kxcF2%3uHu0v{%s#x(v(426j)bx(mMc6BCgYzdd6*rb3C<wFbh*BAh8kxcE/)1.?*ZxjRXVx(do>wG?={3#GM^x<<FBy?lQAoCdCIA+({i3i$6HAcb/jzw0d{BAh8kxcFc04qxV/xjU1:vSVsay?jj-B98CpzF6p:3jfB9q!p2>x(v>@RW0Lso&Bz$zGYPiB76f8z/c:u3j?h?y?m9#wN["
    "IDB8$=5wFbqzq+Z?AB75Y)7Y+*c3l0-0v{%gIvrcE7v}/)<zGFDXwO#Q7w[+*%5^z9frAhQU7Y+*d3lj7$zeTJcp*[x^x>7<@vqZfUwmYU2x>z6<A=R&"
    "%vrcx%C]cMqGAhz>x(n06A=:P?BywV)zdNQb5ciWR3iLA>y.u?)A+(Tb3j7lTy?mG)zdKs:B98CpzF6>33jpoYze:r5BzkVh5^q-Xz!0MbiCAwLwPz(U"
    "BAy@3xL?r#BujRWBz9%RBy/Ggvru6Ix(4u#vqPNpv@Dj6y?mZ5z/e9OzE^M{AYL%N3jpG+B7GxlraQq@5ciWV3iUDZCYTM5B98CpzF6>33jpoYze:r5B"
    "zkVh5^q-Xz!0Mb9CGzjwPz((wQ5qTv@Dj6y?mZ5z/e9OzE^M{AYL%Z3jQY!B7Gxlq/(.-yH}I$0u8TV2xL03v@2T@5^.ohq/(.-yH}J86ab7Rz/6DfwP"
    "RT8zw0aZy&r*0a%pPqB7Gxlq/(.-yH}JEv@Dj6y?mZ5z/e9OzE^M{AYL%V3jy]^zE=EMB8$=5wE[>X6BC7ZwPI{3xjRXZo&B+$B8$=5wF#i?3s!0>Abo"
    "9cx(v(41.8p^v@0nfB7Gl1o>wx!vp%djv@Dj6y?mZ5z/e9OzE^M{AYL%V3jy]^zE=W/x>7{&AU5l&6BC7^Bzkl2wPwy&o&B#jx>7{&AVbO#3s!0>Abo9"
    "cx(v(41.8p^v@0nfB7Gl1q/(.-yH}JEv@Dj6y?mZ5z/e9OzE^M{AYL%Z3jQY!B7Gxlo>wx!vp%c.0u8TV2w[3[B75Y)5^.oho>wx!vp%c&6ab7Rz/6Df"
    "wPRT8zw0aZy&r*0a%pPqB7Gxlo>wx!vp%djv@Dj6y?mZ5z/e9OzE^M{AYL$a0sxrTwO#3ABAy@3xL?r#BpXD>3jl(TA+(u<B-Ipp5^![Rx(4u#vqPM*2"
    "6j)bx(mM46ab7Rz/6DfwPRT8zw0aZy&r*0a#:NOzE=4PBywV)zdNQbi^kpWxHcDRwPzV%By^{Qy?mG)zdL+rz/6DfwPRT8zB!hNwnC*$iX<Cq2Y<M{wk"
    ")b+BpXD>4HJtXwQ5qf26j)bx(mM46ab7Rz/6DfwPRT8zw0aZy&r*0a@+PmzE=ZTCYU#Rz/6DfwPRT8zB!hNwnC*$iTQ&F3jfB9o>wx!vp%c}843N:vr("
    "^lBp]9Uq+Z?AB75Y)oKSi+B-X/P3la4$zE^s0p*[x^x>7<@vqZfUwmYU2x>z6<AUnNKq=M*?l(k}G910r!v}f7>B7]8$y?X0poKRywy.u}[BAh8kxcF2"
    "%40c92B.>OSCYmwqwFbbPz/oCo777p/wPI{bz/cf]o&B#4B8#5lzwSx#5deOLA=M8s5^IfgmriA!AV#k93V*DczddEgraQq@5^AA0A+PA7a{[UVrz(H6"
    "19FT2gck*Nx(mTbs7#+&q!p2>x(v(25e(k&2xKD$B7]Mg5^.ohq!p2>x(v(k5nu2@Bxrf#xJ5F-B7]MgiW$qknLr=tdHFT-B-7.#BzkVh",
    v2,
    0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

id sub_22AD25E74(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  const char *v4;
  double v5;
  id v6;
  void *v7;

  v2 = a2;
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDDD0C0]);
    v6 = (id)objc_msgSend_initWithSession_(v3, v4, v5, v2);
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDD0C0]);
  }
  v7 = v6;

  return v7;
}

id sub_22AD25EC0()
{
  return objc_alloc_init(MEMORY[0x24BDDD0D8]);
}

id sub_22AD25EDC(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  const char *v5;
  double v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BDDD0C8];
  v3 = a2;
  v4 = [v2 alloc];
  v7 = (void *)objc_msgSend_initWithAlternateLayout_(v4, v5, v6, v3);

  return v7;
}

void sub_22AD26228(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("83847776i!Wwx+<A{R!L88?/I*mXO<n0upa1gbHmA!De^PzW77&=d1<z=WW#Az?Ie9U=90/+SBXB33?T^{M0koE8oDsH)Qrj{Yk)MEAcBN>LH*o1?Nb!9DOEKZ#tN.Rv/[rp$7]H{JEy&:LnFCiFbjQ0F46Df[E-xEC^1(yE3rWYNry]F}Abok#vruj4zC$j!A=+/lBv/$XzzBrY4@2J(zDyK]xHuYQBywW35d/-]3i$6VzGGq%Bp[)Epd5@qBywW3a}Vttv@Dl^x([2Qz/fV9v@%:s]92EqlRZ0!zGGq%Bxi9!Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Li3$Bi[BywW3q/(}#wFbFupd5@qBywW3q/(}#wG&f56>z31Abn%dwN[RTz/xodBA{I<D2<P4vrcx%C{j1h3VGJ{wO#PWA=l8t5^H^0m@&J<A3u894pK6{wPzV%By!iQzdKs:B98CpzF7de3i$6VzGGq%Bp[)Epd5@qBywW37Y+/)3i$AVB8$=5wFbh*BAh8kxcF5$4pK6?z*cm>wncd1zF6N+vScg3a@7B]vqG:#Cxl5WBzkVhA$OQ+z/oCo5^![PwO+{<vru5[25^%=wN/*aapn%bxM53fwk^eWCt8Z*yH}3zz/fV9v@#=81y=p/y:6]c4@+@$wO#PSz/fV9x(mH55^}64lVl<:vqfQ<AXYSZ8dWr1v@=p5Bz(g?z/O-!ADL#owN[CBD2<Jda@R$xwPIv4x(FfjAZ<$/qE%&<x(W=}oj-x&gf+edC4>JilVl<:A=k=gwPymUA-E0)zF%-plVl<:vpKx<5e(k&2v?W&BywW35^Z{2lVl<:vpKy6aUd.IwP{HWzGG]qy&0W6mSirEzFKcdCwY=^zGGq%Buhf&3k^C<xj#9}xj#x-A=k]dA==Odx([2YwQa*/8vW2QyH}=726j)bx(mM46BCgYwmYU2x>z6<AUnN$BAh8kxcFQmx>I9}x>Ia3p&ZF[wPz)rs7#+&oj-xfx>g^)Bzku3wPx*!p6}?Yx>qGQz/fVqz!%l3AZ<$/lVl<:vpKx<5e(k&2v?W&BywW35^Z{2lVl<:vpKy68y]#BwP{HWzGG]qy&0W6mSirmz/fV9v@%:!r0<N/x>qGQz/fVqz!%l3AZ<$/pgXSpz/fV9v@@m[8wAI-v@DmbvpKx(2$4DPz/fV9v@@[nd%tSrCscp^BAhqoy?mSRz/OP:Cscp^BywW3iTUuS3lqGelVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Li6>z31Abn%dwN[RTz/xodBA{I<D2<P4vrcx%C{i>d2XmH.wOkB[wFbh=vRPE:BrSsAa8(miwnbKZBy^{WA-lK=wN/*@z/eu.p&ZF[wPz)r5^}Dkp&ZbTx>7N[wG&Yk9=MdhwnbKZBy^{WA-lK=wN/*@z/eu.lVl<:vpKx(3R<R%A+e=}v{%E<a$r{sAb]J2x>7N[wKZPUmq=Kyy?W^1lVl<:vpKx(3R<R%A+e=}v{%E<bc.pU7EH}+z/fV9v@$KYv@2T@l$HgCxjk)[b1h?Ov@DmbvpKyQx>7{&AZTRLlT:>xwO.[U8yC<@Aa@/$wPwz7lRZ0!zGGq%BwMWYyH}J!x>qGQz/fVqz!%l3AWQ#kQx7YFv@DmbvpKyQx>7{&AZTRLq!o=Rv@$7RzGGq%BwN0@AaK6iC[o#{cKH5%x>7{&AUoxWpd5@qBywW3p?:APwPy*=wP{HWzGG]qy&0W68ybU2v@DmbvpKy#A=k]dA==Nt5KPqXz/fV9v@$K/z/xodBA]5Tv@DmbvpKyQx>7{&AYN-Bwk^5QwN/*Hz/fV9v@$K/z/xodBA][}0Wri%3lAX}zGGq%BwMWYyH}JOx>gdNy?m9#lVl<:vpKz25ciW%3i>D-v@2T@5/<tmlVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS95EF!Nz/fV9v@#=81Z#B(vr<4tv@DmbvpKyQx>7{&AYN-Bwk^5QwN/*Hz/fV9v@#=Mc&$PB0sx&Sz/fV9v@$KYv@2T@l${ggwO+{/Bvf$:BywW35ciW%3i>D-v@2T@5/<tmlVl<:vpKyQx>7{&A"
         "-M)=Cscp^BAhqoy?mS96BC7Pz/fV9v@@s&lRZ0!zGGq%BrR/pz/fV9v@$KYv@2T@i+h@nq!o=Rv@$7RzGGq%Bug/KbaO-wcU47jBywW3p?:APwP"
         "ygMwk^5QwN/*Hz/fV9v@$K/z/xodBzkrc5ciW%3i>D-v@2T@5/<tmlVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS98vv6^z/fV9v@#Wgz/xodBzk"
         "rc5^qY:A::kqdpWplBywW3p?:APwPx?xx>gdNy?m9#lVl<:vpKyQA=k]dA==2bB2>YJbaX(za45^<z/fV9v@$:=wP{HWzGG]qy&0W6l$HgCxjk)"
         "[bgV=4l1s?JBywW3r+Vb?lVl<:A=k=gwPyZ.z/](bp?sVVz/PX.wObv[y&?%MBzkVhmSirmz/fV9v@$K/z/xodBA[A08yV16C4>Jiv@DmbA=k=g"
         "wPwz1lRZ0!zGGq%Bxi9!Cscp^BAhqoy?mS99sr6>A=k]dA==Nt5KPqXz/fV9v@$K/z/xodBA]5$v@DmbvpKyWx>qGQz/fVqz!%l3AYOnPz/](bp"
         "?sVVz/PX.wObv[y&?%MBzkVhmSirmz/fV9v@$K/z/xodBA][}0Wsrs3m/R8zGGq%Bxi9!Cscp^BAhqoy?mSPx>fOHze:r5By!J/Bza3WzGGq%Bp"
         "XD>dgcMdx>qGQz/fVqz!%l3AUofQpd5@qBywW3r+Vb?lVl<:A=k=gwPwX63i$6VzGGq%Bp[)Epd5@qBywW3a$WqyzGGq%Bxi9!Cscp^BAhqoy?m"
         "SFwnbNwz/6DfwPRG+x([2Qz/fV9v@%:W0XaEyz/fV9v@#=w3pX@RzE^f$x(v>");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "83847776i!Wwx+<A{R!L88?/I*mXO<n0upa1gbHmA!De^PzW77&=d1<z=WW#Az?Ie9U=90/+SBXB33?T^{M0koE8oDsH)Qrj{Yk)MEAcBN>LH*o1?Nb!9DOEKZ#tN.Rv/[rp$7]H{JEy&:LnFCiFbjQ0F46Df[E-xEC^1(yE3rWYNry]F}Abok#vruj4zC$j!A=+/lBv/$XzzBrY4@2J(zDyK]xHuYQBywW35d/-]3i$6VzGGq%Bp[)Epd5@qBywW3a}Vttv@Dl^x([2Qz/fV9v@%:s]92EqlRZ0!zGGq%Bxi9!Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Li3$Bi[BywW3q/(}#wFbFupd5@qBywW3q/(}#wG&f56>z31Abn%dwN[RTz/xodBA{I<D2<P4vrcx%C{j1h3VGJ{wO#PWA=l8t5^H^0m@&J<A3u894pK6{wPzV%By!iQzdKs:B98CpzF7de3i$6VzGGq%Bp[)Epd5@qBywW37Y+/)3i$AVB8$=5wFbh*BAh8kxcF5$4pK6?z*cm>wncd1zF6N+vScg3a@7B]vqG:#Cxl5WBzkVhA$OQ+z/oCo5^![PwO+{<vru5[25^%=wN/*aapn%bxM53fwk^eWCt8Z*yH}3zz/fV9v@#=81y=p/y:6]c4@+@$wO#PSz/fV9x(mH55^}64lVl<:vqfQ<AXYSZ8dWr1v@=p5Bz(g?z/O-!ADL#owN[CBD2<Jda@R$xwPIv4x(FfjAZ<$/qE%&<x(W=}oj-x&gf+edC4>JilVl<:A=k=gwPymUA-E0)zF%-plVl<:vpKx<5e(k&2v?W&BywW35^Z{2lVl<:vpKy6aUd.IwP{HWzGG]qy&0W6mSirEzFKcdCwY=^zGGq%Buhf&3k^C<xj#9}xj#x-A=k]dA==Odx([2YwQa*/8vW2QyH}=726j)bx(mM46BCgYwmYU2x>z6<AUnN$BAh8kxcFQmx>I9}x>Ia3p&ZF[wPz)rs7#+&oj-xfx>g^)Bzku3wPx*!p6}?Yx>qGQz/fVqz!%l3AZ<$/lVl<:vpKx<5e(k&2v?W&BywW35^Z{2lVl<:vpKy68y]#BwP{HWzGG]qy&0W6mSirmz/fV9v@%:!r0<N/x>qGQz/fVqz!%l3AZ<$/pgXSpz/fV9v@@m[8wAI-v@DmbvpKx(2$4DPz/fV9v@@[nd%tSrCscp^BAhqoy?mSRz/OP:Cscp^BywW3iTUuS3lqGelVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Li6>z31Abn%dwN[RTz/xodBA{I<D2<P4vrcx%C{i>d2XmH.wOkB[wFbh=vRPE:BrSsAa8(miwnbKZBy^{WA-lK=wN/*@z/eu.p&ZF[wPz)r5^}Dkp&ZbTx>7N[wG&Yk9=MdhwnbKZBy^{WA-lK=wN/*@z/eu.lVl<:vpKx(3R<R%A+e=}v{%E<a$r{sAb]J2x>7N[wKZPUmq=Kyy?W^1lVl<:vpKx(3R<R%A+e=}v{%E<bc.pU7EH}+z/fV9v@$KYv@2T@l$HgCxjk)[b1h?Ov@DmbvpKyQx>7{&AZTRLlT:>xwO.[U8yC<@Aa@/$wPwz7lRZ0!zGGq%BwMWYyH}J!x>qGQz/fVqz!%l3AWQ#kQx7YFv@DmbvpKyQx>7{&AZTRLq!o=Rv@$7RzGGq%BwN0@AaK6iC[o#{cKH5%x>7{&AUoxWpd5@qBywW3p?:APwPy*=wP{HWzGG]qy&0W68ybU2v@DmbvpKy#A=k]dA==Nt5KPqXz/fV9v@$K/z/xodBA]5Tv@DmbvpKyQx>7{&AYN-Bwk^5QwN/*Hz/fV9v@$K/z/x"
    "odBA][}0Wri%3lAX}zGGq%BwMWYyH}JOx>gdNy?m9#lVl<:vpKz25ciW%3i>D-v@2T@5/<tmlVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS95EF!Nz/fV"
    "9v@#=81Z#B(vr<4tv@DmbvpKyQx>7{&AYN-Bwk^5QwN/*Hz/fV9v@#=Mc&$PB0sx&Sz/fV9v@$KYv@2T@l${ggwO+{/Bvf$:BywW35ciW%3i>D-v@2T@"
    "5/<tmlVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS96BC7Pz/fV9v@@s&lRZ0!zGGq%BrR/pz/fV9v@$KYv@2T@i+h@nq!o=Rv@$7RzGGq%Bug/KbaO-wc"
    "U47jBywW3p?:APwPygMwk^5QwN/*Hz/fV9v@$K/z/xodBzkrc5ciW%3i>D-v@2T@5/<tmlVl<:vpKyQx>7{&A-M)=Cscp^BAhqoy?mS98vv6^z/fV9v@"
    "#Wgz/xodBzkrc5^qY:A::kqdpWplBywW3p?:APwPx?xx>gdNy?m9#lVl<:vpKyQA=k]dA==2bB2>YJbaX(za45^<z/fV9v@$:=wP{HWzGG]qy&0W6l$H"
    "gCxjk)[bgV=4l1s?JBywW3r+Vb?lVl<:A=k=gwPyZ.z/](bp?sVVz/PX.wObv[y&?%MBzkVhmSirmz/fV9v@$K/z/xodBA[A08yV16C4>Jiv@DmbA=k="
    "gwPwz1lRZ0!zGGq%Bxi9!Cscp^BAhqoy?mS99sr6>A=k]dA==Nt5KPqXz/fV9v@$K/z/xodBA]5$v@DmbvpKyWx>qGQz/fVqz!%l3AYOnPz/](bp?sVV"
    "z/PX.wObv[y&?%MBzkVhmSirmz/fV9v@$K/z/xodBA][}0Wsrs3m/R8zGGq%Bxi9!Cscp^BAhqoy?mSPx>fOHze:r5By!J/Bza3WzGGq%BpXD>dgcMdx"
    ">qGQz/fVqz!%l3AUofQpd5@qBywW3r+Vb?lVl<:A=k=gwPwX63i$6VzGGq%Bp[)Epd5@qBywW3a$WqyzGGq%Bxi9!Cscp^BAhqoy?mSFwnbNwz/6DfwP"
    "RG+x([2Qz/fV9v@%:W0XaEyz/fV9v@#=w3pX@RzE^f$x(v>",
    v2,
    0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

uint64_t sub_22AD262AC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  objc_class *Class;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  uint64_t v10;
  id v11;
  const char *v12;
  double v13;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  id v20;
  const char *v21;
  double v22;
  const char *v23;
  objc_class *v24;
  objc_class *ClassPair;
  Protocol **v26;
  unint64_t i;
  Method *v28;
  unint64_t j;
  objc_method *v30;
  const char *Name;
  void (*Implementation)(void);
  const char *TypeEncoding;
  objc_method *InstanceMethod;
  void (*v35)(void);
  const char *v36;
  const char *v37;
  Method v38;
  uint64_t v39;
  void *v40;
  void (*v41)(void);
  const char *v42;
  void *v43;
  void (*v44)(void);
  objc_method *v45;
  const char *v46;
  objc_method *v47;
  const char *v48;
  const char *v49;
  size_t InstanceSize;
  _QWORD v51[5];
  _QWORD v52[5];
  unsigned int v53;
  unsigned int outCount;

  v4 = a3;
  Class = object_getClass(v4);
  if ((objc_msgSend_tmlIsKindOfClass_(v4, v6, v7, a1) & 1) != 0)
    goto LABEL_2;
  objc_msgSend_superclass(a1, v8, v9);
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v11 = objc_retainAutorelease(v4), objc_msgSend_observationInfo(v11, v12, v13)))
  {
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v15 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass((Class)a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(Class);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v15, v18, v19, CFSTR("%@_%@"), v16, v17);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = (const char *)objc_msgSend_UTF8String(v20, v21, v22);

  v24 = objc_lookUpClass(v23);
  if (v24)
  {
    ClassPair = v24;
    if (object_getClass(v11) == v24)
      goto LABEL_2;
  }
  else
  {
    ClassPair = objc_allocateClassPair(Class, v23, 0);
    outCount = 0;
    v26 = class_copyProtocolList((Class)a1, &outCount);
    if (outCount)
    {
      for (i = 0; i < outCount; class_addProtocol(ClassPair, v26[i++]))
        ;
    }
    free(v26);
    v53 = 0;
    v28 = class_copyMethodList((Class)a1, &v53);
    if (v53)
    {
      for (j = 0; j < v53; ++j)
      {
        v30 = v28[j];
        Name = method_getName(v30);
        Implementation = method_getImplementation(v30);
        TypeEncoding = method_getTypeEncoding(v30);
        class_addMethod(ClassPair, Name, Implementation, TypeEncoding);
      }
    }
    free(v28);
    InstanceMethod = class_getInstanceMethod(Class, sel_class);
    v35 = imp_implementationWithBlock(&unk_24F4FDCA0);
    v36 = method_getName(InstanceMethod);
    v37 = method_getTypeEncoding(InstanceMethod);
    class_addMethod(ClassPair, v36, v35, v37);
    v38 = class_getInstanceMethod(Class, sel_tmlSuperClass);
    v39 = MEMORY[0x24BDAC760];
    if (!v38)
    {
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = sub_22AD26658;
      v52[3] = &unk_24F4FDCC0;
      v52[4] = Class;
      v40 = (void *)MEMORY[0x22E2E7E44](v52);
      v41 = imp_implementationWithBlock(v40);

      v42 = method_getTypeEncoding(InstanceMethod);
      class_addMethod(ClassPair, sel_tmlSuperClass, v41, v42);
    }
    v51[0] = v39;
    v51[1] = 3221225472;
    v51[2] = sub_22AD26660;
    v51[3] = &unk_24F4FDCE0;
    v51[4] = a1;
    v43 = (void *)MEMORY[0x22E2E7E44](v51);
    v44 = imp_implementationWithBlock(v43);

    v45 = class_getInstanceMethod(Class, sel_isKindOfClass_);
    v46 = method_getTypeEncoding(v45);
    class_addMethod(ClassPair, sel_tmlIsKindOfClass_, v44, v46);
    v47 = class_getInstanceMethod(Class, sel_respondsToSelector_);
    v48 = method_getName(v47);
    v49 = method_getTypeEncoding(v47);
    class_addMethod(ClassPair, v48, (IMP)sub_22AD26670, v49);
    objc_registerClassPair(ClassPair);
    InstanceSize = class_getInstanceSize(Class);
    if (InstanceSize != class_getInstanceSize(ClassPair))
      goto LABEL_5;
  }
  object_setClass(v11, ClassPair);
LABEL_2:
  v10 = 1;
LABEL_6:

  return v10;
}

Class sub_22AD26640(int a1, id a2)
{
  objc_class *Class;

  Class = object_getClass(a2);
  return class_getSuperclass(Class);
}

id sub_22AD26658(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

BOOL sub_22AD26660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_QWORD *)(a1 + 32) == a3;
}

BOOL sub_22AD26670(void *a1, const char *a2, const char *a3)
{
  id v5;
  const char *v6;
  double v7;
  objc_class *Superclass;
  objc_class *Class;
  _BOOL8 v10;
  objc_class *v11;
  objc_super v13;

  v5 = a1;
  Superclass = (objc_class *)objc_msgSend_tmlSuperClass(v5, v6, v7);
  v13.receiver = v5;
  if (!Superclass)
  {
    Class = object_getClass(v5);
    Superclass = class_getSuperclass(Class);
  }
  v13.super_class = Superclass;
  if ((objc_msgSendSuper(&v13, a2, a3) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v11 = object_getClass(v5);
    v10 = class_getInstanceMethod(v11, a3) != 0;
  }

  return v10;
}

uint64_t sub_22AD26700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  double v6;

  v4 = (void *)objc_opt_class();
  return objc_msgSend_isSubclassOfClass_(v4, v5, v6, a3);
}

void sub_22AD26A38(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a3;
  v4 = sub_22AD26AA0(v8);
  if (v4)
  {
    sub_22AD26B18(v8, v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addTarget_action_(a1, v6, v7, v5, sel_handleGesture_);

  }
}

uint64_t sub_22AD26AA0(void *a1)
{
  uint64_t v1;
  const char *v2;
  id v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  uint64_t v8;

  v1 = qword_255B51A58;
  v3 = a1;
  if (v1 != -1)
    dispatch_once(&qword_255B51A58, &unk_24F4FDD20);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51A50, v2, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend_integerValue(v5, v6, v7);
  return v8;
}

id sub_22AD26B18(void *a1, uint64_t a2, int a3)
{
  const char *v5;
  id v6;
  double v7;
  void *v8;
  BOOL v9;
  TMLUIGestureRecognizerActionTarget *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;

  v6 = a1;
  if (qword_255B51A48 != -1)
    dispatch_once(&qword_255B51A48, &unk_24F4FDD00);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51A40, v5, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 1;
  else
    v9 = a3 == 0;
  if (!v9)
  {
    v10 = [TMLUIGestureRecognizerActionTarget alloc];
    v8 = (void *)objc_msgSend_initWithSignal_state_(v10, v11, v12, v6, a2);
    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_255B51A40, v13, v14, v8, v6);
  }

  return v8;
}

void sub_22AD26BD0(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a3;
  v4 = sub_22AD26AA0(v9);
  v5 = v9;
  if (v4)
  {
    sub_22AD26B18(v9, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend_removeTarget_action_(a1, v6, v8, v7, sel_handleGesture_);

    v5 = v9;
  }

}

double sub_22AD26C3C(void *a1, const char *a2, double a3)
{
  void *v4;
  const char *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend_view(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_locationInView_(a1, v5, v6, v4);
  v8 = v7;

  return v8;
}

void sub_22AD26D64()
{
  id v0;
  const char *v1;
  double v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x24BDBCED8]);
  v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 14);
  v4 = (void *)qword_255B51A40;
  qword_255B51A40 = v3;

}

void sub_22AD26D94()
{
  void *v0;

  v0 = (void *)qword_255B51A50;
  qword_255B51A50 = (uint64_t)&unk_24F534890;

}

void sub_22AD271C8(objc_class *a1)
{
  objc_method *InstanceMethod;
  objc_method *v3;

  InstanceMethod = class_getInstanceMethod(a1, sel_setValue_forUndefinedKey_);
  v3 = class_getInstanceMethod(a1, sel_tmlSetValue_forUndefinedKey_);
  method_exchangeImplementations(InstanceMethod, v3);
}

uint64_t sub_22AD2720C(void *a1, uint64_t a2, const char *a3, void *a4)
{
  id v6;
  uint64_t v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  int v21;
  id v22;
  const char *v23;
  double v24;
  id v26;
  objc_super v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v27.receiver = a1;
  v27.super_class = (Class)&off_255B72E50;
  v7 = (uint64_t)objc_msgSendSuper2(&v27, sel_canPerformAction_withSender_, a3, v6);
  objc_msgSend_delegate(a1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = a1;
  NSStringFromSelector(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v12;
  v14 = v6;
  if (!v6)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[2] = v14;
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v11, v13, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v15;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, v17, v28, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v21 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(v10, v19, v20, CFSTR("textFieldCanPerformActionWithSenderDefaultValue"), v18, &v26);
  v22 = v26;

  if (!v6)
  if (v21)
    v7 = objc_msgSend_BOOLValue(v22, v23, v24);

  return v7;
}

void sub_22AD27390(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  uint64_t v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  uint64_t v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  id v41;

  v41 = a3;
  v6 = a4;
  if (objc_msgSend_isEqualToString_(v6, v7, v8, CFSTR("enablesReturnKeyAutomatically")))
  {
    v11 = objc_msgSend_BOOLValue(v41, v9, v10);
    objc_msgSend_setEnablesReturnKeyAutomatically_(a1, v12, v13, v11);
  }
  else if (objc_msgSend_isEqualToString_(v6, v9, v10, CFSTR("returnKeyType")))
  {
    v16 = objc_msgSend_integerValue(v41, v14, v15);
    objc_msgSend_setReturnKeyType_(a1, v17, v18, v16);
  }
  else if (objc_msgSend_isEqualToString_(v6, v14, v15, CFSTR("keyboardType")))
  {
    v21 = objc_msgSend_integerValue(v41, v19, v20);
    objc_msgSend_setKeyboardType_(a1, v22, v23, v21);
  }
  else if (objc_msgSend_isEqualToString_(v6, v19, v20, CFSTR("autocorrectionType")))
  {
    v26 = objc_msgSend_integerValue(v41, v24, v25);
    objc_msgSend_setAutocorrectionType_(a1, v27, v28, v26);
  }
  else if (objc_msgSend_isEqualToString_(v6, v24, v25, CFSTR("autocapitalizationType")))
  {
    v31 = objc_msgSend_integerValue(v41, v29, v30);
    objc_msgSend_setAutocapitalizationType_(a1, v32, v33, v31);
  }
  else if (objc_msgSend_isEqualToString_(v6, v29, v30, CFSTR("spellCheckingType")))
  {
    v36 = objc_msgSend_integerValue(v41, v34, v35);
    objc_msgSend_setSpellCheckingType_(a1, v37, v38, v36);
  }
  else if (objc_msgSend_isEqualToString_(v6, v34, v35, CFSTR("textContentType")))
  {
    objc_msgSend_setTextContentType_(a1, v39, v40, v41);
  }
  else
  {
    objc_msgSend_tmlSetValue_forUndefinedKey_(a1, v39, v40, v41, v6);
  }

}

void sub_22AD275B0(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("838477764bgqNZpim]UgJ2oyyw#Kj*Uv]MZ7]NH6S)8w1)UBij<$Fu@bO$ww*m.lorW))g^>7^^]i7]ck-i2VKBPPE!CcqELyy=v%BXI!.s@<:=J!-nKiXF}mQ%V:UzMBIU+V[>7N}sbW4<z=e+%7:mit673L6(CizRnV5}K3zW+h7e)X3vp&}*x&X}VCscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Rk6(Xh8w[u16wN[boA-u:<Bvf$.z/MD]v@Dg4AU[<45^![PwO+{<vru5[25^%=wN/*a8WWi*x(!c9B8%V<BAzCsq/)q3wFb8VzGDY%a%WHkAb]J4wPz*5wj7oMBAhqorb3k(lVl^VAUnK=z!%uj7Y(Du3jyM=x()A<BzaVLoB}:N2NQPP5^9n%y:6p4zFsh]x([2*qCobbA%-:#zFsh]x([2*qCoC@zF0P}B-H]jx(v(25e>/Y0D/1SB-IppeEzX(z/ff3xa=B/mPi-cvrc6.x>qGQz/fVqz!%l3AZK+.w[+[2A::67z/c:qx(mTbs7#+&rz(HKv@Dl%x>INevruj4zAofEggpIlx(mTbs7#+&rz(HVzGGDgB5DNTwmY^}w<HPGx(4i!y?jd?8vcVJBRj!0A+(T23isPG1y=p/y:7cszFsh]x([2*qCob.zGGDgB5DNTwmY^Mw<HPGx(4i!y?kTmA0^**mPi-cvrc6.x>qGQz/fVqz!%l3AZK+.w[+[2A::67z/cf[pe:}$ygQ)%a@*}7vQTpAz!%k#Ac2-hxglYDvR/Q^5^hVZz!{Qt3kWn>By/GlqE%oEwPyvOl3uWJy**^?wFbbPz/oC.0v3F93lAbnq^<oDA+OM*wP{HWzGG]qy&0W6l$HgCxjk)[bb22AdSY3gvrc6.x>qGQz/fVqz!%l3AZTRLlVl*Xy?mZ1nP5l:x<>*Kz^^e/0u9i<3s!0(BAhqoy?mS17e)X3vp&}*x&X}VCscp^BAhqoy?mS98WWl?x>h3#vpTC4v}f7>B7PMhy<uS@vScg3a$N!zw)]Z]r+Vb?lVl<:A=k=gwPx?xx>fOHze:r5By!3Yx([5$y!O+Qwi8aubaeDs9B<29BAhqoy?mSMv@#Bdx([R(By/rgmSirEqCmSk8ybT%v@DmbA=k=gwPwz0q:%X]w)]Z]r+Vb?lVl<:A=k=gwPwW$3iLA>y.u[Dq=MZ?8v)eUBzk&kwFbh*BAh8kxcG0Ivp&}*x&X}VCscp^BAhqoy?mSFvpKy[C4(5znPXJXB4g7*rz(HKBzk&kwJzjvbc}pSflpMlvrc6.x>qGQz/fVqz!%l3AZ+j.y&%o1wi<ZEx)aijC#P6dwPHsVA-D1h5d/:93jpoYzGG]qy&0W65/aznq^<oDA+OM*wP{HWzGG]qy&0W68vM@PB-Iph1X}#@qCm#t3i+J=BzLI326j)bx(mMch/&ztvrc6.x>qGQz/fVqz!%l3AYN=Rv@co#wN[8pBzk]jBA{&hAaK8Wz/O&QoGEofBzLIHc&$O:3lsg@w)]Z]r+Vb?lVl<:A=k=gwPygMwjyoJx(^@00u9i<3s!0(BAhqoy?mS17e)X3vp&}*x&X}VCscp^BAhqoy?mSn0XavNnLr=t");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "838477764bgqNZpim]UgJ2oyyw#Kj*Uv]MZ7]NH6S)8w1)UBij<$Fu@bO$ww*m.lorW))g^>7^^]i7]ck-i2VKBPPE!CcqELyy=v%BXI!.s@<:=J!-nKiXF}mQ%V:UzMBIU+V[>7N}sbW4<z=e+%7:mit673L6(CizRnV5}K3zW+h7e)X3vp&}*x&X}VCscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#Rk6(Xh8w[u16wN[boA-u:<Bvf$.z/MD]v@Dg4AU[<45^![PwO+{<vru5[25^%=wN/*a8WWi*x(!c9B8%V<BAzCsq/)q3wFb8VzGDY%a%WHkAb]J4wPz*5wj7oMBAhqorb3k(lVl^VAUnK=z!%uj7Y(Du3jyM=x()A<BzaVLoB}:N2NQPP5^9n%y:6p4zFsh]x([2*qCobbA%-:#zFsh]x([2*qCoC@zF0P}B-H]jx(v(25e>/Y0D/1SB-IppeEzX(z/ff3xa=B/mPi-cvrc6.x>qGQz/fVqz!%l3AZK+.w[+[2A::67z/c:qx(mTbs7#+&rz(HKv@Dl%x>INevruj4zAofEggpIlx(mTbs7#+&rz(HVzGGDgB5DNTwmY^}w<HPGx(4i!y?jd?8vcVJBRj!0A+(T23isPG1y=p/y:7cszFsh]x([2*qCob.zGGDgB5DNTwmY^Mw<HPGx(4i!y?kTmA0^**mPi-cvrc6.x>qGQz/fVqz!%l3AZK+.w[+[2A::67z/cf[pe:}$ygQ)%a@*}7vQTpAz!%k#Ac2-hxglYDvR/Q^5^hVZz!{Qt3kWn>By/GlqE%oEwPyvOl3uWJy**^?wFbbPz/oC.0v3F93lAbnq^<oDA+OM*wP{HWzGG]qy&0W6l$HgCxjk)[bb22AdSY3gvrc6.x>qGQz/fVqz!%l3AZTRLlVl*Xy?mZ1nP5l:x<>*Kz^^e/0u9i<3s!0(BAhqoy?mS17e)X3vp&}*x&X}VCscp^BAhqoy?mS98WWl?x>h3#vpTC4v}f7>B7PMhy<uS@vScg3a$N!zw)]Z]r+Vb?lVl<:A=k=gwPx?xx>fOHze:r5By!3Yx([5$y!O+Qwi8aubaeDs9B<29BAhqoy?mSMv@#Bdx([R(By/rgmSirEqCmSk8ybT%v@DmbA=k=gwPwz0q:%X]w)]Z]r+Vb?lVl<:A=k=gwPwW$3iLA>y.u[Dq=MZ?8v)eUBzk&kwFbh*BAh8kxcG0Ivp&}*x&X}VCscp^BAhqoy?mSFvpKy[C4(5znPXJXB4g7*rz(HKBzk&kwJzjvbc}pSflpMlvrc6.x>qGQz/fVqz!%l3AZ+j.y&%o1wi<ZEx)aijC#P6dwPHsVA-D1h5d/:93jpoYzGG]qy&0W65/aznq^<oDA+OM*wP{HWzGG]qy&0W68vM@PB-Iph1X}#@qCm#t3i+J=BzLI326j)bx(mMch/&ztvrc6.x>qGQz/fVqz!%l3AYN=Rv@co#wN[8pBzk]jBA{&hAaK8Wz/O&QoGEofBzLIHc&$O:3lsg@w)]Z]r+Vb?lVl<:A=k=gwPygMwjyoJx(^@00u9i<3s!0(BAhqoy?mS17e)X3vp&}*x&X}VCscp^BAhqoy?mSn0XavNnLr=t", v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

void sub_22AD278B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22AD278D0(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  const char *v4;
  double v5;
  id v6;
  const char *v7;
  double v8;
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    objc_msgSend_shared(TMLAspectsRegistration, v4, v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend_unregisterAspect_withKey_(v9, v7, v8, v6, *(_QWORD *)(a1 + 32));

  }
}

void sub_22AD27BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_22AD27C00(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id *v5;
  id v6;
  id v7;
  const char *v8;
  double v9;
  id v10;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = (id *)(a1 + 40);
    v6 = objc_loadWeakRetained(v5);

    if (v6)
    {
      v10 = objc_loadWeakRetained(v2);
      v7 = objc_loadWeakRetained(v5);
      objc_msgSend_unregisterAspect_(v10, v8, v9, v7);

    }
  }
}

void sub_22AD27D28(uint64_t a1, void *a2, void *a3, void *a4, void *a5, _QWORD *a6, _QWORD *a7)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;
  id WeakRetained;
  const char *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  id v29;
  const char *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v38;
  void *v39;
  _QWORD v40[4];
  _QWORD v41[5];

  v41[4] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v41[0] = v11;
    v40[0] = CFSTR("object");
    v40[1] = CFSTR("ctx");
    v19 = v12;
    if (!v12)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41[1] = v19;
    v40[2] = CFSTR("arguments");
    v20 = v13;
    if (!v13)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41[2] = v20;
    v40[3] = CFSTR("returnValue");
    v21 = v14;
    if (!v14)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41[3] = v21;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, v18, v41, v40, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)

    if (!v13)
    if (!v12)

    v23 = objc_loadWeakRetained(v15);
    v39 = v22;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v24, v25, &v39, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend_emitTMLSignal_withArguments_returnValue_(v23, v27, v28, CFSTR("activate"), v26, &v38);
    v29 = v38;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a6)
      {
        objc_msgSend_objectForKeyedSubscript_(v29, v30, v31, CFSTR("newArguments"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
          *a6 = objc_retainAutorelease(v32);

      }
      if (a7)
      {
        objc_msgSend_objectForKeyedSubscript_(v29, v30, v31, CFSTR("newReturnValue"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
          *a7 = objc_retainAutorelease(v34);

      }
    }

  }
}

void sub_22AD27FA4(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  const char *v3;
  double v4;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    objc_msgSend_raiseException_(TMLExceptionHandler, v3, v4, v2);

    objc_end_catch();
    JUMPOUT(0x22AD27F58);
  }
  _Unwind_Resume(exception_object);
}

id sub_22AD283E8(void *a1)
{
  return objc_getAssociatedObject(a1, "tcdssdpomabscgoc");
}

void sub_22AD283F4(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  char v11;
  const char *v12;
  double v13;
  uint64_t v14;
  void *v15;
  id value;

  value = a3;
  objc_getAssociatedObject(a1, "tcdssdpomabscgoc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (!v4)
  {
    v15 = value;
    goto LABEL_5;
  }
  objc_msgSend_componentsSeparatedByString_(v4, v5, v6, CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_containsObject_(v8, v9, v10, value);

  if ((v11 & 1) == 0)
  {
    objc_msgSend_stringByAppendingFormat_(v7, v12, v13, CFSTR(",%@"), value);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v14;
LABEL_5:
    value = v15;
    objc_setAssociatedObject(a1, "tcdssdpomabscgoc", v15, (void *)3);
  }

}

uint64_t sub_22AD284C4(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_classForObject_(TMLRuntime, a2, a3, a1);
}

void sub_22AD284D4(void *a1, uint64_t a2)
{
  void *v4;
  const char *v5;
  double v6;

  objc_getAssociatedObject(a1, "cdssdpomabscgoc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeObjectsPerformSelector_(v4, v5, v6, a2);

  objc_setAssociatedObject(a1, "cdssdpomabscgoc", 0, (void *)1);
  objc_setAssociatedObject(a1, "dssdpomabscgoc", 0, (void *)1);
  objc_setAssociatedObject(a1, "ssdpomabscgoc", 0, (void *)1);
  objc_setAssociatedObject(a1, "sdpomabscgoc", 0, (void *)1);
  objc_setAssociatedObject(a1, "dpomabscgoc", 0, (void *)1);
}

void sub_22AD28590(void *a1, uint64_t a2, void *a3)
{
  const char *v4;
  void *v5;
  double v6;
  id v7;
  const char *v8;
  double v9;
  id v10;

  v10 = a3;
  objc_getAssociatedObject(a1, "cdssdpomabscgoc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v5 = (void *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    objc_setAssociatedObject(a1, "cdssdpomabscgoc", v5, (void *)1);
  }
  objc_msgSend_addObject_(v5, v4, v6, v10);

}

id sub_22AD2861C(void *a1)
{
  return objc_getAssociatedObject(a1, "cdssdpomabscgoc");
}

id sub_22AD28628(void *a1)
{
  return objc_getAssociatedObject(a1, "pomabscgoc");
}

void sub_22AD28634(void *a1, uint64_t a2, void *a3)
{
  const char *v4;
  double v5;
  id v6;

  v6 = a3;
  objc_setAssociatedObject(a1, "pomabscgoc", v6, 0);
  objc_msgSend_addTmlChild_(v6, v4, v5, a1);

}

id sub_22AD28688(void *a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  double v5;

  objc_getAssociatedObject(a1, "dssdpomabscgoc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = 0;
    }
    else
    {
      v3 = objc_opt_class();
      objc_msgSend_stateForClass_stateName_(TMLState, v4, v5, v3, &stru_24F505EA8);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v2, "pomabscgoc", a1, 0);
      objc_setAssociatedObject(a1, "dssdpomabscgoc", v2, (void *)1);
    }
  }
  return v2;
}

__CFString *sub_22AD28738(void *a1)
{
  void *v1;
  const char *v2;
  double v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  objc_getAssociatedObject(a1, "ssdpomabscgoc");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlStateName(v1, v2, v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24F505EA8;
  v6 = v4;

  return v6;
}

void sub_22AD2879C(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  char isEqualToString;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  id v26;

  v26 = a3;
  objc_getAssociatedObject(a1, "ssdpomabscgoc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlStateName(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v26, v8, v9, v7);

  if ((isEqualToString & 1) == 0)
  {
    objc_msgSend_tmlStateForName_(a1, v11, v12, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, "ssdpomabscgoc", v13, (void *)1);
    objc_msgSend_tmlStateName(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_leaveStateToState_(v4, v17, v18, v16);

    objc_msgSend_applyToObject_fromState_(v13, v19, v20, a1, v4);
    objc_msgSend_tmlStateName(v4, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enterStateFromState_(v13, v24, v25, v23);

  }
}

id sub_22AD28894(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = sub_22AD289B0;
    v21 = sub_22AD289C0;
    v22 = 0;
    objc_msgSend_tmlChildren(a1, v7, COERCE_DOUBLE(0x3032000000));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_22AD289C8;
    v14[3] = &unk_24F4FDDD0;
    v15 = v4;
    v16 = &v17;
    objc_msgSend_enumerateObjectsUsingBlock_(v9, v10, v11, v14);

    v12 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    objc_msgSend_tmlDefaultState(a1, v7, v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

void sub_22AD28998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AD289B0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22AD289C0(uint64_t a1)
{

}

void sub_22AD289C8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  int isEqualToString;
  id v13;

  v13 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_tmlStateName(v13, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v9, v10, v11, *(_QWORD *)(a1 + 32));

    if (isEqualToString)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

BOOL sub_22AD28A6C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id AssociatedObject;

  v4 = a3;
  AssociatedObject = j__objc_getAssociatedObject(a1, "omabscgoc");
  if (!AssociatedObject)
    objc_setAssociatedObject(a1, "omabscgoc", v4, 0);

  return AssociatedObject == 0;
}

BOOL sub_22AD28AD8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id AssociatedObject;

  v4 = a3;
  AssociatedObject = j__objc_getAssociatedObject(a1, "omabscgoc");

  return !AssociatedObject || AssociatedObject == v4;
}

void sub_22AD28B24(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  uint64_t v22;
  const char *v23;
  double v24;
  uint64_t v25;
  id v26;
  const char *v27;
  id v28;
  double v29;
  uint64_t v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  id v40;

  v40 = a3;
  v6 = a4;
  objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v7, v8, v6, a1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_type(v9, v10, v11);

  objc_msgSend_valueForTarget_withKeyPath_(TMLReactiveValue, v13, v14, a1, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unassign(v15, v16, v17);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_assignToTarget_withKeyPath_(v40, v18, v19, a1, v6);
  if (objc_msgSend_conformsToProtocol_(v40, v18, v19, &unk_255B535F8))
  {
    objc_msgSend_value(v40, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v40 = (id)v22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = objc_msgSend_rangeOfString_options_(v6, v23, v24, CFSTR("."), 4);
    v26 = v6;
    v28 = a1;
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_substringFromIndex_(v26, v27, v29, v25 + 1);
      v30 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_substringToIndex_(v26, v31, v32, v25);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueForKeyPath_(v28, v34, v35, v33);
      v36 = objc_claimAutoreleasedReturnValue();

      v26 = (id)v30;
      v28 = (id)v36;
    }
    v37 = (const char *)v40;
    if (v40)
    {
      objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, (const char *)v40, v29, v40, v12);
      v38 = objc_claimAutoreleasedReturnValue();

      v39 = (void *)v38;
    }
    else
    {
      v39 = 0;
    }
    v40 = v39;
    objc_msgSend_setValue_forKey_(v28, v37, v29);

  }
}

id sub_22AD28D9C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  void *v13;
  TMLValue *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;

  v4 = a3;
  objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v5, v6, v4, a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_type(v7, v8, v9);

  objc_msgSend_valueForKeyPath_(a1, v11, v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [TMLValue alloc];
  v17 = (void *)objc_msgSend_initWithValue_valueType_(v14, v15, v16, v13, v10);
  objc_msgSend_convertTmlValue_(TMLJSEnvironment, v18, v19, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id sub_22AD28E54(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;

  v4 = a3;
  v7 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v5, v6, v4, a1, 0);
  objc_msgSend_valueForKey_(a1, v8, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_22AD28EC0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  id v13;

  v4 = a3;
  objc_getAssociatedObject(a1, "mabscgoc");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCED8]);
    v13 = (id)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    objc_setAssociatedObject(a1, "mabscgoc", v13, (void *)1);
  }
  objc_msgSend_methodName(v4, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v11, v12, v4, v10);

}

void sub_22AD28F64(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  const char *v7;
  void *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  const char *v13;
  id v14;
  double v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  id v26;

  v26 = a3;
  v6 = a4;
  objc_getAssociatedObject(a1, "sdpomabscgoc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCED8]);
    v8 = (void *)objc_msgSend_initWithCapacity_(v10, v11, v12, 4);
    objc_setAssociatedObject(a1, "sdpomabscgoc", v8, (void *)1);
  }
  objc_msgSend_objectForKeyedSubscript_(v8, v7, v9, v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 != v26)
  {
    if (v26)
    {
      objc_msgSend_detach(v14, v13, v15);
      objc_msgSend_setObject_forKeyedSubscript_(v8, v16, v17, v26, v6);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_tmlSignalDetach_(a1, v20, v21, v6);
      objc_msgSend_detach(v14, v20, v21);
    }
    objc_msgSend_makeAccessible_signalName_(TMLNSObjectAccessibility, v18, v19, a1, v6);
    objc_msgSend_attach(v26, v22, v23);
    if (!v14 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend_tmlSignalAttach_(a1, v24, v25, v6);
  }

}

uint64_t sub_22AD290AC(uint64_t a1, double a2)
{
  return MEMORY[0x24BEDD108](a1, sel_setTMLSignalHandler_block_, a2);
}

void sub_22AD290BC(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  id v18;
  TMLPropertyChangedBlockSignalHandler *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  TMLBlockSignalHandler *v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  id v30;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend_hasSuffix_(v7, v8, v9, CFSTR("Changed")))
  {
    v12 = objc_msgSend_length(v7, v10, v11);
    objc_msgSend_substringToIndex_(v7, v13, v14, v12 - 7);
    v15 = objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v16, v17, v15, a1, 0);
    v19 = [TMLPropertyChangedBlockSignalHandler alloc];
    objc_msgSend_bindingForTarget_withKeyPath_(TMLBinding, v20, v21, a1, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend_initWithBlock_binding_(v19, v23, v24, v6, v22);

    v6 = (id)v15;
  }
  else
  {
    v25 = [TMLBlockSignalHandler alloc];
    v30 = (id)objc_msgSend_initWithBlock_(v25, v26, v27, v6);
  }

  objc_msgSend_setTMLHandler_forSignal_(a1, v28, v29, v30, v7);
}

id sub_22AD291D8(void *a1, uint64_t a2, void *a3, int a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  BOOL v15;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const char *v31;
  double v32;
  id v33;
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_opt_class();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_getAssociatedObject(v8, "mabscgoc");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v9, v10, v11, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend_superclass(v8, v13, v14);

      if (v12)
        v15 = 1;
      else
        v15 = v8 == 0;
    }
    while (!v15);
    if (v12)
      goto LABEL_12;
  }
  else
  {
    v12 = 0;
  }
  if (a4)
  {
    v17 = (void *)MEMORY[0x24BDBCE88];
    v18 = (void *)MEMORY[0x24BDD17C8];
    v19 = objc_opt_class();
    objc_msgSend_stringWithFormat_(v18, v20, v21, CFSTR("Attempt to call undeclared method %@ in class %@"), v6, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = CFSTR("identifier");
    objc_msgSend_tmlIdentifier(a1, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v25;
    v29 = &stru_24F505EA8;
    if (v25)
      v29 = (const __CFString *)v25;
    v35[0] = v29;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, v27, v35, &v34, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v17, v31, v32, CFSTR("TMLRuntimeException"), v22, v30);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v33);
  }
LABEL_12:

  return v12;
}

id sub_22AD2938C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  id v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  id v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  id v32;
  id v34;
  id v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_methodName(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v7;
  objc_msgSend_willEmitSignalOrMethod_withArguments_newArguments_(a1, v11, v12, v10, v7, &v35);
  v13 = v35;

  v36[0] = a1;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, v15, v36, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v16, v17, v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callWithArguments_(v6, v20, v21, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_convertTmlValue_(TMLJSEnvironment, v23, v24, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  v26 = v25;
  objc_msgSend_methodName(v6, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v26;
  objc_msgSend_didEmitSignalOrMethod_withArguments_returnValue_newReturnValue_(a1, v30, v31, v29, v13, v26, &v34);
  v32 = v34;

  return v32;
}

id sub_22AD2950C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  const char *v10;
  void *v11;
  double v12;
  id v13;
  char v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const char *v31;
  double v32;
  id v33;
  id v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_tmlGetMethod_throwIfMissing_(a1, v8, v9, v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend_tmlInvokeMethodCall_withArguments_(a1, v10, v12, v11, v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
    v14 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, v10, v12, v6, v7, &v34);
    v13 = v34;
    if ((v14 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x24BDBCE88];
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = objc_opt_class();
      objc_msgSend_stringWithFormat_(v18, v20, v21, CFSTR("Attempt to call undeclared method %@ in class %@"), v6, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("identifier");
      objc_msgSend_tmlIdentifier(a1, v23, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v25;
      v29 = &stru_24F505EA8;
      if (v25)
        v29 = (const __CFString *)v25;
      v36[0] = v29;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, v27, v36, &v35, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v17, v31, v32, CFSTR("TMLRuntimeException"), v22, v30);
      v33 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v33);
    }
  }
  v15 = v13;

  return v15;
}

id sub_22AD296B4(void *a1)
{
  return objc_getAssociatedObject(a1, "dpomabscgoc");
}

void sub_22AD296C0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_metaObjects(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v7)
  {
    objc_msgSend_arrayByAddingObject_(v7, v8, v9, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13[0] = v4;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v8, v9, v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  objc_setAssociatedObject(a1, "dpomabscgoc", v11, (void *)1);

}

id sub_22AD2978C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  id v12;
  id v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend_count(v3, v4, v5))
  {
    v8 = (void *)MEMORY[0x24BDBCEB8];
    v9 = objc_msgSend_count(v3, v6, v7);
    objc_msgSend_arrayWithCapacity_(v8, v10, v11, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v3;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, v15, &v26, v30, 16);
    if (v16)
    {
      v19 = v16;
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v13);
          objc_msgSend_object(*(void **)(*((_QWORD *)&v26 + 1) + 8 * v21), v17, v18, (_QWORD)v26);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend_addObject_(v12, v22, v24, v23);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, v18, &v26, v30, 16);
      }
      while (v19);
    }

  }
  else
  {
    v12 = v3;
  }

  return v12;
}

id sub_22AD298DC(void *a1, uint64_t a2, void *a3, int a4, int a5)
{
  id v8;
  char *v9;
  const char *v10;
  void *v11;
  double v12;
  BOOL v13;
  const char *v14;
  void *v15;
  double v16;
  BOOL v17;
  const char *v18;
  double v19;

  v8 = a3;
  if (a4)
    v9 = "bscgoc";
  else
    v9 = "abscgoc";
  objc_getAssociatedObject(a1, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v13 = 1;
  else
    v13 = a5 == 0;
  if (!v13)
  {
    objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x24BDD1650], v10, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, v9, v11, (void *)1);
  }
  objc_msgSend_objectForKey_(v11, v10, v12, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v17 = 1;
  else
    v17 = a5 == 0;
  if (!v17)
  {
    objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v14, v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v11, v18, v19, v15, v8);
  }

  return v15;
}

void sub_22AD299CC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  id v18;

  v4 = a3;
  objc_msgSend_signalName(v4, v5, v6);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_advice(v4, v7, v8);
  objc_msgSend_getAspectsForSignalName_advice_createStorageIfMissing_(a1, v10, v11, v18, v9, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v13, v14, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(v12, v16, v17, v15);
}

void sub_22AD29A64(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  void *v13;
  id v14;
  const char *v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  const char *v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_signalName(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_advice(v4, v8, v9);
  objc_msgSend_getAspectsForSignalName_advice_createStorageIfMissing_(a1, v11, v12, v7, v10, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v13;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, v16, &v29, v33, 16);
  v20 = v14;
  if (v17)
  {
    v21 = v17;
    v22 = *(_QWORD *)v30;
LABEL_3:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v22)
        objc_enumerationMutation(v14);
      v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v23);
      objc_msgSend_object(v24, v18, v19, (_QWORD)v29);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (v25 && v25 == v4)
        break;

      if (v21 == ++v23)
      {
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, v19, &v29, v33, 16);
        if (v21)
          goto LABEL_3;
        v20 = v14;
        goto LABEL_15;
      }
    }
    v20 = v24;

    if (!v20)
      goto LABEL_16;
    objc_msgSend_removeObject_(v14, v27, v28, v20);
  }
LABEL_15:

LABEL_16:
}

void sub_22AD29BDC(void *a1, uint64_t a2, void *a3, void *a4, id *a5)
{
  id v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  id v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  uint64_t v26;
  id v27;
  id v28;
  const char *v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend_getAspectsForSignalName_advice_createStorageIfMissing_(a1, v10, v11, v8, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strongObjectsArray_(a1, v13, v14, v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_shared(TMLAspectsRegistration, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v8;
  objc_msgSend_aspectsForObject_signalName_advice_(v18, v19, v20, a1, v8, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v21, v22, v23))
  {
    if (v15)
    {
      objc_msgSend_arrayByAddingObjectsFromArray_(v15, v24, v25, v21);
      v26 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v26;
    }
    else
    {
      v15 = v21;
    }
  }
  v27 = v9;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v28 = v15;
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, v30, &v40, v44, 16);
  v34 = v27;
  if (v31)
  {
    v35 = v31;
    v36 = *(_QWORD *)v41;
    v34 = v27;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v41 != v36)
          objc_enumerationMutation(v28);
        objc_msgSend_activateWithObject_arguments_returnValue_newArguments_newReturnValue_(*(void **)(*((_QWORD *)&v40 + 1) + 8 * v37), v32, v33, a1, v34, 0, a5, 0);
        if (a5)
        {
          v38 = *a5;

          v34 = v38;
        }
        ++v37;
      }
      while (v35 != v37);
      v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v32, v33, &v40, v44, 16);
    }
    while (v35);
  }

}

BOOL sub_22AD29DE0(void *a1, uint64_t a2, void *a3, void *a4, void *a5, id *a6)
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  id v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  uint64_t v29;
  id v30;
  id v31;
  const char *v32;
  double v33;
  uint64_t v34;
  const char *v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  id v41;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend_getAspectsForSignalName_advice_createStorageIfMissing_(a1, v13, v14, v10, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strongObjectsArray_(a1, v16, v17, v15);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_shared(TMLAspectsRegistration, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v10;
  objc_msgSend_aspectsForObject_signalName_advice_(v21, v22, v23, a1, v10, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v24;
  if (objc_msgSend_count(v24, v25, v26))
  {
    if (v18)
    {
      objc_msgSend_arrayByAddingObjectsFromArray_(v18, v27, v28, v24);
      v29 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v29;
    }
    else
    {
      v18 = v24;
    }
  }
  v30 = v12;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v31 = v18;
  v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, v33, &v46, v50, 16);
  v37 = v34;
  v45 = v30;
  if (v34)
  {
    v38 = *(_QWORD *)v47;
    v39 = v34;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v47 != v38)
          objc_enumerationMutation(v31);
        objc_msgSend_activateWithObject_arguments_returnValue_newArguments_newReturnValue_(*(void **)(*((_QWORD *)&v46 + 1) + 8 * i), v35, v36, a1, v11, v30, 0, a6);
        if (a6)
        {
          v41 = *a6;

          v30 = v41;
        }
      }
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v35, v36, &v46, v50, 16);
    }
    while (v39);
  }

  return v37 != 0;
}

id sub_22AD2A010(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v6 = a4;
  objc_msgSend_tmlGetMethod_(a1, v7, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlInvokeMethodCall_withArguments_(a1, v10, v11, v9, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t sub_22AD2A078(void *a1, const char *a2, double a3, uint64_t a4)
{
  return objc_msgSend_tmlGetMethod_throwIfMissing_(a1, a2, a3, a4, 1);
}

id sub_22AD2A080(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *v6;
  double v7;
  const char *v8;
  void *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  BOOL v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a3;
  objc_getAssociatedObject(a1, "sdpomabscgoc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v11 = objc_opt_class();
    if (!v11)
      goto LABEL_10;
    v14 = (void *)v11;
    do
    {
      objc_getAssociatedObject(v14, "sdpomabscgoc");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v15, v16, v17, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend_superclass(v14, v18, v19);

      if (v9)
        v20 = 1;
      else
        v20 = v14 == 0;
    }
    while (!v20);
    if (!v9)
    {
LABEL_10:
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_setObject_forKeyedSubscript_(v5, v12, v13, v9, v4);
  }
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v8, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v21)
    v22 = 0;
  else
    v22 = v9;
  v23 = v22;

  return v23;
}

uint64_t sub_22AD2A19C(void *a1, const char *a2, double a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, a2, a3, a4, a5, 0);
}

uint64_t sub_22AD2A1A4(void *a1, uint64_t a2, void *a3, void *a4, _QWORD *a5)
{
  id v8;
  id v9;
  const char *v10;
  double v11;
  id v12;
  const char *v13;
  double v14;
  const char *v15;
  void *v16;
  double v17;
  const char *v18;
  id v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  id v30;
  const char *v31;
  double v32;
  uint64_t v33;
  id v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v35 = v9;
  objc_msgSend_willEmitSignalOrMethod_withArguments_newArguments_(a1, v10, v11, v8, v9, &v35);
  v12 = v35;
  objc_msgSend_tmlSignalHandlerForSignal_(a1, v13, v14, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend_tmlParent(a1, v15, v17);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!v19)
      v19 = a1;
    v36[0] = v19;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v20, v36, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObjectsFromArray_(v21, v22, v23, v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_callWithArguments_(v16, v25, v26, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      objc_msgSend_value(v27, v28, v29);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      *a5 = v30;
      objc_msgSend_didEmitSignalOrMethod_withArguments_returnValue_newReturnValue_(a1, v31, v32, v8, v12, v30, a5);
    }
    else
    {
      objc_msgSend_didEmitSignalOrMethod_withArguments_returnValue_newReturnValue_(a1, v28, v29, v8, v12, 0, 0);
    }

    v33 = 1;
  }
  else
  {
    v33 = objc_msgSend_didEmitSignalOrMethod_withArguments_returnValue_newReturnValue_(a1, v15, v17, v8, v12, 0, a5);
  }

  return v33;
}

void sub_22AD2A358(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  id v7;

  v4 = a3;
  objc_getAssociatedObject(a1, "sdpomabscgoc");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v7, v5, v6, 0, v4);

}

BOOL sub_22AD2A3B0(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  void *v4;
  _BOOL8 v5;

  objc_msgSend_signal_forObject_(TMLRuntime, a2, a4, a3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

void sub_22AD2A480(uint64_t a1)
{
  id v1;
  const char *v2;
  double v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___TMLApplication;
  v1 = objc_msgSendSuper2(&v6, sel_allocWithZone_, 0);
  v4 = objc_msgSend_init(v1, v2, v3);
  v5 = (void *)qword_255B51A68;
  qword_255B51A68 = v4;

}

void sub_22AD2A510()
{
  void *v0;
  const char *v1;
  double v2;
  uint64_t v3;
  void *v4;
  size_t size;

  size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  v0 = malloc_type_malloc(size, 0xBE30D705uLL);
  sysctlbyname("hw.machine", v0, &size, 0, 0);
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v1, v2, v0, 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255B51A78;
  qword_255B51A78 = v3;

  free(v0);
}

void sub_22AD2A5F0(double a1, uint64_t a2, const char *a3)
{
  void *v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  uint64_t v20;
  void *v21;
  id v22;

  objc_msgSend_mainBundle(MEMORY[0x24BDD1488], a3, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_infoDictionary(v3, v4, v5);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v22, v6, v7, *MEMORY[0x24BDBD2A0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v22, v9, v10, CFSTR("CFBundleShortVersionString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x24BDD1798], v12, v13, CFSTR("^\\d+\\.\\d+"), 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_length(v11, v15, v16);
  v20 = objc_msgSend_numberOfMatchesInString_options_range_(v14, v18, v19, v11, 0, 0, v17);

  if (v20)
    v21 = v11;
  else
    v21 = v8;
  objc_storeStrong((id *)&qword_255B51A88, v21);

}

void sub_22AD2A784(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen(a83847776l8gakb);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, a83847776l8gakb, v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

id sub_22AD2A8BC(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  const char *v5;
  double v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BDB91E8];
  v3 = a2;
  v4 = [v2 alloc];
  v7 = (void *)objc_msgSend_initWithRecordName_(v4, v5, v6, v3);

  return v7;
}

id sub_22AD2A900(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  const char *v5;
  double v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BDB91D8];
  v3 = a2;
  v4 = [v2 alloc];
  v7 = (void *)objc_msgSend_initWithRecordType_(v4, v5, v6, v3);

  return v7;
}

id sub_22AD2A944(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x24BDB91D8];
  v5 = a3;
  v6 = a2;
  v7 = [v4 alloc];
  v10 = (void *)objc_msgSend_initWithRecordType_recordID_(v7, v8, v9, v6, v5);

  return v10;
}

id sub_22AD2A9A4(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BDB9218];
  v5 = a2;
  v6 = [v4 alloc];
  v9 = (void *)objc_msgSend_initWithRecord_action_(v6, v7, v8, v5, a3);

  return v9;
}

id sub_22AD2A9F8(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BDB9218];
  v5 = a2;
  v6 = [v4 alloc];
  v9 = (void *)objc_msgSend_initWithRecordID_action_(v6, v7, v8, v5, a3);

  return v9;
}

id sub_22AD2B3BC(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v9;
  const char *v10;

  v9 = objc_alloc(*(Class *)(a1 + 32));
  return (id)objc_msgSend_initWithDirectionalEdgeInsets_(v9, v10, a2, a3, a4, a5);
}

BOOL sub_22AD2B408(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;

  v4 = a3;
  objc_msgSend_directionalEdgeInsets(a2, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend_directionalEdgeInsets(v4, v15, v7);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v10 == v19;
  if (v8 != v17)
    v24 = 0;
  if (v14 != v23)
    v24 = 0;
  return v12 == v21 && v24;
}

id sub_22AD2B914(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  id v13;
  const char *v14;
  double v15;
  _QWORD v17[6];

  v13 = objc_alloc(*(Class *)(a1 + 32));
  *(double *)v17 = a2;
  *(double *)&v17[1] = a3;
  *(double *)&v17[2] = a4;
  *(double *)&v17[3] = a5;
  *(double *)&v17[4] = a6;
  *(double *)&v17[5] = a7;
  return (id)objc_msgSend_initWithAffineTransform_(v13, v14, v15, v17);
}

id sub_22AD2B978(uint64_t a1, CGFloat a2, CGFloat a3)
{
  id v5;
  const char *v6;
  double v7;
  CGAffineTransform v9;

  v5 = objc_alloc(*(Class *)(a1 + 32));
  CGAffineTransformMakeTranslation(&v9, a2, a3);
  return (id)objc_msgSend_initWithAffineTransform_(v5, v6, v7, &v9);
}

id sub_22AD2B9D0(uint64_t a1, CGFloat a2, CGFloat a3)
{
  id v5;
  const char *v6;
  double v7;
  CGAffineTransform v9;

  v5 = objc_alloc(*(Class *)(a1 + 32));
  CGAffineTransformMakeScale(&v9, a2, a3);
  return (id)objc_msgSend_initWithAffineTransform_(v5, v6, v7, &v9);
}

id sub_22AD2BA28(uint64_t a1, CGFloat a2)
{
  id v3;
  const char *v4;
  double v5;
  CGAffineTransform v7;

  v3 = objc_alloc(*(Class *)(a1 + 32));
  CGAffineTransformMakeRotation(&v7, a2);
  return (id)objc_msgSend_initWithAffineTransform_(v3, v4, v5, &v7);
}

id sub_22AD2BA78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  double v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  CGAffineTransform v15;
  CGAffineTransform t1;
  CGAffineTransform v17;

  v5 = a2;
  v6 = a3;
  v8 = objc_alloc(*(Class *)(a1 + 32));
  if (!v5)
  {
    v10 = 0.0;
    memset(&t1, 0, sizeof(t1));
    if (v6)
      goto LABEL_3;
LABEL_5:
    memset(&v15, 0, sizeof(v15));
    goto LABEL_6;
  }
  objc_msgSend_transform(v5, v7, v9);
  if (!v6)
    goto LABEL_5;
LABEL_3:
  objc_msgSend_transform(v6, v7, v10);
LABEL_6:
  CGAffineTransformConcat(&v17, &t1, &v15);
  v13 = (void *)objc_msgSend_initWithAffineTransform_(v8, v11, v12, &v17);

  return v13;
}

id sub_22AD2BB30(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  id v7;
  const char *v8;
  id v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v7 = a2;
  v9 = objc_alloc(*(Class *)(a1 + 32));
  if (v7)
    objc_msgSend_transform(v7, v8, v10);
  else
    memset(&v15, 0, sizeof(v15));
  CGAffineTransformTranslate(&v16, &v15, a3, a4);
  v13 = (void *)objc_msgSend_initWithAffineTransform_(v9, v11, v12, &v16);

  return v13;
}

id sub_22AD2BBC4(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  id v7;
  const char *v8;
  id v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v7 = a2;
  v9 = objc_alloc(*(Class *)(a1 + 32));
  if (v7)
    objc_msgSend_transform(v7, v8, v10);
  else
    memset(&v15, 0, sizeof(v15));
  CGAffineTransformScale(&v16, &v15, a3, a4);
  v13 = (void *)objc_msgSend_initWithAffineTransform_(v9, v11, v12, &v16);

  return v13;
}

id sub_22AD2BC58(uint64_t a1, void *a2, CGFloat a3)
{
  id v5;
  const char *v6;
  id v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v5 = a2;
  v7 = objc_alloc(*(Class *)(a1 + 32));
  if (v5)
    objc_msgSend_transform(v5, v6, v8);
  else
    memset(&v13, 0, sizeof(v13));
  CGAffineTransformRotate(&v14, &v13, a3);
  v11 = (void *)objc_msgSend_initWithAffineTransform_(v7, v9, v10, &v14);

  return v11;
}

id sub_22AD2BCE4(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  id v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  CGAffineTransform v11;
  CGAffineTransform v12;

  v3 = a2;
  v5 = objc_alloc(*(Class *)(a1 + 32));
  if (v3)
    objc_msgSend_transform(v3, v4, v6);
  else
    memset(&v11, 0, sizeof(v11));
  CGAffineTransformInvert(&v12, &v11);
  v9 = (void *)objc_msgSend_initWithAffineTransform_(v5, v7, v8, &v12);

  return v9;
}

BOOL sub_22AD2BD60(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  double v9;
  _BOOL8 v10;
  CGAffineTransform v12;
  CGAffineTransform t1;

  v4 = a2;
  v5 = a3;
  v8 = v5;
  if (!v4)
  {
    v9 = 0.0;
    memset(&t1, 0, sizeof(t1));
    if (v5)
      goto LABEL_3;
LABEL_5:
    memset(&v12, 0, sizeof(v12));
    goto LABEL_6;
  }
  objc_msgSend_transform(v4, v6, v7);
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend_transform(v8, v6, v9);
LABEL_6:
  v10 = CGAffineTransformEqualToTransform(&t1, &v12);

  return v10;
}

uint64_t sub_22AD2BE40(objc_class *a1)
{
  objc_method *InstanceMethod;
  objc_method *v3;
  void (*Implementation)(void);
  const char *TypeEncoding;
  void (*v6)(void);
  const char *v7;
  objc_method *v8;
  objc_method *v9;
  void (*v10)(void);
  const char *v11;
  void (*v12)(void);
  const char *v13;
  objc_method *v14;
  objc_method *v15;
  void (*v16)(void);
  const char *v17;
  void (*v18)(void);
  const char *v19;
  objc_method *v20;
  objc_method *v21;
  void (*v22)(void);
  const char *v23;
  void (*v24)(void);
  const char *v25;
  objc_method *v26;
  objc_method *v27;
  void (*v28)(void);
  const char *v29;
  void (*v30)(void);
  const char *v31;
  const char *v32;
  double v33;

  InstanceMethod = class_getInstanceMethod(a1, sel_didMoveToWindow);
  v3 = class_getInstanceMethod(a1, sel_tmlDidMoveToWindow);
  Implementation = method_getImplementation(v3);
  TypeEncoding = method_getTypeEncoding(v3);
  if (class_addMethod(a1, sel_didMoveToWindow, Implementation, TypeEncoding))
  {
    v6 = method_getImplementation(InstanceMethod);
    v7 = method_getTypeEncoding(InstanceMethod);
    class_replaceMethod(a1, sel_tmlDidMoveToWindow, v6, v7);
  }
  else
  {
    method_exchangeImplementations(InstanceMethod, v3);
  }
  v8 = class_getInstanceMethod(a1, sel_traitCollectionDidChange_);
  v9 = class_getInstanceMethod(a1, sel_tmlTraitCollectionDidChange_);
  v10 = method_getImplementation(v9);
  v11 = method_getTypeEncoding(v9);
  if (class_addMethod(a1, sel_traitCollectionDidChange_, v10, v11))
  {
    v12 = method_getImplementation(v8);
    v13 = method_getTypeEncoding(v8);
    class_replaceMethod(a1, sel_tmlTraitCollectionDidChange_, v12, v13);
  }
  else
  {
    method_exchangeImplementations(v8, v9);
  }
  v14 = class_getInstanceMethod(a1, sel_accessibilityActivate);
  v15 = class_getInstanceMethod(a1, sel_tmlAccessibilityActivate);
  v16 = method_getImplementation(v15);
  v17 = method_getTypeEncoding(v15);
  if (class_addMethod(a1, sel_accessibilityActivate, v16, v17))
  {
    v18 = method_getImplementation(v14);
    v19 = method_getTypeEncoding(v14);
    class_replaceMethod(a1, sel_tmlAccessibilityActivate, v18, v19);
  }
  else
  {
    method_exchangeImplementations(v14, v15);
  }
  v20 = class_getInstanceMethod(a1, sel_accessibilityDecrement);
  v21 = class_getInstanceMethod(a1, sel_tmlAccessibilityDecrement);
  v22 = method_getImplementation(v21);
  v23 = method_getTypeEncoding(v21);
  if (class_addMethod(a1, sel_accessibilityDecrement, v22, v23))
  {
    v24 = method_getImplementation(v20);
    v25 = method_getTypeEncoding(v20);
    class_replaceMethod(a1, sel_tmlAccessibilityDecrement, v24, v25);
  }
  else
  {
    method_exchangeImplementations(v20, v21);
  }
  v26 = class_getInstanceMethod(a1, sel_accessibilityIncrement);
  v27 = class_getInstanceMethod(a1, sel_tmlAccessibilityIncrement);
  v28 = method_getImplementation(v27);
  v29 = method_getTypeEncoding(v27);
  if (class_addMethod(a1, sel_accessibilityIncrement, v28, v29))
  {
    v30 = method_getImplementation(v26);
    v31 = method_getTypeEncoding(v26);
    class_replaceMethod(a1, sel_tmlAccessibilityIncrement, v30, v31);
  }
  else
  {
    method_exchangeImplementations(v26, v27);
  }
  return objc_msgSend_tmlLoadCategory(MEMORY[0x24BDF6AE8], v32, v33);
}

void sub_22AD2C140(void *a1, const char *a2, double a3)
{
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  id v16;

  objc_msgSend_tmlDidMoveToWindow(a1, a2, a3);
  objc_msgSend_window(a1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_emitTMLSignal_withArguments_(a1, v7, v8, CFSTR("didMoveToWindow"), 0);
    objc_msgSend_traitCollection(a1, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_traitEnvironment_willTransitionToTraitCollection_fromPreviousTraitCollection_(TMLUITraitCollection, v12, v13, a1, v11, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_emitTMLSignal_withArguments_(v16, v14, v15, CFSTR("enter"), 0);
  }
}

void sub_22AD2C200(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_tmlTraitCollectionDidChange_(a1, v5, v6, v4);
  objc_msgSend_traitCollection(a1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_traitEnvironment_willTransitionToTraitCollection_fromPreviousTraitCollection_(TMLUITraitCollection, v10, v11, a1, v9, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v20[0] = v4;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v13, v14, v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emitTMLSignal_withArguments_(a1, v16, v17, CFSTR("traitCollectionDidChange"), v15);

  }
  else
  {
    objc_msgSend_emitTMLSignal_withArguments_(a1, v13, v14, CFSTR("traitCollectionDidChange"), 0);
  }
  objc_msgSend_emitTMLSignal_withArguments_(v12, v18, v19, CFSTR("enter"), 0);

}

void sub_22AD2C314(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  const char *v16;
  double v17;
  void *v18;
  id v19;
  _QWORD v20[5];

  v4 = a3;
  objc_getAssociatedObject(a1, "scgoc");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsInArray_(v19, v5, v6, v4);
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v7, v8, CFSTR("superview == %@"), a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v19, v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeObjectsPerformSelector_(v12, v13, v14, sel_removeFromSuperview);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_22AD2C424;
  v20[3] = &unk_24F4FE0D8;
  v20[4] = a1;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v15, COERCE_DOUBLE(3221225472), v20);
  v18 = (void *)objc_msgSend_mutableCopy(v4, v16, v17);

  objc_setAssociatedObject(a1, "scgoc", v18, (void *)1);
}

uint64_t sub_22AD2C424(uint64_t a1, double a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_addSubview_, a2);
}

void sub_22AD2C430(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  id value;

  value = a3;
  objc_getAssociatedObject(a1, "cgoc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
    objc_msgSend_deactivateConstraints_(MEMORY[0x24BDD1628], v7, v8, v4);
  v9 = value;
  if (value)
  {
    objc_msgSend_activateConstraints_(MEMORY[0x24BDD1628], v7, v8, value);
    v9 = value;
  }
  objc_setAssociatedObject(a1, "cgoc", v9, (void *)3);

}

void sub_22AD2C4C8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *v6;
  double v7;
  id v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_getAssociatedObject(a1, "goc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v5, v6, v7))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = v5;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, v10, &v30, v35, 16);
    if (v11)
    {
      v14 = v11;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v8);
          objc_msgSend_removeLayoutGuide_(a1, v12, v13, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, v13, &v30, v35, 16);
      }
      while (v14);
    }

  }
  if (v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v4;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, v19, &v26, v34, 16);
    if (v20)
    {
      v23 = v20;
      v24 = *(_QWORD *)v27;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(v17);
          objc_msgSend_addLayoutGuide_(a1, v21, v22, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v25++), (_QWORD)v26);
        }
        while (v23 != v25);
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v21, v22, &v26, v34, 16);
      }
      while (v23);
    }

  }
  objc_setAssociatedObject(a1, "goc", v4, (void *)3);

}

void sub_22AD2C694(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = a3;
  objc_msgSend_gestureRecognizers(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend_mutableCopy(v7, v8, v9);

  objc_msgSend_removeObjectsInArray_(v17, v10, v11, v4);
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_22AD2C760;
  v19[3] = &unk_24F4FE100;
  v19[4] = a1;
  objc_msgSend_enumerateObjectsUsingBlock_(v17, v13, v14, v19);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = sub_22AD2C76C;
  v18[3] = &unk_24F4FE100;
  v18[4] = a1;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v15, v16, v18);

}

uint64_t sub_22AD2C760(uint64_t a1, double a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_removeGestureRecognizer_, a2);
}

uint64_t sub_22AD2C76C(uint64_t a1, double a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_addGestureRecognizer_, a2);
}

id sub_22AD2C778()
{
  void *v0;
  objc_class *v1;
  const char *Name;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  v0 = (void *)MEMORY[0x24BDD17C8];
  v1 = (objc_class *)objc_opt_class();
  Name = class_getName(v1);
  objc_msgSend_stringWithUTF8String_(v0, v3, v4, Name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_(v8, v9, v10, v5, CFSTR("tml"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_22AD2C7F4(void *a1, uint64_t a2, void *a3)
{
  objc_setAssociatedObject(a1, "oc", a3, (void *)3);
}

id sub_22AD2C804(void *a1)
{
  return objc_getAssociatedObject(a1, "oc");
}

id sub_22AD2C810(void *a1)
{
  return objc_getAssociatedObject(a1, "c");
}

void sub_22AD2C81C(void *a1, uint64_t a2, void *a3)
{
  void (**v4)(id, id);
  TMLContext *v5;
  TMLContext *v6;
  const char *v7;
  double v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  _QWORD v26[4];
  id v27;
  id location;
  _QWORD v29[4];
  TMLContext *v30;

  v4 = a3;
  objc_getAssociatedObject(a1, "c");
  v5 = (TMLContext *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc_init(TMLContext);
    objc_msgSend_tmlObjects(a1, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_22AD2CA0C;
    v29[3] = &unk_24F4FE128;
    v5 = v6;
    v30 = v5;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, v12, v29);

    objc_msgSend_tmlObjects(a1, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v16, v17, CFSTR("owner"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v19, v20, a1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_withIdentifier_(v5, v22, v23, v21, CFSTR("owner"));

    }
    objc_setAssociatedObject(a1, "c", v5, (void *)1);
    objc_initWeak(&location, v5);
    v26[0] = v10;
    v26[1] = 3221225472;
    v26[2] = sub_22AD2CA18;
    v26[3] = &unk_24F4FE150;
    objc_copyWeak(&v27, &location);
    objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v24, v25, v26, a1);
    v4[2](v4, v5);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
}

void sub_22AD2C9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_22AD2CA0C(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_addObject_withIdentifier_(*(void **)(a1 + 32), a2, a4, a3, a2);
}

void sub_22AD2CA18(uint64_t a1)
{
  const char *v1;
  double v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_dispose(WeakRetained, v1, v2);

}

void sub_22AD2CA44(void *a1)
{
  void *v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  objc_getAssociatedObject(a1, "c");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_msgSend_dispose(v2, v3, v4);
    objc_setAssociatedObject(a1, "c", 0, (void *)1);
    objc_msgSend_tmlDispose(a1, v5, v6);
    v2 = v7;
  }

}

void sub_22AD2CAA8(void *a1, const char *a2, double a3)
{
  const char *v4;
  double v5;
  id v6;

  objc_msgSend_tmlViewPath(a1, a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlLoadViewFromPath_(a1, v4, v5, v6);

}

void sub_22AD2CAE8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  id v7;
  const char *v8;
  double v9;
  _QWORD v10[4];
  id v11;
  void *v12;

  v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_22AD2CB6C;
  v10[3] = &unk_24F4FE178;
  v11 = v4;
  v12 = a1;
  v7 = v4;
  objc_msgSend__tmlEnsureContext_(a1, v8, v9, v10);

}

void sub_22AD2CB6C(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  char *v19;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend_loadSource_(v4, v5, v6, v3);
  objc_msgSend_rootObject(v4, v7, v8);
  v19 = (char *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isEqual_(v19, v9, v10, *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, v11, CFSTR("Expected to load own UIView for %@"), v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v12, v14, v15, CFSTR("TMLRuntimeException"), v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raiseException_(TMLExceptionHandler, v17, v18, v16);

  }
}

void sub_22AD2CC44(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  id v7;
  const char *v8;
  double v9;
  _QWORD v10[4];
  id v11;
  void *v12;

  v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_22AD2CCC8;
  v10[3] = &unk_24F4FE178;
  v11 = v4;
  v12 = a1;
  v7 = v4;
  objc_msgSend__tmlEnsureContext_(a1, v8, v9, v10);

}

void sub_22AD2CCC8(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  char *v19;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend_loadSourceFromPath_(v4, v5, v6, v3);
  objc_msgSend_rootObject(v4, v7, v8);
  v19 = (char *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isEqual_(v19, v9, v10, *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, v11, CFSTR("Expected to load own UIView for %@"), v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v12, v14, v15, CFSTR("TMLRuntimeException"), v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raiseException_(TMLExceptionHandler, v17, v18, v16);

  }
}

void sub_22AD2CDA0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  id v21;
  id v22;
  const char *v23;
  double v24;
  _QWORD v25[4];
  id v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCED8]);
  v8 = (void *)objc_msgSend_initWithCapacity_(v5, v6, v7, 8);
  objc_msgSend_tmlContext(a1, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = sub_22AD2CECC;
  v29[3] = &unk_24F4FE128;
  v16 = v8;
  v30 = v16;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v14, v17, v18, v29);

  objc_msgSend__tmlUnloadContext(a1, v19, v20);
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = sub_22AD2CF38;
  v25[3] = &unk_24F4FE1A0;
  v26 = v16;
  v27 = v4;
  v28 = a1;
  v21 = v4;
  v22 = v16;
  objc_msgSend__tmlEnsureContext_(a1, v23, v24, v25);

}

void sub_22AD2CECC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_setObject_forKey_(*(void **)(a1 + 32), v6, v7, v5, v8);

}

void sub_22AD2CF38(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = a2;
  v4 = (void *)a1[4];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_22AD2D05C;
  v24[3] = &unk_24F4FE128;
  v23 = v3;
  v25 = v23;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v5, v6, v24);
  objc_msgSend_loadSource_(v23, v7, v8, a1[5]);
  objc_msgSend_rootObject(v23, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v11, v12, v13, a1[6]) & 1) == 0)
  {
    v16 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v14, v15, CFSTR("Expected to load own UITableViewCell for %@"), v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v16, v18, v19, CFSTR("TMLRuntimeException"), v17, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raiseException_(TMLExceptionHandler, v21, v22, v20);

  }
}

uint64_t sub_22AD2D05C(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_addObject_withIdentifier_(*(void **)(a1 + 32), a2, a4, a3, a2);
}

id sub_22AD2D068(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  TMLContext *v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  id v28;
  const char *v29;
  _QWORD v31[4];
  id v32;
  id location;

  v3 = a3;
  v4 = objc_alloc_init(TMLContext);
  objc_msgSend_loadSourceFromPath_(v4, v5, v6, v3);
  objc_msgSend_rootObject(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v10, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tmlIdentifier(v9, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_withIdentifier_(v4, v16, v17, v12, v15);

    objc_setAssociatedObject(v9, "c", v4, (void *)1);
    objc_initWeak(&location, v4);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_22AD2D27C;
    v31[3] = &unk_24F4FE150;
    objc_copyWeak(&v32, &location);
    objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v18, v19, v31, v9);
    v20 = v9;
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, v11, CFSTR("Expected to load UIView for %@"), v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v21, v23, v24, CFSTR("TMLRuntimeException"), v22, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raiseException_(TMLExceptionHandler, v26, v27, v25);

    v28 = objc_alloc(MEMORY[0x24BDF6F90]);
    v20 = (id)objc_msgSend_initWithFrame_(v28, v29, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }

  return v20;
}

void sub_22AD2D260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22AD2D27C(uint64_t a1)
{
  const char *v1;
  double v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_disposeIfNecessary(WeakRetained, v1, v2);

}

uint64_t sub_22AD2D2A8(void *a1, const char *a2, double a3)
{
  int v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, a2, a3, CFSTR("accessibilityActivate"), 0, &v12);
  v5 = v12;
  v8 = v5;
  if (v4)
    v9 = objc_msgSend_BOOLValue(v5, v6, v7);
  else
    v9 = objc_msgSend_tmlAccessibilityActivate(a1, v6, v7);
  v10 = v9;

  return v10;
}

uint64_t sub_22AD2D320(void *a1, const char *a2, double a3)
{
  return objc_msgSend_emitTMLSignal_withArguments_(a1, a2, a3, CFSTR("accessibilityIncrement"), 0);
}

uint64_t sub_22AD2D330(void *a1, const char *a2, double a3)
{
  return objc_msgSend_emitTMLSignal_withArguments_(a1, a2, a3, CFSTR("accessibilityDecrement"), 0);
}

void sub_22AD2D340(objc_class *a1)
{
  objc_method *InstanceMethod;
  objc_method *v3;
  void (*Implementation)(void);
  const char *TypeEncoding;
  void (*v6)(void);
  const char *v7;

  InstanceMethod = class_getInstanceMethod(a1, sel_traitCollectionDidChange_);
  v3 = class_getInstanceMethod(a1, sel_tmlTraitCollectionDidChange_);
  Implementation = method_getImplementation(v3);
  TypeEncoding = method_getTypeEncoding(v3);
  if (class_addMethod(a1, sel_traitCollectionDidChange_, Implementation, TypeEncoding))
  {
    v6 = method_getImplementation(InstanceMethod);
    v7 = method_getTypeEncoding(InstanceMethod);
    class_replaceMethod(a1, sel_tmlTraitCollectionDidChange_, v6, v7);
  }
  else
  {
    method_exchangeImplementations(InstanceMethod, v3);
  }
}

void sub_22AD2D400(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  id v14;

  v4 = a3;
  objc_msgSend_tmlTraitCollectionDidChange_(a1, v5, v6, v4);
  objc_msgSend_traitCollection(a1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_traitEnvironment_willTransitionToTraitCollection_fromPreviousTraitCollection_(TMLUITraitCollection, v10, v11, a1, v9, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_emitTMLSignal_withArguments_(v14, v12, v13, CFSTR("enter"), 0);
}

void sub_22AD2D514(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  id v13;

  v2 = objc_alloc_init(MEMORY[0x24BDDA738]);
  v3 = (void *)qword_255B51AC0;
  qword_255B51AC0 = (uint64_t)v2;

  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v7 = objc_msgSend_initWithCapacity_(v4, v5, v6, 16);
  v8 = (void *)qword_255B51AD0;
  qword_255B51AD0 = v7;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v9, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v13, v11, v12, *(_QWORD *)(a1 + 32), sel_applicationDidReceiveMemoryWarningNotification_, *MEMORY[0x24BDF7538], 0);

}

void sub_22AD2D630(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x22AD2D61CLL);
}

uint64_t sub_22AD2D7AC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void sub_22AD2DC6C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  id v8;

  v3 = a3;
  objc_msgSend_validCurrentContext(TMLJSEnvironment, v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raiseJSException_(v8, v6, v7, v3);

}

uint64_t sub_22AD2DCBC(double a1, uint64_t a2, const char *a3)
{
  return objc_msgSend_unwrap_(TMLJSNil, a3, a1, a3);
}

uint64_t sub_22AD2DCCC(uint64_t a1, void *a2)
{
  const char *v2;
  id v3;
  double v4;
  const char *v5;
  id v6;
  double v7;
  uint64_t isNil;

  v3 = a2;
  if (v3)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v2, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v3)
      isNil = 1;
    else
      isNil = objc_msgSend_isNil_(TMLTypes, v5, v7, v3);

  }
  else
  {
    isNil = 1;
  }

  return isNil;
}

BOOL sub_22AD2DD44(uint64_t a1, void *a2)
{
  const char *v2;
  id v3;
  double v4;
  const char *v5;
  id v6;
  double v7;
  _BOOL8 v8;
  const char *v10;
  double v11;
  const char *v12;
  double v13;

  v3 = a2;
  if (v3)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v2, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v3
      || (objc_msgSend_isNil_(TMLTypes, v5, v7, v3) & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend_count(v3, v10, v11))
    {
      v8 = 1;
    }
    else
    {
      v8 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend_length(v3, v12, v13) == 0;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

id sub_22AD2DE08(double a1, uint64_t a2, const char *a3)
{
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_unwrap_(TMLJSNil, a3, a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sub_22AD2DEE8(v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9[0] = v3;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v4, v5, v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sub_22AD2DEE8(v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

id sub_22AD2DEE8(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v1 = a1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_22AD2F14C;
  v19 = sub_22AD2F15C;
  v20 = 0;
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v2, COERCE_DOUBLE(0x3032000000));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_22AD2F164;
  v11[3] = &unk_24F4FE380;
  v4 = v3;
  v12 = v4;
  v14 = &v15;
  v5 = v1;
  v13 = v5;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v5, v6, v7, 2, v11);
  v8 = (void *)v16[5];
  if (!v8)
    v8 = v5;
  v9 = v8;

  _Block_object_dispose(&v15, 8);
  return v9;
}

void sub_22AD2DFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_22AD2EB18(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  const char *v4;
  double v5;
  uint64_t v6;
  const char *v7;
  double v8;
  void *v9;
  id v10;
  const char *v11;
  double v12;
  _QWORD v14[4];
  id v15;

  v1 = (objc_class *)MEMORY[0x24BDBCEB8];
  v2 = a1;
  v3 = [v1 alloc];
  v6 = objc_msgSend_count(v2, v4, v5);
  v9 = (void *)objc_msgSend_initWithCapacity_(v3, v7, v8, v6);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_22AD2F104;
  v14[3] = &unk_24F4FE358;
  v10 = v9;
  v15 = v10;
  objc_msgSend_enumerateObjectsUsingBlock_(v2, v11, v12, v14);

  return v10;
}

id sub_22AD2EBBC(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  const char *v4;
  double v5;
  uint64_t v6;
  const char *v7;
  double v8;
  void *v9;
  id v10;
  const char *v11;
  double v12;
  _QWORD v14[4];
  id v15;

  v1 = (objc_class *)MEMORY[0x24BDBCED8];
  v2 = a1;
  v3 = [v1 alloc];
  v6 = objc_msgSend_count(v2, v4, v5);
  v9 = (void *)objc_msgSend_initWithCapacity_(v3, v7, v8, v6);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_22AD2F0A0;
  v14[3] = &unk_24F4FE330;
  v10 = v9;
  v15 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v2, v11, v12, v14);

  return v10;
}

id sub_22AD2EC6C(void *a1, uint64_t a2)
{
  const char *v3;
  id v4;
  double v5;
  id v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;

  v4 = a1;
  if (v4)
  {
    switch(a2)
    {
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 17:
      case 21:
      case 23:
      case 24:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_15;
        goto LABEL_4;
      case 15:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = objc_retainAutorelease(v4);
          objc_msgSend_CGColor(v4, v8, v9);
          v6 = (id)objc_claimAutoreleasedReturnValue();
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_4;
        v4 = objc_retainAutorelease(v4);
        objc_msgSend_CGImage(v4, v16, v17);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 19:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_15;
        goto LABEL_9;
      case 20:
        objc_msgSend_unwrap_(TMLJSNil, v3, v5, v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          sub_22AD2EBBC(v10);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }
        v4 = v10;
        goto LABEL_16;
      case 22:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_14;
        goto LABEL_15;
      default:
        if (objc_msgSend_isNil_(TMLJSNil, v3, v5, v4))
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v15);
          v6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            sub_22AD2EBBC(v4);
            v6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
LABEL_9:
              sub_22AD2EB18(v4);
              v6 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend_NSAttributedString(v4, v18, v19);
                v6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
LABEL_14:
                  objc_msgSend_UIFontValue(v4, v11, v12);
                  v6 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend_CGRectValue(v4, v20, v21);
                    v6 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend_CGPointValue(v4, v22, v23);
                      v6 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend_CGSizeValue(v4, v24, v25);
                        v6 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend_NSRangeValue(v4, v26, v27);
                          v6 = (id)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            objc_msgSend_UIEdgeInsetsValue(v4, v28, v29);
                            v6 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              objc_msgSend_NSDirectionalEdgeInsetsValue(v4, v30, v31);
                              v6 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                objc_msgSend_CGAffineTransformValue(v4, v32, v33);
                                v6 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  objc_msgSend_CATransform3DValue(v4, v34, v35);
                                  v6 = (id)objc_claimAutoreleasedReturnValue();
                                }
                                else
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    objc_msgSend_blockValue(v4, v36, v37);
                                    v6 = (id)objc_claimAutoreleasedReturnValue();
                                  }
                                  else
                                  {
LABEL_4:
                                    v6 = v4;
                                    v4 = v6;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        break;
    }
    v7 = v6;
  }
  else
  {
LABEL_15:
    v7 = 0;
  }
LABEL_16:

  return v7;
}

void sub_22AD2F0A0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const char *v6;
  double v7;
  id v8;

  v5 = a2;
  sub_22AD2EC6C(a3, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v6, v7, v8, v5);

}

void sub_22AD2F104(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  double v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  sub_22AD2EC6C(a2, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v2, v3, v4, v5);

}

uint64_t sub_22AD2F14C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22AD2F15C(uint64_t a1)
{

}

void sub_22AD2F164(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a2;
  if (*(id *)(a1 + 32) == v5)
  {
    v12 = v5;
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v8)
    {
      v9 = objc_msgSend_mutableCopy(*(void **)(a1 + 40), v6, v7);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend_removeObjectAtIndex_(v8, v6, v7, a3);
    v5 = v12;
  }

}

void sub_22AD2F6F0(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x22AD2F648);
  }
  JUMPOUT(0x22AD2F64CLL);
}

uint64_t sub_22AD2F738(uint64_t a1, const char *a2, unsigned int a3, uint64_t a4, double a5)
{
  uint64_t v5;
  const char *v9;
  double v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 16) != 18)
  {
    *(_DWORD *)(v5 + 96) = a4;
    if ((objc_msgSend_consumeToken_text_(*(void **)(a1 + 32), a2, a5, a3, a2) & 1) != 0)
      return 0;
    v12 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v12 + 160))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, v10, CFSTR("Unexpected token '%s' at line %d"), a2, a4);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 160);
      *(_QWORD *)(v14 + 160) = v13;

      v12 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v12 + 16) = 18;
  }
  return 1;
}

void sub_22AD2FA00(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22AD2FA20(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x22AD2F97CLL);
  }
  JUMPOUT(0x22AD2F980);
}

uint64_t sub_22AD2FA44(uint64_t a1, const char *a2, unsigned int a3, uint64_t a4, double a5)
{
  uint64_t v5;
  const char *v9;
  double v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 16) != 18)
  {
    *(_DWORD *)(v5 + 96) = a4;
    if ((objc_msgSend_consumeToken_text_(*(void **)(a1 + 32), a2, a5, a3, a2) & 1) != 0)
      return 0;
    v12 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v12 + 160))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, v10, CFSTR("Unexpected token '%s' at line %d"), a2, a4);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 160);
      *(_QWORD *)(v14 + 160) = v13;

      v12 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v12 + 16) = 18;
  }
  return 1;
}

void sub_22AD2FCC8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22AD2FCE8(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x22AD2FC30);
  }
  JUMPOUT(0x22AD2FC34);
}

uint64_t sub_22AD2FD0C(uint64_t a1, const char *a2, unsigned int a3, uint64_t a4, double a5)
{
  uint64_t v5;
  const char *v9;
  double v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 16) != 18)
  {
    *(_DWORD *)(v5 + 96) = a4;
    if ((objc_msgSend_consumeToken_text_(*(void **)(a1 + 32), a2, a5, a3, a2) & 1) != 0)
      return 0;
    v12 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v12 + 160))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, v10, CFSTR("Unexpected token '%s' at line %d"), a2, a4);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 160);
      *(_QWORD *)(v14 + 160) = v13;

      v12 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v12 + 16) = 18;
  }
  return 1;
}

void sub_22AD2FF7C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22AD2FF9C(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x22AD2FEF8);
  }
  JUMPOUT(0x22AD2FEFCLL);
}

uint64_t sub_22AD2FFBC(uint64_t a1, const char *a2, unsigned int a3, uint64_t a4, double a5)
{
  uint64_t v5;
  const char *v9;
  double v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 16) != 18)
  {
    *(_DWORD *)(v5 + 96) = a4;
    if ((objc_msgSend_consumeToken_text_(*(void **)(a1 + 32), a2, a5, a3, a2) & 1) != 0)
      return 0;
    v12 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v12 + 160))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, v10, CFSTR("Unexpected token '%s' at line %d"), a2, a4);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 160);
      *(_QWORD *)(v14 + 160) = v13;

      v12 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v12 + 16) = 18;
  }
  return 1;
}

void sub_22AD3018C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22AD301AC(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_begin_catch(exc_buf);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x22AD30140);
  }
  JUMPOUT(0x22AD30144);
}

void sub_22AD301EC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  const char *v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  double v13;
  id v14;
  const char *v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  id v31;

  v6 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 16) == 18)
  {
    *a4 = 1;
  }
  else
  {
    *(_DWORD *)(v9 + 96) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v10 = *(void **)(a1 + 32);
    v31 = v6;
    v11 = objc_msgSend_token(v6, v7, v8);
    objc_msgSend_text(v31, v12, v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend_cStringUsingEncoding_(v14, v15, v16, 4);
    LOBYTE(v10) = objc_msgSend_consumeToken_text_(v10, v18, v19, v11, v17);

    if ((v10 & 1) == 0)
    {
      v22 = *(_QWORD *)(a1 + 32);
      if (!*(_QWORD *)(v22 + 160))
      {
        v23 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_text(v31, v20, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v23, v25, v26, CFSTR("Unexpected token '%@' at line %u"), v24, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 32);
        v29 = *(void **)(v28 + 160);
        *(_QWORD *)(v28 + 160) = v27;

        v22 = *(_QWORD *)(a1 + 32);
      }
      *(_QWORD *)(v22 + 16) = 18;
      *a4 = 1;
    }
    v30 = objc_msgSend_token(v31, v20, v21) == 1;
    v6 = v31;
    if (v30)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

void sub_22AD31148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AD31160(uint64_t a1, void *a2, double a3)
{
  uint64_t result;

  result = objc_msgSend_token(a2, (const char *)a2, a3);
  if ((unint64_t)(result - 2) <= 5)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += qword_22AD835B8[result - 2];
  return result;
}

void sub_22AD31A60(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x24BDD1798], a3, a1, CFSTR("(^|(\\w+\\.)+)on([A-Z].*)"), 0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255B51AE0;
  qword_255B51AE0 = v3;

}

void sub_22AD31C20(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  id v11;

  v11 = a2;
  if (objc_msgSend_token(v11, v3, v4) == 19)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend_text(v11, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addImplements_(v7, v9, v10, v8);

  }
}

void sub_22AD322EC(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  void *v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  char isEqualToString;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a2;
  v8 = objc_msgSend_token(v22, v6, v7);
  if (v8 == 21)
  {
    objc_msgSend_text(v22, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v15, v16, v17, CFSTR(","));

    if ((isEqualToString & 1) != 0)
      goto LABEL_6;
LABEL_5:
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, v10, CFSTR("Malformed argument for pragma %@ at line %d"), a1[6], *(unsigned int *)(a1[5] + 96));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = a1[5];
    v21 = *(void **)(v20 + 160);
    *(_QWORD *)(v20 + 160) = v19;

    *a4 = 1;
    goto LABEL_6;
  }
  if (v8 != 19)
    goto LABEL_5;
  v11 = (void *)a1[4];
  objc_msgSend_text(v22, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v11, v13, v14, v12);

LABEL_6:
}

void sub_22AD323C8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  void *v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  char isEqualToString;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a2;
  v8 = objc_msgSend_token(v22, v6, v7);
  if (v8 == 21)
  {
    objc_msgSend_text(v22, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v15, v16, v17, CFSTR(","));

    if ((isEqualToString & 1) != 0)
      goto LABEL_6;
LABEL_5:
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, v10, CFSTR("Malformed argument for pragma %@ at line %d"), *(_QWORD *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 96));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 160);
    *(_QWORD *)(v20 + 160) = v19;

    *a4 = 1;
    goto LABEL_6;
  }
  if (v8 != 19)
    goto LABEL_5;
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend_text(v22, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addRequire_(v11, v13, v14, v12);

LABEL_6:
}

void sub_22AD324A8(uint64_t a1, void *a2, double a3)
{
  void *v3;
  const char *v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend_text(a2, (const char *)a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v3, v4, v5, v6);

}

void sub_22AD327F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_22AD32820(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  uint64_t v5;
  const char *v6;
  double v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  double v11;
  int isEqualToString;
  void *v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  double v25;
  id v26;

  v26 = a2;
  v5 = objc_msgSend_token(v26, v3, v4);
  switch(v5)
  {
    case 2:
      v8 = *(_QWORD *)(a1 + 56);
      goto LABEL_10;
    case 3:
      v19 = *(_QWORD *)(a1 + 56);
      goto LABEL_12;
    case 4:
    case 5:
      goto LABEL_14;
    case 6:
      v8 = *(_QWORD *)(a1 + 48);
LABEL_10:
      v20 = *(_QWORD *)(v8 + 8);
      v21 = *(_QWORD *)(v20 + 24) + 1;
      goto LABEL_13;
    case 7:
      v19 = *(_QWORD *)(a1 + 48);
LABEL_12:
      v20 = *(_QWORD *)(v19 + 8);
      v21 = *(_QWORD *)(v20 + 24) - 1;
LABEL_13:
      *(_QWORD *)(v20 + 24) = v21;
      goto LABEL_14;
    default:
      if (v5 != 21
        || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
        || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
        || (objc_msgSend_text(v26, v6, v7),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            isEqualToString = objc_msgSend_isEqualToString_(v9, v10, v11, CFSTR(",")),
            v9,
            !isEqualToString))
      {
LABEL_14:
        v22 = *(void **)(a1 + 32);
        objc_msgSend_text(v26, v6, v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v22, v24, v25, v23);

      }
      else
      {
        v13 = *(void **)(a1 + 40);
        v14 = (void *)objc_msgSend_copy(*(void **)(a1 + 32), v6, v7);
        objc_msgSend_addObject_(v13, v15, v16, v14);

        objc_msgSend_setString_(*(void **)(a1 + 32), v17, v18, &stru_24F505EA8);
      }

      return;
  }
}

void sub_22AD3295C(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a2;
  objc_msgSend_stringWithFormat_(v6, v8, v9, CFSTR("%%%u"), a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_length(*(void **)(a1 + 32), v10, v11);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v5, v13, v14, v15, v7, 2, 0, v12);

}

void sub_22AD33380(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_22AD333B4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;

  v7 = a2;
  v9 = v7;
  if (a3)
  {
    v15 = v7;
    if (objc_msgSend_token(v7, (const char *)v7, v8) == 2)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      v9 = v15;
LABEL_6:
      *a4 = 1;
      goto LABEL_7;
    }
    v12 = objc_msgSend_token(v15, v10, v11);
    v9 = v15;
    if (v12)
    {
      v14 = objc_msgSend_token(v15, (const char *)v15, v13);
      v9 = v15;
      if (v14 != 1)
        goto LABEL_6;
    }
  }
LABEL_7:

}

void sub_22AD3344C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  char isEqualToString;
  void *v22;
  void *v23;
  const char *v24;
  double v25;
  TMLJSScope *v26;
  uint64_t v27;
  TMLJSScope *v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  void *v39;
  void *v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  double v59;
  void *v60;
  uint64_t v61;
  const char *v62;
  double v63;
  const char *v64;
  double v65;
  void *v66;
  const char *v67;
  double v68;
  void *v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  const char *v74;
  double v75;
  void *v76;
  const char *v77;
  double v78;
  char v79;
  const char *v80;
  double v81;
  void *v82;
  const char *v83;
  double v84;
  const char *v85;
  double v86;
  const char *v87;
  double v88;
  void *v89;
  const char *v90;
  double v91;
  void *v92;
  const char *v93;
  double v94;
  const char *v95;
  double v96;
  void *v97;
  const char *v98;
  double v99;
  int v100;
  const char *v101;
  double v102;
  const char *v103;
  double v104;
  void *v105;
  const char *v106;
  double v107;
  uint64_t v108;
  const char *v109;
  double v110;
  void *v111;
  uint64_t v112;
  const char *v113;
  double v114;
  const char *v115;
  double v116;
  const char *v117;
  double v118;
  const char *v119;
  double v120;
  id v121;

  v121 = a2;
  switch(objc_msgSend_token(v121, v7, v8))
  {
    case 0:
      if (a3)
      {
        objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v9, v10, a3 - 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_text(v23, v24, v25);
        v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = 0;
      }
      if (!sub_22AD33964(v26))
        goto LABEL_48;
      v60 = *(void **)(a1 + 40);
      objc_msgSend_text(v121, v58, v59);
      v61 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    case 2:
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      if (!*(_BYTE *)(v27 + 24))
      {
        v28 = objc_alloc_init(TMLJSScope);
        objc_msgSend_setType_(v28, v29, v30, 0);
        objc_msgSend_addObject_(*(void **)(a1 + 64), v31, v32, v28);

        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      }
      *(_BYTE *)(v27 + 24) = 0;
      goto LABEL_12;
    case 3:
      objc_msgSend_lastObject(*(void **)(a1 + 64), v9, v10);
      v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeLastObject(*(void **)(a1 + 64), v33, v34);
      if (!v26 || objc_msgSend_type(v26, v35, v36) != 1)
        goto LABEL_40;
      v39 = *(void **)(a1 + 40);
      objc_msgSend_text(v121, v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v39, v41, v42, CFSTR("%@.bind(currentContext())"), v40);
      goto LABEL_28;
    case 6:
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      goto LABEL_41;
    case 7:
LABEL_12:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      goto LABEL_41;
    case 10:
    case 19:
      v11 = objc_msgSend_length(*(void **)(a1 + 48), v9, v10);
      v14 = objc_msgSend_token(v121, v12, v13);
      if (v11)
      {
        if (v14 != 10
          || a3 + 1 >= (unint64_t)objc_msgSend_count(*(void **)(a1 + 32), v9, v10)
          || (objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v9, v10, a3 + 1),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend_text(v15, v16, v17),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              isEqualToString = objc_msgSend_isEqualToString_(v18, v19, v20, CFSTR("$")),
              v18,
              v15,
              (isEqualToString & 1) == 0))
        {
          v22 = *(void **)(a1 + 48);
LABEL_47:
          objc_msgSend_text(v121, v9, v10);
          v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v22, v119, v120, v26);
          goto LABEL_48;
        }
LABEL_41:
        if (objc_msgSend_length(*(void **)(a1 + 48), v9, v10))
        {
          v105 = (void *)objc_msgSend_copy(*(void **)(a1 + 48), v9, v10);
          v108 = objc_msgSend_indexOfObject_(*(void **)(a1 + 72), v106, v107, v105);
          v111 = *(void **)(a1 + 40);
          if (v108 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v112 = objc_msgSend_count(*(void **)(a1 + 72), v109, v110);
            objc_msgSend_appendFormat_(v111, v113, v114, CFSTR("$(%u)"), v112);
            objc_msgSend_addObject_(*(void **)(a1 + 72), v115, v116, v105);
          }
          else
          {
            objc_msgSend_appendFormat_(v111, v109, v110, CFSTR("$(%u)"), v108);
          }
          objc_msgSend_setString_(*(void **)(a1 + 48), v117, v118, &stru_24F505EA8);

        }
        v22 = *(void **)(a1 + 40);
        goto LABEL_47;
      }
      if (v14 == 10)
        goto LABEL_41;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      {
        objc_msgSend_lastObject(*(void **)(a1 + 64), v9, v10);
        v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_text(v121, v54, v55);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addVar_(v26, v56, v57, v40);
LABEL_31:

LABEL_40:
        goto LABEL_41;
      }
      v66 = (void *)objc_opt_class();
      objc_msgSend_subarrayWithRange_(*(void **)(a1 + 32), v67, v68, 0, a3);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_previousNonSpaceToken_(v66, v70, v71, v69);
      v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_text(v121, v72, v73);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_text(v26, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend_isEqualToString_(CFSTR("var"), v77, v78, v76);

      if ((v79 & 1) != 0)
      {
        objc_msgSend_lastObject(*(void **)(a1 + 64), v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addVar_(v82, v83, v84, v40);

        goto LABEL_31;
      }
      if (!objc_msgSend_containsObject_(*(void **)(*(_QWORD *)(a1 + 56) + 128), v80, v81, v40)
        || objc_msgSend_token(v26, v85, v86) == 10
        || objc_msgSend_token(v121, v87, v88) == 10)
      {
        goto LABEL_37;
      }
      v89 = (void *)objc_opt_class();
      objc_msgSend_varsInCurrentScope_(v89, v90, v91, *(_QWORD *)(a1 + 64));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_containsObject_(v92, v93, v94, v40))
      {

LABEL_37:
LABEL_38:
        objc_msgSend_text(v121, v9, v10);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend_isEqualToString_(v97, v98, v99, CFSTR("function"));

        if (!v100)
          goto LABEL_41;
        v26 = objc_alloc_init(TMLJSScope);
        objc_msgSend_setType_(v26, v101, v102, 1);
        objc_msgSend_addObject_(*(void **)(a1 + 64), v103, v104, v26);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
        goto LABEL_40;
      }
      objc_msgSend_appendFormat_(*(void **)(a1 + 40), v95, v96, CFSTR("this.%@"), v40);

LABEL_28:
LABEL_48:

LABEL_49:
      return;
    case 15:
      if (objc_msgSend_length(*(void **)(a1 + 48), v9, v10))
      {
        v45 = (void *)MEMORY[0x24BDD17C8];
        v46 = *(_QWORD *)(a1 + 56);
        v47 = *(_QWORD *)(v46 + 24);
        objc_msgSend_type(*(void **)(v46 + 72), v43, v44);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v45, v49, v50, CFSTR("Invalid expression for '%@' of type %@ at line %d"), v47, v48, *(unsigned int *)(*(_QWORD *)(a1 + 56) + 96));
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = *(_QWORD *)(a1 + 56);
        v53 = *(void **)(v52 + 160);
        *(_QWORD *)(v52 + 160) = v51;

        *a4 = 1;
        goto LABEL_49;
      }
      v60 = *(void **)(a1 + 48);
      objc_msgSend_text(v121, v43, v44);
      v26 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringFromIndex_(v26, v64, v65, 1);
      v61 = objc_claimAutoreleasedReturnValue();
LABEL_27:
      v40 = (void *)v61;
      objc_msgSend_appendString_(v60, v62, v63, v61);
      goto LABEL_28;
    case 20:
      goto LABEL_38;
    default:
      goto LABEL_41;
  }
}

uint64_t sub_22AD33964(void *a1)
{
  uint64_t v1;
  const char *v2;
  id v3;
  double v4;
  uint64_t v5;

  v1 = qword_255B51B00;
  v3 = a1;
  if (v1 != -1)
    dispatch_once(&qword_255B51B00, &unk_24F4FE570);
  v5 = objc_msgSend_containsObject_((void *)qword_255B51AF8, v2, v4, v3);

  return v5;
}

unint64_t sub_22AD33E04(void *a1, unint64_t a2)
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;

  v3 = a1;
  if (objc_msgSend_count(v3, v4, v5) > a2)
  {
    v8 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v3, v6, v7, a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend_token(v9, v10, v11);

      if (v12 == 7)
      {
        if (!--v8)
          goto LABEL_10;
      }
      else if (v12 == 6)
      {
        ++v8;
      }
      ++a2;
    }
    while (a2 < objc_msgSend_count(v3, v13, v14));
  }
  a2 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:

  return a2;
}

void sub_22AD34F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_22AD34F64(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  void *v12;
  TMLJSScope *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  TMLJSScope *v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  void *v24;
  id v25;
  const char *v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  TMLJSScope *v34;
  const char *v35;
  double v36;
  void *v37;
  void *v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  char isEqualToString;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  double v59;
  void *v60;
  const char *v61;
  double v62;
  void *v63;
  const char *v64;
  double v65;
  int v66;
  const char *v67;
  double v68;
  const char *v69;
  double v70;
  void *v71;
  void *v72;
  const char *v73;
  double v74;
  void *v75;
  const char *v76;
  double v77;
  const char *v78;
  double v79;
  void *v80;
  const char *v81;
  double v82;
  void *v83;
  const char *v84;
  double v85;
  void *v86;
  const char *v87;
  double v88;
  const char *v89;
  double v90;
  const char *v91;
  double v92;
  void *v93;
  const char *v94;
  double v95;
  int v96;
  const char *v97;
  double v98;
  void *v99;
  const char *v100;
  double v101;
  const char *v102;
  double v103;
  void *v104;
  const char *v105;
  double v106;
  const char *v107;
  double v108;
  const char *v109;
  double v110;
  void *v111;
  const char *v112;
  double v113;
  void *v114;
  const char *v115;
  double v116;
  const char *v117;
  double v118;
  const char *v119;
  double v120;
  void *v121;
  const char *v122;
  double v123;
  int v124;
  const char *v125;
  double v126;
  const char *v127;
  double v128;
  void *v129;
  void *v130;
  const char *v131;
  double v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  switch(objc_msgSend_token(v7, v8, v9))
  {
    case 0:
    case 1:
    case 10:
      goto LABEL_2;
    case 2:
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      if (!*(_BYTE *)(v16 + 24))
      {
        v17 = objc_alloc_init(TMLJSScope);
        objc_msgSend_setType_(v17, v18, v19, 0);
        if (!objc_msgSend_count(*(void **)(a1 + 64), v20, v21))
        {
          v24 = *(void **)(a1 + 72);
          if (v24)
          {
            v135 = 0u;
            v136 = 0u;
            v133 = 0u;
            v134 = 0u;
            v25 = v24;
            v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, v27, &v133, v137, 16);
            if (v28)
            {
              v31 = v28;
              v32 = *(_QWORD *)v134;
              do
              {
                for (i = 0; i != v31; ++i)
                {
                  if (*(_QWORD *)v134 != v32)
                    objc_enumerationMutation(v25);
                  objc_msgSend_addVar_(v17, v29, v30, *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i));
                }
                v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v29, v30, &v133, v137, 16);
              }
              while (v31);
            }

          }
        }
        objc_msgSend_addObject_(*(void **)(a1 + 64), v22, v23, v17);

        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      }
      *(_BYTE *)(v16 + 24) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      goto LABEL_16;
    case 3:
      objc_msgSend_lastObject(*(void **)(a1 + 64), v10, v11);
      v34 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
      v13 = v34;
      if (v34
        && objc_msgSend_type(v34, v35, v36) == 1
        && (unint64_t)objc_msgSend_count(*(void **)(a1 + 64), v35, v36) >= 2)
      {
        v37 = *(void **)(a1 + 56);
        objc_msgSend_text(v7, v35, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v37, v39, v40, CFSTR("%@.bind(currentContext())"), v38);
      }
      else
      {
        v75 = *(void **)(a1 + 56);
        objc_msgSend_text(v7, v35, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v75, v76, v77, v38);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
      objc_msgSend_removeLastObject(*(void **)(a1 + 64), v78, v79);
      goto LABEL_37;
    case 6:
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)
        || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
      }
      goto LABEL_34;
    case 7:
LABEL_16:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
      goto LABEL_34;
    case 15:
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      {
        v80 = *(void **)(a1 + 32);
        objc_msgSend_text(v7, v10, v11);
        v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v80, v81, v82, v13);
        goto LABEL_42;
      }
      objc_msgSend_text(v7, v10, v11);
      v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v13, v41, v42, CFSTR("$")) & 1) != 0)
      {
LABEL_42:

        goto LABEL_2;
      }
      objc_msgSend_text(v7, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v45, v46, v47, CFSTR("$self"));

      if ((isEqualToString & 1) != 0)
      {
LABEL_2:
        v12 = *(void **)(a1 + 56);
        objc_msgSend_text(v7, v10, v11);
        v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v12, v14, v15, v13);
        goto LABEL_37;
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      {
        v49 = (void *)MEMORY[0x24BDD17C8];
        v50 = *(_QWORD *)(a1 + 40);
        v51 = *(_QWORD *)(v50 + 24);
        objc_msgSend_type(*(void **)(v50 + 72), v10, v11);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v49, v53, v54, CFSTR("Invalid expression for '%@' of type %@ at line %d"), v51, v52, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 96));
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = *(_QWORD *)(a1 + 40);
        v57 = *(void **)(v56 + 160);
        *(_QWORD *)(v56 + 160) = v55;

        *a4 = 1;
        goto LABEL_38;
      }
      v111 = (void *)objc_opt_class();
      objc_msgSend_subarrayWithRange_(*(void **)(a1 + 48), v112, v113, 0, a3);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_previousNonSpaceToken_(v111, v115, v116, v114);
      v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_text(v7, v117, v118);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_text(v13, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = objc_msgSend_isEqualToString_(CFSTR("var"), v122, v123, v121);

      if (v124)
        objc_msgSend_addObject_(*(void **)(a1 + 32), v125, v126, v60);
      if (objc_msgSend_containsObject_(*(void **)(a1 + 32), v125, v126, v60))
      {

        goto LABEL_42;
      }
      v129 = *(void **)(a1 + 56);
      objc_msgSend_substringFromIndex_(v60, v127, v128, 1);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v129, v131, v132, CFSTR("$$('%@')"), v130);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
LABEL_56:

LABEL_37:
LABEL_38:

      return;
    case 19:
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      {
        objc_msgSend_lastObject(*(void **)(a1 + 64), v10, v11);
        v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_text(v7, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addVar_(v13, v61, v62, v60);
        goto LABEL_30;
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      {
LABEL_34:
        v71 = *(void **)(a1 + 56);
        objc_msgSend_text(v7, v10, v11);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v71, v73, v74, v72);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
        goto LABEL_38;
      }
      v83 = (void *)objc_opt_class();
      objc_msgSend_subarrayWithRange_(*(void **)(a1 + 48), v84, v85, 0, a3);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_previousNonSpaceToken_(v83, v87, v88, v86);
      v13 = (TMLJSScope *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_text(v7, v89, v90);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_text(v13, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend_isEqualToString_(CFSTR("var"), v94, v95, v93);

      if (v96)
      {
        objc_msgSend_lastObject(*(void **)(a1 + 64), v97, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addVar_(v99, v100, v101, v60);
      }
      else
      {
        if (!objc_msgSend_containsObject_(*(void **)(*(_QWORD *)(a1 + 40) + 128), v97, v98, v60)
          || objc_msgSend_token(v13, v102, v103) == 10)
        {
LABEL_30:

LABEL_33:
          goto LABEL_34;
        }
        v104 = (void *)objc_opt_class();
        objc_msgSend_varsInCurrentScope_(v104, v105, v106, *(_QWORD *)(a1 + 64));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_containsObject_(v99, v107, v108, v60))
        {
          objc_msgSend_appendFormat_(*(void **)(a1 + 56), v109, v110, CFSTR("this.%@"), v60);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;

          goto LABEL_56;
        }
      }

      goto LABEL_30;
    case 20:
      objc_msgSend_text(v7, v10, v11);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend_isEqualToString_(v63, v64, v65, CFSTR("function"));

      if (!v66)
        goto LABEL_34;
      v13 = objc_alloc_init(TMLJSScope);
      objc_msgSend_setType_(v13, v67, v68, 1);
      objc_msgSend_addObject_(*(void **)(a1 + 64), v69, v70, v13);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
      goto LABEL_33;
    default:
      goto LABEL_34;
  }
}

void sub_22AD35798(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], a3, a1, CFSTR("Array"), CFSTR("Boolean"), CFSTR("Date"), CFSTR("Function"), CFSTR("Math"), CFSTR("Number"), CFSTR("Object"), CFSTR("RegExp"), CFSTR("String"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255B51AE8;
  qword_255B51AE8 = v3;

}

void sub_22AD3590C(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], a3, a1, CFSTR("return"), CFSTR("var"), CFSTR("new"), CFSTR("switch"), CFSTR("case"), CFSTR("throw"), CFSTR("let"), CFSTR("instanceof"), CFSTR("else"), CFSTR("in"), CFSTR("of"), CFSTR("const"), CFSTR("delete"), CFSTR("typeof"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255B51AF8;
  qword_255B51AF8 = v3;

}

const char *sub_22AD359CC()
{
  return "1.2.1";
}

uint64_t sub_22AD359D8()
{
  return 1002001;
}

char *sub_22AD359E4(uint64_t a1, size_t __n, void *__src)
{
  uint64_t v6;
  size_t v7;
  size_t v8;
  uint64_t (**v9)(int, size_t);
  char *result;
  char *v11;

  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = v6 + __n;
  if (v6 + __n <= v7)
  {
    v11 = *(char **)(a1 + 24);
LABEL_13:
    result = (char *)memcpy(&v11[v6], __src, __n);
    *(_QWORD *)(a1 + 16) = v8;
    return result;
  }
  do
    v7 *= 2;
  while (v7 < v8);
  if (*(_QWORD *)(a1 + 40))
    v9 = *(uint64_t (***)(int, size_t))(a1 + 40);
  else
    v9 = &off_255B50130;
  result = (char *)(*v9)((int)v9[2], v7);
  if (result)
  {
    v11 = result;
    memcpy(result, *(const void **)(a1 + 24), *(_QWORD *)(a1 + 16));
    if (*(_DWORD *)(a1 + 32))
    {
      if (*(_QWORD *)(a1 + 24))
        ((void (*)(uint64_t (*)(int, size_t)))v9[1])(v9[2]);
    }
    else
    {
      *(_DWORD *)(a1 + 32) = 1;
    }
    *(_QWORD *)(a1 + 24) = v11;
    *(_QWORD *)(a1 + 8) = v7;
    v6 = *(_QWORD *)(a1 + 16);
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_22AD35ABC(uint64_t a1)
{
  _DWORD *v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  unsigned int *v8;
  int v9;
  uint64_t v10;
  int v11;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  unsigned int v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  size_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v1 = *(_DWORD **)a1;
  if (**(_DWORD **)a1 != 682290937)
    sub_22AD7E104();
  if (v1[12])
  {
    v3 = 0;
    v4 = 0;
    while (1)
    {
      v5 = *((_QWORD *)v1 + 7);
      v6 = (_DWORD *)(v5 + 72 * v3);
      v7 = v6[5];
      v8 = (unsigned int *)(a1 + v6[6]);
      v9 = v6[3];
      if (v9 == 1)
      {
        if ((*(_BYTE *)(v5 + 72 * v3 + 48) & 4) != 0)
        {
          if (*(_DWORD *)(a1 + v7) != *(_DWORD *)(v5 + 72 * v3 + 8))
            goto LABEL_38;
          v24 = *(_DWORD *)(v5 + 72 * v3 + 16);
          if (v24 != 16 && v24 != 14)
            goto LABEL_6;
        }
        else
        {
          v11 = *(_DWORD *)(v5 + 72 * v3 + 16);
          if (v11 != 16 && v11 != 14)
          {
            if (!*(_DWORD *)(a1 + v7))
              goto LABEL_38;
            goto LABEL_6;
          }
        }
        if (!*(_QWORD *)v8 || *(_QWORD *)v8 == *(_QWORD *)(v5 + 72 * v3 + 40))
          goto LABEL_38;
      }
      else if (v9)
      {
        v13 = *(_QWORD *)(a1 + v7);
        if (v13)
        {
          v14 = *(_DWORD *)(v5 + 72 * v3 + 8);
          if (v14 >> 25)
            v15 = 5;
          else
            v15 = 4;
          if (v14 < 0x40000)
            v15 = 3;
          if (v14 < 0x800)
            v15 = 2;
          if (v14 >= 0x10)
            v16 = v15;
          else
            v16 = 1;
          v17 = v5 + 72 * v3;
          v19 = *(_DWORD *)(v17 + 48);
          v18 = (_DWORD *)(v17 + 48);
          v20 = v19 & 1;
          if ((v19 & 1) != 0)
            v21 = 1;
          else
            v21 = v13;
          v22 = *(_QWORD *)v8;
          switch(*(v18 - 8))
          {
            case 0:
            case 0xD:
              v26 = 0;
              v23 = 0;
              v27 = 1;
              do
              {
                v28 = *(_DWORD *)(v22 + 4 * v26);
                if ((v28 & 0x80000000) != 0)
                {
                  v29 = 10;
                }
                else if (v28 >= 0x80)
                {
                  if (v28 >= 0x4000)
                  {
                    if (v28 >> 28)
                      v30 = 5;
                    else
                      v30 = 4;
                    if (v28 >= 0x200000)
                      v29 = v30;
                    else
                      v29 = 3;
                  }
                  else
                  {
                    v29 = 2;
                  }
                }
                else
                {
                  v29 = 1;
                }
                v23 += v29;
                v26 = v27;
                v31 = v13 > v27++;
              }
              while (v31);
              break;
            case 1:
              v39 = 0;
              v23 = 0;
              v40 = 1;
              do
              {
                v41 = (2 * *(_DWORD *)(v22 + 4 * v39)) ^ (*(int *)(v22 + 4 * v39) >> 31);
                if (v41 >= 0x80)
                {
                  if (v41 >= 0x4000)
                  {
                    if (v41 >= 0x200000)
                    {
                      if (v41 >> 28)
                        v42 = 5;
                      else
                        v42 = 4;
                    }
                    else
                    {
                      v42 = 3;
                    }
                  }
                  else
                  {
                    v42 = 2;
                  }
                }
                else
                {
                  v42 = 1;
                }
                v23 += v42;
                v39 = v40;
                v31 = v13 > v40++;
              }
              while (v31);
              break;
            case 2:
            case 7:
            case 0xA:
              v23 = 4 * v13;
              break;
            case 3:
            case 8:
              v32 = 0;
              v23 = 0;
              v33 = 1;
              do
              {
                v34 = *(_QWORD *)(v22 + 8 * v32);
                if (HIDWORD(v34))
                {
                  if (v34 >> 35)
                  {
                    if (v34 >> 42)
                    {
                      v37 = v34 >> 49;
                      v38 = HIBYTE(v34);
                      if ((v34 & 0x8000000000000000) == 0)
                        v35 = 9;
                      else
                        v35 = 10;
                      if (!v38)
                        v35 = 8;
                      if (!v37)
                        v35 = 7;
                    }
                    else
                    {
                      v35 = 6;
                    }
                  }
                  else
                  {
                    v35 = 5;
                  }
                }
                else if (v34 >= 0x80)
                {
                  if (v34 >= 0x4000)
                  {
                    if (v34 >> 28)
                      v36 = 5;
                    else
                      v36 = 4;
                    if (v34 >= 0x200000)
                      v35 = v36;
                    else
                      v35 = 3;
                  }
                  else
                  {
                    v35 = 2;
                  }
                }
                else
                {
                  v35 = 1;
                }
                v23 += v35;
                v32 = v33;
                v31 = v13 > v33++;
              }
              while (v31);
              break;
            case 4:
              v43 = 0;
              v23 = 0;
              v44 = 1;
              do
              {
                v45 = (2 * *(_QWORD *)(v22 + 8 * v43)) ^ (*(uint64_t *)(v22 + 8 * v43) >> 63);
                if (HIDWORD(v45))
                {
                  if (v45 >> 35)
                  {
                    if (v45 >> 42)
                    {
                      if (v45 >> 49)
                      {
                        if (HIBYTE(v45))
                        {
                          if ((v45 & 0x8000000000000000) == 0)
                            v46 = 9;
                          else
                            v46 = 10;
                        }
                        else
                        {
                          v46 = 8;
                        }
                      }
                      else
                      {
                        v46 = 7;
                      }
                    }
                    else
                    {
                      v46 = 6;
                    }
                  }
                  else
                  {
                    v46 = 5;
                  }
                }
                else if (v45 >= 0x80)
                {
                  if (v45 >= 0x4000)
                  {
                    if (v45 >= 0x200000)
                    {
                      if (v45 >> 28)
                        v46 = 5;
                      else
                        v46 = 4;
                    }
                    else
                    {
                      v46 = 3;
                    }
                  }
                  else
                  {
                    v46 = 2;
                  }
                }
                else
                {
                  v46 = 1;
                }
                v23 += v46;
                v43 = v44;
                v31 = v13 > v44++;
              }
              while (v31);
              break;
            case 5:
            case 9:
            case 0xB:
              v23 = 8 * v13;
              break;
            case 6:
              v47 = 0;
              v23 = 0;
              v48 = 1;
              do
              {
                v49 = *(_DWORD *)(v22 + 4 * v47);
                if (v49 >= 0x80)
                {
                  if (v49 >= 0x4000)
                  {
                    if (v49 >> 28)
                      v51 = 5;
                    else
                      v51 = 4;
                    if (v49 >= 0x200000)
                      v50 = v51;
                    else
                      v50 = 3;
                  }
                  else
                  {
                    v50 = 2;
                  }
                }
                else
                {
                  v50 = 1;
                }
                v23 += v50;
                v47 = v48;
                v31 = v13 > v48++;
              }
              while (v31);
              break;
            case 0xC:
              v23 = v13;
              break;
            case 0xE:
              v75 = v20;
              v76 = v21;
              v78 = v16;
              v55 = 0;
              v23 = 0;
              v56 = 1;
              do
              {
                v57 = strlen(*(const char **)(v22 + 8 * v55));
                v58 = 4;
                if (v57 >> 28)
                  v58 = 5;
                if (v57 < 0x200000)
                  v58 = 3;
                if (v57 < 0x4000)
                  v58 = 2;
                if (v57 < 0x80)
                  v58 = 1;
                v23 += v57 + v58;
                v55 = v56;
                v31 = v13 > v56++;
              }
              while (v31);
              v21 = v76;
              v16 = v78;
              v20 = v75;
              break;
            case 0xF:
              v59 = 0;
              v23 = 0;
              v60 = 1;
              do
              {
                v61 = *(_QWORD *)(v22 + 16 * v59);
                if (v61 >> 28)
                  v62 = 5;
                else
                  v62 = 4;
                if (v61 < 0x200000)
                  v62 = 3;
                if (v61 < 0x4000)
                  v62 = 2;
                if (v61 < 0x80)
                  v62 = 1;
                v23 += v61 + v62;
                v59 = v60;
                v31 = v13 > v60++;
              }
              while (v31);
              break;
            case 0x10:
              v77 = v21;
              v79 = v16;
              v63 = 0;
              v23 = 0;
              v64 = 1;
              do
              {
                v65 = sub_22AD35ABC(*(_QWORD *)(v22 + 8 * v63));
                if (v65 >> 28)
                  v66 = 5;
                else
                  v66 = 4;
                if (v65 < 0x200000)
                  v66 = 3;
                if (v65 < 0x4000)
                  v66 = 2;
                if (v65 < 0x80)
                  v66 = 1;
                v23 += v65 + v66;
                v63 = v64;
                v31 = v13 > v64++;
              }
              while (v31);
              v20 = *v18 & 1;
              v21 = v77;
              v16 = v79;
              break;
            default:
              v23 = 0;
              break;
          }
          v52 = v21 * v16;
          if (v23 >> 28)
            v53 = 5;
          else
            v53 = 4;
          if (v23 < 0x200000)
            v53 = 3;
          if (v23 < 0x4000)
            v53 = 2;
          if (v23 < 0x80)
            v53 = 1;
          v54 = v53 + v52;
          if (v20)
            v52 = v54;
          v10 = v52 + v23;
          goto LABEL_143;
        }
LABEL_38:
        v10 = 0;
        goto LABEL_143;
      }
LABEL_6:
      v10 = sub_22AD36148((uint64_t)v6, v8);
LABEL_143:
      v4 += v10;
      ++v3;
      v1 = *(_DWORD **)a1;
      if (v3 >= *(unsigned int *)(*(_QWORD *)a1 + 48))
        goto LABEL_181;
    }
  }
  v4 = 0;
LABEL_181:
  v67 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v67)
  {
    v68 = (_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
    do
    {
      v69 = *((_DWORD *)v68 - 2);
      v71 = *v68;
      v68 += 3;
      v70 = v71;
      if (v69 >> 25)
        v72 = 5;
      else
        v72 = 4;
      if (v69 < 0x40000)
        v72 = 3;
      if (v69 < 0x800)
        v72 = 2;
      if (v69 >= 0x10)
        v73 = v72;
      else
        v73 = 1;
      v4 += v73 + v70;
      --v67;
    }
    while (v67);
  }
  return v4;
}

uint64_t sub_22AD36148(uint64_t a1, unsigned int *a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  const char *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  BOOL v30;

  v2 = *(_DWORD *)(a1 + 8);
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v2 >> 25)
    v5 = 5;
  if (v2 >= 0x40000)
    v4 = v5;
  if (v2 >= 0x800)
    v3 = v4;
  if (v2 >= 0x10)
    v6 = v3;
  else
    v6 = 1;
  switch(*(_DWORD *)(a1 + 16))
  {
    case 0:
    case 0xD:
      v8 = *a2;
      if ((*a2 & 0x80000000) == 0)
        goto LABEL_31;
      v9 = 10;
      return v9 + v6;
    case 1:
      v14 = (2 * *a2) ^ ((int)*a2 >> 31);
      if (v14 < 0x80)
        goto LABEL_32;
      if (v14 < 0x4000)
        goto LABEL_29;
      if (v14 < 0x200000)
        goto LABEL_80;
      v15 = v14 >> 28;
      goto LABEL_84;
    case 2:
    case 7:
    case 0xA:
      return v6 + 4;
    case 3:
    case 8:
      v10 = *(_QWORD *)a2;
      if (HIDWORD(*(_QWORD *)a2))
      {
        if (!(v10 >> 35))
          goto LABEL_71;
        v25 = v10 >> 42;
        v26 = v10 >> 49;
        v27 = HIBYTE(v10);
        v28 = (v10 & 0x8000000000000000) != 0;
        v9 = 9;
        if (v28)
          v9 = 10;
        if (!v27)
          v9 = 8;
        if (!v26)
          v9 = 7;
        if (!v25)
          v9 = 6;
      }
      else
      {
        if (v10 < 0x80)
          goto LABEL_32;
        v11 = 3;
        v12 = 4;
        if (v10 >> 28)
          v12 = 5;
        if (v10 >= 0x200000)
          v11 = v12;
        v13 = v10 >= 0x4000;
LABEL_38:
        if (v13)
          v9 = v11;
        else
          v9 = 2;
      }
      break;
    case 4:
      v16 = (2 * *(_QWORD *)a2) ^ (*(uint64_t *)a2 >> 63);
      if (HIDWORD(v16))
      {
        if (v16 >> 35)
        {
          if (v16 >> 42)
          {
            if (v16 >> 49)
            {
              if (HIBYTE(v16))
              {
                v28 = (v16 & 0x8000000000000000) != 0;
                v9 = 9;
                if (v28)
                  v9 = 10;
              }
              else
              {
                v9 = 8;
              }
            }
            else
            {
              v9 = 7;
            }
          }
          else
          {
            v9 = 6;
          }
        }
        else
        {
LABEL_71:
          v9 = 5;
        }
      }
      else if (v16 < 0x80)
      {
LABEL_32:
        v9 = 1;
      }
      else if (v16 >= 0x4000)
      {
        if (v16 >= 0x200000)
        {
          v15 = v16 >> 28;
LABEL_84:
          v30 = v15 == 0;
          v9 = 4;
          if (!v30)
            v9 = 5;
        }
        else
        {
LABEL_80:
          v9 = 3;
        }
      }
      else
      {
LABEL_29:
        v9 = 2;
      }
      break;
    case 5:
    case 9:
    case 0xB:
      return v6 | 8;
    case 6:
      v8 = *a2;
LABEL_31:
      if (v8 < 0x80)
        goto LABEL_32;
      v11 = 3;
      v17 = 4;
      if (v8 >> 28)
        v17 = 5;
      if (v8 >= 0x200000)
        v11 = v17;
      v13 = v8 >= 0x4000;
      goto LABEL_38;
    case 0xC:
      return v6 + 1;
    case 0xE:
      v18 = *(const char **)a2;
      if (!*(_QWORD *)a2)
        goto LABEL_56;
      v18 = (const char *)strlen(v18);
      goto LABEL_55;
    case 0xF:
      v19 = *(_QWORD *)a2;
      v20 = 1;
      v21 = 2;
      v22 = 3;
      v23 = 4;
      if (*(_QWORD *)a2 >> 28)
        v23 = 5;
      if (v19 >= 0x200000)
        v22 = v23;
      if (v19 >= 0x4000)
        v21 = v22;
      if (v19 >= 0x80)
        v20 = v21;
      return v19 + v6 + v20;
    case 0x10:
      v18 = *(const char **)a2;
      if (!*(_QWORD *)a2)
        goto LABEL_56;
      v18 = (const char *)sub_22AD35ABC();
LABEL_55:
      if (v18 >= 0x80)
      {
        if (v18 >= 0x4000)
        {
          v24 = 3;
          v29 = 4;
          if (v18 >> 28)
            v29 = 5;
          if (v18 >= 0x200000)
            v24 = v29;
        }
        else
        {
          v24 = 2;
        }
      }
      else
      {
LABEL_56:
        v24 = 1;
      }
      return (uint64_t)&v18[v6 + v24];
    default:
      sub_22AD7E12C();
  }
  return v9 + v6;
}

uint64_t sub_22AD36420(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t *v11;
  int v12;
  uint64_t v13;
  int v14;
  unint64_t v16;
  _BYTE *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  BOOL v22;
  int v23;
  uint64_t v25;
  int v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  uint64_t v31;
  _BYTE *v32;
  int v33;
  int v34;
  size_t v35;
  _BYTE *v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int16x8_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  uint64_t v60;
  _BYTE *v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  int v65;
  int v66;
  _BYTE *v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v75;
  int v76;

  v3 = *(_DWORD **)a1;
  if (**(_DWORD **)a1 != 682290937)
    sub_22AD7E1C8();
  v4 = a2;
  v5 = a1;
  if (v3[12])
  {
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *((_QWORD *)v3 + 7);
      v9 = (_DWORD *)(v8 + 72 * v6);
      v10 = v9[5];
      v11 = (unint64_t *)(v5 + v9[6]);
      v12 = v9[3];
      if (v12 == 1)
      {
        a3 = (_BYTE *)(v4 + v7);
        if ((*(_BYTE *)(v8 + 72 * v6 + 48) & 4) != 0)
        {
          if (*(_DWORD *)(v5 + v10) != *(_DWORD *)(v8 + 72 * v6 + 8))
            goto LABEL_33;
          v23 = *(_DWORD *)(v8 + 72 * v6 + 16);
          if (v23 != 16 && v23 != 14)
            goto LABEL_7;
        }
        else
        {
          v14 = *(_DWORD *)(v8 + 72 * v6 + 16);
          if (v14 != 16 && v14 != 14)
          {
            if (!*(_DWORD *)(v5 + v10))
              goto LABEL_33;
            goto LABEL_7;
          }
        }
        if (!*v11 || *v11 == *(_QWORD *)(v8 + 72 * v6 + 40))
          goto LABEL_33;
      }
      else
      {
        if (v12)
        {
          v16 = *(_QWORD *)(v5 + v10);
          v17 = (_BYTE *)(v4 + v7);
          v18 = (char *)*v11;
          if ((*(_BYTE *)(v8 + 72 * v6 + 48) & 1) != 0)
          {
            if (v16)
            {
              v25 = v8 + 72 * v6;
              a1 = sub_22AD39830(*(_DWORD *)(v25 + 8), (_BYTE *)(v4 + v7));
              *v17 |= 2u;
              v26 = *(_DWORD *)(v25 + 16);
              if ((v26 - 2) > 9)
                v27 = 1;
              else
                v27 = dword_22AD836E4[v26 - 2];
              v28 = v27 * v16;
              if (v28 >= 0x80)
              {
                if (v28 >= 0x4000)
                {
                  if (v28 >> 28)
                    v30 = 5;
                  else
                    v30 = 4;
                  if (v28 >= 0x200000)
                    v29 = v30;
                  else
                    v29 = 3;
                }
                else
                {
                  v29 = 2;
                }
              }
              else
              {
                v29 = 1;
              }
              v75 = a1;
              v31 = (v29 + a1);
              v32 = &v17[v31];
              v76 = v29;
              switch(v26)
              {
                case 0:
                case 13:
                  v37 = 0;
                  v38 = 1;
                  v36 = &v17[v31];
                  do
                  {
                    v39 = *(_DWORD *)&v18[4 * v37];
                    if ((v39 & 0x80000000) != 0)
                    {
                      v42 = vdupq_n_s32(v39);
                      *v36 = v39 | 0x80;
                      v43 = (int32x4_t)vshlq_u32((uint32x4_t)v42, (uint32x4_t)xmmword_22AD83810);
                      v44 = (int16x8_t)vshlq_s32(v42, (int32x4_t)xmmword_22AD83810);
                      v43.i32[3] = v44.i32[3];
                      v44.i64[0] = *(_QWORD *)&vmovn_s32(v43) | 0x80008000800080;
                      *(_DWORD *)(v36 + 1) = vmovn_s16(v44).u32[0];
                      *(_DWORD *)(v36 + 5) = -1;
                      v36[9] = 1;
                      v45 = 10;
                    }
                    else
                    {
                      if (v39 < 0x80)
                      {
                        v41 = 0;
                      }
                      else
                      {
                        *v36 = v39 | 0x80;
                        if (v39 < 0x4000)
                        {
                          v39 >>= 7;
                          v41 = 1;
                        }
                        else
                        {
                          v36[1] = (v39 >> 7) | 0x80;
                          if (v39 < 0x200000)
                          {
                            v39 >>= 14;
                            v41 = 2;
                          }
                          else
                          {
                            v36[2] = (v39 >> 14) | 0x80;
                            v40 = v39 >> 21;
                            v39 >>= 28;
                            if (v39)
                            {
                              v36[3] = v40 | 0x80;
                              v41 = 4;
                            }
                            else
                            {
                              LOBYTE(v39) = v40;
                              v41 = 3;
                            }
                          }
                        }
                      }
                      v45 = v41 + 1;
                      v36[v41] = v39;
                    }
                    v36 += v45;
                    v37 = v38;
                    v22 = v16 > v38++;
                  }
                  while (v22);
                  break;
                case 1:
                  v48 = 0;
                  v49 = 1;
                  v36 = &v17[v31];
                  do
                  {
                    v50 = (2 * *(_DWORD *)&v18[4 * v48]) ^ (*(int *)&v18[4 * v48] >> 31);
                    if (v50 < 0x80)
                    {
                      v52 = 0;
                    }
                    else
                    {
                      *v36 = v50 | 0x80;
                      if (v50 < 0x4000)
                      {
                        v50 >>= 7;
                        v52 = 1;
                      }
                      else
                      {
                        v36[1] = (v50 >> 7) | 0x80;
                        if (v50 < 0x200000)
                        {
                          v50 >>= 14;
                          v52 = 2;
                        }
                        else
                        {
                          v36[2] = (v50 >> 14) | 0x80;
                          v51 = v50 >> 21;
                          v50 >>= 28;
                          if (v50)
                          {
                            v36[3] = v51 | 0x80;
                            v52 = 4;
                          }
                          else
                          {
                            LOBYTE(v50) = v51;
                            v52 = 3;
                          }
                        }
                      }
                    }
                    v53 = &v36[v52];
                    *v53 = v50;
                    v36 = v53 + 1;
                    v48 = v49;
                    v22 = v16 > v49++;
                  }
                  while (v22);
                  break;
                case 2:
                case 7:
                case 10:
                  v33 = v29 + a1;
                  v34 = 4 * v16;
                  v35 = (4 * v16) & 0xFFFFFFFC;
                  goto LABEL_48;
                case 3:
                case 8:
                  v46 = 0;
                  v47 = 1;
                  v36 = &v17[v31];
                  do
                  {
                    a1 = sub_22AD398C4(*(_QWORD *)&v18[8 * v46], v36);
                    v36 += a1;
                    v46 = v47;
                    v22 = v16 > v47++;
                  }
                  while (v22);
                  break;
                case 4:
                  v54 = 0;
                  v55 = 1;
                  v36 = &v17[v31];
                  do
                  {
                    a1 = sub_22AD398C4((2 * *(_QWORD *)&v18[8 * v54]) ^ (*(uint64_t *)&v18[8 * v54] >> 63), v36);
                    v36 += a1;
                    v54 = v55;
                    v22 = v16 > v55++;
                  }
                  while (v22);
                  break;
                case 5:
                case 9:
                case 11:
                  v33 = v29 + a1;
                  v34 = 8 * v16;
                  v35 = (8 * v16) & 0xFFFFFFF8;
LABEL_48:
                  a1 = (uint64_t)memcpy(v32, v18, v35);
                  LODWORD(v36) = (_DWORD)v32 + v34;
                  LODWORD(v31) = v33;
                  break;
                case 6:
                  v56 = 0;
                  v57 = 1;
                  v36 = &v17[v31];
                  do
                  {
                    v58 = *(_DWORD *)&v18[4 * v56];
                    if (v58 < 0x80)
                    {
                      v60 = 0;
                    }
                    else
                    {
                      *v36 = v58 | 0x80;
                      if (v58 < 0x4000)
                      {
                        v58 >>= 7;
                        v60 = 1;
                      }
                      else
                      {
                        v36[1] = (v58 >> 7) | 0x80;
                        if (v58 < 0x200000)
                        {
                          v58 >>= 14;
                          v60 = 2;
                        }
                        else
                        {
                          v36[2] = (v58 >> 14) | 0x80;
                          v59 = v58 >> 21;
                          v58 >>= 28;
                          if (v58)
                          {
                            v36[3] = v59 | 0x80;
                            v60 = 4;
                          }
                          else
                          {
                            LOBYTE(v58) = v59;
                            v60 = 3;
                          }
                        }
                      }
                    }
                    v61 = &v36[v60];
                    *v61 = v58;
                    v36 = v61 + 1;
                    v56 = v57;
                    v22 = v16 > v57++;
                  }
                  while (v22);
                  break;
                case 12:
                  v62 = 0;
                  v63 = 0;
                  do
                  {
                    v32[v62++] = *(_DWORD *)&v18[4 * v63] != 0;
                    v63 = v62;
                  }
                  while (v16 > v62);
                  LODWORD(v36) = (_DWORD)v32 + v62;
                  break;
                default:
                  sub_22AD7E178();
              }
              v64 = (_DWORD)v36 - (_DWORD)v32;
              if (((_DWORD)v36 - (_DWORD)v32) >= 0x80)
              {
                v66 = v76;
                if (v64 >= 0x4000)
                {
                  if (v64 >> 28)
                    v65 = 5;
                  else
                    v65 = 4;
                  if (v64 < 0x200000)
                    v65 = 3;
                }
                else
                {
                  v65 = 2;
                }
              }
              else
              {
                v65 = 1;
                v66 = v76;
              }
              if (v66 != v65)
              {
                if (v66 + 1 != v65)
                  sub_22AD7E1A0();
                a1 = (uint64_t)memmove(v32 + 1, v32, ((_DWORD)v36 - (_DWORD)v32));
                LODWORD(v31) = v31 + 1;
              }
              v67 = &v17[v75];
              if (v64 < 0x80)
              {
                v69 = 0;
                LOBYTE(v68) = (_BYTE)v36 - (_BYTE)v32;
              }
              else
              {
                *v67 = v64 | 0x80;
                v68 = v64 >> 7;
                if (v64 < 0x4000)
                {
                  v69 = 1;
                }
                else
                {
                  v67[1] = v68 | 0x80;
                  v68 = v64 >> 14;
                  if (v64 < 0x200000)
                  {
                    v69 = 2;
                  }
                  else
                  {
                    v67[2] = v68 | 0x80;
                    v68 = v64 >> 21;
                    if (v64 >> 28)
                    {
                      v67[3] = v68 | 0x80;
                      v68 = v64 >> 28;
                      v69 = 4;
                    }
                    else
                    {
                      v69 = 3;
                    }
                  }
                }
              }
              v67[v69] = v68;
              v13 = v31 + v64;
              goto LABEL_119;
            }
          }
          else
          {
            v19 = *(int *)(v8 + 72 * v6 + 16);
            if (v19 >= 0x11)
              sub_22AD7E154(a1, (uint64_t)v11, (uint64_t)a3);
            if (v16)
            {
              v13 = 0;
              v20 = qword_22AD83710[v19];
              v21 = 1;
              do
              {
                a1 = sub_22AD36B20((uint64_t)v9, (unint64_t *)v18, &v17[v13]);
                v13 += a1;
                v18 += v20;
                v22 = v16 > v21++;
              }
              while (v22);
              goto LABEL_119;
            }
          }
LABEL_33:
          v13 = 0;
          goto LABEL_119;
        }
        a3 = (_BYTE *)(v4 + v7);
      }
LABEL_7:
      a1 = sub_22AD36B20((uint64_t)v9, v11, a3);
      v13 = a1;
LABEL_119:
      v7 += v13;
      ++v6;
      v3 = *(_DWORD **)v5;
      v4 = a2;
      if (v6 >= *(unsigned int *)(*(_QWORD *)v5 + 48))
        goto LABEL_122;
    }
  }
  v7 = 0;
LABEL_122:
  if (*(_DWORD *)(v5 + 8))
  {
    v70 = 0;
    v71 = 0;
    do
    {
      v72 = *(_QWORD *)(v5 + 16) + v70;
      v73 = sub_22AD39830(*(_DWORD *)v72, (_BYTE *)(v4 + v7));
      *(_BYTE *)(v4 + v7) |= *(_BYTE *)(v72 + 4);
      memcpy((void *)(v4 + v7 + v73), *(const void **)(v72 + 16), *(_QWORD *)(v72 + 8));
      v7 += v73 + *(_QWORD *)(v72 + 8);
      ++v71;
      v70 += 24;
    }
    while (v71 < *(unsigned int *)(v5 + 8));
  }
  return v7;
}

uint64_t sub_22AD36B20(uint64_t a1, unint64_t *a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _BYTE *v10;
  int32x4_t v11;
  int32x4_t v12;
  int16x8_t v13;
  unint64_t v14;
  _BYTE *v15;
  unsigned int v16;
  unsigned int v17;
  const char *v18;
  _BYTE *v19;
  size_t v20;
  size_t v21;
  unsigned int v22;
  unsigned int v23;
  _BYTE *v24;
  size_t v25;
  unint64_t v26;
  unsigned int v27;
  size_t v28;
  size_t v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v6 = sub_22AD39830(*(_DWORD *)(a1 + 8), a3);
  v7 = v6;
  switch(*(_DWORD *)(a1 + 16))
  {
    case 0:
    case 0xD:
      v9 = *(_DWORD *)a2;
      v10 = &a3[v6];
      if ((*(_DWORD *)a2 & 0x80000000) == 0)
        goto LABEL_11;
      *v10 = v9 | 0x80;
      v11 = vdupq_n_s32(v9);
      v12 = (int32x4_t)vshlq_u32((uint32x4_t)v11, (uint32x4_t)xmmword_22AD83810);
      v13 = (int16x8_t)vshlq_s32(v11, (int32x4_t)xmmword_22AD83810);
      v12.i32[3] = v13.i32[3];
      v13.i64[0] = *(_QWORD *)&vmovn_s32(v12) | 0x80008000800080;
      *(_DWORD *)(v10 + 1) = vmovn_s16(v13).u32[0];
      *(_DWORD *)(v10 + 5) = -1;
      v10[9] = 1;
      v8 = 10;
      return v8 + v7;
    case 1:
      v10 = &a3[v6];
      v9 = (2 * *(_DWORD *)a2) ^ (*(int *)a2 >> 31);
      goto LABEL_11;
    case 2:
    case 7:
    case 0xA:
      *a3 |= 5u;
      *(_DWORD *)&a3[v6] = *(_DWORD *)a2;
      v8 = 4;
      return v8 + v7;
    case 3:
    case 8:
      v14 = *a2;
      v15 = &a3[v7];
      goto LABEL_9;
    case 4:
      v15 = &a3[v6];
      v14 = (2 * *a2) ^ ((uint64_t)*a2 >> 63);
LABEL_9:
      v8 = sub_22AD398C4(v14, v15);
      return v8 + v7;
    case 5:
    case 9:
    case 0xB:
      *a3 |= 1u;
      *(_QWORD *)&a3[v6] = *a2;
      v8 = 8;
      return v8 + v7;
    case 6:
      v9 = *(_DWORD *)a2;
      v10 = &a3[v6];
LABEL_11:
      if (v9 < 0x80)
      {
        v17 = 0;
      }
      else
      {
        *v10 = v9 | 0x80;
        v16 = v9 >> 7;
        if (v9 < 0x4000)
        {
          v17 = 1;
        }
        else
        {
          v10[1] = v16 | 0x80;
          v16 = v9 >> 14;
          if (v9 < 0x200000)
          {
            v17 = 2;
          }
          else
          {
            v10[2] = v16 | 0x80;
            v16 = v9 >> 21;
            v9 >>= 28;
            if (v9)
            {
              v10[3] = v16 | 0x80;
              v17 = 4;
              goto LABEL_51;
            }
            v17 = 3;
          }
        }
        LOBYTE(v9) = v16;
      }
LABEL_51:
      v8 = v17 + 1;
      v10[v17] = v9;
      return v8 + v7;
    case 0xC:
      a3[v6] = *(_DWORD *)a2 != 0;
      goto LABEL_34;
    case 0xE:
      *a3 |= 2u;
      v18 = (const char *)*a2;
      v19 = &a3[v6];
      if (!v18)
        goto LABEL_33;
      v20 = strlen(v18);
      v21 = v20;
      if (v20 < 0x80)
      {
        v23 = 0;
        LOBYTE(v22) = v20;
      }
      else
      {
        *v19 = v20 | 0x80;
        v22 = v20 >> 7;
        if (v20 < 0x4000)
        {
          v23 = 1;
        }
        else
        {
          v19[1] = v22 | 0x80;
          v22 = v20 >> 14;
          if (v20 < 0x200000)
          {
            v23 = 2;
          }
          else
          {
            v19[2] = v22 | 0x80;
            v22 = v20 >> 21;
            if (v20 >> 28)
            {
              v19[3] = v22 | 0x80;
              v23 = 4;
              v22 = v20 >> 28;
            }
            else
            {
              v23 = 3;
            }
          }
        }
      }
      v37 = v23 + 1;
      v19[v23] = v22;
      memcpy(&v19[v37], v18, v20);
      v8 = v21 + v37;
      return v8 + v7;
    case 0xF:
      *a3 |= 2u;
      v24 = &a3[v6];
      v25 = *a2;
      if (*a2 < 0x80)
      {
        v27 = 0;
        v26 = *a2;
      }
      else
      {
        *v24 = v25 | 0x80;
        LODWORD(v26) = v25 >> 7;
        if (v25 < 0x4000)
        {
          v27 = 1;
        }
        else
        {
          v24[1] = v26 | 0x80;
          LODWORD(v26) = v25 >> 14;
          if (v25 < 0x200000)
          {
            v27 = 2;
          }
          else
          {
            v24[2] = v26 | 0x80;
            LODWORD(v26) = v25 >> 21;
            if (v25 >> 28)
            {
              v24[3] = v26 | 0x80;
              v27 = 4;
              LODWORD(v26) = v25 >> 28;
            }
            else
            {
              v27 = 3;
            }
          }
        }
      }
      v36 = v27 + 1;
      v24[v27] = v26;
      memcpy(&v24[v36], (const void *)a2[1], v25);
      v8 = v25 + v36;
      return v8 + v7;
    case 0x10:
      *a3 |= 2u;
      v19 = &a3[v6];
      if (*a2)
      {
        v28 = sub_22AD36420(*a2, v19 + 1);
        v29 = v28;
        if (v28 >= 0x80)
        {
          v32 = 2;
          v33 = 3;
          v34 = v28 >> 28;
          v35 = 4;
          if (v28 >> 28)
            v35 = 5;
          if (v28 >= 0x200000)
            v33 = v35;
          if (v28 >= 0x4000)
            v32 = v33;
          memmove(&v19[v32], v19 + 1, v28);
          *v19 = v29 | 0x80;
          v31 = v29 >> 7;
          if (v29 < 0x4000)
          {
            v30 = 1;
          }
          else
          {
            v19[1] = v31 | 0x80;
            v31 = v29 >> 14;
            if (v29 < 0x200000)
            {
              v30 = 2;
            }
            else
            {
              v19[2] = v31 | 0x80;
              v31 = v29 >> 21;
              if (v34)
              {
                v19[3] = v31 | 0x80;
                v30 = 4;
                v31 = v29 >> 28;
              }
              else
              {
                v30 = 3;
              }
            }
          }
        }
        else
        {
          v30 = 0;
          LOBYTE(v31) = v28;
        }
        v19[v30] = v31;
        v8 = v29 + v30 + 1;
      }
      else
      {
LABEL_33:
        *v19 = 0;
LABEL_34:
        v8 = 1;
      }
      return v8 + v7;
    default:
      sub_22AD7E1F0();
  }
}

uint64_t sub_22AD36F48(_QWORD *a1, void (**a2)(_QWORD, uint64_t, _BYTE *), uint64_t a3)
{
  _DWORD *v3;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v16;
  unint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  _DWORD *v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int *v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  int v33;
  unint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  int v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  int *v43;
  uint64_t v44;
  int v45;
  unsigned int v46;
  int v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  int v52;
  unsigned int *v53;
  uint64_t v54;
  unsigned int v55;
  unsigned int v56;
  int v57;
  int v58;
  _BYTE *v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  uint64_t v68;
  int32x4_t v69;
  int32x4_t v70;
  int16x8_t v71;
  uint64_t v72;
  unint64_t v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE v94[20];
  char v95;
  unsigned __int32 v96;
  int v97;
  char v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v3 = (_DWORD *)*a1;
  if (*(_DWORD *)*a1 != 682290937)
    sub_22AD7E290();
  v5 = a1;
  if (v3[12])
  {
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *((_QWORD *)v3 + 7);
      v9 = (_DWORD *)(v8 + 72 * v6);
      v10 = v9[5];
      v11 = (_QWORD *)((char *)v5 + v9[6]);
      v12 = v9[3];
      if (v12 == 1)
      {
        if ((*(_BYTE *)(v8 + 72 * v6 + 48) & 4) != 0)
        {
          if (*(_DWORD *)((char *)v5 + v10) != *(_DWORD *)(v8 + 72 * v6 + 8))
            goto LABEL_28;
          v20 = *(_DWORD *)(v8 + 72 * v6 + 16);
          if (v20 != 16 && v20 != 14)
            goto LABEL_6;
        }
        else
        {
          v14 = *(_DWORD *)(v8 + 72 * v6 + 16);
          if (v14 != 16 && v14 != 14)
          {
            if (!*(_DWORD *)((char *)v5 + v10))
              goto LABEL_28;
            goto LABEL_6;
          }
        }
        if (!*v11 || *v11 == *(_QWORD *)(v8 + 72 * v6 + 40))
          goto LABEL_28;
      }
      else if (v12)
      {
        v16 = *(_QWORD *)((char *)v5 + v10);
        if ((_DWORD)v16)
        {
          v17 = (unint64_t *)*v11;
          if ((*(_BYTE *)(v8 + 72 * v6 + 48) & 1) != 0)
          {
            v22 = v8 + 72 * v6;
            v23 = sub_22AD39830(*(_DWORD *)(v22 + 8), v94);
            v25 = *(_DWORD *)(v22 + 16);
            v24 = (_DWORD *)(v22 + 16);
            v26 = v16;
            v27 = v16;
            switch(v25)
            {
              case 0:
              case 13:
                v27 = 0;
                v28 = (unsigned int *)v17;
                v29 = v16;
                do
                {
                  v31 = *v28++;
                  v30 = v31;
                  if ((v31 & 0x80000000) != 0)
                  {
                    v32 = 10;
                  }
                  else if (v30 >= 0x80)
                  {
                    if (v30 >> 28)
                      v33 = 5;
                    else
                      v33 = 4;
                    if (v30 < 0x200000)
                      v33 = 3;
                    if (v30 >= 0x4000)
                      v32 = v33;
                    else
                      v32 = 2;
                  }
                  else
                  {
                    v32 = 1;
                  }
                  v27 += v32;
                  --v29;
                }
                while (v29);
                break;
              case 1:
                v27 = 0;
                v43 = (int *)v17;
                v44 = v16;
                do
                {
                  v45 = *v43++;
                  v46 = (2 * v45) ^ (v45 >> 31);
                  if (v46 >= 0x80)
                  {
                    if (v46 >= 0x4000)
                    {
                      if (v46 >= 0x200000)
                      {
                        if (v46 >> 28)
                          v47 = 5;
                        else
                          v47 = 4;
                      }
                      else
                      {
                        v47 = 3;
                      }
                    }
                    else
                    {
                      v47 = 2;
                    }
                  }
                  else
                  {
                    v47 = 1;
                  }
                  v27 += v47;
                  --v44;
                }
                while (v44);
                break;
              case 2:
              case 7:
              case 10:
                v27 = 4 * v16;
                break;
              case 3:
              case 8:
                v27 = 0;
                v34 = v17;
                v35 = v16;
                do
                {
                  v37 = *v34++;
                  v36 = v37;
                  if (HIDWORD(v37))
                  {
                    if (v36 >> 35)
                    {
                      v40 = v36 >> 42;
                      v41 = v36 >> 49;
                      v42 = HIBYTE(v36);
                      if ((v36 & 0x8000000000000000) == 0)
                        v38 = 9;
                      else
                        v38 = 10;
                      if (!v42)
                        v38 = 8;
                      if (!v41)
                        v38 = 7;
                      if (!v40)
                        v38 = 6;
                    }
                    else
                    {
                      v38 = 5;
                    }
                  }
                  else if (v36 >= 0x80)
                  {
                    if (v36 >> 28)
                      v39 = 5;
                    else
                      v39 = 4;
                    if (v36 < 0x200000)
                      v39 = 3;
                    if (v36 >= 0x4000)
                      v38 = v39;
                    else
                      v38 = 2;
                  }
                  else
                  {
                    v38 = 1;
                  }
                  v27 += v38;
                  --v35;
                }
                while (v35);
                break;
              case 4:
                v27 = 0;
                v48 = (uint64_t *)v17;
                v49 = v16;
                do
                {
                  v50 = *v48++;
                  v51 = (2 * v50) ^ (v50 >> 63);
                  if (HIDWORD(v51))
                  {
                    if (v51 >> 35)
                    {
                      if (v51 >> 42)
                      {
                        if (v51 >> 49)
                        {
                          if (HIBYTE(v51))
                          {
                            if ((v51 & 0x8000000000000000) == 0)
                              v52 = 9;
                            else
                              v52 = 10;
                          }
                          else
                          {
                            v52 = 8;
                          }
                        }
                        else
                        {
                          v52 = 7;
                        }
                      }
                      else
                      {
                        v52 = 6;
                      }
                    }
                    else
                    {
                      v52 = 5;
                    }
                  }
                  else if (v51 >= 0x80)
                  {
                    if (v51 >= 0x4000)
                    {
                      if (v51 >= 0x200000)
                      {
                        if (v51 >> 28)
                          v52 = 5;
                        else
                          v52 = 4;
                      }
                      else
                      {
                        v52 = 3;
                      }
                    }
                    else
                    {
                      v52 = 2;
                    }
                  }
                  else
                  {
                    v52 = 1;
                  }
                  v27 += v52;
                  --v49;
                }
                while (v49);
                break;
              case 5:
              case 9:
              case 11:
                v27 = 8 * v16;
                break;
              case 6:
                v27 = 0;
                v53 = (unsigned int *)v17;
                v54 = v16;
                do
                {
                  v56 = *v53++;
                  v55 = v56;
                  if (v56 >= 0x80)
                  {
                    if (v55 >> 28)
                      v58 = 5;
                    else
                      v58 = 4;
                    if (v55 < 0x200000)
                      v58 = 3;
                    if (v55 >= 0x4000)
                      v57 = v58;
                    else
                      v57 = 2;
                  }
                  else
                  {
                    v57 = 1;
                  }
                  v27 += v57;
                  --v54;
                }
                while (v54);
                break;
              case 12:
                break;
              default:
                sub_22AD7E218();
            }
            v94[0] |= 2u;
            v59 = &v94[v23];
            if (v27 < 0x80)
            {
              v61 = 0;
              LOBYTE(v60) = v27;
            }
            else
            {
              *v59 = v27 | 0x80;
              v60 = v27 >> 7;
              if (v27 < 0x4000)
              {
                v61 = 1;
              }
              else
              {
                v59[1] = v60 | 0x80;
                v60 = v27 >> 14;
                if (v27 < 0x200000)
                {
                  v61 = 2;
                }
                else
                {
                  v59[2] = v60 | 0x80;
                  v60 = v27 >> 21;
                  if (v27 >> 28)
                  {
                    v59[3] = v60 | 0x80;
                    v60 = v27 >> 28;
                    v61 = 4;
                  }
                  else
                  {
                    v61 = 3;
                  }
                }
              }
            }
            v59[v61] = v60;
            v62 = v61 + v23 + 1;
            (*a2)(a2, v62, v94);
            v63 = 2;
            switch(*v24)
            {
              case 0:
              case 0xD:
                v64 = 0;
                do
                {
                  v66 = *(_DWORD *)v17;
                  v17 = (unint64_t *)((char *)v17 + 4);
                  v65 = v66;
                  if ((v66 & 0x80000000) != 0)
                  {
                    v69 = vdupq_n_s32(v65);
                    v95 = v65 | 0x80;
                    v70 = (int32x4_t)vshlq_u32((uint32x4_t)v69, (uint32x4_t)xmmword_22AD83810);
                    v71 = (int16x8_t)vshlq_s32(v69, (int32x4_t)xmmword_22AD83810);
                    v70.i32[3] = v71.i32[3];
                    v71.i64[0] = *(_QWORD *)&vmovn_s32(v70) | 0x80008000800080;
                    v96 = vmovn_s16(v71).u32[0];
                    v97 = -1;
                    v98 = 1;
                    v72 = 10;
                  }
                  else
                  {
                    if (v65 < 0x80)
                    {
                      v68 = 0;
                    }
                    else
                    {
                      v95 = v65 | 0x80;
                      if (v65 < 0x4000)
                      {
                        v65 >>= 7;
                        v68 = 1;
                      }
                      else
                      {
                        LOBYTE(v96) = (v65 >> 7) | 0x80;
                        if (v65 < 0x200000)
                        {
                          v65 >>= 14;
                          v68 = 2;
                        }
                        else
                        {
                          BYTE1(v96) = (v65 >> 14) | 0x80;
                          v67 = v65 >> 21;
                          v65 >>= 28;
                          if (v65)
                          {
                            BYTE2(v96) = v67 | 0x80;
                            v68 = 4;
                          }
                          else
                          {
                            LOBYTE(v65) = v67;
                            v68 = 3;
                          }
                        }
                      }
                    }
                    v72 = v68 + 1;
                    *(&v95 + v68) = v65;
                  }
                  a1 = (_QWORD *)((uint64_t (*)(_QWORD, uint64_t, char *))*a2)(a2, v72, &v95);
                  v64 += v72;
                  --v26;
                }
                while (v26);
                break;
              case 1:
                v64 = 0;
                do
                {
                  v75 = *(_DWORD *)v17;
                  v17 = (unint64_t *)((char *)v17 + 4);
                  v76 = (2 * v75) ^ (v75 >> 31);
                  if (v76 < 0x80)
                  {
                    v78 = 0;
                  }
                  else
                  {
                    v95 = v76 | 0x80;
                    if (v76 < 0x4000)
                    {
                      v76 >>= 7;
                      v78 = 1;
                    }
                    else
                    {
                      LOBYTE(v96) = (v76 >> 7) | 0x80;
                      if (v76 < 0x200000)
                      {
                        v76 >>= 14;
                        v78 = 2;
                      }
                      else
                      {
                        BYTE1(v96) = (v76 >> 14) | 0x80;
                        v77 = v76 >> 21;
                        v76 >>= 28;
                        if (v76)
                        {
                          BYTE2(v96) = v77 | 0x80;
                          v78 = 4;
                        }
                        else
                        {
                          LOBYTE(v76) = v77;
                          v78 = 3;
                        }
                      }
                    }
                  }
                  v79 = v78 + 1;
                  *(&v95 + v78) = v76;
                  a1 = (_QWORD *)((uint64_t (*)(_QWORD, uint64_t, char *))*a2)(a2, v78 + 1, &v95);
                  v64 += v79;
                  --v26;
                }
                while (v26);
                break;
              case 2:
              case 7:
              case 0xA:
                goto LABEL_131;
              case 3:
              case 8:
                v64 = 0;
                do
                {
                  v73 = *v17++;
                  v74 = sub_22AD398C4(v73, &v95);
                  a1 = (_QWORD *)((uint64_t (*)(_QWORD, _QWORD, char *))*a2)(a2, v74, &v95);
                  v64 += v74;
                  --v26;
                }
                while (v26);
                break;
              case 4:
                v64 = 0;
                do
                {
                  v80 = *v17++;
                  v81 = sub_22AD398C4((2 * v80) ^ (v80 >> 63), &v95);
                  a1 = (_QWORD *)((uint64_t (*)(_QWORD, _QWORD, char *))*a2)(a2, v81, &v95);
                  v64 += v81;
                  --v26;
                }
                while (v26);
                break;
              case 5:
              case 9:
              case 0xB:
                v63 = 3;
LABEL_131:
                v64 = ((_DWORD)v16 << v63);
                a1 = (_QWORD *)((uint64_t (*)(_QWORD, uint64_t, unint64_t *))*a2)(a2, v64, v17);
                break;
              case 6:
                v64 = 0;
                do
                {
                  v83 = *(_DWORD *)v17;
                  v17 = (unint64_t *)((char *)v17 + 4);
                  v82 = v83;
                  if (v83 < 0x80)
                  {
                    v85 = 0;
                  }
                  else
                  {
                    v95 = v82 | 0x80;
                    if (v82 < 0x4000)
                    {
                      v82 >>= 7;
                      v85 = 1;
                    }
                    else
                    {
                      LOBYTE(v96) = (v82 >> 7) | 0x80;
                      if (v82 < 0x200000)
                      {
                        v82 >>= 14;
                        v85 = 2;
                      }
                      else
                      {
                        BYTE1(v96) = (v82 >> 14) | 0x80;
                        v84 = v82 >> 21;
                        v82 >>= 28;
                        if (v82)
                        {
                          BYTE2(v96) = v84 | 0x80;
                          v85 = 4;
                        }
                        else
                        {
                          LOBYTE(v82) = v84;
                          v85 = 3;
                        }
                      }
                    }
                  }
                  v86 = v85 + 1;
                  *(&v95 + v85) = v82;
                  a1 = (_QWORD *)((uint64_t (*)(_QWORD, uint64_t, char *))*a2)(a2, v85 + 1, &v95);
                  v64 += v86;
                  --v26;
                }
                while (v26);
                break;
              case 0xC:
                v87 = v16;
                do
                {
                  v88 = *(_DWORD *)v17;
                  v17 = (unint64_t *)((char *)v17 + 4);
                  v95 = v88 != 0;
                  a1 = (_QWORD *)((uint64_t (*)(_QWORD, uint64_t, char *))*a2)(a2, 1, &v95);
                  --v87;
                }
                while (v87);
                v64 = v16;
                break;
              default:
                sub_22AD7E240();
            }
            if (v64 != v27)
              sub_22AD7E268();
            v13 = v62 + v27;
          }
          else
          {
            v18 = *(int *)(v8 + 72 * v6 + 16);
            if (v18 >= 0x11)
              sub_22AD7E154((uint64_t)a1, (uint64_t)v11, a3);
            LODWORD(v13) = 0;
            v19 = qword_22AD83710[v18];
            do
            {
              a1 = (_QWORD *)sub_22AD37888((uint64_t)v9, v17, (void (**)(_QWORD, _QWORD, _QWORD))a2);
              v13 = (v13 + (_DWORD)a1);
              v17 = (unint64_t *)((char *)v17 + v19);
              LODWORD(v16) = v16 - 1;
            }
            while ((_DWORD)v16);
          }
          goto LABEL_182;
        }
LABEL_28:
        v13 = 0;
        goto LABEL_182;
      }
LABEL_6:
      a1 = (_QWORD *)sub_22AD37888((uint64_t)v9, v11, (void (**)(_QWORD, _QWORD, _QWORD))a2);
      v13 = (uint64_t)a1;
LABEL_182:
      v7 += v13;
      ++v6;
      v3 = (_DWORD *)*v5;
      if (v6 >= *(unsigned int *)(*v5 + 48))
        goto LABEL_185;
    }
  }
  v7 = 0;
LABEL_185:
  if (*((_DWORD *)v5 + 2))
  {
    v89 = 0;
    v90 = 0;
    do
    {
      v91 = v5[2] + v89;
      v92 = sub_22AD39830(*(_DWORD *)v91, v94);
      v94[0] |= *(_BYTE *)(v91 + 4);
      (*a2)(a2, v92, v94);
      (*a2)(a2, *(_QWORD *)(v91 + 8), *(_BYTE **)(v91 + 16));
      v7 += v92 + *(_QWORD *)(v91 + 8);
      ++v90;
      v89 += 24;
    }
    while (v90 < *((unsigned int *)v5 + 2));
  }
  return v7;
}

uint64_t sub_22AD37888(uint64_t a1, unint64_t *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _BYTE *v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  const char *v19;
  size_t v20;
  size_t v21;
  unsigned int v22;
  _BYTE *v23;
  unsigned int v24;
  unsigned int v25;
  _BYTE *v26;
  unsigned int v27;
  unsigned int v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  _BYTE *v33;
  unsigned int v34;
  unsigned int v35;
  int32x4_t v36;
  int32x4_t v37;
  int16x8_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *(*v44)(uint64_t, size_t, void *);
  __int128 v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  _BYTE v50[20];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = sub_22AD39830(*(_DWORD *)(a1 + 8), v50);
  v7 = v6;
  switch(*(_DWORD *)(a1 + 16))
  {
    case 0:
    case 0xD:
      v9 = *(_DWORD *)a2;
      v10 = &v50[v6];
      if ((*(_DWORD *)a2 & 0x80000000) != 0)
      {
        *v10 = v9 | 0x80;
        v36 = vdupq_n_s32(v9);
        v37 = (int32x4_t)vshlq_u32((uint32x4_t)v36, (uint32x4_t)xmmword_22AD83810);
        v38 = (int16x8_t)vshlq_s32(v36, (int32x4_t)xmmword_22AD83810);
        v37.i32[3] = v38.i32[3];
        v38.i64[0] = *(_QWORD *)&vmovn_s32(v37) | 0x80008000800080;
        *(_DWORD *)(v10 + 1) = vmovn_s16(v38).u32[0];
        *(_DWORD *)(v10 + 5) = -1;
        v10[9] = 1;
        v39 = 10;
        goto LABEL_60;
      }
      if (v9 < 0x80)
      {
        v12 = 0;
      }
      else
      {
        *v10 = v9 | 0x80;
        v11 = v9 >> 7;
        if (v9 < 0x4000)
        {
          v12 = 1;
        }
        else
        {
          v10[1] = v11 | 0x80;
          v11 = v9 >> 14;
          if (v9 < 0x200000)
          {
            v12 = 2;
          }
          else
          {
            v10[2] = v11 | 0x80;
            v11 = v9 >> 21;
            v9 >>= 28;
            if (v9)
            {
              v10[3] = v11 | 0x80;
              v12 = 4;
              goto LABEL_59;
            }
            v12 = 3;
          }
        }
        LOBYTE(v9) = v11;
      }
LABEL_59:
      v39 = v12 + 1;
      v10[v12] = v9;
LABEL_60:
      v8 = v39 + v6;
      goto LABEL_61;
    case 1:
      v15 = &v50[v6];
      v16 = (2 * *(_DWORD *)a2) ^ (*(int *)a2 >> 31);
      goto LABEL_15;
    case 2:
    case 7:
    case 0xA:
      v50[0] |= 5u;
      *(_DWORD *)&v50[v6] = *(_DWORD *)a2;
      v8 = v6 + 4;
      goto LABEL_61;
    case 3:
    case 8:
      v13 = *a2;
      v14 = &v50[v7];
      goto LABEL_13;
    case 4:
      v14 = &v50[v6];
      v13 = (2 * *a2) ^ ((uint64_t)*a2 >> 63);
LABEL_13:
      v8 = sub_22AD398C4(v13, v14) + v7;
      goto LABEL_61;
    case 5:
    case 9:
    case 0xB:
      v50[0] |= 1u;
      *(_QWORD *)&v50[v6] = *a2;
      v8 = v6 + 8;
      goto LABEL_61;
    case 6:
      v16 = *(_DWORD *)a2;
      v15 = &v50[v6];
LABEL_15:
      if (v16 < 0x80)
      {
        v18 = 0;
      }
      else
      {
        *v15 = v16 | 0x80;
        v17 = v16 >> 7;
        if (v16 < 0x4000)
        {
          v18 = 1;
        }
        else
        {
          v15[1] = v17 | 0x80;
          v17 = v16 >> 14;
          if (v16 < 0x200000)
          {
            v18 = 2;
          }
          else
          {
            v15[2] = v17 | 0x80;
            v17 = v16 >> 21;
            v16 >>= 28;
            if (v16)
            {
              v15[3] = v17 | 0x80;
              v18 = 4;
              goto LABEL_55;
            }
            v18 = 3;
          }
        }
        LOBYTE(v16) = v17;
      }
LABEL_55:
      v15[v18] = v16;
      v8 = v6 + v18 + 1;
LABEL_61:
      (*a3)(a3, v8, v50);
      return v8;
    case 0xC:
      v50[v6] = *(_DWORD *)a2 != 0;
      v8 = v6 + 1;
      goto LABEL_61;
    case 0xE:
      v19 = (const char *)*a2;
      if (v19)
      {
        v20 = strlen(v19);
        v21 = v20;
        v50[0] |= 2u;
        LOBYTE(v22) = v20;
        if (v20 < 0x80)
        {
          v25 = 0;
        }
        else
        {
          v23 = &v50[v7];
          v50[v7] = v20 | 0x80;
          v24 = v20 >> 7;
          if (v20 < 0x4000)
          {
            v25 = 1;
          }
          else
          {
            v23[1] = v24 | 0x80;
            v24 = v20 >> 14;
            if (v20 < 0x200000)
            {
              v25 = 2;
            }
            else
            {
              v23[2] = v24 | 0x80;
              v24 = v20 >> 21;
              v22 = v20 >> 28;
              if (v20 >> 28)
              {
                v23[3] = v24 | 0x80;
                v25 = 4;
                goto LABEL_69;
              }
              v25 = 3;
            }
          }
          LOBYTE(v22) = v24;
        }
      }
      else
      {
        v21 = 0;
        LOBYTE(v22) = 0;
        v25 = 0;
        v50[0] |= 2u;
      }
LABEL_69:
      v50[v7 + v25] = v22;
      v41 = v7 + v25 + 1;
      (*a3)(a3, v41, v50);
      (*a3)(a3, v21, v19);
      return v41 + v21;
    case 0xF:
      v21 = *a2;
      v50[0] |= 2u;
      v26 = &v50[v6];
      if (v21 < 0x80)
      {
        v28 = 0;
        LOBYTE(v27) = v21;
      }
      else
      {
        *v26 = v21 | 0x80;
        v27 = v21 >> 7;
        if (v21 < 0x4000)
        {
          v28 = 1;
        }
        else
        {
          v26[1] = v27 | 0x80;
          v27 = v21 >> 14;
          if (v21 < 0x200000)
          {
            v28 = 2;
          }
          else
          {
            v26[2] = v27 | 0x80;
            v27 = v21 >> 21;
            if (v21 >> 28)
            {
              v26[3] = v27 | 0x80;
              v28 = 4;
              v27 = v21 >> 28;
            }
            else
            {
              v28 = 3;
            }
          }
        }
      }
      v26[v28] = v27;
      v41 = v6 + v28 + 1;
      (*a3)(a3, v41, v50);
      (*a3)(a3, v21, a2[1]);
      return v41 + v21;
    case 0x10:
      v29 = *a2;
      v47 = 0;
      v48 = 0;
      v44 = sub_22AD359E4;
      v45 = xmmword_22AD83820;
      v46 = &v49;
      v50[0] |= 2u;
      if (!v29)
      {
        v31 = 0;
        LOBYTE(v32) = 0;
        goto LABEL_45;
      }
      v30 = sub_22AD36F48(v29, &v44);
      v31 = v30;
      LOBYTE(v32) = v30;
      if (v30 < 0x80)
      {
LABEL_45:
        v35 = 0;
        goto LABEL_73;
      }
      v33 = &v50[v7];
      v50[v7] = v30 | 0x80;
      v34 = v30 >> 7;
      if (v30 < 0x4000)
      {
        v35 = 1;
      }
      else
      {
        v33[1] = v34 | 0x80;
        v34 = v30 >> 14;
        if (v30 < 0x200000)
        {
          v35 = 2;
        }
        else
        {
          v33[2] = v34 | 0x80;
          v34 = v30 >> 21;
          v32 = v30 >> 28;
          if (v30 >> 28)
          {
            v33[3] = v34 | 0x80;
            v35 = 4;
            goto LABEL_73;
          }
          v35 = 3;
        }
      }
      LOBYTE(v32) = v34;
LABEL_73:
      v50[v7 + v35] = v32;
      v42 = v7 + v35 + 1;
      (*a3)(a3, v42, v50);
      (*a3)(a3, v31, v46);
      v8 = v42 + v31;
      if ((_DWORD)v47)
      {
        if (v48)
          (*(void (**)(uint64_t, void *, uint64_t))(v48 + 8))(v48, v46, v43);
        else
          free(v46);
      }
      return v8;
    default:
      sub_22AD7E2B8();
  }
}

_QWORD *sub_22AD37E4C(uint64_t a1, uint64_t (**a2)(int, size_t size), unint64_t a3, char *a4)
{
  uint64_t v4;
  uint64_t (**v8)(int, size_t);
  uint64_t v9;
  unsigned int v10;
  char *v11;
  _QWORD *v12;
  uint64_t (*v13)(char *);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  int v33;
  int v34;
  int *v35;
  int v36;
  int v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  int v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  unint64_t v53;
  char v54;
  char *v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  _DWORD *v61;
  uint64_t v62;
  int v63;
  char *v64;
  char *v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t (**v76)(int, size_t);
  uint64_t v77;
  int v78;
  int v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t *v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  uint64_t v91;
  void *v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE *v101;
  unint64_t v102;
  char v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  unsigned int v109;
  uint64_t v110;
  unsigned int v111;
  uint64_t v112;
  int v113;
  int v114;
  int *v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unsigned int v124;
  unsigned int v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unsigned int v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  uint64_t v134;
  unsigned int v135;
  unsigned int *v136;
  unsigned int v137;
  uint64_t v138;
  uint64_t v139;
  size_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unsigned int v144;
  unsigned int v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unsigned int v149;
  unint64_t v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unsigned int v155;
  unsigned int v156;
  uint64_t v157;
  unsigned int v158;
  unsigned int v159;
  unsigned int k;
  unsigned int i;
  unsigned int v164;
  unsigned int *v165;
  unsigned int v166;
  unsigned int *v167;
  int v168;
  unsigned int j;
  uint64_t v170;
  char v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unsigned int v175;
  int v176;
  unsigned int v177;
  char *v178;
  uint64_t v179;
  int v180;
  char *v181;
  unint64_t v182;
  unsigned int v183;
  char v184;
  char *v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  char v197;
  uint64_t v198;

  v198 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 56);
  v196 = 0u;
  v195 = 0u;
  v194 = 0u;
  v193 = 0u;
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  v186 = 0u;
  if (*(_DWORD *)a1 != 682290937)
    sub_22AD7E358();
  if (a2)
    v8 = a2;
  else
    v8 = &off_255B50130;
  v9 = (*v8)((int)v8[2], *(_QWORD *)(a1 + 40));
  if (!v9)
    return 0;
  v181 = (char *)v9;
  v185 = &v197;
  v10 = *(_DWORD *)(a1 + 48) + 7;
  if (v10 >= 0x88)
  {
    v11 = (char *)(*v8)((int)v8[2], v10 >> 3);
    if (!v11)
    {
      v65 = v181;
      goto LABEL_119;
    }
  }
  else
  {
    v11 = &v184;
  }
  bzero(v11, v10 >> 3);
  v13 = *(uint64_t (**)(_QWORD))(a1 + 88);
  v177 = v10;
  if (v13)
  {
    v12 = v181;
    v14 = v13(v181);
  }
  else
  {
    v12 = v181;
    bzero(v181, *(_QWORD *)(a1 + 40));
    *(_QWORD *)v181 = a1;
    if (*(_DWORD *)(a1 + 48))
    {
      v58 = 0;
      v59 = 0;
      do
      {
        v60 = *(_QWORD *)(a1 + 56);
        v61 = *(_DWORD **)(v60 + v58 + 40);
        if (v61 && *(_DWORD *)(v60 + v58 + 12) != 2)
        {
          v62 = v60 + v58;
          v63 = *(_DWORD *)(v62 + 16);
          v64 = &v181[*(unsigned int *)(v62 + 24)];
          switch(v63)
          {
            case 0:
            case 1:
            case 2:
            case 6:
            case 7:
            case 10:
            case 12:
            case 13:
              *(_DWORD *)v64 = *v61;
              break;
            case 3:
            case 4:
            case 5:
            case 8:
            case 9:
            case 11:
              v61 = *(_DWORD **)v61;
              goto LABEL_114;
            case 14:
            case 16:
LABEL_114:
              *(_QWORD *)v64 = v61;
              break;
            case 15:
              *(_OWORD *)v64 = *(_OWORD *)v61;
              break;
            default:
              break;
          }
        }
        ++v59;
        v58 += 72;
      }
      while (v59 < *(unsigned int *)(a1 + 48));
    }
  }
  v178 = v11;
  v183 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  while (a3)
  {
    if (a3 >= 5)
      v19 = 5;
    else
      v19 = a3;
    v20 = *a4;
    v21 = (v20 >> 3) & 0xF;
    if ((v20 & 0x80000000) != 0)
    {
      if (v19 < 2)
        goto LABEL_308;
      v23 = 4;
      v24 = 1;
      while (1)
      {
        v25 = a4[v24];
        if ((a4[v24] & 0x80000000) == 0)
          break;
        v21 |= (v25 & 0x7F) << v23;
        v23 += 7;
        if (v19 == ++v24)
          goto LABEL_308;
      }
      v21 |= v25 << v23;
      v22 = v24 + 1;
      if (!v4)
        goto LABEL_30;
    }
    else
    {
      v22 = 1;
      if (!v4)
        goto LABEL_30;
    }
    if (*(_DWORD *)(v4 + 8) == v21)
    {
      v26 = v4;
      v27 = v18;
LABEL_28:
      v28 = 0;
      if (!*(_DWORD *)(v26 + 12))
        v178[(unint64_t)v27 >> 3] |= 1 << (v27 & 7);
      v18 = v27;
      v4 = v26;
      goto LABEL_49;
    }
LABEL_30:
    v29 = *(_DWORD *)(a1 + 72);
    if (!v29)
      goto LABEL_48;
    v30 = *(_QWORD *)(a1 + 80);
    if (v29 != 1)
    {
      v31 = 0;
      while (1)
      {
        v32 = v31 + (v29 >> 1);
        v33 = *(_DWORD *)(v30 + 8 * v32);
        if (v21 >= v33)
        {
          v34 = *(_DWORD *)(v30 + 8 * v32 + 4);
          if (*(_DWORD *)(v30 + 8 * (v32 + 1) + 4) + v33 - v34 > v21)
          {
            v27 = (v21 - v33 + v34);
            if ((v27 & 0x80000000) == 0)
              goto LABEL_43;
            goto LABEL_48;
          }
          v29 += v31 + ~(_DWORD)v32;
          v31 = v32 + 1;
        }
        else
        {
          v29 >>= 1;
        }
        if (v29 <= 1)
        {
          if (!v29)
            goto LABEL_48;
          goto LABEL_40;
        }
      }
    }
    v31 = 0;
LABEL_40:
    v35 = (int *)(v30 + 8 * v31);
    v36 = *v35;
    if (*v35 > v21
      || (v37 = v35[1], v36 - v37 + *(_DWORD *)(v30 + 8 * (v31 + 1) + 4) <= v21)
      || (v27 = (v37 + v21 - v36), (v27 & 0x80000000) != 0))
    {
LABEL_48:
      v26 = 0;
      ++v17;
      v28 = 1;
    }
    else
    {
LABEL_43:
      v38 = *(_QWORD *)(a1 + 56);
      if (v38)
      {
        v26 = v38 + 72 * v27;
        goto LABEL_28;
      }
      v26 = 0;
      v4 = 0;
      v28 = 1;
      v18 = v27;
    }
LABEL_49:
    v39 = v20 & 7;
    a4 += v22;
    a3 -= v22;
    switch(v20 & 7)
    {
      case 0u:
        v40 = 10;
        if (a3 < 0xA)
          v40 = a3;
        if (v40)
        {
          v41 = 0;
          while (a4[v41] < 0)
          {
            if (v40 == (_DWORD)++v41)
              goto LABEL_308;
          }
        }
        else
        {
          LODWORD(v41) = 0;
        }
        if ((_DWORD)v41 == v40)
          goto LABEL_308;
        v179 = v4;
        v42 = 0;
        LODWORD(v43) = v41 + 1;
        goto LABEL_80;
      case 1u:
        if (a3 < 8)
          goto LABEL_308;
        v179 = v4;
        v42 = 0;
        LODWORD(v43) = 8;
        goto LABEL_80;
      case 2u:
        if (a3 >= 5)
          v44 = 5;
        else
          v44 = a3;
        if ((_DWORD)v44)
        {
          v45 = 0;
          v46 = 0;
          v47 = 0;
          while (1)
          {
            v47 |= (a4[v45] & 0x7F) << v46;
            if ((a4[v45] & 0x80) == 0)
              break;
            v46 += 7;
            if (v44 == ++v45)
              goto LABEL_308;
          }
        }
        else
        {
          LODWORD(v45) = 0;
          v47 = 0;
        }
        if ((_DWORD)v45 == (_DWORD)v44)
          goto LABEL_308;
        v43 = (v47 + v45 + 1);
        v48 = (_DWORD)v43 && a3 >= v43;
        if (!v48)
          goto LABEL_308;
        v179 = v4;
        v42 = (v45 + 1);
LABEL_80:
        if (1 << (v183 + 4) == v16)
        {
          if (v183 == 22)
          {
            v183 = 22;
LABEL_308:
            ((void (*)(uint64_t (*)(int, size_t), _QWORD *, uint64_t, uint64_t, uint64_t))v8[1])(v8[2], v12, v16, 5, 1);
            if (v183)
            {
              for (i = 1; i <= v183; ++i)
              {
                if ((&v185)[i])
                  ((void (*)(uint64_t (*)(int, size_t)))v8[1])(v8[2]);
              }
            }
            v12 = 0;
            goto LABEL_314;
          }
          v170 = v42;
          v171 = v28;
          v173 = v26;
          v175 = v18;
          v49 = v15;
          v50 = v17;
          v14 = (*v8)((int)v8[2], 32 << (v183 + 5));
          (&v185)[v183 + 1] = (char *)v14;
          v16 = 0;
          if (!v14)
          {
            v54 = 0;
            ++v183;
            v12 = v181;
            v17 = v50;
            v15 = v49;
            v18 = v175;
            goto LABEL_93;
          }
          ++v183;
          v12 = v181;
          v17 = v50;
          v15 = v49;
          v18 = v175;
          v26 = v173;
          v28 = v171;
          v42 = v170;
        }
        else
        {
          v14 = (uint64_t)(&v185)[v183];
        }
        v51 = v14 + 32 * v16;
        *(_DWORD *)v51 = v21;
        *(_BYTE *)(v51 + 4) = v39;
        *(_BYTE *)(v51 + 5) = v42;
        *(_WORD *)(v51 + 6) = 0;
        *(_QWORD *)(v51 + 8) = v26;
        *(_QWORD *)(v51 + 16) = v43;
        *(_QWORD *)(v51 + 24) = a4;
        if ((v28 & 1) == 0 && *(_DWORD *)(v26 + 12) == 2)
        {
          if (v39 == 2
            && ((v52 = *(_DWORD *)(v26 + 16), (*(_BYTE *)(v26 + 48) & 1) != 0) || (v52 - 14) >= 3))
          {
            v53 = v43 - v42;
            switch(v52)
            {
              case 0:
              case 1:
              case 3:
              case 4:
              case 6:
              case 8:
              case 13:
                if (v53)
                {
                  v53 = 0;
                  v55 = &a4[v42];
                  v56 = v42 - v43;
                  do
                  {
                    v57 = *v55++;
                    v53 += (v57 >> 7) ^ 1;
                    v48 = __CFADD__(v56++, 1);
                  }
                  while (!v48);
                }
                break;
              case 2:
              case 7:
              case 10:
                if ((v53 & 3) != 0)
                  goto LABEL_308;
                v53 >>= 2;
                break;
              case 5:
              case 9:
              case 11:
                if ((v53 & 7) != 0)
                  goto LABEL_308;
                v53 >>= 3;
                break;
              case 12:
                break;
              default:
                goto LABEL_308;
            }
          }
          else
          {
            v53 = 1;
          }
          *(_QWORD *)((char *)v12 + *(unsigned int *)(v26 + 20)) += v53;
        }
        v16 = (v16 + 1);
        a4 += v43;
        a3 -= v43;
        v54 = 1;
LABEL_93:
        v4 = v179;
        if ((v54 & 1) == 0)
          goto LABEL_308;
        break;
      case 5u:
        if (a3 < 4)
          goto LABEL_308;
        v179 = v4;
        v42 = 0;
        LODWORD(v43) = 4;
        goto LABEL_80;
      default:
        goto LABEL_308;
    }
  }
  v66 = *(unsigned int *)(a1 + 48);
  v67 = v16;
  if ((_DWORD)v66)
  {
    v68 = 0;
    v69 = 92;
    do
    {
      v70 = *(_QWORD *)(a1 + 56);
      v71 = *(_DWORD *)(v70 + v69 - 80);
      if (v71)
      {
        if (v71 == 2)
        {
          v72 = *(int *)(v70 + v69 - 76);
          if (v72 >= 0x11)
            sub_22AD7E154(v14, v17, v16);
          v73 = *(unsigned int *)(v70 + v69 - 72);
          v74 = *(_QWORD *)((char *)v12 + v73);
          if (v74)
          {
            v75 = qword_22AD83710[v72];
            *(_QWORD *)((char *)v12 + v73) = 0;
            if (!*v12)
              sub_22AD7E330();
            v76 = v8;
            v77 = v17;
            v14 = (*v76)((int)v76[2], v74 * v75);
            if (!v14)
            {
              v164 = *(_DWORD *)(a1 + 48);
              v8 = v76;
              if ((int)v68 + 1 < v164)
              {
                v165 = (unsigned int *)(*(_QWORD *)(a1 + 56) + v69);
                v166 = ~(_DWORD)v68 + v164;
                do
                {
                  if (*(v165 - 2) == 2)
                    *(_QWORD *)((char *)v12 + *v165) = 0;
                  v165 += 18;
                  --v166;
                }
                while (v166);
              }
              goto LABEL_329;
            }
            *(_QWORD *)((char *)v12 + *(unsigned int *)(v70 + v69 - 68)) = v14;
            v66 = *(unsigned int *)(a1 + 48);
            v17 = v77;
            v8 = v76;
            v16 = v67;
          }
        }
      }
      else if (!*(_QWORD *)(v70 + v69 - 52) && ((v178[v68 >> 3] >> (v68 & 7)) & 1) == 0)
      {
        if ((v68 + 1) < v66)
        {
          v167 = (unsigned int *)(v70 + v69);
          v168 = ~(_DWORD)v68 + v66;
          do
          {
            if (*(v167 - 2) == 2)
              *(_QWORD *)((char *)v12 + *v167) = 0;
            v167 += 18;
            --v168;
          }
          while (v168);
        }
        goto LABEL_329;
      }
      ++v68;
      v69 += 72;
    }
    while (v68 < v66);
  }
  if (v17)
  {
    v14 = (*v8)((int)v8[2], 24 * v17);
    v16 = v67;
    v12[2] = v14;
    if (!v14)
    {
LABEL_329:
      sub_22AD38EDC(v12, v8);
      if (v183)
      {
        for (j = 1; j <= v183; ++j)
        {
          if ((&v185)[j])
            ((void (*)(uint64_t (*)(int, size_t)))v8[1])(v8[2]);
        }
      }
      v12 = 0;
      if (v177 < 0x88)
        return v12;
      v65 = v178;
      if (!v178)
        return v12;
LABEL_119:
      v12 = 0;
      goto LABEL_316;
    }
  }
  v78 = 0;
  v79 = v16;
  v80 = v183;
  v176 = v16;
  do
  {
    v81 = 1 << (v78 + 4);
    v180 = v78;
    if (v78 == v80)
      LODWORD(v81) = v79;
    v182 = v81;
    if ((_DWORD)v81)
    {
      v82 = 0;
      v83 = (&v185)[v78];
      while (1)
      {
        v84 = &v83[32 * v82];
        v85 = *((_QWORD *)v84 + 1);
        if (!v85)
        {
          v89 = v12[2];
          v90 = *((_DWORD *)v12 + 2);
          *((_DWORD *)v12 + 2) = v90 + 1;
          v91 = v89 + 24 * v90;
          *(_DWORD *)v91 = *(_DWORD *)v84;
          *(_DWORD *)(v91 + 4) = v84[4];
          *(_QWORD *)(v91 + 8) = *((_QWORD *)v84 + 2);
          v92 = (void *)((uint64_t (*)(uint64_t (*)(int, size_t)))*v8)(v8[2]);
          *(_QWORD *)(v91 + 16) = v92;
          if (!v92)
            goto LABEL_329;
          v14 = (uint64_t)memcpy(v92, *(const void **)&v83[32 * v82 + 24], *(_QWORD *)(v91 + 8));
          goto LABEL_235;
        }
        v86 = (_QWORD *)((char *)v12 + *(unsigned int *)(v85 + 24));
        v87 = *(_DWORD *)(v85 + 12);
        if (!v87)
        {
          v14 = sub_22AD399D4((uint64_t)&v83[32 * v82], (_QWORD *)((char *)v12 + *(unsigned int *)(v85 + 24)), (uint64_t)v8, 1);
          if (!(_DWORD)v14)
            goto LABEL_329;
          goto LABEL_235;
        }
        if (v87 == 2)
          break;
        if (v87 != 1)
          sub_22AD7E2E0();
        if ((*(_BYTE *)(v85 + 48) & 4) != 0)
        {
          v106 = *(unsigned int *)(v85 + 20);
          v107 = *(_DWORD *)((char *)v12 + v106);
          if (!v107)
            goto LABEL_233;
          v108 = *v12;
          v109 = *(_DWORD *)(*v12 + 72);
          if (!v109)
            goto LABEL_176;
          v110 = *(_QWORD *)(v108 + 80);
          if (v109 == 1)
          {
            v111 = 0;
          }
          else
          {
            v111 = 0;
            do
            {
              v112 = v111 + (v109 >> 1);
              v113 = *(_DWORD *)(v110 + 8 * v112);
              if (v107 >= v113)
              {
                v14 = *(unsigned int *)(v110 + 8 * (v112 + 1) + 4);
                v114 = *(_DWORD *)(v110 + 8 * v112 + 4);
                if ((int)v14 + v113 - v114 > v107)
                {
                  v117 = v107 - v113 + v114;
                  goto LABEL_216;
                }
                v109 += v111 + ~(_DWORD)v112;
                v111 = v112 + 1;
              }
              else
              {
                v109 >>= 1;
              }
            }
            while (v109 > 1);
            if (!v109)
              goto LABEL_176;
          }
          v115 = (int *)(v110 + 8 * v111);
          v116 = *v115;
          if (*v115 <= v107)
          {
            v118 = v115[1];
            v119 = v116 - v118 + *(_DWORD *)(v110 + 8 * (v111 + 1) + 4);
            v120 = v118 + v107 - v116;
            if (v119 > v107)
              v117 = v120;
            else
              v117 = -1;
          }
          else
          {
LABEL_176:
            v117 = -1;
          }
LABEL_216:
          v132 = *(_QWORD *)(v108 + 56);
          v133 = v117;
          v134 = v132 + 72 * v117;
          v137 = *(_DWORD *)(v134 + 16);
          v136 = (unsigned int *)(v134 + 16);
          v135 = v137;
          if (v137 == 16)
          {
            v14 = *v86;
            if (!*v86)
              goto LABEL_237;
            if (v14 != *(_QWORD *)(v132 + 72 * v133 + 40))
              v14 = (uint64_t)sub_22AD38EDC((_QWORD *)v14, v8);
          }
          else
          {
            if (v135 != 15)
            {
              if (v135 == 14)
              {
                v17 = *v86;
                if (*v86)
                {
                  v138 = *(_QWORD *)(v132 + 72 * v133 + 40);
                  goto LABEL_227;
                }
LABEL_237:
                v140 = 8;
LABEL_232:
                bzero(v86, v140);
LABEL_233:
                v14 = sub_22AD399D4((uint64_t)&v83[32 * v82], v86, (uint64_t)v8, 1);
                if (!(_DWORD)v14)
                  goto LABEL_329;
                *(_DWORD *)((char *)v12 + v106) = *(_DWORD *)v84;
                goto LABEL_235;
              }
LABEL_230:
              if (v135 >= 0x11)
                sub_22AD7E154(v14, v17, v16);
              v140 = qword_22AD83710[v135];
              goto LABEL_232;
            }
            v17 = v86[1];
            if (v17)
            {
              v139 = *(_QWORD *)(v132 + 72 * v133 + 40);
              if (!v139)
                goto LABEL_228;
              v138 = *(_QWORD *)(v139 + 8);
LABEL_227:
              if (v17 != v138)
LABEL_228:
                v14 = ((uint64_t (*)(uint64_t (*)(int, size_t)))v8[1])(v8[2]);
            }
          }
          v135 = *v136;
          goto LABEL_230;
        }
        v14 = sub_22AD399D4((uint64_t)&v83[32 * v82], (_QWORD *)((char *)v12 + *(unsigned int *)(v85 + 24)), (uint64_t)v8, 1);
        if (!(_DWORD)v14)
          goto LABEL_329;
        v88 = *(unsigned int *)(*((_QWORD *)v84 + 1) + 20);
        if ((_DWORD)v88)
          *(_DWORD *)((char *)v12 + v88) = 1;
LABEL_235:
        if (++v82 == v182)
          goto LABEL_300;
      }
      if (v83[32 * v82 + 4] == 2)
      {
        v93 = *(_DWORD *)(v85 + 16);
        if ((*(_BYTE *)(v85 + 48) & 1) != 0 || v93 - 14 >= 3)
        {
          v94 = *(unsigned int *)(v85 + 20);
          v95 = 4;
          switch(v93)
          {
            case 0u:
            case 1u:
            case 2u:
            case 6u:
            case 7u:
            case 0xAu:
            case 0xCu:
            case 0xDu:
              break;
            case 3u:
            case 4u:
            case 5u:
            case 8u:
            case 9u:
            case 0xBu:
            case 0xEu:
            case 0x10u:
              v95 = 8;
              break;
            case 0xFu:
LABEL_343:
              sub_22AD7E308();
            default:
              sub_22AD7E154(v14, v17, v16);
          }
          v96 = v93;
          v97 = *(_QWORD *)((char *)v12 + v94);
          v14 = *v86 + v97 * v95;
          v98 = &v83[32 * v82];
          v99 = v98[5];
          v100 = *((_QWORD *)v98 + 3);
          v101 = (_BYTE *)(v100 + v99);
          v102 = *((_QWORD *)v98 + 2) - v99;
          v103 = 2;
          switch(v96)
          {
            case 0u:
            case 0xDu:
              if (!v102)
                goto LABEL_298;
              v121 = 0;
              while (1)
              {
                v122 = v102 >= 0xA ? 10 : v102;
                if ((_DWORD)v122)
                {
                  v123 = 0;
                  while ((char)v101[v123] < 0)
                  {
                    if (v122 == ++v123)
                      goto LABEL_329;
                  }
                }
                else
                {
                  LODWORD(v123) = 0;
                }
                v124 = v123 + 1;
                if ((_DWORD)v123 == (_DWORD)v122 || (_DWORD)v123 == -1)
                  goto LABEL_329;
                v125 = *v101 & 0x7F;
                if (v124 >= 2)
                {
                  v125 = *v101 & 0x7F | ((v101[1] & 0x7F) << 7);
                  if ((_DWORD)v123 != 1)
                  {
                    v125 = *v101 & 0x7F | ((v101[1] & 0x7F) << 7) & 0x3FFF | ((v101[2] & 0x7F) << 14);
                    if (v124 >= 4)
                    {
                      v125 = *v101 & 0x7F | ((v101[1] & 0x7F) << 7) & 0x3FFF | ((v101[2] & 0x7F) << 14) & 0xF01FFFFF | ((v101[3] & 0x7F) << 21);
                      if ((_DWORD)v123 != 3)
                        v125 |= v101[4] << 28;
                    }
                  }
                }
                *(_DWORD *)(v14 + 4 * v121) = v125;
                v126 = v121 + 1;
                v101 += v124;
                ++v121;
                v102 -= v124;
                if (!v102)
                  goto LABEL_299;
              }
            case 1u:
              if (!v102)
                goto LABEL_298;
              v141 = 0;
              while (1)
              {
                v142 = v102 >= 0xA ? 10 : v102;
                if ((_DWORD)v142)
                {
                  v143 = 0;
                  while ((char)v101[v143] < 0)
                  {
                    if (v142 == ++v143)
                      goto LABEL_329;
                  }
                }
                else
                {
                  LODWORD(v143) = 0;
                }
                v144 = v143 + 1;
                if ((_DWORD)v143 == (_DWORD)v142 || (_DWORD)v143 == -1)
                  goto LABEL_329;
                v145 = *v101 & 0x7F;
                if (v144 >= 2)
                {
                  v145 = *v101 & 0x7F | ((v101[1] & 0x7F) << 7);
                  if ((_DWORD)v143 != 1)
                  {
                    v145 = *v101 & 0x7F | ((v101[1] & 0x7F) << 7) & 0x3FFF | ((v101[2] & 0x7F) << 14);
                    if (v144 >= 4)
                    {
                      v145 = *v101 & 0x7F | ((v101[1] & 0x7F) << 7) & 0x3FFF | ((v101[2] & 0x7F) << 14) & 0xF01FFFFF | ((v101[3] & 0x7F) << 21);
                      if ((_DWORD)v143 != 3)
                        v145 |= v101[4] << 28;
                    }
                  }
                }
                *(_DWORD *)(v14 + 4 * v141) = -(v145 & 1) ^ (v145 >> 1);
                v126 = v141 + 1;
                v101 += v144;
                v102 -= v144;
                ++v141;
                if (!v102)
                  goto LABEL_299;
              }
            case 2u:
            case 7u:
            case 0xAu:
              goto LABEL_158;
            case 3u:
            case 8u:
              if (!v102)
                goto LABEL_298;
              v127 = 0;
              v174 = v94;
              while (1)
              {
                v128 = v102 >= 0xA ? 10 : v102;
                if ((_DWORD)v128)
                {
                  v129 = 0;
                  while ((char)v101[v129] < 0)
                  {
                    if (v128 == ++v129)
                      goto LABEL_329;
                  }
                }
                else
                {
                  LODWORD(v129) = 0;
                }
                v130 = v129 + 1;
                if ((_DWORD)v129 == (_DWORD)v128 || (_DWORD)v129 == -1)
                  goto LABEL_329;
                v131 = v14;
                *(_QWORD *)(v14 + 8 * v127) = sub_22AD39CC4((int)v129 + 1, v101);
                v14 = v131;
                v94 = v174;
                v126 = v127 + 1;
                v101 += v130;
                ++v127;
                v102 -= v130;
                if (!v102)
                  goto LABEL_299;
              }
            case 4u:
              if (!v102)
                goto LABEL_298;
              v146 = 0;
              v172 = v14;
              while (1)
              {
                v147 = v102 >= 0xA ? 10 : v102;
                if ((_DWORD)v147)
                {
                  v148 = 0;
                  while ((char)v101[v148] < 0)
                  {
                    if (v147 == ++v148)
                      goto LABEL_329;
                  }
                }
                else
                {
                  LODWORD(v148) = 0;
                }
                v149 = v148 + 1;
                if ((_DWORD)v148 == (_DWORD)v147 || (_DWORD)v148 == -1)
                  goto LABEL_329;
                v150 = sub_22AD39CC4((int)v148 + 1, v101);
                v151 = -(uint64_t)(v150 & 1) ^ (v150 >> 1);
                v14 = v172;
                *(_QWORD *)(v172 + 8 * v146) = v151;
                v126 = v146 + 1;
                v101 += v149;
                v102 -= v149;
                ++v146;
                if (!v102)
                  goto LABEL_299;
              }
            case 5u:
            case 9u:
            case 0xBu:
              v103 = 3;
LABEL_158:
              v104 = v102 >> v103;
              v14 = (uint64_t)memcpy((void *)v14, (const void *)(v100 + v99), (v102 >> v103) * v95);
              v105 = *(_QWORD *)((char *)v12 + v94) + v104;
              break;
            case 6u:
              if (!v102)
                goto LABEL_298;
              v152 = 0;
              while (1)
              {
                v153 = v102 >= 0xA ? 10 : v102;
                if ((_DWORD)v153)
                {
                  v154 = 0;
                  while ((char)v101[v154] < 0)
                  {
                    if (v153 == ++v154)
                      goto LABEL_329;
                  }
                }
                else
                {
                  LODWORD(v154) = 0;
                }
                v155 = v154 + 1;
                if ((_DWORD)v154 == (_DWORD)v153 || (_DWORD)v154 == -1)
                  goto LABEL_329;
                v156 = *v101 & 0x7F;
                if (v155 >= 2)
                {
                  v156 = *v101 & 0x7F | ((v101[1] & 0x7F) << 7);
                  if ((_DWORD)v154 != 1)
                  {
                    v156 = *v101 & 0x7F | ((v101[1] & 0x7F) << 7) & 0x3FFF | ((v101[2] & 0x7F) << 14);
                    if (v155 >= 4)
                    {
                      v156 = *v101 & 0x7F | ((v101[1] & 0x7F) << 7) & 0x3FFF | ((v101[2] & 0x7F) << 14) & 0xF01FFFFF | ((v101[3] & 0x7F) << 21);
                      if ((_DWORD)v154 != 3)
                        v156 |= v101[4] << 28;
                    }
                  }
                }
                *(_DWORD *)(v14 + 4 * v152) = v156;
                v126 = v152 + 1;
                v101 += v155;
                ++v152;
                v102 -= v155;
                if (!v102)
                  goto LABEL_299;
              }
            case 0xCu:
              if (v102)
              {
                v157 = 0;
                v158 = 1;
                do
                {
                  v159 = v101[v157];
                  if (v159 > 1)
                    goto LABEL_329;
                  *(_DWORD *)(v14 + 4 * v157) = v159;
                  v157 = v158;
                }
                while (v102 > v158++);
                v126 = v102;
              }
              else
              {
LABEL_298:
                v126 = 0;
              }
LABEL_299:
              v105 = v126 + v97;
              break;
            default:
              goto LABEL_343;
          }
LABEL_167:
          *(_QWORD *)((char *)v12 + v94) = v105;
          goto LABEL_235;
        }
      }
      else
      {
        v93 = *(_DWORD *)(v85 + 16);
      }
      if (v93 >= 0x11)
        sub_22AD7E154(v14, v17, v16);
      v94 = *(unsigned int *)(v85 + 20);
      v14 = sub_22AD399D4((uint64_t)&v83[32 * v82], (_QWORD *)(*v86 + *(_QWORD *)((char *)v12 + v94) * qword_22AD83710[v93]), (uint64_t)v8, 0);
      if (!(_DWORD)v14)
        goto LABEL_329;
      v105 = *(_QWORD *)((char *)v12 + v94) + 1;
      goto LABEL_167;
    }
LABEL_300:
    v78 = v180 + 1;
    v80 = v183;
    v79 = v176;
  }
  while (v180 + 1 <= v183);
  if (v183)
  {
    for (k = 1; k <= v183; ++k)
    {
      if ((&v185)[k])
        ((void (*)(uint64_t (*)(int, size_t)))v8[1])(v8[2]);
    }
  }
LABEL_314:
  if (v177 >= 0x88)
  {
    v65 = v178;
    if (v178)
LABEL_316:
      v8[1]((int)v8[2], (size_t)v65);
  }
  return v12;
}

uint64_t sub_22AD38ED0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 88))(a2);
}

_QWORD *sub_22AD38EDC(_QWORD *result, uint64_t (**a2)(int, size_t size))
{
  _QWORD *v2;
  _DWORD *v3;
  uint64_t (**v4)(int, size_t);
  unsigned int *v5;
  unint64_t i;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  unint64_t v10;
  int v11;
  uint64_t v13;
  unsigned int v14;
  BOOL v15;
  int v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;

  if (result)
  {
    v2 = result;
    v3 = (_DWORD *)*result;
    if (*(_DWORD *)*result != 682290937)
      sub_22AD7E380();
    if (a2)
      v4 = a2;
    else
      v4 = &off_255B50130;
    *result = 0;
    v5 = (unsigned int *)(result + 1);
    if (v3[12])
    {
      for (i = 0; i < v3[12]; ++i)
      {
        v7 = *((_QWORD *)v3 + 7);
        if ((*(_BYTE *)(v7 + 72 * i + 48) & 4) != 0
          && *(_DWORD *)(v7 + 72 * i + 8) != *(_DWORD *)((char *)v2 + *(unsigned int *)(v7 + 72 * i + 20)))
        {
          continue;
        }
        if (*(_DWORD *)(v7 + 72 * i + 12) == 2)
        {
          v8 = v7 + 72 * i;
          v9 = *(_QWORD *)((char *)v2 + *(unsigned int *)(v8 + 24));
          if (v9)
          {
            v10 = *(_QWORD *)((char *)v2 + *(unsigned int *)(v8 + 20));
            v11 = *(_DWORD *)(v7 + 72 * i + 16);
            if (v11 == 14)
            {
              if (v10)
              {
                v21 = 0;
                v22 = 1;
                do
                {
                  if (*(_QWORD *)(v9 + 8 * v21))
                    ((void (*)(uint64_t (*)(int, size_t)))v4[1])(v4[2]);
                  v21 = v22;
                  v15 = v10 > v22++;
                }
                while (v15);
              }
            }
            else if (v11 == 15)
            {
              if (v10)
              {
                v23 = 0;
                v24 = 1;
                do
                {
                  if (*(_QWORD *)(v9 + 16 * v23 + 8))
                    ((void (*)(uint64_t (*)(int, size_t)))v4[1])(v4[2]);
                  v23 = v24;
                  v15 = v10 > v24++;
                }
                while (v15);
              }
            }
            else if (v11 == 16 && v10 != 0)
            {
              v13 = 0;
              v14 = 1;
              do
              {
                sub_22AD38EDC(*(_QWORD *)(v9 + 8 * v13), v4);
                v13 = v14;
                v15 = v10 > v14++;
              }
              while (v15);
            }
            v4[1]((int)v4[2], v9);
          }
          continue;
        }
        v16 = *(_DWORD *)(v7 + 72 * i + 16);
        switch(v16)
        {
          case 16:
            v18 = *(_QWORD *)((char *)v2 + *(unsigned int *)(v7 + 72 * i + 24));
            if (v18 && v18 != *(_QWORD *)(v7 + 72 * i + 40))
              sub_22AD38EDC(v18, v4);
            continue;
          case 15:
            v19 = v7 + 72 * i;
            v17 = *(_QWORD *)((char *)v5 + *(unsigned int *)(v19 + 24));
            if (!v17)
              continue;
            v20 = *(_QWORD *)(v19 + 40);
            if (v20)
            {
              if (*(_QWORD *)(v20 + 8) == v17)
                continue;
            }
            break;
          case 14:
            v17 = *(_QWORD *)((char *)v2 + *(unsigned int *)(v7 + 72 * i + 24));
            if (!v17 || v17 == *(_QWORD *)(v7 + 72 * i + 40))
              continue;
            break;
          default:
            continue;
        }
        v4[1]((int)v4[2], v17);
      }
    }
    v25 = *v5;
    if ((_DWORD)v25)
    {
      v26 = 0;
      v27 = 16;
      do
      {
        if (*(_QWORD *)(v2[2] + v27))
        {
          ((void (*)(uint64_t (*)(int, size_t)))v4[1])(v4[2]);
          v25 = *v5;
        }
        ++v26;
        v27 += 24;
      }
      while (v26 < v25);
    }
    if (v2[2])
      ((void (*)(uint64_t (*)(int, size_t)))v4[1])(v4[2]);
    return (_QWORD *)v4[1]((int)v4[2], (size_t)v2);
  }
  return result;
}

uint64_t sub_22AD39180(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  int v7;
  int v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  BOOL v23;

  if (!result)
    return result;
  v1 = result;
  v2 = *(_QWORD *)result;
  if (!*(_QWORD *)result || *(_DWORD *)v2 != 682290937)
    return 0;
  v3 = *(unsigned int *)(v2 + 48);
  if (!(_DWORD)v3)
    return 1;
  v4 = 0;
  v5 = *(_QWORD *)(v2 + 56);
  while (1)
  {
    v6 = (_DWORD *)(v5 + 72 * v4);
    v8 = v6[3];
    v7 = v6[4];
    v9 = (uint64_t *)(v1 + v6[6]);
    if (v8 != 2)
    {
      if (v7 == 14)
      {
        v22 = *v9;
        if (v8)
          v23 = 0;
        else
          v23 = v22 == 0;
        if (v23)
          return 0;
      }
      else if (v7 == 15)
      {
        if ((!v8 || *(_DWORD *)(v1 + *(unsigned int *)(v5 + 72 * v4 + 20)) == 1) && *v9 && !v9[1])
          return 0;
      }
      else if (v7 == 16 && (!v8 || *v9 != 0))
      {
        result = ((uint64_t (*)(void))sub_22AD39180)();
        if (!(_DWORD)result)
          return result;
      }
      goto LABEL_47;
    }
    v10 = *(_QWORD *)(v1 + *(unsigned int *)(v5 + 72 * v4 + 20));
    if (v10 && !*v9)
      return 0;
    if (v7 == 14)
      break;
    if (v7 == 15)
    {
      if (v10)
      {
        v19 = 0;
        v20 = *v9;
        v21 = 1;
        while (!*(_QWORD *)(v20 + 16 * v19) || *(_QWORD *)(v20 + 16 * v19 + 8))
        {
          v19 = v21;
          v14 = v10 > v21++;
          if (!v14)
            goto LABEL_47;
        }
        return 0;
      }
    }
    else if (v7 == 16 && v10)
    {
      v11 = 0;
      v12 = *v9;
      v13 = 1;
      do
      {
        result = sub_22AD39180(*(_QWORD *)(v12 + 8 * v11));
        if (!(_DWORD)result)
          return result;
        v11 = v13;
        v14 = v10 > v13++;
      }
      while (v14);
    }
LABEL_47:
    ++v4;
    result = 1;
    if (v4 == v3)
      return result;
  }
  if (!v10)
    goto LABEL_47;
  v16 = 0;
  v17 = *v9;
  v18 = 1;
  while (*(_QWORD *)(v17 + 8 * v16))
  {
    v16 = v18;
    v14 = v10 > v18++;
    if (!v14)
      goto LABEL_47;
  }
  return 0;
}

uint64_t sub_22AD39358(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(*(_QWORD *)a1 + 40) <= a2)
    sub_22AD7E3A8();
  return (*(uint64_t (**)(void))(a1 + 8 * a2 + 24))();
}

void sub_22AD39390(_QWORD *a1, _DWORD *a2, uint64_t a3)
{
  if (*a2 != 336960451)
    sub_22AD7E3D0();
  *a1 = a2;
  a1[1] = sub_22AD39358;
  a1[2] = a3;
  bzero(a1 + 3, 8 * a2[10]);
}

uint64_t sub_22AD393D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_22AD393DC(uint64_t result, char *__s2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;

  if (result)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 64);
    if (v3)
    {
      v5 = *(_DWORD *)(result + 56);
      if (v5 >= 2)
      {
        LODWORD(v6) = 0;
        while (1)
        {
          v7 = v6 + (v5 >> 1);
          v8 = strcmp(*(const char **)(v3 + 16 * v7), __s2);
          if (!v8)
            return *(_QWORD *)(v2 + 48) + 24 * *(unsigned int *)(v3 + 16 * v7 + 8);
          v9 = v5 + v6 + ~(_DWORD)v7;
          if (v8 < 0)
            v6 = (v7 + 1);
          else
            v6 = v6;
          if (v8 >= 0)
            v5 >>= 1;
          else
            v5 = v9;
          if (v5 <= 1)
          {
            v7 = v6;
            if (v5)
              goto LABEL_16;
            return 0;
          }
        }
      }
      v7 = 0;
      if (v5)
      {
LABEL_16:
        if (!strcmp(*(const char **)(v3 + 16 * v7), __s2))
          return *(_QWORD *)(v2 + 48) + 24 * *(unsigned int *)(v3 + 16 * v7 + 8);
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_22AD394A8(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int *v9;
  int v10;
  int v11;
  unsigned int v12;

  v2 = *(_DWORD *)(a1 + 72);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(a1 + 80);
  if (v2 != 1)
  {
    v4 = 0;
    while (1)
    {
      v5 = v4 + (v2 >> 1);
      v6 = *(_DWORD *)(v3 + 8 * v5);
      v7 = a2 - v6;
      if (a2 >= v6)
      {
        v8 = *(_DWORD *)(v3 + 8 * v5 + 4);
        if (*(_DWORD *)(v3 + 8 * (v5 + 1) + 4) + v6 - v8 > a2)
        {
          v12 = v7 + v8;
          if (((v7 + v8) & 0x80000000) == 0)
            return *(_QWORD *)(a1 + 48) + 24 * v12;
          return 0;
        }
        v2 += v4 + ~(_DWORD)v5;
        v4 = v5 + 1;
      }
      else
      {
        v2 >>= 1;
      }
      if (v2 <= 1)
      {
        if (!v2)
          return 0;
        goto LABEL_11;
      }
    }
  }
  v4 = 0;
LABEL_11:
  v9 = (int *)(v3 + 8 * v4);
  v10 = *v9;
  if (*v9 > a2)
    return 0;
  v11 = v9[1];
  if (v10 - v11 + *(_DWORD *)(v3 + 8 * (v4 + 1) + 4) <= a2)
    return 0;
  v12 = v11 + a2 - v10;
  if ((v12 & 0x80000000) != 0)
    return 0;
  else
    return *(_QWORD *)(a1 + 48) + 24 * v12;
}

const char **sub_22AD39580(uint64_t a1, char *__s2)
{
  uint64_t v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  const char **v9;
  int v10;
  unsigned int v11;
  const char **v12;

  if (!a1)
    return 0;
  v3 = *(_QWORD *)(a1 + 64);
  if (!v3)
    return 0;
  v5 = *(_DWORD *)(a1 + 48);
  if (v5 < 2)
  {
    v6 = 0;
    if (v5)
    {
LABEL_14:
      v12 = (const char **)(*(_QWORD *)(a1 + 56) + 72 * *(unsigned int *)(v3 + 4 * v6));
      if (!strcmp(*v12, __s2))
        return v12;
      else
        return 0;
    }
    return 0;
  }
  LODWORD(v6) = 0;
  v7 = *(_QWORD *)(a1 + 56);
  while (1)
  {
    v8 = v6 + (v5 >> 1);
    v9 = (const char **)(v7 + 72 * *(unsigned int *)(v3 + 4 * v8));
    v10 = strcmp(*v9, __s2);
    if (!v10)
      return v9;
    v11 = v5 + v6 + ~v8;
    if (v10 < 0)
      v6 = v8 + 1;
    else
      v6 = v6;
    if (v10 >= 0)
      v5 >>= 1;
    else
      v5 = v11;
    if (v5 <= 1)
    {
      if (!v5)
        return 0;
      goto LABEL_14;
    }
  }
}

uint64_t sub_22AD39660(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int *v9;
  int v10;
  int v11;
  unsigned int v12;

  v2 = *(_DWORD *)(a1 + 72);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(a1 + 80);
  if (v2 != 1)
  {
    v4 = 0;
    while (1)
    {
      v5 = v4 + (v2 >> 1);
      v6 = *(_DWORD *)(v3 + 8 * v5);
      v7 = a2 - v6;
      if (a2 >= v6)
      {
        v8 = *(_DWORD *)(v3 + 8 * v5 + 4);
        if (*(_DWORD *)(v3 + 8 * (v5 + 1) + 4) + v6 - v8 > a2)
        {
          v12 = v7 + v8;
          if (((v7 + v8) & 0x80000000) == 0)
            return *(_QWORD *)(a1 + 56) + 72 * v12;
          return 0;
        }
        v2 += v4 + ~(_DWORD)v5;
        v4 = v5 + 1;
      }
      else
      {
        v2 >>= 1;
      }
      if (v2 <= 1)
      {
        if (!v2)
          return 0;
        goto LABEL_11;
      }
    }
  }
  v4 = 0;
LABEL_11:
  v9 = (int *)(v3 + 8 * v4);
  v10 = *v9;
  if (*v9 > a2)
    return 0;
  v11 = v9[1];
  if (v10 - v11 + *(_DWORD *)(v3 + 8 * (v4 + 1) + 4) <= a2)
    return 0;
  v12 = v11 + a2 - v10;
  if ((v12 & 0x80000000) != 0)
    return 0;
  else
    return *(_QWORD *)(a1 + 56) + 72 * v12;
}

const char **sub_22AD39738(uint64_t a1, char *__s2)
{
  uint64_t v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  const char **v9;
  int v10;
  const char **v11;

  if (!a1)
    return 0;
  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
    return 0;
  v5 = *(_DWORD *)(a1 + 40);
  if (v5 < 2)
  {
    v6 = 0;
    if (v5)
    {
LABEL_14:
      v11 = (const char **)(*(_QWORD *)(a1 + 48) + 24 * *(unsigned int *)(v3 + 4 * v6));
      if (!strcmp(*v11, __s2))
        return v11;
      else
        return 0;
    }
    return 0;
  }
  LODWORD(v6) = 0;
  v7 = *(_QWORD *)(a1 + 48);
  while (1)
  {
    v8 = v6 + (v5 >> 1);
    v9 = (const char **)(v7 + 24 * *(unsigned int *)(v3 + 4 * v8));
    v10 = strcmp(*v9, __s2);
    if (!v10)
      return v9;
    if (v10 >= 0)
      v5 >>= 1;
    else
      v5 += v6 + ~v8;
    if (v10 < 0)
      v6 = v8 + 1;
    else
      v6 = v6;
    if (v5 <= 1)
    {
      if (!v5)
        return 0;
      goto LABEL_14;
    }
  }
}

void *sub_22AD39818(int a1, size_t size)
{
  return malloc_type_malloc(size, 0xB182DB82uLL);
}

void sub_22AD39828(int a1, void *a2)
{
  free(a2);
}

uint64_t sub_22AD39830(unsigned int a1, _BYTE *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t result;

  if (a1 >> 29)
    return sub_22AD398C4(8 * a1, a2);
  LOBYTE(v2) = 8 * a1;
  if (a1 < 0x10)
  {
    v3 = 0;
  }
  else
  {
    *a2 = v2 | 0x80;
    v2 = a1 >> 4;
    if (a1 < 0x800)
    {
      v3 = 1;
    }
    else
    {
      a2[1] = v2 | 0x80;
      v2 = a1 >> 11;
      if (a1 < 0x40000)
      {
        v3 = 2;
      }
      else
      {
        a2[2] = v2 | 0x80;
        v2 = a1 >> 18;
        if (a1 >> 25)
        {
          a2[3] = v2 | 0x80;
          v3 = 4;
          v2 = a1 >> 25;
        }
        else
        {
          v3 = 3;
        }
      }
    }
  }
  result = v3 + 1;
  a2[v3] = v2;
  return result;
}

uint64_t sub_22AD398C4(unint64_t a1, _BYTE *a2)
{
  unint64_t v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;

  v2 = HIDWORD(a1);
  if (!HIDWORD(a1))
  {
    if (a1 >= 0x80)
    {
      *a2 = a1 | 0x80;
      v5 = a1 >> 7;
      if (a1 < 0x4000)
      {
        LODWORD(v4) = 1;
      }
      else
      {
        a2[1] = v5 | 0x80;
        v5 = a1 >> 14;
        if (a1 < 0x200000)
        {
          LODWORD(v4) = 2;
        }
        else
        {
          a2[2] = v5 | 0x80;
          v5 = a1 >> 21;
          LODWORD(a1) = a1 >> 28;
          if ((_DWORD)a1)
          {
            a2[3] = v5 | 0x80;
            LODWORD(v4) = 4;
LABEL_19:
            v3 = v4 + 1;
            goto LABEL_20;
          }
          LODWORD(v4) = 3;
        }
      }
      LOBYTE(a1) = v5;
      goto LABEL_19;
    }
    LODWORD(v4) = 0;
    goto LABEL_19;
  }
  *a2 = a1 | 0x80;
  a2[1] = (a1 >> 7) | 0x80;
  a2[2] = (a1 >> 14) | 0x80;
  a2[3] = (a1 >> 21) | 0x80;
  LODWORD(a1) = a1 >> 28;
  if (v2 >= 8)
  {
    a2[4] = a1 | 0x80;
    LODWORD(a1) = v2 >> 3;
    if (v2 < 0x400)
    {
      LODWORD(v4) = 5;
    }
    else
    {
      v4 = 5;
      do
      {
        a2[v4++] = a1 | 0x80;
        v6 = a1 >> 14;
        LODWORD(a1) = a1 >> 7;
      }
      while (v6);
    }
    goto LABEL_19;
  }
  v3 = 5;
  LODWORD(v4) = 4;
LABEL_20:
  a2[v4] = a1;
  return v3;
}

uint64_t sub_22AD399D4(uint64_t a1, _QWORD *a2, uint64_t a3, int a4)
{
  uint64_t v4;
  char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  char v15;
  int v16;
  uint64_t v17;
  size_t v18;
  uint64_t result;
  int v20;
  uint64_t v21;
  uint64_t v22;
  size_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  BOOL v28;

  v4 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  v8 = *(char **)(a1 + 24);
  v10 = *(unsigned __int8 *)(a1 + 4);
  switch(*(_DWORD *)(v4 + 16))
  {
    case 0:
    case 6:
    case 0xD:
      if (*(_BYTE *)(a1 + 4))
        return 0;
      LODWORD(v11) = *v8 & 0x7F;
      if (v9 >= 2)
      {
        LODWORD(v11) = *v8 & 0x7F | ((v8[1] & 0x7F) << 7);
        if ((_DWORD)v9 != 2)
        {
          LODWORD(v11) = *v8 & 0x7F | ((v8[1] & 0x7F) << 7) & 0x3FFF | ((v8[2] & 0x7F) << 14);
          if (v9 >= 4)
          {
            LODWORD(v11) = *v8 & 0x7F | ((v8[1] & 0x7F) << 7) & 0x3FFF | ((v8[2] & 0x7F) << 14) & 0xF01FFFFF | ((v8[3] & 0x7F) << 21);
            if ((_DWORD)v9 != 4)
              LODWORD(v11) = v11 | (v8[4] << 28);
          }
        }
      }
      goto LABEL_10;
    case 1:
      if (*(_BYTE *)(a1 + 4))
        return 0;
      v13 = *v8 & 0x7F;
      if (v9 >= 2)
      {
        v13 = *v8 & 0x7F | ((v8[1] & 0x7F) << 7);
        if ((_DWORD)v9 != 2)
        {
          v13 = *v8 & 0x7F | ((v8[1] & 0x7F) << 7) & 0x3FFF | ((v8[2] & 0x7F) << 14);
          if (v9 >= 4)
          {
            v13 = *v8 & 0x7F | ((v8[1] & 0x7F) << 7) & 0x3FFF | ((v8[2] & 0x7F) << 14) & 0xF01FFFFF | ((v8[3] & 0x7F) << 21);
            if ((_DWORD)v9 != 4)
              v13 |= v8[4] << 28;
          }
        }
      }
      LODWORD(v11) = -(v13 & 1) ^ (v13 >> 1);
      goto LABEL_10;
    case 2:
    case 7:
    case 0xA:
      if (v10 != 5)
        return 0;
      LODWORD(v11) = *(_DWORD *)v8;
      goto LABEL_10;
    case 3:
    case 8:
      if (*(_BYTE *)(a1 + 4))
        return 0;
      *a2 = sub_22AD39CC4(*(_QWORD *)(a1 + 16), v8);
      return 1;
    case 4:
      if (*(_BYTE *)(a1 + 4))
        return 0;
      v14 = sub_22AD39CC4(*(_QWORD *)(a1 + 16), v8);
      v12 = -(uint64_t)(v14 & 1) ^ (v14 >> 1);
      goto LABEL_13;
    case 5:
    case 9:
    case 0xB:
      if (v10 != 1)
        return 0;
      v12 = *(_QWORD *)v8;
LABEL_13:
      *a2 = v12;
      return 1;
    case 0xC:
      if ((_DWORD)v9)
      {
        v11 = *(_QWORD *)(a1 + 16);
        while (1)
        {
          v15 = *v8++;
          if ((v15 & 0x7F) != 0)
            break;
          if (!--v11)
            goto LABEL_10;
        }
        LODWORD(v11) = 1;
      }
      else
      {
        LODWORD(v11) = 0;
      }
LABEL_10:
      *(_DWORD *)a2 = v11;
      return 1;
    case 0xE:
      if (v10 != 2)
        return 0;
      v16 = *(unsigned __int8 *)(a1 + 5);
      if (a4)
      {
        v17 = *a2;
        if (*a2)
        {
          if (v17 != *(_QWORD *)(v4 + 40))
            (*(void (**)(_QWORD))(a3 + 8))(*(_QWORD *)(a3 + 16));
        }
      }
      v18 = (v9 - v16);
      result = (*(uint64_t (**)(_QWORD, _QWORD))a3)(*(_QWORD *)(a3 + 16), (v18 + 1));
      *a2 = result;
      if (!result)
        return result;
      memcpy((void *)result, &v8[v16], v18);
      *(_BYTE *)(*a2 + v18) = 0;
      return 1;
    case 0xF:
      if (v10 != 2)
        return 0;
      v20 = *(unsigned __int8 *)(a1 + 5);
      if (a4)
      {
        v21 = a2[1];
        if (v21)
        {
          v22 = *(_QWORD *)(v4 + 40);
          if (!v22 || v21 != *(_QWORD *)(v22 + 8))
            (*(void (**)(_QWORD))(a3 + 8))(*(_QWORD *)(a3 + 16));
        }
      }
      v23 = (v9 - v20);
      if ((_DWORD)v23)
      {
        result = (*(uint64_t (**)(_QWORD, size_t))a3)(*(_QWORD *)(a3 + 16), v23);
        a2[1] = result;
        if (!result)
          return result;
        memcpy((void *)result, &v8[v20], v23);
      }
      else
      {
        a2[1] = 0;
      }
      *a2 = v23;
      return 1;
    case 0x10:
      if (v10 != 2)
        return 0;
      v24 = *(_QWORD **)(v4 + 40);
      v25 = sub_22AD37E4C(*(_QWORD *)(v4 + 32), a3, v9 - *(unsigned __int8 *)(a1 + 5), &v8[*(unsigned __int8 *)(a1 + 5)]);
      if (a4)
      {
        v26 = (_QWORD *)*a2;
        v27 = 1;
        if (*a2 && v26 != v24)
        {
          if (v25)
          {
            v27 = sub_22AD39D58((uint64_t)v26, v25, a3);
            v26 = (_QWORD *)*a2;
          }
          sub_22AD38EDC(v26, (uint64_t (**)(int, size_t))a3);
        }
      }
      else
      {
        v27 = 1;
      }
      *a2 = v25;
      if (v25)
        v28 = v27 == 0;
      else
        v28 = 1;
      return !v28;
    default:
      return 0;
  }
}

unint64_t sub_22AD39CC4(unsigned int a1, _BYTE *a2)
{
  unint64_t result;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  LODWORD(result) = *a2 & 0x7F;
  if (a1 > 4)
  {
    result = *a2 & 0x7F | (unint64_t)(((a2[1] & 0x7F) << 7) & 0x3FFF) | ((unint64_t)(a2[2] & 0x7F) << 14) & 0xFFFFFFFFF01FFFFFLL | ((unint64_t)(a2[3] & 0x7F) << 21);
    v4 = a2 + 4;
    v5 = 7 * a1;
    v6 = 28;
    do
    {
      v7 = *v4++;
      result |= (unint64_t)(v7 & 0x7F) << v6;
      v6 += 7;
    }
    while (v5 != v6);
  }
  else
  {
    if (a1 >= 2)
    {
      LODWORD(result) = *a2 & 0x7F | ((a2[1] & 0x7F) << 7);
      if (a1 != 2)
      {
        LODWORD(result) = *a2 & 0x7F | ((a2[1] & 0x7F) << 7) & 0x3FFF | ((a2[2] & 0x7F) << 14);
        if (a1 >= 4)
          LODWORD(result) = *a2 & 0x7F | ((a2[1] & 0x7F) << 7) & 0x3FFF | ((a2[2] & 0x7F) << 14) & 0xF01FFFFF | ((a2[3] & 0x7F) << 21);
      }
    }
    return result;
  }
  return result;
}

uint64_t sub_22AD39D58(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  int v26;
  int *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  unsigned int v36;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v3 = *(_QWORD *)a2;
  if (*(_DWORD *)(*(_QWORD *)a2 + 48))
  {
    v5 = a2;
    v6 = result;
    v7 = 0;
    v8 = *(_QWORD *)(v3 + 56);
    do
    {
      v9 = *(_DWORD *)(v8 + 72 * v7 + 12);
      if (v9 == 1)
      {
        v18 = v8 + 72 * v7;
        v19 = *(unsigned int *)(v18 + 20);
        if ((*(_BYTE *)(v18 + 48) & 4) != 0)
        {
          if (*(_DWORD *)(v5 + v19))
            goto LABEL_21;
          v20 = *(_DWORD *)(v3 + 72);
          if (!v20)
            goto LABEL_31;
          v21 = *(_QWORD *)(v3 + 80);
          v22 = *(_DWORD *)(v6 + v19);
          if (v20 == 1)
          {
            v23 = 0;
          }
          else
          {
            v23 = 0;
            do
            {
              v24 = v23 + (v20 >> 1);
              v25 = *(_DWORD *)(v21 + 8 * v24);
              if (v22 >= v25)
              {
                v26 = *(_DWORD *)(v21 + 8 * v24 + 4);
                if (*(_DWORD *)(v21 + 8 * (v24 + 1) + 4) + v25 - v26 > v22)
                {
                  v29 = v22 - v25 + v26;
                  goto LABEL_36;
                }
                v20 += v23 + ~(_DWORD)v24;
                v23 = v24 + 1;
              }
              else
              {
                v20 >>= 1;
              }
            }
            while (v20 > 1);
            if (!v20)
              goto LABEL_31;
          }
          v27 = (int *)(v21 + 8 * v23);
          v28 = *v27;
          if (*v27 <= v22)
          {
            v30 = v27[1];
            v31 = v28 - v30 + *(_DWORD *)(v21 + 8 * (v23 + 1) + 4);
            v32 = v30 + v22 - v28;
            if (v31 > v22)
              v29 = v32;
            else
              v29 = -1;
          }
          else
          {
LABEL_31:
            v29 = -1;
          }
LABEL_36:
          v18 = *(_QWORD *)(v3 + 56) + 72 * v29;
        }
        v33 = *(unsigned int *)(v18 + 24);
        v34 = (_QWORD *)(v6 + v33);
        result = v5 + v33;
        v35 = *(_QWORD *)(v18 + 40);
        v36 = *(_DWORD *)(v18 + 16);
        switch(v36)
        {
          case 0xEu:
            if (*v34 != v35 && *(_QWORD *)result == v35)
            {
LABEL_49:
              v38 = 8;
              goto LABEL_65;
            }
            break;
          case 0xFu:
            v39 = v34[1];
            if (v39)
            {
              v40 = *(_QWORD *)(result + 8);
              if (v35)
              {
                v41 = *(_QWORD *)(v35 + 8);
                if (v39 != v41 && (!v40 || v40 == v41))
                {
LABEL_64:
                  v38 = 16;
LABEL_65:
                  memcpy((void *)result, v34, v38);
                  bzero(v34, v38);
                  if (*(_DWORD *)(v18 + 20))
                  {
                    *(_DWORD *)(v5 + v19) = *(_DWORD *)(v6 + v19);
                    *(_DWORD *)(v6 + v19) = 0;
                  }
                }
              }
              else if (!v40)
              {
                goto LABEL_64;
              }
            }
            break;
          case 0x10u:
            if (*v34)
            {
              if (!*(_QWORD *)result)
                goto LABEL_49;
              result = sub_22AD39D58(*v34, *(_QWORD *)result, a3);
              if (!(_DWORD)result)
                return result;
            }
            break;
          default:
            if (*(_DWORD *)(v6 + v19) && !*(_DWORD *)(v5 + v19))
            {
              if (v36 >= 0xE)
                sub_22AD7E154(result, a2, a3);
              v38 = qword_22AD83798[v36];
              goto LABEL_65;
            }
            break;
        }
      }
      else if (v9 == 2)
      {
        v10 = v8 + 72 * v7;
        v11 = *(unsigned int *)(v10 + 20);
        v12 = *(_QWORD *)(v6 + v11);
        if (v12)
        {
          v13 = *(unsigned int *)(v10 + 24);
          v14 = *(_QWORD *)(v5 + v11);
          if (v14)
          {
            v15 = *(int *)(v8 + 72 * v7 + 16);
            if (v15 >= 0x11)
              sub_22AD7E154(result, a2, a3);
            v16 = qword_22AD83710[v15];
            result = (*(uint64_t (**)(_QWORD, uint64_t))a3)(*(_QWORD *)(a3 + 16), v16 * (v14 + v12));
            if (!result)
              return result;
            v17 = result;
            memcpy((void *)result, *(const void **)(v6 + v13), *(_QWORD *)(v6 + v11) * v16);
            result = (uint64_t)memcpy((void *)(v17 + *(_QWORD *)(v6 + v11) * v16), *(const void **)(v5 + v13), *(_QWORD *)(v5 + v11) * v16);
            if (*(_QWORD *)(v5 + v13))
              result = (*(uint64_t (**)(_QWORD))(a3 + 8))(*(_QWORD *)(a3 + 16));
            a2 = *(_QWORD *)(v6 + v13);
            if (a2)
              result = (*(uint64_t (**)(_QWORD))(a3 + 8))(*(_QWORD *)(a3 + 16));
            *(_QWORD *)(v5 + v13) = v17;
            *(_QWORD *)(v5 + v11) += *(_QWORD *)(v6 + v11);
          }
          else
          {
            *(_QWORD *)(v5 + v11) = v12;
            *(_QWORD *)(v5 + v13) = *(_QWORD *)(v6 + v13);
          }
          *(_QWORD *)(v6 + v11) = 0;
          *(_QWORD *)(v6 + v13) = 0;
        }
      }
LABEL_21:
      ++v7;
      v3 = *(_QWORD *)v5;
    }
    while (v7 < *(unsigned int *)(*(_QWORD *)v5 + 48));
  }
  return 1;
}

void sub_22AD3A0A0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 1158, a4);
}

void *sub_22AD3A0A8(void *a1, id a2, size_t a3)
{
  void *IndexedIvars;
  void *v6;

  IndexedIvars = object_getIndexedIvars(a2);
  v6 = object_getIndexedIvars(a1);
  return memmove(IndexedIvars, v6, a3);
}

_QWORD *sub_22AD3A0F0(void *a1, uint64_t a2, const void *a3)
{
  const void *v6;
  _QWORD *result;

  v6 = (const void *)*((_QWORD *)object_getIndexedIvars(a1) + a2);
  if (v6)
    CFRelease(v6);
  if (a3)
    CFRetain(a3);
  result = object_getIndexedIvars(a1);
  result[a2] = a3;
  return result;
}

uint64_t sub_22AD3A144(void *a1, uint64_t a2)
{
  return *((_QWORD *)object_getIndexedIvars(a1) + a2);
}

uint64_t sub_22AD3A2C0(uint64_t a1)
{
  id v1;
  void *v2;
  const char *v3;
  double v4;
  double v5;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_255B51B08;
  qword_255B51B08 = (uint64_t)v1;

  objc_msgSend_setSubviews_((void *)qword_255B51B08, v3, v4, MEMORY[0x24BDBD1A8]);
  return MEMORY[0x24BEDD108](qword_255B51B08, sel_setConstraints_, v5);
}

void sub_22AD3A744(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  const char *v5;
  double v6;
  void *v7;
  objc_super v8;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v4 = a2;
  objc_msgSend_objectForKeyedSubscript_(v3, v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)TMLUITraitCollection;
  objc_msgSendSuper2(&v8, sel_setTMLValue_forKeyPath_, v7, v4);

}

uint64_t sub_22AD3AA80(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  int v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  void *v22;
  const char *v23;
  double v24;
  uint64_t v25;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend_preferredContentSizeCategories(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_preferredContentSizeCategories(v3, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preferredContentSizeCategory(*(void **)(a1 + 32), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_containsObject_(v9, v13, v14, v12);

    if (v15)
    {
      objc_msgSend_preferredContentSizeCategory(*(void **)(a1 + 32), v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPreferredContentSizeCategory_(v3, v19, v20, v18);

      goto LABEL_5;
    }
LABEL_6:
    v25 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v21 = *(void **)(a1 + 32);
  objc_msgSend_traitCollection(v3, v7, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_containsTraitsInCollection_(v21, v23, v24, v22);

LABEL_7:
  return v25;
}

uint64_t sub_22AD3AB7C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  uint64_t v10;

  v4 = a3;
  v7 = objc_msgSend_specificity(a2, v5, v6);
  v10 = objc_msgSend_specificity(v4, v8, v9);

  if (v7 == v10)
    return 0;
  else
    return ((v7 - v10) >> 63) | 1;
}

const CGPath *sub_22AD3AD80(CGFloat a1, CGFloat a2, uint64_t a3, void *a4, void *a5, CGLineCap a6, CGLineJoin a7)
{
  const CGPath *v12;
  id v13;
  const char *v14;
  const CGPath *v15;
  const CGPath *v16;
  const char *v17;
  double v18;
  const CGAffineTransform *v19;
  const CGPath *v20;
  CGAffineTransform v22;
  CGAffineTransform v23;

  v12 = a4;
  v13 = a5;
  objc_opt_class();
  v15 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_retainAutorelease(v12);
    v15 = (const CGPath *)objc_msgSend_CGPath(v16, v17, v18);
  }
  memset(&v23, 0, sizeof(v23));
  if (v13)
    objc_msgSend_transform(v13, v14, 0.0);
  v22 = v23;
  if (CGAffineTransformIsIdentity(&v22))
    v19 = 0;
  else
    v19 = &v23;
  v20 = CGPathCreateCopyByStrokingPath(v15, v19, a1, a6, a7, a2);

  return v20;
}

id sub_22AD3B254(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v7;
  const char *v8;
  double v9;
  CATransform3D v11;

  v7 = objc_alloc(*(Class *)(a1 + 32));
  CATransform3DMakeTranslation(&v11, a2, a3, a4);
  return (id)objc_msgSend_initWithTransform3D_(v7, v8, v9, &v11);
}

id sub_22AD3B2BC(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v7;
  const char *v8;
  double v9;
  CATransform3D v11;

  v7 = objc_alloc(*(Class *)(a1 + 32));
  CATransform3DMakeScale(&v11, a2, a3, a4);
  return (id)objc_msgSend_initWithTransform3D_(v7, v8, v9, &v11);
}

id sub_22AD3B324(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9;
  const char *v10;
  double v11;
  CATransform3D v13;

  v9 = objc_alloc(*(Class *)(a1 + 32));
  CATransform3DMakeRotation(&v13, a2, a3, a4, a5);
  return (id)objc_msgSend_initWithTransform3D_(v9, v10, v11, &v13);
}

id sub_22AD3B394(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  double v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  CATransform3D v15;
  CATransform3D a;
  CATransform3D v17;

  v5 = a2;
  v6 = a3;
  v8 = objc_alloc(*(Class *)(a1 + 32));
  if (!v5)
  {
    v10 = 0.0;
    memset(&a, 0, sizeof(a));
    if (v6)
      goto LABEL_3;
LABEL_5:
    memset(&v15, 0, sizeof(v15));
    goto LABEL_6;
  }
  objc_msgSend_transform(v5, v7, v9);
  if (!v6)
    goto LABEL_5;
LABEL_3:
  objc_msgSend_transform(v6, v7, v10);
LABEL_6:
  CATransform3DConcat(&v17, &a, &v15);
  v13 = (void *)objc_msgSend_initWithTransform3D_(v8, v11, v12, &v17);

  return v13;
}

id sub_22AD3B45C(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9;
  const char *v10;
  id v11;
  double v12;
  const char *v13;
  double v14;
  void *v15;
  CATransform3D v17;
  CATransform3D v18;

  v9 = a2;
  v11 = objc_alloc(*(Class *)(a1 + 32));
  if (v9)
    objc_msgSend_transform(v9, v10, v12);
  else
    memset(&v17, 0, sizeof(v17));
  CATransform3DTranslate(&v18, &v17, a3, a4, a5);
  v15 = (void *)objc_msgSend_initWithTransform3D_(v11, v13, v14, &v18);

  return v15;
}

id sub_22AD3B510(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9;
  const char *v10;
  id v11;
  double v12;
  const char *v13;
  double v14;
  void *v15;
  CATransform3D v17;
  CATransform3D v18;

  v9 = a2;
  v11 = objc_alloc(*(Class *)(a1 + 32));
  if (v9)
    objc_msgSend_transform(v9, v10, v12);
  else
    memset(&v17, 0, sizeof(v17));
  CATransform3DScale(&v18, &v17, a3, a4, a5);
  v15 = (void *)objc_msgSend_initWithTransform3D_(v11, v13, v14, &v18);

  return v15;
}

id sub_22AD3B5C4(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11;
  const char *v12;
  id v13;
  double v14;
  const char *v15;
  double v16;
  void *v17;
  CATransform3D v19;
  CATransform3D v20;

  v11 = a2;
  v13 = objc_alloc(*(Class *)(a1 + 32));
  if (v11)
    objc_msgSend_transform(v11, v12, v14);
  else
    memset(&v19, 0, sizeof(v19));
  CATransform3DRotate(&v20, &v19, a3, a4, a5, a6);
  v17 = (void *)objc_msgSend_initWithTransform3D_(v13, v15, v16, &v20);

  return v17;
}

id sub_22AD3B680(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  id v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  CATransform3D v11;
  CATransform3D v12;

  v3 = a2;
  v5 = objc_alloc(*(Class *)(a1 + 32));
  if (v3)
    objc_msgSend_transform(v3, v4, v6);
  else
    memset(&v11, 0, sizeof(v11));
  CATransform3DInvert(&v12, &v11);
  v9 = (void *)objc_msgSend_initWithTransform3D_(v5, v7, v8, &v12);

  return v9;
}

id sub_22AD3B70C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  id v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  CGAffineTransform v11;
  CATransform3D v12;

  v3 = a2;
  v5 = objc_alloc(*(Class *)(a1 + 32));
  if (v3)
    objc_msgSend_transform(v3, v4, v6);
  else
    memset(&v11, 0, sizeof(v11));
  CATransform3DMakeAffineTransform(&v12, &v11);
  v9 = (void *)objc_msgSend_initWithTransform3D_(v5, v7, v8, &v12);

  return v9;
}

uint64_t sub_22AD3B938(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t v10;

  v6 = a3;
  sub_22AD3BAE4();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_initWithImage_style_target_action_(a1, v8, v9, v6, a4, v7, sel_action_);

  return v10;
}

uint64_t sub_22AD3B9A0(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t v10;

  v6 = a3;
  sub_22AD3BAE4();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_initWithTitle_style_target_action_(a1, v8, v9, v6, a4, v7, sel_action_);

  return v10;
}

uint64_t sub_22AD3BA08(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  uint64_t v8;

  sub_22AD3BAE4();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_initWithBarButtonSystemItem_target_action_(a1, v6, v7, a3, v5, sel_action_);

  return v8;
}

uint64_t sub_22AD3BA60(void *a1)
{
  void *v2;
  const char *v3;
  double v4;
  double v5;

  sub_22AD3BAE4();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTarget_(a1, v3, v4, v2);

  return MEMORY[0x24BEDD108](a1, sel_setAction_, v5);
}

uint64_t sub_22AD3BAA4(void *a1, const char *a2, double a3)
{
  double v4;

  objc_msgSend_setTarget_(a1, a2, a3, 0);
  return MEMORY[0x24BEDD108](a1, sel_setAction_, v4);
}

id sub_22AD3BAE4()
{
  if (qword_255B51B20 != -1)
    dispatch_once(&qword_255B51B20, &unk_24F4FE718);
  return (id)qword_255B51B18;
}

void sub_22AD3BB24()
{
  TMLUIBarButtonItemActionTarget *v0;
  void *v1;

  v0 = objc_alloc_init(TMLUIBarButtonItemActionTarget);
  v1 = (void *)qword_255B51B18;
  qword_255B51B18 = (uint64_t)v0;

}

void sub_22AD3BBB8(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_setWithObject_(MEMORY[0x24BDBCF20], a3, a1, CFSTR("array"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255B51B28;
  qword_255B51B28 = v3;

}

id sub_22AD3C21C(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v9;
  const char *v10;

  v9 = objc_alloc(*(Class *)(a1 + 32));
  return (id)objc_msgSend_initWithInsets_(v9, v10, a2, a3, a4, a5);
}

BOOL sub_22AD3C268(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;

  v4 = a3;
  objc_msgSend_UIEdgeInsets(a2, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend_UIEdgeInsets(v4, v15, v7);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v10 == v19;
  if (v8 != v17)
    v24 = 0;
  if (v14 != v23)
    v24 = 0;
  return v12 == v21 && v24;
}

double sub_22AD3C3AC(uint64_t a1)
{
  double result;

  *(_OWORD *)(a1 + 64) = xmmword_24F4FE7F8;
  *(_OWORD *)(a1 + 80) = unk_24F4FE808;
  *(_QWORD *)(a1 + 96) = 0;
  *(_OWORD *)a1 = xmmword_24F4FE7B8;
  *(_OWORD *)(a1 + 16) = unk_24F4FE7C8;
  result = dbl_24F4FE7E8[0];
  *(_OWORD *)(a1 + 32) = xmmword_24F4FE7D8;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)dbl_24F4FE7E8;
  return result;
}

uint64_t sub_22AD3C3D8(void **a1)
{
  if (*a1 != &unk_24F4FE820)
    sub_22AD7E3F8();
  return sub_22AD35ABC((uint64_t)a1);
}

uint64_t sub_22AD3C400(void **a1, uint64_t a2, _BYTE *a3)
{
  if (*a1 != &unk_24F4FE820)
    sub_22AD7E420();
  return sub_22AD36420((uint64_t)a1, a2, a3);
}

uint64_t sub_22AD3C428(void **a1, void (**a2)(_QWORD, uint64_t, _BYTE *), uint64_t a3)
{
  if (*a1 != &unk_24F4FE820)
    sub_22AD7E448();
  return sub_22AD36F48(a1, a2, a3);
}

_QWORD *sub_22AD3C450(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_22AD37E4C((uint64_t)&unk_24F4FE820, a1, a2, a3);
}

_QWORD *sub_22AD3C468(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_24F4FE820)
    sub_22AD7E470();
  return sub_22AD38EDC(a1, a2);
}

double sub_22AD3C490(_OWORD *a1)
{
  double result;

  a1[4] = xmmword_24F4FE8D8;
  a1[5] = unk_24F4FE8E8;
  a1[6] = xmmword_24F4FE8F8;
  a1[7] = unk_24F4FE908;
  *a1 = xmmword_24F4FE898;
  a1[1] = unk_24F4FE8A8;
  result = 0.0;
  a1[2] = xmmword_24F4FE8B8;
  a1[3] = unk_24F4FE8C8;
  return result;
}

uint64_t sub_22AD3C4BC(void **a1)
{
  if (*a1 != &unk_24F4FE918)
    sub_22AD7E498();
  return sub_22AD35ABC((uint64_t)a1);
}

uint64_t sub_22AD3C4E4(void **a1, uint64_t a2, _BYTE *a3)
{
  if (*a1 != &unk_24F4FE918)
    sub_22AD7E4C0();
  return sub_22AD36420((uint64_t)a1, a2, a3);
}

uint64_t sub_22AD3C50C(void **a1, void (**a2)(_QWORD, uint64_t, _BYTE *), uint64_t a3)
{
  if (*a1 != &unk_24F4FE918)
    sub_22AD7E4E8();
  return sub_22AD36F48(a1, a2, a3);
}

_QWORD *sub_22AD3C534(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_22AD37E4C((uint64_t)&unk_24F4FE918, a1, a2, a3);
}

_QWORD *sub_22AD3C54C(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_24F4FE918)
    sub_22AD7E510();
  return sub_22AD38EDC(a1, a2);
}

double sub_22AD3C574(uint64_t a1)
{
  double result;

  *(_OWORD *)(a1 + 32) = xmmword_24F4FE9B0;
  *(_OWORD *)(a1 + 48) = unk_24F4FE9C0;
  *(_QWORD *)(a1 + 64) = 0;
  result = dbl_24F4FE9A0[0];
  *(_OWORD *)a1 = xmmword_24F4FE990;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)dbl_24F4FE9A0;
  return result;
}

uint64_t sub_22AD3C598(void **a1)
{
  if (*a1 != &unk_24F4FE9D8)
    sub_22AD7E538();
  return sub_22AD35ABC((uint64_t)a1);
}

uint64_t sub_22AD3C5C0(void **a1, uint64_t a2, _BYTE *a3)
{
  if (*a1 != &unk_24F4FE9D8)
    sub_22AD7E560();
  return sub_22AD36420((uint64_t)a1, a2, a3);
}

uint64_t sub_22AD3C5E8(void **a1, void (**a2)(_QWORD, uint64_t, _BYTE *), uint64_t a3)
{
  if (*a1 != &unk_24F4FE9D8)
    sub_22AD7E588();
  return sub_22AD36F48(a1, a2, a3);
}

_QWORD *sub_22AD3C610(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_22AD37E4C((uint64_t)&unk_24F4FE9D8, a1, a2, a3);
}

_QWORD *sub_22AD3C628(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_24F4FE9D8)
    sub_22AD7E5B0();
  return sub_22AD38EDC(a1, a2);
}

double sub_22AD3C650(_OWORD *a1)
{
  double result;

  *a1 = xmmword_24F4FEA50;
  a1[1] = unk_24F4FEA60;
  result = 0.0;
  a1[2] = xmmword_24F4FEA70;
  return result;
}

uint64_t sub_22AD3C66C(void **a1)
{
  if (*a1 != &unk_24F4FEA80)
    sub_22AD7E5D8();
  return sub_22AD35ABC((uint64_t)a1);
}

uint64_t sub_22AD3C694(void **a1, uint64_t a2, _BYTE *a3)
{
  if (*a1 != &unk_24F4FEA80)
    sub_22AD7E600();
  return sub_22AD36420((uint64_t)a1, a2, a3);
}

uint64_t sub_22AD3C6BC(void **a1, void (**a2)(_QWORD, uint64_t, _BYTE *), uint64_t a3)
{
  if (*a1 != &unk_24F4FEA80)
    sub_22AD7E628();
  return sub_22AD36F48(a1, a2, a3);
}

_QWORD *sub_22AD3C6E4(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_22AD37E4C((uint64_t)&unk_24F4FEA80, a1, a2, a3);
}

_QWORD *sub_22AD3C6FC(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_24F4FEA80)
    sub_22AD7E650();
  return sub_22AD38EDC(a1, a2);
}

double sub_22AD3C724(uint64_t a1)
{
  double result;

  *(_OWORD *)(a1 + 32) = xmmword_24F4FEB18;
  *(_OWORD *)(a1 + 48) = unk_24F4FEB28;
  *(_QWORD *)(a1 + 64) = 0;
  result = dbl_24F4FEB08[0];
  *(_OWORD *)a1 = xmmword_24F4FEAF8;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)dbl_24F4FEB08;
  return result;
}

uint64_t sub_22AD3C748(void **a1)
{
  if (*a1 != &unk_24F4FEB40)
    sub_22AD7E678();
  return sub_22AD35ABC((uint64_t)a1);
}

uint64_t sub_22AD3C770(void **a1, uint64_t a2, _BYTE *a3)
{
  if (*a1 != &unk_24F4FEB40)
    sub_22AD7E6A0();
  return sub_22AD36420((uint64_t)a1, a2, a3);
}

uint64_t sub_22AD3C798(void **a1, void (**a2)(_QWORD, uint64_t, _BYTE *), uint64_t a3)
{
  if (*a1 != &unk_24F4FEB40)
    sub_22AD7E6C8();
  return sub_22AD36F48(a1, a2, a3);
}

_QWORD *sub_22AD3C7C0(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_22AD37E4C((uint64_t)&unk_24F4FEB40, a1, a2, a3);
}

_QWORD *sub_22AD3C7D8(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_24F4FEB40)
    sub_22AD7E6F0();
  return sub_22AD38EDC(a1, a2);
}

double sub_22AD3C800(uint64_t a1)
{
  double result;

  *(_OWORD *)(a1 + 32) = xmmword_24F4FEBD8;
  *(_OWORD *)(a1 + 48) = unk_24F4FEBE8;
  *(_OWORD *)(a1 + 64) = xmmword_24F4FEBF8;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)&result = 0x24F4FEC10;
  *(_OWORD *)a1 = xmmword_24F4FEBB8;
  *(_OWORD *)(a1 + 16) = unk_24F4FEBC8;
  return result;
}

double sub_22AD3C82C(_OWORD *a1)
{
  double result;

  a1[6] = xmmword_24F4FECE8;
  a1[7] = unk_24F4FECF8;
  a1[8] = xmmword_24F4FED08;
  a1[9] = unk_24F4FED18;
  a1[2] = xmmword_24F4FECA8;
  a1[3] = unk_24F4FECB8;
  a1[4] = xmmword_24F4FECC8;
  a1[5] = unk_24F4FECD8;
  *(_QWORD *)&result = 0x24F4FED28;
  *a1 = xmmword_24F4FEC88;
  a1[1] = unk_24F4FEC98;
  return result;
}

uint64_t sub_22AD3C860(void **a1)
{
  if (*a1 != &unk_24F4FED28)
    sub_22AD7E718();
  return sub_22AD35ABC((uint64_t)a1);
}

uint64_t sub_22AD3C888(void **a1, uint64_t a2, _BYTE *a3)
{
  if (*a1 != &unk_24F4FED28)
    sub_22AD7E740();
  return sub_22AD36420((uint64_t)a1, a2, a3);
}

uint64_t sub_22AD3C8B0(void **a1, void (**a2)(_QWORD, uint64_t, _BYTE *), uint64_t a3)
{
  if (*a1 != &unk_24F4FED28)
    sub_22AD7E768();
  return sub_22AD36F48(a1, a2, a3);
}

_QWORD *sub_22AD3C8D8(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_22AD37E4C((uint64_t)&unk_24F4FED28, a1, a2, a3);
}

_QWORD *sub_22AD3C8F0(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_24F4FED28)
    sub_22AD7E790();
  return sub_22AD38EDC(a1, a2);
}

double sub_22AD3C918(uint64_t a1)
{
  double result;

  *(_QWORD *)&result = 0x24F4FEDC8;
  *(_OWORD *)a1 = xmmword_24F4FEDA0;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)algn_24F4FEDB0;
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

uint64_t sub_22AD3C934(void **a1)
{
  if (*a1 != &unk_24F4FEDC8)
    sub_22AD7E7B8();
  return sub_22AD35ABC((uint64_t)a1);
}

uint64_t sub_22AD3C95C(void **a1, uint64_t a2, _BYTE *a3)
{
  if (*a1 != &unk_24F4FEDC8)
    sub_22AD7E7E0();
  return sub_22AD36420((uint64_t)a1, a2, a3);
}

uint64_t sub_22AD3C984(void **a1, void (**a2)(_QWORD, uint64_t, _BYTE *), uint64_t a3)
{
  if (*a1 != &unk_24F4FEDC8)
    sub_22AD7E808();
  return sub_22AD36F48(a1, a2, a3);
}

_QWORD *sub_22AD3C9AC(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_22AD37E4C((uint64_t)&unk_24F4FEDC8, a1, a2, a3);
}

_QWORD *sub_22AD3C9C4(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_24F4FEDC8)
    sub_22AD7E830();
  return sub_22AD38EDC(a1, a2);
}

double sub_22AD3C9EC(uint64_t a1)
{
  double result;

  *(_OWORD *)a1 = xmmword_24F4FEE40;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)algn_24F4FEE50;
  result = 0.0;
  *(_OWORD *)(a1 + 32) = xmmword_24F4FEE60;
  *(_QWORD *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_22AD3CA10(void **a1)
{
  if (*a1 != &unk_24F4FEE78)
    sub_22AD7E858();
  return sub_22AD35ABC((uint64_t)a1);
}

uint64_t sub_22AD3CA38(void **a1, uint64_t a2, _BYTE *a3)
{
  if (*a1 != &unk_24F4FEE78)
    sub_22AD7E880();
  return sub_22AD36420((uint64_t)a1, a2, a3);
}

uint64_t sub_22AD3CA60(void **a1, void (**a2)(_QWORD, uint64_t, _BYTE *), uint64_t a3)
{
  if (*a1 != &unk_24F4FEE78)
    sub_22AD7E8A8();
  return sub_22AD36F48(a1, a2, a3);
}

_QWORD *sub_22AD3CA88(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_22AD37E4C((uint64_t)&unk_24F4FEE78, a1, a2, a3);
}

_QWORD *sub_22AD3CAA0(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_24F4FEE78)
    sub_22AD7E8D0();
  return sub_22AD38EDC(a1, a2);
}

double sub_22AD3CAC8(_OWORD *a1)
{
  double result;

  *a1 = xmmword_24F4FEEF0;
  a1[1] = unk_24F4FEF00;
  result = 0.0;
  a1[2] = xmmword_24F4FEF10;
  return result;
}

uint64_t sub_22AD3CAE4(void **a1)
{
  if (*a1 != &unk_24F4FEF20)
    sub_22AD7E8F8();
  return sub_22AD35ABC((uint64_t)a1);
}

uint64_t sub_22AD3CB0C(void **a1, uint64_t a2, _BYTE *a3)
{
  if (*a1 != &unk_24F4FEF20)
    sub_22AD7E920();
  return sub_22AD36420((uint64_t)a1, a2, a3);
}

uint64_t sub_22AD3CB34(void **a1, void (**a2)(_QWORD, uint64_t, _BYTE *), uint64_t a3)
{
  if (*a1 != &unk_24F4FEF20)
    sub_22AD7E948();
  return sub_22AD36F48(a1, a2, a3);
}

_QWORD *sub_22AD3CB5C(uint64_t (**a1)(int, size_t size), unint64_t a2, char *a3)
{
  return sub_22AD37E4C((uint64_t)&unk_24F4FEF20, a1, a2, a3);
}

_QWORD *sub_22AD3CB74(void **a1, uint64_t (**a2)(int, size_t size))
{
  if (*a1 != &unk_24F4FEF20)
    sub_22AD7E970();
  return sub_22AD38EDC(a1, a2);
}

void sub_22AD3CE68(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  id v12;

  v6 = (void *)MEMORY[0x24BDD1798];
  objc_msgSend_objectForKeyedSubscript_(a2, (const char *)a2, a4, CFSTR("regex"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_regularExpressionWithPattern_options_error_(v6, v7, v8, v12, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 32), v10, v11, v9, a3);

}

void sub_22AD3D51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AD3D55C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22AD3D56C(uint64_t a1)
{

}

uint64_t sub_22AD3D574(uint64_t a1, void *a2, char a3)
{
  __int128 v3;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char v9;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_22AD3D5D8;
  v5[3] = &unk_24F500020;
  v9 = a3;
  v8 = *(_QWORD *)(a1 + 64);
  v3 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 32);
  v7 = v3;
  return objc_msgSend_enumerateObjectsUsingBlock_(a2, (const char *)a2, *(double *)&v6, v5);
}

void sub_22AD3D5D8(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  id v24;

  v24 = a2;
  objc_msgSend_replacestring_usingRule_atIndex_additonalRules_(*(void **)(a1 + 32), v3, v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v5, v6, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) & 1) == 0)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend_objectForKeyedSubscript_(v24, v8, v9, CFSTR("tag"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_intValue(v10, v11, v12) == 5)
      {
        objc_msgSend_objectForKey_(**(void ***)(a1 + 64), v13, v14, CFSTR("sup"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          objc_msgSend_addEntriesFromDictionary_(*(void **)(*(_QWORD *)(a1 + 32) + 24), v8, v9, &unk_24F534AC0);
        }
      }
      else
      {

      }
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend_objectForKeyedSubscript_(v24, v8, v9, CFSTR("tag"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_intValue(v16, v17, v18) == 6)
      {
        objc_msgSend_objectForKey_(**(void ***)(a1 + 64), v19, v20, CFSTR("sub"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          objc_msgSend_addEntriesFromDictionary_(*(void **)(*(_QWORD *)(a1 + 32) + 24), v22, v23, &unk_24F534B10);
        }
      }
      else
      {

      }
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
  }

}

void sub_22AD3E088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_22AD3E0B8(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  id v18;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v18 = a3;
  v6 = a2;
  objc_msgSend_setObject_forKeyedSubscript_(v5, v7, v8, MEMORY[0x24BDBD1C8], CFSTR("open"));
  objc_msgSend_objectForKeyedSubscript_(v6, v9, v10, CFSTR("tag"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 32) + 32), v12, v13, v11, CFSTR("type"));
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 32) + 32), v14, v15, &unk_24F532A90, CFSTR("count"));
  objc_msgSend_insertString_atIndex_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v16, v17, v18, 0);

}

void sub_22AD3E438(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend_objectForKeyedSubscript_(v3, v4, v5, CFSTR("replace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v7, v8, CFSTR("regex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend_count(v6, v10, v11))
      {
        v14 = *(void **)(a1 + 32);
        v18[0] = CFSTR("regex");
        v18[1] = CFSTR("tag");
        v19[0] = v9;
        v19[1] = &unk_24F532AA8;
        v18[2] = CFSTR("replace");
        v19[2] = v6;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, v13, v19, v18, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v14, v16, v17, v15);

      }
    }
  }

}

void sub_22AD3EF18(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_setWithObject_(MEMORY[0x24BDBCF20], a3, a1, CFSTR("rawJSON"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255B51B38;
  qword_255B51B38 = v3;

}

uint64_t sub_22AD3F104(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_internalValidateJSON_completion_(*(void **)(a1 + 32), a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t sub_22AD3F30C(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4;
  uint64_t result;

  v4 = objc_msgSend_internalSetJSON_(*(void **)(a1 + 32), a2, a3, *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  return result;
}

void sub_22AD3F460(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  double v8;
  id v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v9 = 0;
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], a2, a3, v4, 1, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  objc_msgSend_validateJSON_completion_(*(void **)(a1 + 32), v7, v8, v5, &unk_24F5000D0);

}

void sub_22AD3F730(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  void *v11;
  double v12;
  TMLJSONObjectDerived *v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  id v18;

  v18 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 32), v5, v6, v18, a3);
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, v6, CFSTR("%@.@%lu"), *(_QWORD *)(a1 + 40), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 48) + 16), v8, v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v13 = [TMLJSONObjectDerived alloc];
      v11 = (void *)objc_msgSend_initWithParent_keyPath_(v13, v14, v15, *(_QWORD *)(a1 + 48), v7);
      objc_msgSend_setObject_forKey_(*(void **)(*(_QWORD *)(a1 + 48) + 16), v16, v17, v11, v7);
    }
    objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 32), v10, v12, v11, a3);

  }
}

void sub_22AD3FA84(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  void *v11;
  double v12;
  TMLJSONObjectDerived *v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  id v18;

  v18 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 32), v5, v6, v18, a3);
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, v6, CFSTR("%@.@%lu"), *(_QWORD *)(a1 + 40), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 48) + 16), v8, v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v13 = [TMLJSONObjectDerived alloc];
      v11 = (void *)objc_msgSend_initWithParent_keyPath_(v13, v14, v15, *(_QWORD *)(a1 + 48), v7);
      objc_msgSend_setObject_forKey_(*(void **)(*(_QWORD *)(a1 + 48) + 16), v16, v17, v11, v7);
    }
    objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 32), v10, v12, v11, a3);

  }
}

void sub_22AD3FDAC(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  void *v4;
  const char *v5;
  double v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], a3, a1, CFSTR("@"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255B51B48;
  qword_255B51B48 = v3;

  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], v5, v6, CFSTR("."));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_255B51B50;
  qword_255B51B50 = v7;

}

void sub_22AD3FFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AD40010(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22AD40020(uint64_t a1)
{

}

void sub_22AD40028(_QWORD *a1, void *a2, _BYTE *a3)
{
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  void *v12;
  const char *v13;
  double v14;
  int isEqualToString;
  id v16;

  v16 = a2;
  objc_msgSend_targetUnsafe(v16, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  if (v8 == (void *)a1[4])
  {
    objc_msgSend_keyPath(v16, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v12, v13, v14, a1[5]);

    if (isEqualToString)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
      *a3 = 1;
    }
  }
  else
  {

  }
}

void sub_22AD40780(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen(a838477761ygsql);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, a838477761ygsql, v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

void sub_22AD41AF4(double a1, uint64_t a2, const char *a3)
{
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;
  const char *v49;
  double v50;
  const char *v51;
  double v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  const char *v57;
  double v58;
  const char *v59;
  double v60;
  const char *v61;
  double v62;
  const char *v63;
  double v64;
  const char *v65;
  double v66;
  const char *v67;
  double v68;
  const char *v69;
  double v70;
  const char *v71;
  double v72;
  const char *v73;
  double v74;
  const char *v75;
  double v76;
  const char *v77;
  double v78;
  const char *v79;
  double v80;
  const char *v81;
  double v82;
  const char *v83;
  double v84;
  const char *v85;
  double v86;
  const char *v87;
  double v88;
  const char *v89;
  double v90;
  const char *v91;
  double v92;
  const char *v93;
  double v94;
  const char *v95;
  double v96;
  const char *v97;
  double v98;
  const char *v99;
  double v100;
  void *v101;
  const char *v102;
  double v103;
  void *v104;
  const char *v105;
  double v106;
  void *v107;
  const char *v108;
  double v109;
  void *v110;
  const char *v111;
  double v112;
  void *v113;
  const char *v114;
  double v115;
  void *v116;
  const char *v117;
  double v118;
  void *v119;
  const char *v120;
  double v121;
  void *v122;
  const char *v123;
  double v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  _QWORD v176[58];
  _QWORD v177[60];

  v177[58] = *MEMORY[0x24BDAC8D0];
  v176[0] = CFSTR("optional");
  v177[0] = &unk_24F500208;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a3, a1, "v");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v176[1] = v175;
  v177[1] = &unk_24F500228;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v3, v4, CFSTR("%s%s"), "v", "@");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v176[2] = v174;
  v177[2] = &unk_24F500248;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, v6, CFSTR("%s%s"), "v", "B");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v176[3] = v173;
  v177[3] = &unk_24F500268;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, v8, CFSTR("%s%s"), "v", "f");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v176[4] = v172;
  v177[4] = &unk_24F500288;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, v10, CFSTR("%s%s"), "v", "d");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v176[5] = v171;
  v177[5] = &unk_24F5002A8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, v12, CFSTR("%s%s"), "v", "q");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v176[6] = v170;
  v177[6] = &unk_24F5002C8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, v14, CFSTR("%s%s"), "v", "Q");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v176[7] = v169;
  v177[7] = &unk_24F5002E8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, v16, CFSTR("%s%s"), "v", "I");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v176[8] = v168;
  v177[8] = &unk_24F500308;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, v18, CFSTR("%s%s"), "v", "{CGSize=dd}");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v176[9] = v167;
  v177[9] = &unk_24F500328;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, v20, CFSTR("%s%s"), "v", "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v176[10] = v166;
  v177[10] = &unk_24F500348;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v21, v22, CFSTR("%s%s"), "v", "{CGPoint=dd}");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v176[11] = v165;
  v177[11] = &unk_24F500368;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v23, v24, CFSTR("%s%s"), "v", "{CGAffineTransform=dddddd}");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v176[12] = v164;
  v177[12] = &unk_24F500388;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, v26, CFSTR("%s%s"), "v", "{CATransform3D=dddddddddddddddd}");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v176[13] = v163;
  v177[13] = &unk_24F5003A8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v27, v28, CFSTR("%s%s"), "v", "{UIEdgeInsets=dddd}");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v176[14] = v162;
  v177[14] = &unk_24F5003C8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v29, v30, CFSTR("%s%s"), "v", "{_NSRange=QQ}");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v176[15] = v161;
  v177[15] = &unk_24F5003E8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v31, v32, CFSTR("%s%s"), "v", "{?=qiIq}");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v176[16] = v160;
  v177[16] = &unk_24F500408;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v33, v34, CFSTR("%s%s%s"), "v", "@", "@");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v176[17] = v159;
  v177[17] = &unk_24F500428;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v35, v36, CFSTR("%s%s%s%s"), "v", "@", "@", "@");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v176[18] = v158;
  v177[18] = &unk_24F500448;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v37, v38, CFSTR("%s%s%s%s"), "v", "@", "B", "@");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v176[19] = v157;
  v177[19] = &unk_24F500468;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v39, v40, CFSTR("%s%s%s%s"), "v", "{?=qiIq}", "{?=qiIq}", "{?=qiIq}");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v176[20] = v156;
  v177[20] = &unk_24F500488;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v41, v42, CFSTR("%s%s%s%s%s"), "v", "@", "@", "@", "@");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v176[21] = v155;
  v177[21] = &unk_24F5004A8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v43, v44, CFSTR("%s%s%s"), "v", "f", "q");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v176[22] = v154;
  v177[22] = &unk_24F5004C8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v45, v46, CFSTR("%s%s%s"), "v", "@", "I");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v176[23] = v153;
  v177[23] = &unk_24F5004E8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v47, v48, CFSTR("%s%s%s"), "v", "Q", "@");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v176[24] = v152;
  v177[24] = &unk_24F500508;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v49, v50, CFSTR("%s%s%s"), "v", "q", "@");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v176[25] = v151;
  v177[25] = &unk_24F500528;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v51, v52, CFSTR("%s%s%s"), "v", "d", "B");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v176[26] = v150;
  v177[26] = &unk_24F500548;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v53, v54, "@");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v176[27] = v149;
  v177[27] = &unk_24F500568;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v55, v56, CFSTR("%s%s"), "@", "@");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v176[28] = v148;
  v177[28] = &unk_24F500588;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v57, v58, CFSTR("%s%s"), "@", "B");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v176[29] = v147;
  v177[29] = &unk_24F5005A8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v59, v60, CFSTR("%s%s"), "@", "f");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v176[30] = v146;
  v177[30] = &unk_24F5005C8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v61, v62, CFSTR("%s%s"), "@", "d");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v176[31] = v145;
  v177[31] = &unk_24F5005E8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v63, v64, CFSTR("%s%s"), "@", "q");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v176[32] = v144;
  v177[32] = &unk_24F500608;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v65, v66, CFSTR("%s%s"), "@", "Q");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v176[33] = v143;
  v177[33] = &unk_24F500628;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v67, v68, CFSTR("%s%s"), "@", "I");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v176[34] = v142;
  v177[34] = &unk_24F500648;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v69, v70, CFSTR("%s%s"), "@", "{CGSize=dd}");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v176[35] = v141;
  v177[35] = &unk_24F500668;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v71, v72, CFSTR("%s%s"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v176[36] = v140;
  v177[36] = &unk_24F500688;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v73, v74, CFSTR("%s%s"), "@", "{CGPoint=dd}");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v176[37] = v139;
  v177[37] = &unk_24F5006A8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v75, v76, CFSTR("%s%s"), "@", "{CGAffineTransform=dddddd}");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v176[38] = v138;
  v177[38] = &unk_24F5006C8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v77, v78, CFSTR("%s%s"), "@", "{CATransform3D=dddddddddddddddd}");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v176[39] = v137;
  v177[39] = &unk_24F5006E8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v79, v80, CFSTR("%s%s"), "@", "{UIEdgeInsets=dddd}");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v176[40] = v136;
  v177[40] = &unk_24F500708;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v81, v82, CFSTR("%s%s"), "@", "{_NSRange=QQ}");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v176[41] = v135;
  v177[41] = &unk_24F500728;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v83, v84, CFSTR("%s%s"), "@", "^{CGPath=}");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v176[42] = v134;
  v177[42] = &unk_24F500748;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v85, v86, CFSTR("%s%s%s"), "@", "@", "@");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v176[43] = v133;
  v177[43] = &unk_24F500768;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v87, v88, CFSTR("%s%s%s"), "@", "@", "d");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v176[44] = v132;
  v177[44] = &unk_24F500788;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v89, v90, CFSTR("%s%s%s%s"), "@", "@", "@", "@");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v176[45] = v131;
  v177[45] = &unk_24F5007A8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v91, v92, CFSTR("%s%s%s%s%s"), "@", "@", "@", "@", "@");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v176[46] = v130;
  v177[46] = &unk_24F5007C8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v93, v94, CFSTR("%s%s%s%s%s%s"), "@", "{CGPoint=dd}", "d", "d", "d", "B");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v176[47] = v129;
  v177[47] = &unk_24F5007E8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v95, v96, CFSTR("%s%s%s"), "@", "Q", "@");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v176[48] = v128;
  v177[48] = &unk_24F500808;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v97, v98, "^{CGPath=}");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v176[49] = v127;
  v177[49] = &unk_24F500828;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v99, v100, "^{CGColor=}");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v176[50] = v101;
  v177[50] = &unk_24F500848;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v102, v103, "^{CGImage=}");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v176[51] = v104;
  v177[51] = &unk_24F500868;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v105, v106, "{CGSize=dd}");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v176[52] = v107;
  v177[52] = &unk_24F500888;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v108, v109, "B");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v176[53] = v110;
  v177[53] = &unk_24F5008A8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v111, v112, CFSTR("%s%s"), "{CGSize=dd}", "{CGSize=dd}");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v176[54] = v113;
  v177[54] = &unk_24F5008C8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v114, v115, CFSTR("%s%s"), "B", "d");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v176[55] = v116;
  v177[55] = &unk_24F5008E8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v117, v118, CFSTR("%s%s"), "d", "@");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v176[56] = v119;
  v177[56] = &unk_24F500908;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v120, v121, CFSTR("%s%s%s"), "d", "d", "@");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v176[57] = v122;
  v177[57] = &unk_24F500928;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v123, v124, v177, v176, 58);
  v125 = objc_claimAutoreleasedReturnValue();
  v126 = (void *)qword_255B51B68;
  qword_255B51B68 = v125;

}

uint64_t sub_22AD427A0()
{
  return 0;
}

uint64_t sub_22AD427A8(int a1, id a2, SEL a3)
{
  objc_msgSend(a2, a3);
  return 0;
}

uint64_t sub_22AD427C8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  void *v16;

  v6 = a2;
  v7 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v14)
  {
    objc_msgSend(v6, a3, 0);
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, a3, v16);

  }
  return 0;
}

uint64_t sub_22AD42884(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, a3, objc_msgSend_BOOLValue(v9, v10, v11));

  return 0;
}

uint64_t sub_22AD428E8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v9, v10, v11);
  objc_msgSend(v6, a3);

  return 0;
}

uint64_t sub_22AD42948(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v9, v10, v11);
  objc_msgSend(v6, a3);

  return 0;
}

uint64_t sub_22AD429A8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, a3, objc_msgSend_integerValue(v9, v10, v11));

  return 0;
}

uint64_t sub_22AD42A0C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, a3, objc_msgSend_unsignedIntegerValue(v9, v10, v11));

  return 0;
}

uint64_t sub_22AD42A70(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, a3, objc_msgSend_unsignedIntValue(v9, v10, v11));

  return 0;
}

uint64_t sub_22AD42AD4(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGSizeValue(v9, v10, v11);
  objc_msgSend(v6, a3);

  return 0;
}

uint64_t sub_22AD42B34(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v9, v10, v11);
  objc_msgSend(v6, a3);

  return 0;
}

uint64_t sub_22AD42B94(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGPointValue(v9, v10, v11);
  objc_msgSend(v6, a3);

  return 0;
}

uint64_t sub_22AD42BF4(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  _OWORD v14[3];

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9)
    objc_msgSend_CGAffineTransformValue(v9, v10, v11);
  else
    memset(v14, 0, sizeof(v14));
  objc_msgSend(v6, a3, v14);

  return 0;
}

uint64_t sub_22AD42C7C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  _OWORD v14[8];

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9)
    objc_msgSend_CATransform3DValue(v9, v10, v11);
  else
    memset(v14, 0, sizeof(v14));
  objc_msgSend(v6, a3, v14);

  return 0;
}

uint64_t sub_22AD42D0C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UIEdgeInsetsValue(v9, v10, v11);
  objc_msgSend(v6, a3);

  return 0;
}

uint64_t sub_22AD42D6C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_rangeValue(v9, v10, v11);
  objc_msgSend(v6, a3, v12, v13);

  return 0;
}

uint64_t sub_22AD42DD4(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  _QWORD v14[3];

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9)
    objc_msgSend_CMTimeValue(v9, v10, v11);
  else
    memset(v14, 0, sizeof(v14));
  objc_msgSend(v6, a3, v14);

  return 0;
}

uint64_t sub_22AD42E58(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  const char *v20;
  void *v21;
  double v22;
  void *v23;

  v6 = a2;
  v7 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v14)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v21)
  {
    objc_msgSend(v6, a3, v16, 0);
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v20, v22, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, a3, v16, v23);

  }
  if (v10 != v14)

  return 0;
}

uint64_t sub_22AD42F88(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  void *v26;
  double v27;
  void *v28;
  const char *v31;
  id v32;

  v32 = a2;
  v5 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v5, v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v12)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v11, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v5, v11, v13, 2, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == v19)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v18, v20, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v5, v18, v20, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v23, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 == v26)
  {
    objc_msgSend(v32, v31, v14, v21, 0);
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v25, v27, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, v31, v14, v21, v28);

  }
  if (v15 != v19)

  if (v8 != v12)
  return 0;
}

uint64_t sub_22AD43120(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  void *v26;
  double v27;
  void *v28;

  v5 = a2;
  v6 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v6, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v13)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_BOOLValue(v16, v17, v18);
  objc_msgSend_objectAtIndexedSubscript_(v6, v20, v21, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v23, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 == v26)
  {
    objc_msgSend(v5, a3, v15, v19, 0);
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v25, v27, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, a3, v15, v19, v28);

  }
  if (v9 != v13)

  return 0;
}

uint64_t sub_22AD43280(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];

  v6 = a2;
  v7 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (v10)
    objc_msgSend_CMTimeValue(v10, v11, v12);
  else
    memset(v25, 0, sizeof(v25));
  objc_msgSend_objectAtIndexedSubscript_(v7, v11, v12, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  if (v14)
    objc_msgSend_CMTimeValue(v14, v15, v16);
  else
    memset(v24, 0, sizeof(v24));
  objc_msgSend_objectAtIndexedSubscript_(v7, v15, v16, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18;
  if (v18)
    objc_msgSend_CMTimeValue(v18, v19, v20);
  else
    memset(v23, 0, sizeof(v23));
  objc_msgSend(v6, a3, v25, v24, v23);

  return 0;
}

uint64_t sub_22AD43384(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  void *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  const char *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  const char *v29;
  double v30;
  const char *v31;
  void *v32;
  double v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v44 = a2;
  v6 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v6, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v13)
  {
    v43 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v15 == (void *)v19)
  {
    v42 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v18, v20, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v6, v18, v20, 3, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 == v25)
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v24, v26, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v6, v24, v26, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 == v32)
  {
    objc_msgSend(v44, a3, v43, v42, v27, 0);
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v31, v33, 4);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = a3;
    v36 = v15;
    v37 = v13;
    v38 = v9;
    v39 = (void *)v34;
    objc_msgSend(v44, v35, v43, v42, v27, v34);

    v9 = v38;
    v13 = v37;
    v15 = v36;
  }

  if (v21 != v25)
  if (v15 != v41)

  if (v9 != v13)
  return 0;
}

uint64_t sub_22AD435A8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  double v13;
  int v14;
  const char *v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  double v20;

  v6 = a4;
  v7 = a2;
  objc_msgSend_objectAtIndexedSubscript_(v6, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v10, v11, v12);
  v14 = LODWORD(v13);
  objc_msgSend_objectAtIndexedSubscript_(v6, v15, v13, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend_integerValue(v16, v17, v18);
  LODWORD(v20) = v14;
  objc_msgSend(v7, a3, v19, v20);

  return 0;
}

uint64_t sub_22AD43650(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;

  v6 = a4;
  v7 = a2;
  objc_msgSend_objectAtIndexedSubscript_(v6, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v14)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v13, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v6, v13, v15, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, a3, v16, objc_msgSend_unsignedIntValue(v17, v18, v19));

  if (v10 != v14)
  return 0;
}

uint64_t sub_22AD43734(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  void *v20;
  double v21;
  void *v22;

  v6 = a2;
  v7 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_unsignedIntValue(v10, v11, v12);
  objc_msgSend_objectAtIndexedSubscript_(v7, v14, v15, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 == v20)
  {
    objc_msgSend(v6, a3, v13, 0);
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v19, v21, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, a3, v13, v22);

  }
  return 0;
}

uint64_t sub_22AD43820(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  void *v20;
  double v21;
  void *v22;

  v6 = a2;
  v7 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_unsignedIntValue(v10, v11, v12);
  objc_msgSend_objectAtIndexedSubscript_(v7, v14, v15, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 == v20)
  {
    objc_msgSend(v6, a3, v13, 0);
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v19, v21, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, a3, v13, v22);

  }
  return 0;
}

uint64_t sub_22AD4390C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  void *v16;
  const char *v17;
  double v18;

  v6 = a4;
  v7 = a2;
  objc_msgSend_objectAtIndexedSubscript_(v6, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v10, v11, v12);
  v14 = v13;
  objc_msgSend_objectAtIndexedSubscript_(v6, v15, v13, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, a3, objc_msgSend_BOOLValue(v16, v17, v18), v14);
  return 0;
}

id sub_22AD439B4(int a1, id a2, SEL a3)
{
  return objc_msgSend(a2, a3);
}

id sub_22AD439C0(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;

  v6 = a2;
  v7 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v14)
  {
    objc_msgSend(v6, a3, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, a3, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

id sub_22AD43A8C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, a3, objc_msgSend_BOOLValue(v9, v10, v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD43AF8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v9, v10, v11);
  objc_msgSend(v6, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD43B60(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v9, v10, v11);
  objc_msgSend(v6, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD43BC8(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, a3, objc_msgSend_integerValue(v9, v10, v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD43C34(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, a3, objc_msgSend_unsignedIntegerValue(v9, v10, v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD43CA0(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, a3, objc_msgSend_unsignedIntValue(v9, v10, v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD43D0C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGSizeValue(v9, v10, v11);
  objc_msgSend(v6, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD43D74(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v9, v10, v11);
  objc_msgSend(v6, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD43DDC(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGPointValue(v9, v10, v11);
  objc_msgSend(v6, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD43E44(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  void *v13;
  _OWORD v15[3];

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9)
    objc_msgSend_CGAffineTransformValue(v9, v10, v11);
  else
    memset(v15, 0, sizeof(v15));
  objc_msgSend(v6, a3, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id sub_22AD43ED4(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  void *v13;
  _OWORD v15[8];

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9)
    objc_msgSend_CATransform3DValue(v9, v10, v11);
  else
    memset(v15, 0, sizeof(v15));
  objc_msgSend(v6, a3, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id sub_22AD43F6C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UIEdgeInsetsValue(v9, v10, v11);
  objc_msgSend(v6, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD43FD4(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_rangeValue(v9, v10, v11);
  objc_msgSend(v6, a3, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id sub_22AD44044(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;

  v6 = a2;
  v7 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v14)
  {
    objc_msgSend(v6, a3, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, a3, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

id sub_22AD44110(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  const char *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;

  v6 = a2;
  v7 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v14)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v7, v13, v15, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v21)
  {
    objc_msgSend(v6, a3, v16, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v20, v22, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, a3, v16, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v10 != v14)

  return v24;
}

id sub_22AD44250(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;

  v6 = a4;
  v7 = a2;
  objc_msgSend_objectAtIndexedSubscript_(v6, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v14)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v13, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v6, v13, v15, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v17, v18, v19);
  objc_msgSend(v7, a3, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v14)
  return v20;
}

id sub_22AD44338(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  void *v13;
  double v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  const char *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  const char *v25;
  double v26;
  const char *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  id v35;

  v35 = a2;
  v6 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v6, v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v13)
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 2, 0);
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v12, v14, 1);
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v6, v15, v16, 2, v33);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v21)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v20, v22, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v6, v20, v22, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v25, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24 == v28)
  {
    objc_msgSend(v35, a3, v34, v23, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v27, v29, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, a3, v34, v23, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v17 != v21)

  if (v9 != v13)
  return v31;
}

id sub_22AD444E4(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  void *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  void *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  void *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v42 = a2;
  v5 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v5, v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v12)
  {
    v41 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v11, v13, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v5, v11, v13, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 == v18)
  {
    v40 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v17, v19, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v5, v17, v19, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 == v24)
  {
    v39 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v23, v25, 3);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectAtIndexedSubscript_(v5, v23, v25, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 == v30)
  {
    objc_msgSend(v42, a3, v41, v40, v39, 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v29, v31, 4);
    v32 = v14;
    v33 = v12;
    v34 = v8;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, a3, v41, v40, v39, v35);
    v38 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v34;
    v12 = v33;
    v14 = v32;
  }

  if (v20 != v24)
  if (v14 != v18)

  if (v8 != v12)
  return v38;
}

id sub_22AD4470C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  const char *v17;
  void *v18;
  const char *v19;
  double v20;
  double v21;
  double v22;
  const char *v23;
  void *v24;
  const char *v25;
  double v26;
  double v27;
  double v28;
  const char *v29;
  void *v30;
  const char *v31;
  double v32;
  double v33;
  double v34;
  const char *v35;
  void *v36;
  const char *v37;
  double v38;
  void *v39;

  v6 = a4;
  v7 = a2;
  objc_msgSend_objectAtIndexedSubscript_(v6, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGPointValue(v10, v11, v12);
  v14 = v13;
  v16 = v15;
  objc_msgSend_objectAtIndexedSubscript_(v6, v17, v13, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v18, v19, v20);
  v22 = *(float *)&v21;
  objc_msgSend_objectAtIndexedSubscript_(v6, v23, v21, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v24, v25, v26);
  v28 = *(float *)&v27;
  objc_msgSend_objectAtIndexedSubscript_(v6, v29, v27, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v30, v31, v32);
  v34 = *(float *)&v33;
  objc_msgSend_objectAtIndexedSubscript_(v6, v35, v33, 5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, a3, objc_msgSend_BOOLValue(v36, v37, v38), v14, v16, v22, v28, v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

id sub_22AD44848(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;

  v6 = a2;
  v7 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_unsignedIntegerValue(v10, v11, v12);
  objc_msgSend_objectAtIndexedSubscript_(v7, v14, v15, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 == v20)
  {
    objc_msgSend(v6, a3, v13, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v19, v21, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, a3, v13, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

id sub_22AD44944(int a1, id a2, SEL a3)
{
  return objc_msgSend(a2, a3);
}

id sub_22AD44950(int a1, id a2, SEL a3)
{
  return objc_msgSend(a2, a3);
}

id sub_22AD4495C(int a1, id a2, SEL a3)
{
  return objc_msgSend(a2, a3);
}

uint64_t sub_22AD44968(int a1, id a2, SEL a3)
{
  void *v3;
  const char *v4;
  double v5;

  v3 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, a3);
  return objc_msgSend_valueWithCGSize_(v3, v4, v5);
}

uint64_t sub_22AD44998(int a1, id a2, SEL a3)
{
  void *v3;
  id v4;
  const char *v5;
  double v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = objc_msgSend(a2, a3);
  return objc_msgSend_numberWithBool_(v3, v5, v6, v4);
}

id sub_22AD449CC(uint64_t a1, void *a2, const char *a3, void *a4)
{
  void *v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  const char *v17;
  void *v18;

  v6 = (void *)MEMORY[0x24BDD1968];
  v7 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGSizeValue(v10, v11, v12);
  objc_msgSend(v7, a3);
  v14 = v13;
  v16 = v15;

  objc_msgSend_valueWithCGSize_(v6, v17, v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id sub_22AD44A5C(uint64_t a1, void *a2, const char *a3, void *a4)
{
  void *v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  id v13;
  const char *v14;
  double v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a2;
  objc_msgSend_objectAtIndexedSubscript_(a4, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v10, v11, v12);
  v13 = objc_msgSend(v7, a3);

  objc_msgSend_numberWithBool_(v6, v14, v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id sub_22AD44ADC(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  void *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;

  v6 = a2;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_objectAtIndexedSubscript_(v7, v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == v15)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v14, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, a3, v17);
  objc_msgSend_numberWithDouble_(v8, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 != v15)

  return v20;
}

id sub_22AD44BB4(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  double v14;
  double v15;
  const char *v16;
  void *v17;
  const char *v18;
  double v19;
  const char *v20;
  void *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;

  v6 = a2;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_objectAtIndexedSubscript_(v7, v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v11, v12, v13);
  v15 = v14;
  objc_msgSend_objectAtIndexedSubscript_(v7, v16, v14, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v21)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v20, v22, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, a3, v23, v15);
  objc_msgSend_numberWithDouble_(v8, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 != v21)

  return v26;
}

char *sub_22AD45F44(uint64_t a1, id a2, uint64_t a3)
{
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  char *result;

  v5 = objc_retainAutorelease(a2);
  v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
  result = strdup(v8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8 * a3) = result;
  return result;
}

void sub_22AD45F80(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0x48uLL, 0x10F004036FA40C8uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD4643C(Class cls)
{
  void *v2;
  const char *Name;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  id v12;

  if (qword_255B51B80 != -1)
    dispatch_once(&qword_255B51B80, &unk_24F500988);
  v2 = (void *)MEMORY[0x24BDD17C8];
  Name = class_getName(cls);
  objc_msgSend_stringWithUTF8String_(v2, v4, v5, Name);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsObject_((void *)qword_255B51B78, v6, v7) & 1) == 0)
  {
    if ((objc_msgSend_hasPrefix_(v12, v8, v9, CFSTR("__NSCF")) & 1) == 0)
      class_addProtocol(cls, (Protocol *)&unk_255B84C18);
    objc_msgSend_addObject_((void *)qword_255B51B78, v10, v11, v12);
  }

}

void sub_22AD464F4()
{
  id v0;
  const char *v1;
  double v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x24BDBCEF0]);
  v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 256);
  v4 = (void *)qword_255B51B78;
  qword_255B51B78 = v3;

}

uint64_t sub_22AD46524(void *a1)
{
  Class Class;
  const char *v2;
  double v3;

  Class = object_getClass(a1);
  return objc_msgSend_tmlMakeJSObjectClass(Class, v2, v3);
}

uint64_t sub_22AD46538(void *a1, const char *a2, double a3)
{
  return objc_msgSend_conformsToProtocol_(a1, a2, a3, &unk_255B84C18);
}

id sub_22AD46544(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v8, v9, v7, 19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlEmitSignalOrCallMethod_withArguments_(a1, v11, v12, v6, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id sub_22AD46610(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  TMLJSValueProxy *v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = [TMLJSValueProxy alloc];
  v8 = (void *)objc_msgSend_initWithTarget_keyPath_(v5, v6, v7, a1, v4);

  return v8;
}

void sub_22AD46C14(uint64_t a1, void *a2, _BYTE *a3)
{
  const char *v5;
  double v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  id v15;
  id v16;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_object(v15, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v7;
    if (!v7)
      goto LABEL_9;
  }
  else
  {
    v8 = v15;
  }
  v16 = v8;
  if (objc_msgSend_hasTMLOwnerContext_(v8, v5, v6, *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend_emitTMLSignal_withArguments_(v16, v9, v10, CFSTR("finalize"), 0);
    objc_msgSend_removeReactiveValuesForTarget_(TMLReactiveValue, v11, v12, v16);
    objc_msgSend_tmlDispose(v16, v13, v14);
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
      *a3 = 1;
  }
  v8 = v16;
LABEL_9:

}

void sub_22AD47130()
{
  objc_end_catch();
  JUMPOUT(0x22AD47138);
}

uint64_t sub_22AD47700(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_addObject_withIdentifier_(*(void **)(a1 + 32), a2, a4, a3, a2);
}

void sub_22AD4776C(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x22AD47758);
}

void sub_22AD47AA4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  id v16;

  v16 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend_type(a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend_isEqualToString_(v5, v9, v10, v8);

  if ((_DWORD)v5)
  {
    objc_msgSend_objectWithIdentifier_(*(void **)(a1 + 40), v11, v12, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend_setObject_forKey_(*(void **)(a1 + 48), v13, v15, v14, v16);

  }
}

id sub_22AD480A8(uint64_t a1, const char *a2, double a3)
{
  void *v3;
  const char *v4;
  double v5;
  void *v6;

  objc_msgSend_processValue_ofType_selfValue_(*(void **)(a1 + 32), a2, a3, *(_QWORD *)(a1 + 40), 16, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_value(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_22AD480F0(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  id v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v20 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_registerProperty_forObject_(TMLRuntime, v3, v4, v20, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x24BDBCE88];
      v8 = (void *)MEMORY[0x24BDD17C8];
      v9 = objc_opt_class();
      objc_msgSend_stringWithFormat_(v8, v10, v11, CFSTR("Unsupported declaration type %@"), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v21 = CFSTR("identifier");
      v22[0] = v13;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v14, v15, v22, &v21, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v7, v17, v18, CFSTR("TMLRuntimeException"), v12, v16);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v19);
    }
    objc_msgSend_registerSignal_forObject_(TMLRuntime, v5, v6, v20, *(_QWORD *)(a1 + 32));
  }

}

id sub_22AD48258(uint64_t a1, const char *a2, double a3)
{
  return (id)objc_msgSend_createObjectFromMetaObject_parent_(*(void **)(a1 + 32), a2, a3, a2, *(_QWORD *)(a1 + 40));
}

void sub_22AD48280(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  double v7;
  void *v8;
  id v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  double v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  void *v41;
  void *v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  void *v48;
  const char *v49;
  void *v50;
  double v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  double v55;
  void *v56;
  const char *v57;
  double v58;
  void *v59;
  uint64_t v60;
  const char *v61;
  double v62;
  uint64_t v63;
  const char *v64;
  double v65;
  uint64_t v66;
  const char *v67;
  double v68;
  const char *v69;
  double v70;
  uint64_t v71;
  const char *v72;
  double v73;
  __CFString *v74;
  const char *v75;
  double v76;
  void *v77;
  const char *v78;
  double v79;
  id v80;
  const char *v81;
  double v82;
  void *v83;
  const char *v84;
  double v85;
  id v86;
  TMLScriptSignalHandler *v87;
  const char *v88;
  double v89;
  uint64_t v90;
  const char *v91;
  double v92;
  void *v93;
  const char *v94;
  double v95;
  const char *v96;
  double v97;
  uint64_t v98;
  const char *v99;
  double v100;
  void *v101;
  const char *v102;
  double v103;
  id v104;
  TMLPropertyChangedScriptSignalHandler *v105;
  uint64_t v106;
  const char *v107;
  double v108;
  void *v109;
  id v110;
  void *v111;
  const char *v112;
  double v113;
  const char *v114;
  double v115;
  void *v116;
  void *v117;
  void *v118;
  const char *v119;
  double v120;
  void *v121;
  uint64_t v122;
  const char *v123;
  double v124;
  void *v125;
  const char *v126;
  double v127;
  id v128;
  id v129;
  void *v130;
  void *v131;
  id v132;
  const __CFString *v133;
  _QWORD v134[2];

  v134[1] = *MEMORY[0x24BDAC8D0];
  v132 = a2;
  v5 = a3;
  objc_msgSend_signalName(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(id *)(a1 + 32);
  v12 = objc_msgSend_length(v132, v10, v11);
  if (objc_msgSend_rangeOfString_options_range_(v132, v13, v14, CFSTR("."), 4, 0, v12) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_substringToIndex_(v132, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tmlValueForKeyPath_(v9, v18, v19, v17);
    v20 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v20;
  }
  objc_msgSend_signal_forObject_(TMLRuntime, v15, v16, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22 && (objc_msgSend_hasSuffix_(v132, v21, v23, CFSTR("Changed")) & 1) == 0)
  {
    v116 = (void *)MEMORY[0x24BDBCE88];
    v117 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_type(*(void **)(a1 + 40), v24, v23);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v117, v119, v120, CFSTR("Undeclared signal %@ for type %@"), v132, v118);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = *(_QWORD *)(a1 + 48);
    v133 = CFSTR("identifier");
    v134[0] = v122;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v123, v124, v134, &v133, 1);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v116, v126, v127, CFSTR("TMLRuntimeException"), v121, v125);
    v128 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v128);
  }
  v25 = (void *)MEMORY[0x24BDD17C8];
  v26 = *(void **)(a1 + 48);
  v27 = v26;
  v28 = v132;
  if (!v26)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], (const char *)v132, v23, CFSTR("obj_%p"), *(_QWORD *)(a1 + 32));
    v29 = objc_claimAutoreleasedReturnValue();
    v28 = v132;
    v27 = (void *)v29;
  }
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v28, (const char *)v28, v23, CFSTR("."), CFSTR("_dot_"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v25, v31, v32, CFSTR("$%@_%@"), v27, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v34, v35, CFSTR("_%@"), v33);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 56) + 72), v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v38;
  if (!v38 || (v41 = v38, objc_msgSend_isUndefined(v38, v39, v40)))
  {
    if (v22)
    {
      objc_msgSend_parameters(v22, v39, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueForKey_(v42, v43, v44, CFSTR("propertyName"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v45, v46, v47, CFSTR(","));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v48 = 0;
    }
    v129 = v5;
    objc_msgSend_functionBody(v5, v39, v40);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_255B51B90 != -1)
      dispatch_once(&qword_255B51B90, &unk_24F500A70);
    v52 = (void *)qword_255B51B88;
    v53 = objc_msgSend_length(v50, v49, v51);
    objc_msgSend_firstMatchInString_options_range_(v52, v54, v55, v50, 0, 0, v53);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v56;
    if (v56 && objc_msgSend_range(v56, v57, v58) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v60 = objc_msgSend_rangeAtIndex_(v59, v57, v58, 1);
      objc_msgSend_substringWithRange_(v50, v61, v62, v60, v61);
      v63 = objc_claimAutoreleasedReturnValue();

      v66 = objc_msgSend_range(v59, v64, v65);
      objc_msgSend_range(v59, v67, v68);
      objc_msgSend_substringFromIndex_(v50, v69, v70, &v69[v66]);
      v71 = objc_claimAutoreleasedReturnValue();

      v50 = (void *)v71;
      v48 = (void *)v63;
    }
    if (objc_msgSend_length(v48, v57, v58))
    {
      objc_msgSend_stringByAppendingString_(CFSTR(","), v72, v73, v48);
      v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v74 = &stru_24F505EA8;
    }

    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v75, v76, CFSTR("%@._%@ = function ($self%@)%@"), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 80), v33, v74, v50);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = (id)objc_msgSend_evaluateScript_(*(void **)(*(_QWORD *)(a1 + 56) + 48), v78, v79, v77);
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v81, v82, CFSTR("%1$@.%2$@ = %1$@._%2$@.bind(%1$@)"), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 80), v33);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (id)objc_msgSend_evaluateScript_(*(void **)(*(_QWORD *)(a1 + 56) + 48), v84, v85, v83);

    v5 = v129;
    v41 = v131;
  }
  if (v22)
  {
    v87 = [TMLScriptSignalHandler alloc];
    v90 = objc_msgSend_returnType(v22, v88, v89);
    v93 = (void *)objc_msgSend_initWithFunctionName_returnType_target_context_(v87, v91, v92, v33, v90, v9, *(_QWORD *)(a1 + 56));
    objc_msgSend_setTMLHandler_forSignal_(v9, v94, v95, v93, v8);
  }
  else
  {
    v98 = objc_msgSend_length(v8, v39, v40);
    objc_msgSend_substringToIndex_(v8, v99, v100, v98 - 7);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v102, v103, v101, v9, 0);
    v105 = [TMLPropertyChangedScriptSignalHandler alloc];
    v106 = *(_QWORD *)(a1 + 56);
    objc_msgSend_bindingForTarget_withKeyPath_(TMLBinding, v107, v108, v9, v101);
    v109 = v8;
    v110 = v5;
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (void *)objc_msgSend_initWithFunctionName_context_binding_(v105, v112, v113, v33, v106, v111);

    v5 = v110;
    v8 = v109;

    v41 = v131;
    objc_msgSend_setTMLHandler_forSignal_(v9, v114, v115, v93, v109);
  }
  objc_msgSend_addObject_(*(void **)(*(_QWORD *)(a1 + 56) + 40), v96, v97, v93);

}

void sub_22AD4885C(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x24BDD1798], a3, a1, CFSTR("^function[\\s\\w\\d_]*\\(([^\\)]*)\\)"), 0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255B51B88;
  qword_255B51B88 = v3;

}

void sub_22AD489D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AD489F0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22AD48A00(uint64_t a1)
{

}

void sub_22AD48A08(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  void *v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  double v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  id v37;
  id v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v38 = a2;
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v3, v4, v38);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend_propertyWithKeyPath_forObject_(TMLRuntime, v7, v8, v38, *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_type(v9, v10, v11);
  objc_msgSend_processValue_ofType_selfValue_(v6, v13, v14, v5, v12, *(_QWORD *)(a1 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v25 = (void *)MEMORY[0x24BDBCE88];
    v26 = (void *)MEMORY[0x24BDD17C8];
    v27 = objc_opt_class();
    objc_msgSend_stringWithFormat_(v26, v28, v29, CFSTR("Unsupported value type %@"), v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(a1 + 48);
    v39[0] = CFSTR("object");
    v39[1] = CFSTR("property");
    v40[0] = v31;
    v40[1] = v38;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v32, v33, v40, v39, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v25, v35, v36, CFSTR("TMLRuntimeException"), v30, v34);
    v37 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v37);
  }
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v18)
  {

    v15 = 0;
  }
  objc_msgSend_setValue_forKeyPath_(*(void **)(a1 + 56), v19, v20, v15, v38);
  objc_msgSend_setTMLValue_forKeyPath_(*(void **)(a1 + 48), v21, v22, v15, v38);
  if (objc_msgSend_isEqualToString_(v38, v23, v24, CFSTR("tmlState")))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v15);

}

void sub_22AD49338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_22AD4939C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  id v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  uint64_t WeakRetained;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  double v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;

  v3 = a2;
  v6 = objc_msgSend_rangeOfString_(v3, v4, v5, CFSTR("."));
  v8 = v7;
  v9 = v3;
  v12 = v9;
  v13 = v9;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend_substringToIndex_(v9, v10, v11, v6),
        v13 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        objc_msgSend_substringFromIndex_(v12, v14, v15, v6 + v8),
        (v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v25 = *(void **)(a1 + 40);
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = sub_22AD49570;
    v36[3] = &unk_24F500AE8;
    v13 = v13;
    v37 = v13;
    objc_copyWeak(&v38, (id *)(a1 + 48));
    objc_copyWeak(&v39, (id *)(a1 + 56));
    objc_msgSend_referenceWithBlock_(TMLReference, v26, v27, v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v25, v29, v30, v28);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v38);
    v19 = v37;
  }
  else
  {
    v19 = (void *)v16;
    if ((objc_msgSend_isEqualToString_(v13, v17, v18, CFSTR("self")) & 1) != 0)
    {
      WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 48));
    }
    else
    {
      objc_msgSend_objectWithIdentifier_(*(void **)(a1 + 32), v20, v21, v13);
      WeakRetained = objc_claimAutoreleasedReturnValue();
    }
    v31 = (void *)WeakRetained;
    v32 = *(void **)(a1 + 40);
    objc_msgSend_bindingForTarget_withKeyPath_(TMLBinding, v23, v24, WeakRetained, v19);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v32, v34, v35, v33);

  }
}

void sub_22AD49554(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_22AD49570(void **a1, const char *a2, double a3)
{
  void *WeakRetained;
  id v5;
  const char *v6;
  double v7;

  if ((objc_msgSend_isEqualToString_(a1[4], a2, a3, CFSTR("self")) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 5);
  }
  else
  {
    v5 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend_objectWithIdentifier_unwrapWeak_(v5, v6, v7, a1[4], 0);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  }
  return WeakRetained;
}

void sub_22AD49880(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  id v8;

  v3 = a3;
  objc_msgSend_validCurrentContext(TMLJSEnvironment, v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raiseJSException_(v8, v6, v7, v3);

}

uint64_t sub_22AD498D0(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_requireModule_forJSContext_(TMLJSEnvironment, a2, a3, a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

id sub_22AD499BC(double a1, uint64_t a2, const char *a3)
{
  uint64_t v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  objc_msgSend_validCurrentContext(TMLJSEnvironment, a3, a1);
  v4 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v4;
  if (v4)
  {
    objc_msgSend_objectAtIndexedSubscript_(*(void **)(v4 + 56), v5, v6, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_convertTmlValue_(TMLJSEnvironment, v9, v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_22AD49A80()
{
  objc_end_catch();
  JUMPOUT(0x22AD49A88);
}

id sub_22AD49A90(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;

  v2 = a2;
  objc_msgSend_validCurrentContext(TMLJSEnvironment, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectWithIdentifier_(v5, v6, v7, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_22AD49B48(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void **v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  objc_class *Class;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  char v21;
  id v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;

  v4 = a2;
  v5 = a3;
  objc_msgSend_validCurrentContext(TMLJSEnvironment, v6, v7);
  v8 = (void **)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v8[7], v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convertTmlValue_(TMLJSEnvironment, v12, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  Class = object_getClass(v14);
  if (class_isMetaClass(Class))
  {
    objc_msgSend_tmlGetMethod_(v14, v16, v17, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_classMethod(v18, v19, v20);

    if ((v21 & 1) == 0)
    {
      v22 = objc_alloc((Class)v14);

      v14 = v22;
    }
  }
  objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v16, v17, v5, 16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlCallMethod_withArguments_(v14, v24, v25, v4, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

id sub_22AD49CC0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v4;
  id *v5;
  id v8;
  id v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  char v18;
  const char *v19;
  double v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_msgSend_validCurrentContext(TMLJSEnvironment, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v9, v14, v15) && (objc_msgSend_isEqualToString_(v9, v16, v17, CFSTR("init")) & 1) == 0)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_22AD49E5C;
    v23[3] = &unk_24F500A00;
    v4 = &v24;
    v24 = v9;
    v5 = &v25;
    v25 = v10;
    v18 = 1;
    objc_msgSend_createObjectWithIdentifier_ofType_initializer_(TMLRuntime, v19, v20, CFSTR("$new$"), v8, v23);
  }
  else
  {
    v18 = 0;
    objc_msgSend_createObjectWithIdentifier_ofType_initializer_(TMLRuntime, v16, v17, CFSTR("$new$"), v8, 0);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v18 & 1) != 0)
  {

  }
  return v21;
}

id sub_22AD49E5C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  char v9;
  const char *v10;
  double v11;
  id v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;

  v3 = a2;
  objc_msgSend_tmlGetMethod_(v3, v4, v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_classMethod(v6, v7, v8);

  if ((v9 & 1) == 0)
  {
    v12 = objc_alloc((Class)v3);

    v3 = v12;
  }
  v13 = *(_QWORD *)(a1 + 32);
  objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v10, v11, *(_QWORD *)(a1 + 40), 16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlCallMethod_withArguments_(v3, v15, v16, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id sub_22AD49EFC(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;

  v2 = a2;
  objc_msgSend_validCurrentContext(TMLJSEnvironment, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetException(v5, v6, v7);

  return v2;
}

id sub_22AD49F3C(double a1, uint64_t a2, const char *a3)
{
  id *v3;
  id v4;

  objc_msgSend_validCurrentContext(TMLJSEnvironment, a3, a1);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v4 = v3[9];

  return v4;
}

id sub_22AD4A1D4(double a1, uint64_t a2, const char *a3)
{
  return (id)objc_msgSend_requireModule_(TMLRuntime, a3, a1, a3);
}

uint64_t sub_22AD4A1FC(double a1)
{
  return MEMORY[0x24BEDD108](TMLRuntime, sel_registerProtocol_, a1);
}

uint64_t sub_22AD4A208(double a1, uint64_t a2, const char *a3)
{
  return objc_msgSend_registerClass_(TMLRuntime, a3, a1);
}

void sub_22AD4A214(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  double v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_22AD4A2C8;
  v12[3] = &unk_24F4FD5F8;
  v12[4] = v7;
  v13 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend_runInContext_block_(TMLJSEnvironment, v10, v11, v7, v12);

}

void sub_22AD4A2C8(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  id v23;
  id v24;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v4 + 48);
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = *(_QWORD *)(v4 + 80);
  objc_msgSend_functionBody(*(void **)(a1 + 48), a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v7, v10, v11, CFSTR("%@._%@ = %@"), v8, v5, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend_evaluateScript_(v6, v13, v14, v12);

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(v16 + 48);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, v20, CFSTR("%1$@.%2$@ = %1$@._%2$@.bind(%1$@)"), *(_QWORD *)(v16 + 80), v17);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend_evaluateScript_(v18, v21, v22, v24);

}

void sub_22AD4A3A4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v14 = v3;
  objc_msgSend_identifier(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_existingObjectWithIdentifier_(v4, v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v13 = (id)objc_msgSend_createObjectFromMetaObject_parent_(*(void **)(a1 + 32), v11, v12, v14, 0);

}

void sub_22AD4A424(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  id v29;
  id v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v30 = a2;
  v5 = a3;
  objc_msgSend_classForObject_(TMLRuntime, v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v18 = (void *)MEMORY[0x24BDBCE88];
    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = objc_opt_class();
    objc_msgSend_stringWithFormat_(v19, v21, v22, CFSTR("Attempt to add object of undeclared class %@"), v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = CFSTR("object");
    v32[0] = v5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, v25, v32, &v31, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v18, v27, v28, CFSTR("TMLRuntimeException"), v23, v26);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v29);
  }
  objc_msgSend_objects(*(void **)(*(_QWORD *)(a1 + 32) + 8), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v11, v12, v13, v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v17 = (id)objc_msgSend_createObjectFromMetaObject_parent_(*(void **)(a1 + 32), v15, v16, v14, 0);

}

void sub_22AD4A71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AD4A738(uint64_t a1)
{
  id v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v3, v4, CFSTR("var _tmlF=function() { var _tmlResult=%@; return _tmlResult; }; var _tmlResult = _tmlF.call(this.%@); _tmlResult;"),
    *(_QWORD *)(a1 + 48),
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_evaluateScript_(*(void **)(*(_QWORD *)(a1 + 32) + 48), v5, v6, v12);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v2;

}

void sub_22AD4A96C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  id v12;
  const char *v13;
  double v14;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  if (a2 == 1)
  {
    v12 = objc_begin_catch(a1);
    objc_msgSend_raiseException_(TMLExceptionHandler, v13, v14, v12);
    objc_end_catch();
    JUMPOUT(0x22AD4A940);
  }
  _Unwind_Resume(a1);
}

void sub_22AD4A9C8(uint64_t a1, const char *a2, double a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_callWithArguments_(*(void **)(a1 + 32), a2, a3, *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t sub_22AD4AAC4(uint64_t a1, double a2)
{
  return MEMORY[0x24BEDD108](a1, sel_initWithName_, a2);
}

uint64_t sub_22AD4AAD0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *v6;
  double v7;
  uint64_t v8;

  v4 = a3;
  sub_22AD4ABE0();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_initWithName_target_selector_(a1, v6, v7, v4, v5, sel_action_);

  return v8;
}

uint64_t sub_22AD4AB30(void *a1)
{
  void *v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;

  sub_22AD4ABE0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTarget_(a1, v3, v4, v2);

  return objc_msgSend_setSelector_(a1, v5, v6, sel_action_);
}

uint64_t sub_22AD4AB74(void *a1, const char *a2, double a3)
{
  return objc_msgSend_setTarget_(a1, a2, a3, 0);
}

id sub_22AD4ABE0()
{
  if (qword_255B51BA0 != -1)
    dispatch_once(&qword_255B51BA0, &unk_24F500DF8);
  return (id)qword_255B51B98;
}

void sub_22AD4AC20()
{
  TMLUIAccessibilityCustomActionTarget *v0;
  void *v1;

  v0 = objc_alloc_init(TMLUIAccessibilityCustomActionTarget);
  v1 = (void *)qword_255B51B98;
  qword_255B51B98 = (uint64_t)v0;

}

void sub_22AD4ACF0(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen(a83847776m7ulqb);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, a83847776m7ulqb, v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

id sub_22AD4AF00(double a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  const char *v7;
  double v9[4];

  v3 = objc_msgSend_MKCoordinateValue(a3, (const char *)a3, a1);
  v9[0] = MEMORY[0x22E2E77CC](v3);
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = v6;
  objc_msgSend_value_withObjCType_(MEMORY[0x24BDD1968], v7, v9[0], v9, "{?={CLLocationCoordinate2D=dd}{?=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_22AD4AF60(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  id v8;
  const char *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  void *v16;

  v4 = a2;
  objc_msgSend_unwrap_(TMLJSNil, v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BDDB160]);
  objc_msgSend_MKCoordinateValue(v4, v9, v10);
  v12 = v11;
  v14 = v13;

  v16 = (void *)objc_msgSend_initWithCoordinate_addressDictionary_(v8, v15, v12, v7, v14);
  return v16;
}

id sub_22AD4AFF4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  id v8;
  const char *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  double v19;
  void *v20;

  v4 = a2;
  objc_msgSend_unwrap_(TMLJSNil, v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BDDB160]);
  objc_msgSend_MKCoordinateValue(v4, v9, v10);
  v12 = v11;
  v14 = v13;

  v16 = (void *)objc_msgSend_initWithCoordinate_addressDictionary_(v8, v15, v12, v7, v14);
  v17 = objc_alloc(MEMORY[0x24BDDB0F0]);
  v20 = (void *)objc_msgSend_initWithPlacemark_(v17, v18, v19, v16);

  return v20;
}

id sub_22AD4B0A8(double a1, uint64_t a2, void *a3)
{
  const char *v3;
  MKMapPoint v5;
  CLLocationCoordinate2D v6;

  objc_msgSend_MKCoordinateValue(a3, (const char *)a3, a1);
  v5 = MKMapPointForCoordinate(v6);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x24BDD1968], v3, v5.x, &v5, "{?=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_22AD4B0EC(double a1, uint64_t a2, void *a3)
{
  void *v3;
  CLLocationCoordinate2D v4;
  const char *v5;
  MKMapPoint v7;

  v3 = (void *)MEMORY[0x24BDD1968];
  v7.x = 0.0;
  v7.y = 0.0;
  objc_msgSend_getValue_(a3, (const char *)a3, a1, &v7);
  v4 = MKCoordinateForMapPoint(v7);
  objc_msgSend_valueWithMKCoordinate_(v3, v5, v4.latitude, v4.longitude);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_22AD4B138(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  double x;
  double y;
  const char *v9;
  double v10;
  MKMapPoint v11;
  MKMapPoint v12;

  v11.x = 0.0;
  v11.y = 0.0;
  v4 = a3;
  objc_msgSend_getValue_(a2, v5, v6, &v11);
  x = v11.x;
  y = v11.y;
  v11.x = 0.0;
  v11.y = 0.0;
  objc_msgSend_getValue_(v4, v9, v10, &v11);

  v12.x = x;
  v12.y = y;
  MKMetersBetweenMapPoints(v12, v11);
}

id sub_22AD4B1A4(uint64_t a1, void *a2)
{
  const char *v2;
  MKMapRect v4;
  MKCoordinateRegion v5;

  memset(&v4, 0, sizeof(v4));
  objc_msgSend_getValue_(a2, (const char *)a2, 0.0, &v4);
  v5 = MKCoordinateRegionForMapRect(v4);
  v4 = (MKMapRect)v5;
  objc_msgSend_value_withObjCType_(MEMORY[0x24BDD1968], v2, v5.center.latitude, &v4, "{?={CLLocationCoordinate2D=dd}{?=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_22AD4B200()
{
  return objc_alloc_init(MEMORY[0x24BDDB168]);
}

id sub_22AD4B21C(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;

  v4 = a2;
  objc_msgSend_unwrap_(TMLJSNil, v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_conformsToProtocol_(v4, v8, v9, &unk_255B84E00))
  {
    v10 = objc_alloc(MEMORY[0x24BDDB150]);
    v13 = (void *)objc_msgSend_initWithAnnotation_reuseIdentifier_(v10, v11, v12, v4, v7);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id sub_22AD4B2A4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  MKMapPoint origin;
  MKMapSize size;
  const char *v9;
  const char *v10;
  MKMapRect v12;
  MKMapRect v13;
  MKMapRect v14;

  memset(&v12, 0, sizeof(v12));
  v4 = a3;
  objc_msgSend_getValue_(a2, v5, v6, &v12);
  origin = v12.origin;
  size = v12.size;
  memset(&v12, 0, sizeof(v12));
  objc_msgSend_getValue_(v4, v9, 0.0, &v12);

  v13.origin = origin;
  v13.size = size;
  v14 = MKMapRectUnion(v13, v12);
  v12 = v14;
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x24BDD1968], v10, v14.origin.x, &v12, "{?={?=dd}{?=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_22AD4B354(double a1, double a2, uint64_t a3, const char *a4)
{
  _QWORD v5[2];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x24BDD1968], a4, a1, v5, "{?=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_22AD4B38C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  const char *v8;
  _OWORD v10[2];
  __int128 v11;

  v10[0] = 0uLL;
  v4 = a3;
  objc_msgSend_getValue_(a2, v5, v6, v10);
  v11 = 0uLL;
  objc_msgSend_getValue_(v4, v7, *(double *)v10, &v11);

  v10[1] = v11;
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x24BDD1968], v8, *(double *)&v11, v10, "{?={?=dd}{?=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_22AD4B408(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  const char *v5;
  double v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BDDB0A0];
  v3 = a2;
  v4 = [v2 alloc];
  v7 = (void *)objc_msgSend_initWithRequest_(v4, v5, v6, v3);

  return v7;
}

void sub_22AD4BBA0(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_bind_(v5, v3, v4, *(_QWORD *)(a1 + 32));

}

void sub_22AD4BCCC(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_unbind_(v5, v3, v4, *(_QWORD *)(a1 + 32));

}

void sub_22AD4BE70()
{
  void *v0;
  Class v1;
  Class v2;
  Class v3;
  Class v4;
  const char *v5;
  double v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = NSClassFromString(CFSTR("NSParagraphStyle"));
  v2 = NSClassFromString(CFSTR("NSMutableParagraphStyle"));
  v3 = NSClassFromString(CFSTR("NSHashTable"));
  v4 = NSClassFromString(CFSTR("NSMapTable"));
  objc_msgSend_setWithObjects_(v0, v5, v6, v1, v2, v3, v4, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_255B51BB0;
  qword_255B51BB0 = v7;

}

uint64_t sub_22AD4C14C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend_object(a2, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_object(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend_bindingOrder(v7, v11, v12);
  v16 = objc_msgSend_bindingOrder(v10, v14, v15);
  v17 = 1;
  if (v13 <= v16)
    v17 = -1;
  if (v13 == v16)
    v18 = 0;
  else
    v18 = v17;

  return v18;
}

void sub_22AD4C32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22AD4C348(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id *v8;
  id v9;
  id v10;
  const char *v11;
  id WeakRetained;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (id *)(a1 + 32);
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  v18 = *MEMORY[0x24BDD0E70];
  v14 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, v13, v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlObserveValueForKeyPath_ofObject_change_context_(WeakRetained, v16, v17, v9, v10, v15, 0);

  if (!v7)
}

void sub_22AD4C7E0(_Unwind_Exception *exception_object, int a2)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;

  if (a2)
  {
    objc_begin_catch(exception_object);
    do
      v3 = __ldxr(v2);
    while (__stxr(v3 & 0xBF, v2));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_22AD4C828(uint64_t a1, void *a2, double a3)
{
  const char *v4;
  double v5;
  id v6;

  objc_msgSend_object(a2, (const char *)a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindingValueChanged_(v6, v4, v5, *(_QWORD *)(a1 + 32));

}

void sub_22AD4C9CC(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("83847776s0j3!zkfK-)2h:2TV^mQjh-G}KngWNH+.Gu1*uAUK{S<zKD.Y(/7H5Dk##p*b^zByvCIFz=5L:hb*?He2J3Q)h^3EyS#ZwuYr&2.QuiXhOcL$TbCzbb8&QVFp1V@#D.^+4{jk{z4l[3:&+D8U^>LBGd+Y}pF?v(L3to+LnLR&{By/uia@}15x(n37zGFoTB7ol8Acb/jzw0d{BAh8kxbyT[bmkrfB.tt#B97#7nP5Y&v{%E[z/ex+A::325^AA0A+PA7a@gH)x>g^)Bzku3wPwy/B98CpzF6^!nc67z0sxocpdYtBwPzi?BzkVha%471wmoN>nP5SYA=$(c5!mVnl$7gGnP5SYA=$(ca}$v*x(n37zGDG%nLR&{By/ui7Y+*a3jZ=/By/uiqE%]*z/fSc5!ESfnP5SYzGF=/B8V5nB7Df?a@HZ#xl4{kA7KOKzGGP8x>qq$26j)bx(mMc6BCgYwmYU2x>z6<AUnN$BAh8kxcFu66LRDbwO#PXvqYQ(x(mMZByxolA$ON?zGDY@a}L7/wnc6}v@#B6zw04=zGFzI3yp=23q0#>xM4{kv%8(qapnK1B7GwTv@#Bdx([Rk4O/@5B7GwTv@#Bdx([Rq0u@i+25d%%wO#P52Uv=.zGGDcBqL3lpym!IzFsh]x([2*B7GwTv@#Bdx([Ri5e(O%40uS5A:-E1x)aijC[HPZq=N)IAZshSx)aijC{i#qzFsh]x([2*B7GwTv@#Bdx([RYnc66c3j/Z6r=qXZwM9nXA=+/lBrRXi5nu39z!0i$x(v(=xMvK5wFbh*BAh8kxbyT[7ZZK&xM4{kv%8(a3q0#>xM4{kv%8(g0u@o^3tB3ZzGGP8x>qq$22n8%ry]N}0z0kv1YXb!x(>*imSiA!wmoN]z/b");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "83847776s0j3!zkfK-)2h:2TV^mQjh-G}KngWNH+.Gu1*uAUK{S<zKD.Y(/7H5Dk##p*b^zByvCIFz=5L:hb*?He2J3Q)h^3EyS#ZwuYr&2.QuiXhOcL$TbCzbb8&QVFp1V@#D.^+4{jk{z4l[3:&+D8U^>LBGd+Y}pF?v(L3to+LnLR&{By/uia@}15x(n37zGFoTB7ol8Acb/jzw0d{BAh8kxbyT[bmkrfB.tt#B97#7nP5Y&v{%E[z/ex+A::325^AA0A+PA7a@gH)x>g^)Bzku3wPwy/B98CpzF6^!nc67z0sxocpdYtBwPzi?BzkVha%471wmoN>nP5SYA=$(c5!mVnl$7gGnP5SYA=$(ca}$v*x(n37zGDG%nLR&{By/ui7Y+*a3jZ=/By/uiqE%]*z/fSc5!ESfnP5SYzGF=/B8V5nB7Df?a@HZ#xl4{kA7KOKzGGP8x>qq$26j)bx(mMc6BCgYwmYU2x>z6<AUnN$BAh8kxcFu66LRDbwO#PXvqYQ(x(mMZByxolA$ON?zGDY@a}L7/wnc6}v@#B6zw04=zGFzI3yp=23q0#>xM4{kv%8(qapnK1B7GwTv@#Bdx([Rk4O/@5B7GwTv@#Bdx([Rq0u@i+25d%%wO#P52Uv=.zGGDcBqL3lpym!IzFsh]x([2*B7GwTv@#Bdx([Ri5e(O%40uS5A:-E1x)aijC[HPZq=N)IAZshSx)aijC{i#qzFsh]x([2*B7GwTv@#Bdx([RYnc66c3j/Z6r=qXZwM9nXA=+/lBrRXi5nu39z!0i$x(v(=xMvK5wFbh*BAh8kxbyT[7ZZK&xM4{kv%8(a3q0#>xM4{kv%8(g0u@o^3tB3ZzGGP8x>qq$22n8%ry]N}0z0kv1YXb!x(>*imSiA!wmoN]z/b", v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

void sub_22AD4CAF8(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("83847776lM1]&opQk-ot+%a[y-rx5FY!sq9Tgl^}zO0MZP4w<vIG3</-=ocvnGzt^xkPzSl>1y#=Pd1p{Y(!Ynr]&ezW+ypta+55xlq1SZD&CMeW%nU:k!!nHyzcE}rm%b.K:l(0!pnlQysWG[Hn??6VmId3}-UVK8$4!Zd73CcrC5(8v]CYWImB7]MglVl<:wQ5qvc<?bwx>g</Bwca-xjVdal3uWJy**^?wKHlNAbn%do(BMN5^8&=BrR?m7K6O7xjVfJv@#BdwKHlNAbn%do(BMN5^8&=BqL3lsQDl{x>g</Bwlg*x(e0fq!ZL?mSirnx(!lfvr>N=wmVqT8wiw+wnca7y*?P-z!9z(18hT{a%q8zwm]E}o<@oXzfoX]x)KtWz/OlWB8U@7C$&i/wJzpFmSiA!wmoN]z/b");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "83847776lM1]&opQk-ot+%a[y-rx5FY!sq9Tgl^}zO0MZP4w<vIG3</-=ocvnGzt^xkPzSl>1y#=Pd1p{Y(!Ynr]&ezW+ypta+55xlq1SZD&CMeW%nU:k!!nHyzcE}rm%b.K:l(0!pnlQysWG[Hn??6VmId3}-UVK8$4!Zd73CcrC5(8v]CYWImB7]MglVl<:wQ5qvc<?bwx>g</Bwca-xjVdal3uWJy**^?wKHlNAbn%do(BMN5^8&=BrR?m7K6O7xjVfJv@#BdwKHlNAbn%do(BMN5^8&=BqL3lsQDl{x>g</Bwlg*x(e0fq!ZL?mSirnx(!lfvr>N=wmVqT8wiw+wnca7y*?P-z!9z(18hT{a%q8zwm]E}o<@oXzfoX]x)KtWz/OlWB8U@7C$&i/wJzpFmSiA!wmoN]z/b", v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

id sub_22AD4CF5C(uint64_t a1, uint64_t a2, void *a3, double a4)
{
  id v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;

  v7 = a3;
  if ((objc_msgSend_isObject(v7, v8, v9) & 1) != 0)
  {
    objc_msgSend_blockWithFunction_(TMLBlock, v10, INFINITY, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(*(Class *)(a1 + 32));
    objc_msgSend_setInterval_(v13, v14, a4);
    objc_msgSend_setRepeats_(v13, v15, v16, a2);
    objc_msgSend_setBlock_(v13, v17, v18, v12);
    objc_msgSend_start(v13, v19, v20);
    objc_msgSend_currentContext(TMLJSEnvironment, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectReference_(v23, v24, v25, v13);
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v26, v27, v28, CFSTR("Callback is not a function"), v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v31, v32, v33, v23);

    v13 = 0;
  }

  return v13;
}

void sub_22AD4D1C0(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen(a83847776srsnls);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, a83847776srsnls, v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

uint64_t sub_22AD4D33C(CLLocationDegrees a1, CLLocationDegrees a2)
{
  CLLocationCoordinate2D v2;
  const char *v3;

  v2 = CLLocationCoordinate2DMake(a1, a2);
  return objc_msgSend_valueWithMKCoordinate_(MEMORY[0x24BDD1968], v3, v2.latitude, v2.longitude);
}

BOOL sub_22AD4D358(double a1, uint64_t a2, void *a3)
{
  CLLocationCoordinate2D v4;

  objc_msgSend_MKCoordinateValue(a3, (const char *)a3, a1);
  return CLLocationCoordinate2DIsValid(v4);
}

uint64_t sub_22AD4D370(double a1, uint64_t a2, void *a3)
{
  return objc_msgSend_MKCoordinateValue(a3, (const char *)a3, a1);
}

double sub_22AD4D378(double a1, uint64_t a2, void *a3)
{
  double v3;

  objc_msgSend_MKCoordinateValue(a3, (const char *)a3, a1);
  return v3;
}

id sub_22AD4D394(double a1, double a2)
{
  id v4;
  const char *v5;

  v4 = objc_alloc(MEMORY[0x24BDBFA80]);
  return (id)objc_msgSend_initWithLatitude_longitude_(v4, v5, a1, a2);
}

id sub_22AD4D8C0(uint64_t a1, double a2, double a3)
{
  id v5;
  const char *v6;

  v5 = objc_alloc(*(Class *)(a1 + 32));
  return (id)objc_msgSend_initWithOffset_(v5, v6, a2, a3);
}

void sub_22AD4D9BC(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("83847776mNu(HMmlbiO6480e205OuNWA?Nxhd!&R4v:lC[YEW$c@h]mIfrlK(]u)amC*jJ&5zsBiAn+6i4o>C?Pz@H+5Ku>&9wqL7)EIADu:SK:26cy>{OKTXF}E5%9/m{V[8gyVDsthot>7N}Bdv.@RnO2gLRmnRhv*J}ef3xk5[b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#b62XmH.wOkB[wFbh=vRPE:Btu5/5nu2@Bxrf#xJ5O.A=+/lBpY04777s*xM4{kv%8(a3q0#>xM4{kv%8(q5OVb%Bxrf#xJ5O.A=+/lBuh}[3zELdbs$TgnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W65!F5mr+Vb?lVl<:A=k=gwPw$c3j7fNy?ml/By=6?z^)D)v@%F83kEn)x()A<BzaY[x>7ZMxM4{kv%8(85e(U#4r=V7v}xZ{z/P@fB-XlbnLSr8x>7ZMxM4{kv%8(q7hmV2Bxrf#xJx4=v}wOLz/P@fB-YVn0sCj}3k#Ghry]F!wl9R.v}wOLz/P@fB-Y@)BAzCs5^RGeluNx(z/c:f3i+G)D2d481A!A@BqL355^![PwO+{<vru5[25^%=wN/*a777s*xM4{kv%8(a3q0#>xM4{kv%8(Gg71F8zFsh]x([2!BA}Xl5d/-?3i+G)D2d481A!A@BrRiezFsh]x([2!BA}XliW+520v37@3mXRxry]F!wl9R.v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6l$HgCxjk)[bff=(9:@O&r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mR#0u9T03s!0(BAhqoy?mS1b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9apnN3z!SY)q!Q8&ByPDn5!vMer=qXZwM9nXA=+/lBq+R@1.zZ{z/MD]mriA!AW0+SwmO.Vx>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AYN-BwjyoJx(^@?x([2?z!SY)q!Q8&ByPDni+rtLz/N(.t).@/wmO.Vx>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AZTRLlT:>xwO.[U8zzH9v@DmbA=k=gwPwzcnLSnSl1BIbz!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPw#$1putApe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzBw5LwOkB[wG(^e3o@GIwPIB2Bvx.OBxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6mSirkwmO.Vx>7ZMxM4{kv%8(WB-..zzv=*!mHykGwncdez!SY)B7/GjByPDnC4>Jiv@DmbA=k=gwPwzdnLSnSmpZaOr=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9gZU1bwmP>4x>7Z}xM4{kv%8)5B-..zzw0<Vpe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzx.w=A+fr6zGFrTx()x]x>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AYN/JAZskDr=qXZwM9nXA=+/lBv7a(Bz(4Tb7G.4k5+KNB7Glhl1BIbz!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPymUAZskDr=qXZwM9nXA=+/lBv7a(Bz(4d0uauk9:@O&C5I88wPIK6A=+/lBARwfCvLMeBAhqoy?mS1b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9gZU1bwmP>4x>7Z}xM4{kv%8)5B-..zzw0<Vpe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzx.t+A+fr6zGFfPwl9R.v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6i+AqJl1BIbz!SY)q!Q8&ByPDnluNx(z/dPW=JBO9nLSnSmpZaOr=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mSPwO+{<vru68uKwh)wncc^z!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPygMwj6^yv}xD/0u9W13s!0(BAhqoy?mS1bs$TgnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6bi]mplUf!xBxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6l"
         "${g1wO+}1wMA.-v}wOLz/P@fB-ZY0BzalRwO#Q7w[+*%5ciX73jpoYzGG]qy&0W65*G$yry]R&x()x]x>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AV"
         "ctk9+n?#wPRG]C5I88wPIK6A=+/lBzkn%zGGP8x>qq$22n8%ry]O5mp*1zBxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6i+h@nl$HgCBy!G>x>7"
         "ZMxM4{kv%8({x([2WwmYU2x>z6<AYLz>0syk^wncc^z!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPygMwl0OVvru5(0u9W13s!0(BAhqoy?mS1bs$T"
         "gnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W68xYv@C5I88wM9nXA=+/lBp]9Qpf8pEv}wOLz/P@fB-XJi3i+0YA=k$h1X0DLz/N3+wN]H%"
         "r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mSFwnbNOAaAy0wMA.-v}wOLz/P@fB-YVQA=M8siW$qknLr=tdHFT-B-7.#BzkVh");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "83847776mNu(HMmlbiO6480e205OuNWA?Nxhd!&R4v:lC[YEW$c@h]mIfrlK(]u)amC*jJ&5zsBiAn+6i4o>C?Pz@H+5Ku>&9wqL7)EIADu:SK:26cy>{OKTXF}E5%9/m{V[8gyVDsthot>7N}Bdv.@RnO2gLRmnRhv*J}ef3xk5[b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#b62XmH.wOkB[wFbh=vRPE:Btu5/5nu2@Bxrf#xJ5O.A=+/lBpY04777s*xM4{kv%8(a3q0#>xM4{kv%8(q5OVb%Bxrf#xJ5O.A=+/lBuh}[3zELdbs$TgnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W65!F5mr+Vb?lVl<:A=k=gwPw$c3j7fNy?ml/By=6?z^)D)v@%F83kEn)x()A<BzaY[x>7ZMxM4{kv%8(85e(U#4r=V7v}xZ{z/P@fB-XlbnLSr8x>7ZMxM4{kv%8(q7hmV2Bxrf#xJx4=v}wOLz/P@fB-YVn0sCj}3k#Ghry]F!wl9R.v}wOLz/P@fB-Y@)BAzCs5^RGeluNx(z/c:f3i+G)D2d481A!A@BqL355^![PwO+{<vru5[25^%=wN/*a777s*xM4{kv%8(a3q0#>xM4{kv%8(Gg71F8zFsh]x([2!BA}Xl5d/-?3i+G)D2d481A!A@BrRiezFsh]x([2!BA}XliW+520v37@3mXRxry]F!wl9R.v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6l$HgCxjk)[bff=(9:@O&r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mR#0u9T03s!0(BAhqoy?mS1b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9apnN3z!SY)q!Q8&ByPDn5!vMer=qXZwM9nXA=+/lBq+R@1.zZ{z/MD]mriA!AW0+SwmO.Vx>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AYN-BwjyoJx(^@?x([2?z!SY)q!Q8&ByPDni+rtLz/N(.t).@/wmO.Vx>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AZTRLlT:>xwO.[U8zzH9v@DmbA=k=gwPwzcnLSnSl1BIbz!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPw#$1putApe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzBw5LwOkB[wG(^e3o@GIwPIB2Bvx.OBxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6mSirkwmO.Vx>7ZMxM4{kv%8(WB-..zzv=*!mHykGwncdez!SY)B7/GjByPDnC4>Jiv@DmbA=k=gwPwzdnLSnSmpZaOr=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9gZU1bwmP>4x>7Z}xM4{kv%8)5B-..zzw0<Vpe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzx.w=A+fr6zGFrTx()x]x>7ZMxM4{kv%8(]x>qGQz/fVqz!%l3AYN/JAZskDr=qXZwM9nXA=+/lBv7a(Bz(4Tb7G.4k5+KNB7Glhl1BIbz!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPymUAZskDr=qXZwM9nXA=+/lBv7a(Bz(4d0uauk9:@O&C5I88wPIK6A=+/lBARwfCvLMeBAhqoy?mS1b1UKfnKl($r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mS9gZU1bwmP>4x>7Z}xM4{kv%8)5B-..zzw0<Vpe%>KwmO.Vx>7ZMxM4{kv%8(WB-..zzx.t+A+fr6zGFfPwl9R.v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6i+AqJl1B"
    "Ibz!SY)q!Q8&ByPDnluNx(z/dPW=JBO9nLSnSmpZaOr=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mSPwO+{<vru68uKwh)wncc^z!SY)q!Q8&ByPDnr+Vb"
    "?lVl<:A=k=gwPygMwj6^yv}xD/0u9W13s!0(BAhqoy?mS1bs$TgnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6bi]mplUf!xBxir]v}wOLz/P@f"
    "B-ZU#wP{HWzGG]qy&0W6l${g1wO+}1wMA.-v}wOLz/P@fB-ZY0BzalRwO#Q7w[+*%5ciX73jpoYzGG]qy&0W65*G$yry]R&x()x]x>7ZMxM4{kv%8(]x"
    ">qGQz/fVqz!%l3AVctk9+n?#wPRG]C5I88wPIK6A=+/lBzkn%zGGP8x>qq$22n8%ry]O5mp*1zBxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W6i+h@nl$"
    "HgCBy!G>x>7ZMxM4{kv%8({x([2WwmYU2x>z6<AYLz>0syk^wncc^z!SY)q!Q8&ByPDnr+Vb?lVl<:A=k=gwPygMwl0OVvru5(0u9W13s!0(BAhqoy?m"
    "S1bs$TgnKWf7Bxir]v}wOLz/P@fB-ZU#wP{HWzGG]qy&0W68xYv@C5I88wM9nXA=+/lBp]9Qpf8pEv}wOLz/P@fB-XJi3i+0YA=k$h1X0DLz/N3+wN]H"
    "%r=qXZwM9nXA=+/lBxi9!Cscp^BAhqoy?mSFwnbNOAaAy0wMA.-v}wOLz/P@fB-YVQA=M8siW$qknLr=tdHFT-B-7.#BzkVh",
    v2,
    0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

void sub_22AD4DBD8(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen(a83847776niad86);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, a83847776niad86, v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

void sub_22AD4E2F0(uint64_t a1, const char *a2, double a3)
{
  void *v3;
  double v4;
  char *v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend_rootClassDescriptor(v3, a2, a3);
  v5 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerClass_(v3, v5, v4, v5);

}

void sub_22AD4E3CC()
{
  TMLClassDescriptor *v0;
  const char *v1;
  double v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  TMLPropertyDescriptor *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  TMLSignalDescriptor *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  TMLSignalDescriptor *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  TMLMethodDescriptor *v31;
  TMLPropertyDescriptor *v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  void *v38;
  void *v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v0 = [TMLClassDescriptor alloc];
  v3 = objc_msgSend_initWithName_superClassName_initializer_optional_(v0, v1, v2, CFSTR("_NSObject"), 0, 0, 0);
  v4 = (void *)qword_255B51C08;
  qword_255B51C08 = v3;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObjcClassName_((void *)qword_255B51C08, v7, v8, v6);

  v9 = (void *)qword_255B51C08;
  v10 = [TMLPropertyDescriptor alloc];
  v13 = (void *)objc_msgSend_initWithName_type_attributes_(v10, v11, v12, CFSTR("tmlState"), 17, 0);
  objc_msgSend_addProperty_(v9, v14, v15, v13);

  v16 = (void *)qword_255B51C08;
  v17 = [TMLSignalDescriptor alloc];
  v20 = (void *)objc_msgSend_initWithName_parameters_(v17, v18, v19, CFSTR("initialize"), 0);
  objc_msgSend_addSignal_(v16, v21, v22, v20);

  v23 = (void *)qword_255B51C08;
  v24 = [TMLSignalDescriptor alloc];
  v27 = (void *)objc_msgSend_initWithName_parameters_(v24, v25, v26, CFSTR("finalize"), 0);
  objc_msgSend_addSignal_(v23, v28, v29, v27);

  v30 = (void *)qword_255B51C08;
  v31 = [TMLMethodDescriptor alloc];
  v32 = [TMLPropertyDescriptor alloc];
  v35 = (void *)objc_msgSend_initWithName_type_attributes_(v32, v33, v34, CFSTR("signal"), 17, 0);
  v45[0] = v35;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v36, v37, v45, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_tmlHasSignal_);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(v31, v40, v41, CFSTR("tmlHasSignal"), 2, v38, v39, 0);
  objc_msgSend_addMethod_(v30, v43, v44, v42);

}

void sub_22AD4E724()
{
  id v0;
  const char *v1;
  double v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x24BDBCED8]);
  v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 8);
  v4 = (void *)qword_255B51C18;
  qword_255B51C18 = v3;

}

void sub_22AD4EDB8(uint64_t a1, const char *a2, _BYTE *a3, double a4)
{
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  id v18;

  objc_msgSend_protocolForName_(*(void **)(a1 + 40), a2, a4, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v18 = v6;
    objc_msgSend_implementsProtocols(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v9, v10, v11))
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend_allObjects(v9, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v14, v16, v17, v15);

      *a3 = 1;
    }

    v6 = v18;
  }

}

void sub_22AD4EE48(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  double v18;
  id v19;
  char *v20;

  v20 = a2;
  objc_msgSend_protocolForName_(*(void **)(a1 + 48), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v15 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, v7, CFSTR("Cannot implement undeclared protocol %@"), v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v15, v17, v18, CFSTR("TMLRuntimeException"), v16, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v19);
  }
  v8 = v5;
  v9 = *(void **)(a1 + 32);
  objc_msgSend_objcProtocol(v5, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend_conformsToProtocol_(v9, v11, v12, v10);

  if ((v9 & 1) == 0)
    objc_msgSend_addObject_(*(void **)(a1 + 40), v13, v14, v8);

}

void sub_22AD4EF2C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  double v9;
  objc_class *v10;
  const char *v11;
  double v12;
  Protocol *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend_signals(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_22AD4EFE8;
  v15[3] = &unk_24F501348;
  v7 = *(_QWORD *)(a1 + 32);
  v16 = v3;
  v17 = v7;
  v14 = v3;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v8, v9, v15);

  v10 = *(objc_class **)(a1 + 32);
  objc_msgSend_objcProtocol(v14, v11, v12);
  v13 = (Protocol *)objc_claimAutoreleasedReturnValue();
  class_addProtocol(v10, v13);

}

void sub_22AD4EFE8(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  id v11;

  v11 = a3;
  if ((objc_msgSend_isOptional(v11, v4, v5) & 1) == 0)
  {
    objc_msgSend_objcProtocol(*(void **)(a1 + 32), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSignalMethod_forProtocol_toClass_(TMLSignalMethods, v9, v10, v11, v8, *(_QWORD *)(a1 + 40));

  }
}

uint64_t sub_22AD4F908(uint64_t a1, double a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_verifyProperty_withClass_, a2);
}

uint64_t sub_22AD4F914(uint64_t a1, double a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_registerMethod_forObject_, a2);
}

uint64_t sub_22AD4F920(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_registerSignal_forObject_(*(void **)(a1 + 32), a2, a4, a3, *(_QWORD *)(a1 + 40));
}

void sub_22AD4F92C()
{
  id v0;
  const char *v1;
  double v2;
  uint64_t v3;
  void *v4;
  id v5;
  const char *v6;
  double v7;
  uint64_t v8;
  void *v9;

  v0 = objc_alloc(MEMORY[0x24BDBCED8]);
  v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 64);
  v4 = (void *)qword_255B51BE8;
  qword_255B51BE8 = v3;

  v5 = objc_alloc(MEMORY[0x24BDBCEF0]);
  v8 = objc_msgSend_initWithCapacity_(v5, v6, v7, 16);
  v9 = (void *)qword_255B51BF8;
  qword_255B51BF8 = v8;

}

void sub_22AD4F980(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  int isEqualToString;
  const char *v10;
  double v11;
  id v12;

  v12 = a3;
  objc_msgSend_superClassName(v12, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v6, v7, v8, *(_QWORD *)(a1 + 32));

  if (isEqualToString)
    objc_msgSend_setSuperClass_(v12, v10, v11, *(_QWORD *)(a1 + 40));

}

void sub_22AD4F9E4(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;
  void *v9;
  const char *v10;
  double v11;
  id v12;

  v12 = a3;
  if (objc_msgSend_isControlStateClass_(TMLUIControlState, v4, v5))
    objc_msgSend_registerControlState_forClass_(TMLUIControlState, v6, v7, v12, *(_QWORD *)(a1 + 32));
  v8 = *(void **)(a1 + 40);
  objc_msgSend_objcClassName(v12, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerClass_className_(v8, v10, v11, v12, v9);

}

uint64_t sub_22AD4FA60(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addProperty_(*(void **)(a1 + 32), a2, a3);
}

void sub_22AD4FA68(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  int isEqualToString;
  const char *v12;
  double v13;
  id v14;

  v14 = a2;
  objc_msgSend_superClassName(v14, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_className(*(void **)(a1 + 32), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v5, v9, v10, v8);

  if (isEqualToString)
    objc_msgSend_registerClass_(*(void **)(a1 + 40), v12, v13, v14);

}

void sub_22AD4FC04(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v10 = a3;
  objc_msgSend_verifyMethod_forProtocol_(v4, v6, v7, v10, v5);
  objc_msgSend_verifySignalMethod_forProtocol_(TMLSignalMethods, v8, v9, v10, *(_QWORD *)(a1 + 32));

}

void sub_22AD4FC64()
{
  id v0;
  const char *v1;
  double v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x24BDBCED8]);
  v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 16);
  v4 = (void *)qword_255B51BF0;
  qword_255B51BF0 = v3;

}

void sub_22AD501A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AD50200(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22AD50210(uint64_t a1)
{

}

id sub_22AD50218(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  objc_class *Superclass;
  objc_class *Class;
  void *v11;
  objc_super v13;

  v7 = a2;
  v8 = a4;
  Superclass = *(objc_class **)(a1 + 40);
  v13.receiver = v7;
  if (!Superclass)
  {
    Class = object_getClass(v7);
    Superclass = class_getSuperclass(Class);
  }
  v13.super_class = Superclass;
  objc_msgSendSuper(&v13, *(SEL *)(a1 + 48), a3, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  sub_22AD502B4(v11, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return v11;
}

void sub_22AD502B4(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  TMLDisposeBlock *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  _QWORD v24[4];
  id v25;
  id location;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_opt_class();
  objc_setAssociatedObject(v3, "cppmsc", v5, 0);
  v27 = CFSTR("owner");
  objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, v10, v28, &v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloneContext_objects_(TMLContext, v12, v13, v4, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_setAssociatedObject(v3, "c", v14, (void *)1);
  objc_initWeak(&location, v14);
  objc_msgSend_currentContext(TMLJSEnvironment, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [TMLDisposeBlock alloc];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_22AD53438;
  v24[3] = &unk_24F4FE150;
  objc_copyWeak(&v25, &location);
  v21 = (void *)objc_msgSend_initWithBlock_(v18, v19, v20, v24);
  objc_msgSend_addObjectReference_(v17, v22, v23, v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void sub_22AD5047C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_22AD504A8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  objc_class *Superclass;
  objc_class *Class;
  void *v9;
  objc_super v11;

  v5 = a2;
  v6 = a3;
  Superclass = *(objc_class **)(a1 + 40);
  v11.receiver = v5;
  if (!Superclass)
  {
    Class = object_getClass(v5);
    Superclass = class_getSuperclass(Class);
  }
  v11.super_class = Superclass;
  objc_msgSendSuper(&v11, *(SEL *)(a1 + 48), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  sub_22AD502B4(v9, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return v9;
}

id sub_22AD5053C(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  objc_class *Superclass;
  objc_class *Class;
  void *v14;
  objc_super v16;

  v11 = a2;
  Superclass = *(objc_class **)(a1 + 40);
  v16.receiver = v11;
  if (!Superclass)
  {
    Class = object_getClass(v11);
    Superclass = class_getSuperclass(Class);
  }
  v16.super_class = Superclass;
  objc_msgSendSuper(&v16, *(SEL *)(a1 + 48), a3, a4, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  sub_22AD502B4(v14, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return v14;
}

id sub_22AD505EC(uint64_t a1, void *a2)
{
  id v3;
  objc_class *Superclass;
  objc_class *Class;
  void *v6;
  objc_super v8;

  v3 = a2;
  Superclass = *(objc_class **)(a1 + 40);
  v8.receiver = v3;
  if (!Superclass)
  {
    Class = object_getClass(v3);
    Superclass = class_getSuperclass(Class);
  }
  v8.super_class = Superclass;
  objc_msgSendSuper(&v8, *(SEL *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  sub_22AD502B4(v6, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return v6;
}

void sub_22AD5066C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  const char *v6;
  double v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_22AD506F0;
  v8[3] = &unk_24F501590;
  v4 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v4;
  v5 = v3;
  objc_msgSend_addGCCallback_(TMLJSEnvironment, v6, v7, v8);

}

void sub_22AD506F0(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_removeAssociatedObjects(*(id *)(a1 + 32));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void sub_22AD50724(uint64_t a1, const char *a2, _BYTE *a3, double a4)
{
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  id v18;

  objc_msgSend_protocolForName_(*(void **)(a1 + 40), a2, a4, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v18 = v6;
    objc_msgSend_implementsProtocols(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v9, v10, v11))
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend_allObjects(v9, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v14, v16, v17, v15);

      *a3 = 1;
    }

    v6 = v18;
  }

}

void sub_22AD507B4(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  double v13;
  objc_class *v14;
  const char *v15;
  double v16;
  Protocol *v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  id v22;
  char *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;

  v23 = a2;
  objc_msgSend_protocolForName_(*(void **)(a1 + 32), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v18 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v23, v7, CFSTR("Cannot implement undeclared protocol %@"), v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v18, v20, v21, CFSTR("TMLRuntimeException"), v19, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v22);
  }
  v8 = v5;
  objc_msgSend_signals(v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_22AD508E8;
  v24[3] = &unk_24F501348;
  v10 = *(_QWORD *)(a1 + 40);
  v25 = v8;
  v26 = v10;
  v11 = v8;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v12, v13, v24);

  v14 = *(objc_class **)(a1 + 40);
  objc_msgSend_objcProtocol(v11, v15, v16);
  v17 = (Protocol *)objc_claimAutoreleasedReturnValue();
  class_addProtocol(v14, v17);

}

void sub_22AD508E8(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  id v11;

  v11 = a3;
  if ((objc_msgSend_isOptional(v11, v4, v5) & 1) == 0)
  {
    objc_msgSend_objcProtocol(*(void **)(a1 + 32), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSignalMethod_forProtocol_toClass_(TMLSignalMethods, v9, v10, v11, v8, *(_QWORD *)(a1 + 40));

  }
}

uint64_t sub_22AD50F1C(objc_property *a1)
{
  const char *Attributes;
  const char *v2;
  double v3;
  const char *v4;
  id v5;
  size_t v6;
  const char *v7;
  double v8;
  __CFString *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  double v20;
  uint64_t v21;
  const char *v22;
  double v23;
  uint64_t v24;
  const char *v25;
  double v26;
  uint64_t v27;

  Attributes = property_getAttributes(a1);
  if (Attributes)
  {
    v4 = Attributes;
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    v6 = strlen(v4);
    v9 = (__CFString *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v5, v7, v8, v4, v6, 1, 0);
    v12 = objc_msgSend_rangeOfString_(v9, v10, v11, CFSTR(","));
  }
  else
  {
    v9 = CFSTR("T ,");
    v12 = objc_msgSend_rangeOfString_(CFSTR("T ,"), v2, v3, CFSTR(","));
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_hasPrefix_(v9, v13, v14, CFSTR("Tr")))
      v17 = 2;
    else
      v17 = 1;
    v18 = objc_msgSend_length(v9, v15, v16) - v17;
    objc_msgSend_substringWithRange_(v9, v19, v20, v17, v18);
  }
  else
  {
    v21 = v12;
    if (!objc_msgSend_hasPrefix_(v9, v13, v14, CFSTR("T")))
    {
      v27 = 0;
      goto LABEL_13;
    }
    objc_msgSend_substringWithRange_(v9, v22, v23, 1, v21 - 1);
  }
  v24 = objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v25, v26, v24);
  v9 = (__CFString *)v24;
LABEL_13:

  return v27;
}

uint64_t sub_22AD5128C()
{
  return 0;
}

void sub_22AD52744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AD52768(uint64_t a1, void *a2, _BYTE *a3)
{
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  id v20;

  v20 = a2;
  objc_msgSend_signals(v20, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, v9, *(_QWORD *)(a1 + 32));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v15)
  {
    objc_msgSend_objcProtocol(v20, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(*(id *)(a1 + 40), "cppmsc");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSignalMethod_forProtocol_toClass_(TMLSignalMethods, v18, v19, v15, v16, v17);

    *a3 = 1;
  }

}

void sub_22AD52A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AD52A74(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  const char *v8;
  double v9;
  id v10;

  v10 = a3;
  if (objc_msgSend_isEqualToString_(a2, v8, v9, *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

void sub_22AD52EC8()
{
  id v0;
  const char *v1;
  double v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x24BDBCED8]);
  v3 = objc_msgSend_initWithCapacity_(v0, v1, v2, 64);
  v4 = (void *)qword_255B51C48;
  qword_255B51C48 = v3;

}

void sub_22AD53438(uint64_t a1)
{
  const char *v1;
  double v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_dispose(WeakRetained, v1, v2);

}

void sub_22AD5350C(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen(a83847776wu1idv);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, a83847776wu1idv, v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

id sub_22AD53674(int a1, int32_t preferredTimescale, Float64 a3)
{
  void *v3;
  const char *v4;
  double v5;
  CMTime v7;

  v3 = (void *)MEMORY[0x24BDD1968];
  CMTimeMakeWithSeconds(&v7, a3, preferredTimescale);
  objc_msgSend_valueWithCMTime_(v3, v4, v5, &v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_22AD536B8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  id v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  CMTime v13;
  CMTime lhs;
  CMTime v15;
  CMTime v16[2];

  v4 = a2;
  v6 = a3;
  memset(&v16[1], 0, sizeof(CMTime));
  if (v4)
    objc_msgSend_CMTimeValue(v4, v5, v7);
  memset(v16, 0, 24);
  if (v6)
    objc_msgSend_CMTimeValue(v6, v5, v7);
  v8 = (void *)MEMORY[0x24BDD1968];
  lhs = v16[1];
  v13 = v16[0];
  CMTimeAdd(&v15, &lhs, &v13);
  objc_msgSend_valueWithCMTime_(v8, v9, v10, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id sub_22AD5377C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  CMTime v14;
  CMTime start;
  CMTimeRange v16;

  v4 = a2;
  v5 = a3;
  v8 = v5;
  v9 = (void *)MEMORY[0x24BDD1968];
  if (!v4)
  {
    memset(&start, 0, sizeof(start));
    if (v5)
      goto LABEL_3;
LABEL_5:
    memset(&v14, 0, sizeof(v14));
    goto LABEL_6;
  }
  objc_msgSend_CMTimeValue(v4, v6, v7);
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend_CMTimeValue(v8, v6, v7);
LABEL_6:
  CMTimeRangeMake(&v16, &start, &v14);
  objc_msgSend_valueWithCMTimeRange_(v9, v10, v11, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_22AD53828(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  CMTime v14;
  CMTime start;
  CMTimeRange v16;

  v4 = a2;
  v5 = a3;
  v8 = v5;
  v9 = (void *)MEMORY[0x24BDD1968];
  if (!v4)
  {
    memset(&start, 0, sizeof(start));
    if (v5)
      goto LABEL_3;
LABEL_5:
    memset(&v14, 0, sizeof(v14));
    goto LABEL_6;
  }
  objc_msgSend_CMTimeValue(v4, v6, v7);
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend_CMTimeValue(v8, v6, v7);
LABEL_6:
  CMTimeRangeFromTimeToTime(&v16, &start, &v14);
  objc_msgSend_valueWithCMTimeRange_(v9, v10, v11, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

Float64 sub_22AD538D4(double a1, uint64_t a2, void *a3)
{
  CMTime time;

  if (a3)
    objc_msgSend_CMTimeValue(a3, (const char *)a3, a1);
  else
    memset(&time, 0, sizeof(time));
  return CMTimeGetSeconds(&time);
}

id sub_22AD53910(double a1, uint64_t a2, void *a3)
{
  void *v4;
  const char *v5;
  double v6;
  CMTime v8;
  CMTime v9;

  v4 = (void *)MEMORY[0x24BDD1968];
  if (a3)
    objc_msgSend_CMTimeValue(a3, (const char *)a3, a1);
  else
    memset(&v8, 0, sizeof(v8));
  CMTimeMultiplyByFloat64(&v9, &v8, a1);
  objc_msgSend_valueWithCMTime_(v4, v5, v6, &v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_22AD53980(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  CMTime v11;
  CMTime time1;

  v4 = a2;
  v5 = a3;
  v8 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5)
      goto LABEL_3;
LABEL_5:
    memset(&v11, 0, sizeof(v11));
    goto LABEL_6;
  }
  objc_msgSend_CMTimeValue(v4, v6, v7);
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend_CMTimeValue(v8, v6, v7);
LABEL_6:
  v9 = CMTimeCompare(&time1, &v11);

  return v9;
}

void sub_22AD54A64(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("83847776br%J}44V[oHGYAX<9%FYjO7682Rf1wSZ4E&ZA]FFl$q*r+8k.T0iTN}-Rav!N$0Uu+6iBI>[>6!{%REXl$s3?KTV7gKr^)yu<Jjf.BEyvY.&IKJ8L#4(/amOpgo3nK6MRR-#qbPz5=yG7+W2B*:&o>Mr*WF{URvO3Jf#j6h.C1A+fAdwP{HWzGG]qy&0W65!F5mr+Vb?lVl<:A=k=gwPw$o3kc&>A=L-eBwN0?C4>JinPXJX5^An-ygQ)%7Y+/{3jprLByw9^B-H#65^An-ygQ)%a}+j*wmYN*xjk)[5^An-ygQ)%gb]QUA+e<6wPIJLB-IIlzGFY}wP?^0Cs=)/z4DZ(8ffq2A+fr9lV)A&wO#P^A+fAdwP{Z/wO<gV3jZMOzCUv+C4>JinPXJX5cr:W3iU6+wO&4:z^)D)v@@[ad}r19p&Zb<x>qGWBy/qIg8ZGbA+f69vpR=mBytZYa{@v4y&r-)l$7gCbie!j8=op9A+fAdwP{HWzGG]qy&0W6l$HgCxjk)[b1&mZAb]Jkx>qGQz/fVqz!%l3AZTRLl${ZVx(!tb0u9u[5Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mSn0WsPA3m{dpwP?^0Cscp^BAhqoy?mS=xM53fwkveQzDfOdmSirzA+fAdwP{Z/wO?$W8yL}8Ab]Jkx>qGQz/fVqz!%l3AUo3.oI/+vC4>JilVl<:A=k=gwPwW@3iKpaoCdCIA+(T73iU6+wO&4:z^)D)v@@[FAb]Jkx>qGQz/fVqz!%l3AYOnPz/](bpJf(.rz(HKw]zY^A+fAdwP{Z/wO<ER0WpqB9b]}fC4>JilVl<:A=k=gwPy<^y?#HNB8tSjA$wu<c<*M9A+fAdwP{HWzGG]qy&0W65!!bop&Zb<x>qGQz/fVqz!%l3AWQ#k)eWLmqa%/bwP?^0Cscp^BAhqoy?mSPvrt{Rz/{8gwG(m75].(5C4>JinPXJXl3bXowmY#%5e(@75Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mS93<)eLzE^s65^8&=BrS2IA+fAdwP{HWzGG]qy&0W6i=GaJC4>JinPXJXl3bXowmZ0Db2[%$zGP/9wPyNUp&Zb<x>qGWBy/rgnP4vBwP?^0Cscp^BAhqoy?mR#1@X(%5Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mR");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "83847776br%J}44V[oHGYAX<9%FYjO7682Rf1wSZ4E&ZA]FFl$q*r+8k.T0iTN}-Rav!N$0Uu+6iBI>[>6!{%REXl$s3?KTV7gKr^)yu<Jjf.BEyvY.&IKJ8L#4(/amOpgo3nK6MRR-#qbPz5=yG7+W2B*:&o>Mr*WF{URvO3Jf#j6h.C1A+fAdwP{HWzGG]qy&0W65!F5mr+Vb?lVl<:A=k=gwPw$o3kc&>A=L-eBwN0?C4>JinPXJX5^An-ygQ)%7Y+/{3jprLByw9^B-H#65^An-ygQ)%a}+j*wmYN*xjk)[5^An-ygQ)%gb]QUA+e<6wPIJLB-IIlzGFY}wP?^0Cs=)/z4DZ(8ffq2A+fr9lV)A&wO#P^A+fAdwP{Z/wO<gV3jZMOzCUv+C4>JinPXJX5cr:W3iU6+wO&4:z^)D)v@@[ad}r19p&Zb<x>qGWBy/qIg8ZGbA+f69vpR=mBytZYa{@v4y&r-)l$7gCbie!j8=op9A+fAdwP{HWzGG]qy&0W6l$HgCxjk)[b1&mZAb]Jkx>qGQz/fVqz!%l3AZTRLl${ZVx(!tb0u9u[5Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mSn0WsPA3m{dpwP?^0Cscp^BAhqoy?mS=xM53fwkveQzDfOdmSirzA+fAdwP{Z/wO?$W8yL}8Ab]Jkx>qGQz/fVqz!%l3AUo3.oI/+vC4>JilVl<:A=k=gwPwW@3iKpaoCdCIA+(T73iU6+wO&4:z^)D)v@@[FAb]Jkx>qGQz/fVqz!%l3AYOnPz/](bpJf(.rz(HKw]zY^A+fAdwP{Z/wO<ER0WpqB9b]}fC4>JilVl<:A=k=gwPy<^y?#HNB8tSjA$wu<c<*M9A+fAdwP{HWzGG]qy&0W65!!bop&Zb<x>qGQz/fVqz!%l3AWQ#k)eWLmqa%/bwP?^0Cscp^BAhqoy?mSPvrt{Rz/{8gwG(m75].(5C4>JinPXJXl3bXowmY#%5e(@75Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mS93<)eLzE^s65^8&=BrS2IA+fAdwP{HWzGG]qy&0W6i=GaJC4>JinPXJXl3bXowmZ0Db2[%$zGP/9wPyNUp&Zb<x>qGWBy/rgnP4vBwP?^0Cscp^BAhqoy?mR#1@X(%5Pz=4C4>JilVl<:A=k=gwPwy%qa%/bwP?^0Cscp^BAhqoy?mR", v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

id sub_22AD54FC4(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  const char *v9;
  double v10;
  const char *v11;
  void *v12;
  char isKindOfClass;
  const char *v14;
  double v15;
  void *v16;
  float v17;
  const char *v18;
  void *v19;
  const char *v20;
  double v21;
  id v22;
  const char *v23;
  double v24;
  void *v25;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v7, v9, v10))
  {
    objc_msgSend_fontDescriptorWithName_size_(MEMORY[0x24BEBB528], v11, a4, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v16 = (void *)MEMORY[0x24BEBB520];
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend_floatValue(v8, v14, v15);
      objc_msgSend_systemFontOfSize_weight_(v16, v18, a4, v17);
    }
    else
    {
      objc_msgSend_systemFontOfSize_(MEMORY[0x24BEBB520], v14, a4);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fontDescriptor(v19, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v22 = objc_alloc(*(Class *)(a1 + 32));
  v25 = (void *)objc_msgSend_initWithFontDescriptor_(v22, v23, v24, v12);

  return v25;
}

CGFont *sub_22AD550E4(uint64_t a1, void *a2)
{
  const __CFData *v2;
  const __CFData *v3;
  CGDataProvider *v4;
  CGFont *v5;
  CGFont *v6;
  const char *v7;
  double v8;
  CFStringRef v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  CFErrorRef error;

  v2 = a2;
  v3 = v2;
  if (!v2)
    goto LABEL_11;
  v4 = CGDataProviderCreateWithCFData(v2);
  if (!v4)
    goto LABEL_11;
  v5 = CGFontCreateWithDataProvider(v4);
  v6 = v5;
  if (!v5)
    goto LABEL_12;
  error = 0;
  if (!CTFontManagerRegisterGraphicsFont(v5, &error))
  {
    v9 = CFErrorCopyDescription(error);
    CFRelease(v9);
  }
  objc_msgSend_familyNames(MEMORY[0x24BEBB520], v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (CGFont *)CGFontCopyPostScriptName(v6);
  if ((int)objc_msgSend_count(v10, v11, v12) < 1)
  {
LABEL_10:

LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  v15 = 0;
  while (1)
  {
    v16 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend_objectAtIndex_(v10, v13, v14, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_fontNamesForFamilyName_(v16, v18, v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v17) = objc_msgSend_containsObject_(v20, v21, v22, v6);
    if ((v17 & 1) != 0)
      break;
    if (++v15 >= (int)objc_msgSend_count(v10, v23, v24))
      goto LABEL_10;
  }

LABEL_12:
  return v6;
}

void sub_22AD5520C(double a1, uint64_t a2, const char *a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = *MEMORY[0x24BDF7658];
  v11[0] = *MEMORY[0x24BDF7660];
  v11[1] = v4;
  v5 = *MEMORY[0x24BDF7648];
  v11[2] = *MEMORY[0x24BDF7650];
  v11[3] = v5;
  v11[4] = *MEMORY[0x24BDF7640];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a3, a1, v11, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v3, v7, v8, v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_255B51C68;
  qword_255B51C68 = v9;

}

id sub_22AD552E8(uint64_t a1, void *a2, void *a3, int a4)
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  char isKindOfClass;
  const char *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  const char *v28;
  float v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  void *v39;
  void *v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  void *v48;
  id v49;
  const char *v50;
  double v51;
  void *v52;

  v6 = a2;
  v7 = a3;
  v8 = objc_alloc(MEMORY[0x24BDF6A80]);
  v11 = (void *)objc_msgSend_initForTextStyle_(v8, v9, v10, v6);
  objc_msgSend_preferredFontForTextStyle_(MEMORY[0x24BEBB520], v12, v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BEBB528];
  objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x24BDF6F30], v16, v17, *MEMORY[0x24BDF76A0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(v15, v19, v20, v6, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v25 = (void *)MEMORY[0x24BEBB520];
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend_pointSize(v21, v23, v24);
    v27 = v26;
    objc_msgSend_floatValue(v7, v28, v26);
    objc_msgSend_systemFontOfSize_weight_(v25, v30, v27, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_fontDescriptor(v14, v23, v24);
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_pointSize(v21, v33, v34);
    objc_msgSend_fontWithDescriptor_size_(v25, v35, v36, v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)v32;
  }

  if (a4)
  {
    v39 = (void *)MEMORY[0x24BEBB528];
    objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x24BDF6F30], v37, v38, *MEMORY[0x24BDF7678]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(v39, v41, v42, v6, v40);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_pointSize(v43, v44, v45);
    objc_msgSend_scaledFontForFont_maximumPointSize_(v11, v46, v47, v31);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v43;
  }
  else
  {
    objc_msgSend_scaledFontForFont_(v11, v37, v38, v31);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v49 = objc_alloc(*(Class *)(a1 + 32));
  v52 = (void *)objc_msgSend_initWithFont_(v49, v50, v51, v48);

  return v52;
}

double sub_22AD554F8(double a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  double v12;

  v4 = (objc_class *)MEMORY[0x24BDF6A80];
  v5 = a3;
  v6 = [v4 alloc];
  v9 = (void *)objc_msgSend_initForTextStyle_(v6, v7, v8, v5);

  objc_msgSend_scaledValueForValue_(v9, v10, a1);
  v12 = v11;

  return v12;
}

double sub_22AD5555C(double a1, uint64_t a2, const char *a3)
{
  void *v4;
  const char *v5;
  double v6;
  double v7;

  objc_msgSend_defaultMetrics(MEMORY[0x24BDF6A80], a3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scaledValueForValue_(v4, v5, a1);
  v7 = v6;

  return v7;
}

double sub_22AD56084(void *a1, const char *a2, double a3)
{
  void *v4;
  const char *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend_view(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_translationInView_(a1, v5, v6, v4);
  v8 = v7;

  return v8;
}

double sub_22AD560D4(void *a1, const char *a2, double a3)
{
  void *v4;
  const char *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend_view(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_velocityInView_(a1, v5, v6, v4);
  v8 = v7;

  return v8;
}

id sub_22AD56330(uint64_t a1, double a2, double a3)
{
  id v5;
  const char *v6;

  v5 = objc_alloc(*(Class *)(a1 + 32));
  return (id)objc_msgSend_initWithPoint_(v5, v6, a2, a3);
}

BOOL sub_22AD56364(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  objc_msgSend_point(a2, v5, v6);
  v8 = v7;
  v10 = v9;
  objc_msgSend_point(v4, v11, v7);
  v13 = v12;
  v15 = v14;

  return v10 == v15 && v8 == v13;
}

id sub_22AD563CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  double v11;
  __int128 v12;
  const char *v13;
  double v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  void *v19;
  __int128 v21;
  double v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;

  v5 = a3;
  v6 = *(objc_class **)(a1 + 32);
  v7 = a2;
  v8 = [v6 alloc];
  objc_msgSend_point(v7, v9, v10);
  v21 = v12;
  v22 = v11;

  if (v5)
  {
    objc_msgSend_transform(v5, v13, v14, v21);
    v15 = v23;
    v16 = v24;
    v17 = v25;
  }
  else
  {
    v17 = 0uLL;
    v15 = 0uLL;
    v16 = 0uLL;
  }
  v18 = vaddq_f64(v17, vmlaq_n_f64(vmulq_n_f64(v16, *(double *)&v21), v15, v22));
  v19 = (void *)objc_msgSend_initWithPoint_(v8, v13, v18.f64[0], v18.f64[1], (_QWORD)v21);

  return v19;
}

id sub_22AD56488(uint64_t a1, CFDictionaryRef dict)
{
  id v3;
  const char *v4;
  void *v5;
  CGPoint v7;

  v7 = (CGPoint)*MEMORY[0x24BDBEFB0];
  if (CGPointMakeWithDictionaryRepresentation(dict, &v7))
  {
    v3 = objc_alloc(*(Class *)(a1 + 32));
    v5 = (void *)objc_msgSend_initWithPoint_(v3, v4, v7.x, v7.y);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void sub_22AD56B24(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("83847776h1!jvbf5d^2Ija%0E}O4-Ndp]ymr-Hf#w3#P(Lm/JOCOvoFTwRQlC<qzDHY!E}7[30(5VH/Vx?[HdP+d7CUpyLzPm#hp=v%:TEbD7b*$%m.($O]jpHau[4ppQ6:E!NXlUc4cSR.B-4E)oW?Uwg%Z8zIzadx?r$!P3rNSJrzDqcBzku3v{%E[z/eD:B8V5nB7DKr3jH/<Bzku3v{%E[z/cf$rzDqcBzku3v{%E[z/cx)a@*}3vpKy[z/ecSwO#Q7w[+*%5^AA0A+PA77Y:#t0TYVxpek.Hx>z6?vruj4zC>4=B.bSoa%Ev0v@DmbwO#P56&!17z//Y9x>7N[x(v(Rz/fVdzGDY@a%Ev0BAh8dxjV8@6&!17z//Y9x>7N[x(v(*A+Pf0wPwQ*a@gH)x>g^)Bzku3wPwy/B98CpzF6^!go7uZbxvvnB.bSos7#+&nN#yIBzku3wPydRzGGDcBx0o{xj>^@5d/-]3jpGTwO#Q7w[+*%5^AA0A+PA78xYv(v@DmbwO#P56&!17z//Y9x>7N[x(v(Rz/fVdzGD^t3i$V[x>I6&AUo9!pek.Hx>z6?vruj4zD7T<xj>^@a$1)YwPq<7B97F$BzalRwO#Q7w[+*%i+98CBy/uii=]yRxj>^@iTRwU3li5vo)7L^vR/QJz//Y9x>7N[x(v(Rz/fVdzGDHarzDqcBzku3v{%E[z/d{XzGGDcBrRt82Y>b$Bzk&kwFbh*BAh8kxcFi24@tV%zEWuKzdd6*pgn0J5^AA0A+PA7a}C1:vQS!WwFbh=vRPE:BrRRg5oIPawNPavwmYU2x>z6<AUnN$BAh8kxcE&[1:1E2y?jj-B98CpzF7dk3i+G?B-7.56id!5z//Y9x>7N[x(v(/z/]@da}$v(vruQ1v}YZ<zGG}j1Z#B(vr<4b3iT*Rwo!^(B98CpzF7dk3kc&SBy/96A^pk!wO#Q7w[+*%5^AA0A+PA7a@gH>B-RbmnP5cU5^&e-v@#B6zEENh3HE<39At<4vqGH)wmoHNz//Y9x>7N[x(v(*A+Pf0wPwy#rzDqcBzku3v{%E[z/eJ{x>I6&AV#+o4Rf0&wKyxMAbPS9zGG}j5kDd(vru6Fz/6DizE)ZcA#j{kJSxFnBAh8dxjV9+x([2Rvru6Pvru0)x(mMJz/6DizE)ZcB5DN*wNPX45d/:73jZPPBy!%2ze:AhwO#Qh5!E/pl$7gGlVl*Xz/fc7BAnuh3i$P.AaJE1A$OQ+z/oCod>tZZx>I6&A-V%%xHDoJwLDPPv}YN]xg3POAbPS9zGG}XA+fi3vruMK3s<FSrzDqcBzku3v{%E[z/eG(B-7.B9%@A!wObv[y&&P]B-7.35f.MlwmYvYB.(d#z/]@dgaS+tB8MhswklMIwN(t-8v^8SzEEx[5^AA0A+PA7a}b#yz/]@dpgn0Jwi75[3lJnyraQq@nP5G&Bwu:@x>z6?vruj4zC>4!AbPSnwFb+Upek.Hx>z6?vruj4zC>4!AbPSnwG?/}2Z7i1A-uQ{Bp[!0BAh8kxbyTRR2Z]zrzDkav{%E[z/er*Bzku3v{%E[z/eJ{x>I6&AUo9!pek.Hx>z6?vruj4zD7T<xj>^@a}$v*A+e($z/cf[lRHx?xk8p47Y=x[3k4x2x>I6&A-V%%xI@zOx(v(25e(e*26ao/x(v(42T.o-wOkZ}zw<2)2xBx{wNPX45^hVZz!{Qpd%b/Cxj>^@s7#+&qE%GPz/dQRwPhi?BAoFImHxS9pek.Hx>z6?vruj4zxYS01y$}.wFbhxq:+5owF+B(a{[M}wPq<7B953frzDqcBzku3v{%E[z/eD:ADL&lBqL2=g71[0peD7OxIJF/x>z6?vruj4zD7T<xj>^@5/1zwph+k*w[+:-BzkVhrb#X=xjV8<.#Qh*rzDIczdMpRBy/GovqFXSBzku3v{%E[z/eJ{x>I6&AUo9!pek.Hx>z6?vruj4zD7T<xj>^@a@yT}BzkP6nP5SYA=$(c5^z(+BZ/e#7Y=yf3lBqfx>I6&A-V%%xJeX.wL3=YwPz%5y/j?-wNPX45d/-}3jI2<zdNB0By/GovqDLXwn=Q1y?jH}3i$P.AaJE1A$OQ+z/oCoa"
         "UdUPx>I6&A-V%%xJeX.wL3=YwPz%5y=VPFAaJE1B2<U>0TYVxpek.Hx>z6?vruj4zBntWBy/uia}$v&B9g@lx([f55^AA0A+PA77Y+*13j*@YB-"
         "7Y5nO})GwLMVJwFbh*BAh8kxbyT[5EFXJvpT1Z5^An-ygQ)%7Y+*23j}q)A+eV&nN#yIBzku3wPwy/B98CpzF6^!a}Ud=Bzk&kwFbh*BAh8kxby"
         "T[9TS6(z/]@d5!!nuph+k*w[+:-BzkVhq/u!@weCs>777BTBAy@3xL?r#BAn5#vrcx%C]cMa5deLHz!aba26j)bx(mM20u@M(5[tu(wOk}4C$zK"
         "TzGGP8x>qq$26j)bx(mM20u@u/2Z7i1A.gdXzXry/x>8m0z/f07C]cL?dHD[<pek.Hx>z6?vruj4zD7T<xj>^@a}Ud!A+fi3vruM61y=p/y-0g53pX@RzE^f$x(v>");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "83847776h1!jvbf5d^2Ija%0E}O4-Ndp]ymr-Hf#w3#P(Lm/JOCOvoFTwRQlC<qzDHY!E}7[30(5VH/Vx?[HdP+d7CUpyLzPm#hp=v%:TEbD7b*$%m.($O]jpHau[4ppQ6:E!NXlUc4cSR.B-4E)oW?Uwg%Z8zIzadx?r$!P3rNSJrzDqcBzku3v{%E[z/eD:B8V5nB7DKr3jH/<Bzku3v{%E[z/cf$rzDqcBzku3v{%E[z/cx)a@*}3vpKy[z/ecSwO#Q7w[+*%5^AA0A+PA77Y:#t0TYVxpek.Hx>z6?vruj4zC>4=B.bSoa%Ev0v@DmbwO#P56&!17z//Y9x>7N[x(v(Rz/fVdzGDY@a%Ev0BAh8dxjV8@6&!17z//Y9x>7N[x(v(*A+Pf0wPwQ*a@gH)x>g^)Bzku3wPwy/B98CpzF6^!go7uZbxvvnB.bSos7#+&nN#yIBzku3wPydRzGGDcBx0o{xj>^@5d/-]3jpGTwO#Q7w[+*%5^AA0A+PA78xYv(v@DmbwO#P56&!17z//Y9x>7N[x(v(Rz/fVdzGD^t3i$V[x>I6&AUo9!pek.Hx>z6?vruj4zD7T<xj>^@a$1)YwPq<7B97F$BzalRwO#Q7w[+*%i+98CBy/uii=]yRxj>^@iTRwU3li5vo)7L^vR/QJz//Y9x>7N[x(v(Rz/fVdzGDHarzDqcBzku3v{%E[z/d{XzGGDcBrRt82Y>b$Bzk&kwFbh*BAh8kxcFi24@tV%zEWuKzdd6*pgn0J5^AA0A+PA7a}C1:vQS!WwFbh=vRPE:BrRRg5oIPawNPavwmYU2x>z6<AUnN$BAh8kxcE&[1:1E2y?jj-B98CpzF7dk3i+G?B-7.56id!5z//Y9x>7N[x(v(/z/]@da}$v(vruQ1v}YZ<zGG}j1Z#B(vr<4b3iT*Rwo!^(B98CpzF7dk3kc&SBy/96A^pk!wO#Q7w[+*%5^AA0A+PA7a@gH>B-RbmnP5cU5^&e-v@#B6zEENh3HE<39At<4vqGH)wmoHNz//Y9x>7N[x(v(*A+Pf0wPwy#rzDqcBzku3v{%E[z/eJ{x>I6&AV#+o4Rf0&wKyxMAbPS9zGG}j5kDd(vru6Fz/6DizE)ZcA#j{kJSxFnBAh8dxjV9+x([2Rvru6Pvru0)x(mMJz/6DizE)ZcB5DN*wNPX45d/:73jZPPBy!%2ze:AhwO#Qh5!E/pl$7gGlVl*Xz/fc7BAnuh3i$P.AaJE1A$OQ+z/oCod>tZZx>I6&A-V%%xHDoJwLDPPv}YN]xg3POAbPS9zGG}XA+fi3vruMK3s<FSrzDqcBzku3v{%E[z/eG(B-7.B9%@A!wObv[y&&P]B-7.35f.MlwmYvYB.(d#z/]@dgaS+tB8MhswklMIwN(t-8v^8SzEEx[5^AA0A+PA7a}b#yz/]@dpgn0Jwi75[3lJnyraQq@nP5G&Bwu:@x>z6?vruj4zC>4!AbPSnwFb+Upek.Hx>z6?vruj4zC>4!AbPSnwG?/}2Z7i1A-uQ{Bp[!0BAh8kxbyTRR2Z]zrzDkav{%E[z/er*Bzku3v{%E[z/eJ{x>I6&AUo9!pek.Hx>z6?vruj4zD7T<xj>^@a}$v*A+e($z/cf[lRHx?xk8p47Y=x[3k4x2x>I6&A-V%%xI@zOx(v(25e(e*26ao/x(v(42T.o-wOkZ}zw<2)2xBx{wNPX45^hVZz!{Qpd%b/Cxj>^@s7#+&qE%GPz/dQRwPhi?BAoFImHxS9pek.Hx>z6?vruj4zxYS01y$}.wFbhxq:+5owF+B(a{[M}wPq<7B953frzDqcBzku3v{%E[z/eD:ADL&lBqL2=g71[0peD7OxIJF/x>z"
    "6?vruj4zD7T<xj>^@5/1zwph+k*w[+:-BzkVhrb#X=xjV8<.#Qh*rzDIczdMpRBy/GovqFXSBzku3v{%E[z/eJ{x>I6&AUo9!pek.Hx>z6?vruj4zD7T"
    "<xj>^@a@yT}BzkP6nP5SYA=$(c5^z(+BZ/e#7Y=yf3lBqfx>I6&A-V%%xJeX.wL3=YwPz%5y/j?-wNPX45d/-}3jI2<zdNB0By/GovqDLXwn=Q1y?jH}"
    "3i$P.AaJE1A$OQ+z/oCoaUdUPx>I6&A-V%%xJeX.wL3=YwPz%5y=VPFAaJE1B2<U>0TYVxpek.Hx>z6?vruj4zBntWBy/uia}$v&B9g@lx([f55^AA0A"
    "+PA77Y+*13j*@YB-7Y5nO})GwLMVJwFbh*BAh8kxbyT[5EFXJvpT1Z5^An-ygQ)%7Y+*23j}q)A+eV&nN#yIBzku3wPwy/B98CpzF6^!a}Ud=Bzk&kwF"
    "bh*BAh8kxbyT[9TS6(z/]@d5!!nuph+k*w[+:-BzkVhq/u!@weCs>777BTBAy@3xL?r#BAn5#vrcx%C]cMa5deLHz!aba26j)bx(mM20u@M(5[tu(wOk"
    "}4C$zKTzGGP8x>qq$26j)bx(mM20u@u/2Z7i1A.gdXzXry/x>8m0z/f07C]cL?dHD[<pek.Hx>z6?vruj4zD7T<xj>^@a}Ud!A+fi3vruM61y=p/y-0g53pX@RzE^f$x(v>",
    v2,
    0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

void sub_22AD56EAC(uint64_t a1)
{
  uint64_t v2;
  char i;
  char v4;
  const char *v5;
  size_t v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  id v11;
  _QWORD v12[3];

  v2 = 0;
  v12[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = a83847776euNPyO;
  v12[1] = a83847776gduK53;
  for (i = 1; ; i = 0)
  {
    v4 = i;
    v5 = (const char *)v12[v2];
    v6 = strlen(v5);
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v7, v8, v5, v6, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_loadClasses_(TMLContext, v9, v10) & 1) == 0)
      break;

    v2 = 1;
    if ((v4 & 1) == 0)
      return;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;

}

id sub_22AD57360(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  const char *v4;
  double v5;
  void *v6;
  void *v7;
  const char *v8;
  double v9;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v3, v4, v5, v2, 0);
  }
  else
  {
    objc_msgSend_string(MEMORY[0x24BDD17C8], v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v3, v8, v9, v7, 0);

  }
  return v6;
}

id sub_22AD573FC(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_base64EncodedStringWithOptions_(v2, v3, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id sub_22AD5745C(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    v8 = (void *)objc_msgSend_initWithData_encoding_(v5, v6, v7, v4, a3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id sub_22AD574C8(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  const char *v5;
  double v6;
  void *v7;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_dataUsingEncoding_(v4, v5, v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id sub_22AD5752C(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  void *v9;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = objc_msgSend_length(v2, v3, v4);
    objc_msgSend_numberWithUnsignedInteger_(v5, v7, v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t sub_22AD5759C(double a1)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDBCE60], sel_date, a1);
}

void sub_22AD575A8(double a1, uint64_t a2, void *a3)
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  id v19;

  v19 = a3;
  if ((objc_msgSend_isObject(v19, v4, v5) & 1) != 0)
  {
    objc_msgSend_blockWithFunction_(TMLBlock, v6, v7, v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
    dispatch_after(v9, MEMORY[0x24BDAC9B8], v8);
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v10, v11, v12, CFSTR("Callback is not a function"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v16, v17, v18, v13);

  }
}

uint64_t sub_22AD57690(double a1)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDD1880], sel_UUID, a1);
}

uint64_t sub_22AD5769C()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x24BDAC9B8];
  v1 = MEMORY[0x24BDAC9B8];
  return v0;
}

uint64_t sub_22AD576C8(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend_intValue(v2, v3, v4);
  else
    v5 = 0;

  return v5;
}

float sub_22AD5773C(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  float v5;
  float v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), v5 = 0.0, (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_floatValue(v2, v3, v4);
    v5 = v6;
  }

  return v5;
}

double sub_22AD577B4(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  double v5;
  double v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), v5 = 0.0, (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_doubleValue(v2, v3, v4);
    v5 = v6;
  }

  return v5;
}

uint64_t sub_22AD5782C(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend_BOOLValue(v2, v3, v4);
  else
    v5 = 0;

  return v5;
}

id sub_22AD578A0(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  const char *v4;
  double v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_stringValue(v2, v4, v5);
    else
      objc_msgSend_string(MEMORY[0x24BDD17C8], v4, v5);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v3;

  return v6;
}

id sub_22AD57928(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id sub_22AD5797C(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t sub_22AD579D0(double a1, uint64_t a2, void *a3)
{
  return objc_msgSend_isEqual_(a3, (const char *)a3, a1);
}

id sub_22AD579D8(double a1, uint64_t a2, const char *a3, int a4)
{
  void *v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  id v25;
  const char *v26;
  double v27;

  objc_msgSend_unwrap_(TMLJSNil, a3, a1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_conformsToProtocol_(v5, v6, v7, &unk_255B53888) & 1) != 0)
  {
    if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_alloc(MEMORY[0x24BDBCE30]);
        v13 = objc_msgSend_initWithArray_copyItems_(v10, v11, v12, v5, 1);
LABEL_9:
        v24 = (void *)v13;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = objc_alloc(MEMORY[0x24BDBCE70]);
        v13 = objc_msgSend_initWithDictionary_copyItems_(v25, v26, v27, v5, 1);
        goto LABEL_9;
      }
    }
    v13 = objc_msgSend_copyWithZone_(v5, v8, v9, 0);
    goto LABEL_9;
  }
  v14 = (void *)MEMORY[0x24BDDA730];
  objc_msgSend_currentContext(MEMORY[0x24BDDA720], v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueWithNewErrorFromMessage_inContext_(v14, v16, v17, CFSTR("Object cannot be cloned"), v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentContext(MEMORY[0x24BDDA720], v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setException_(v21, v22, v23, v18);

  v24 = 0;
LABEL_10:

  return v24;
}

void sub_22AD57B0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  __CFString *v9;
  const char *v10;
  double v11;
  id v12;

  v4 = a3;
  objc_msgSend_unwrap_(TMLJSNil, v5, v6, a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unwrap_(TMLJSNil, v7, v8, v4);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v9 || objc_msgSend_isEqualToString_(v9, v10, v11, CFSTR("undefined")))
  {

    v9 = CFSTR("_");
  }

}

void sub_22AD57BA0(double a1, uint64_t a2, const char *a3)
{
  objc_msgSend_unwrap_(TMLJSNil, a3, a1, a3);

}

uint64_t sub_22AD57BC4(double a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](a3, sel_tmlValueForKey_, a1);
}

uint64_t sub_22AD57BCC(double a1, uint64_t a2, void *a3)
{
  return objc_msgSend_tmlValueForKeyPath_(a3, (const char *)a3, a1);
}

id sub_22AD57BD4(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;

  v2 = a2;
  objc_msgSend_currentContext(TMLContext, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectWithIdentifierNoCreate_(v5, v6, v7, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_22AD57C30(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  const char *v8;
  double v9;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectWithIdentifier_(v6, v8, v9, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

id sub_22AD57CB4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  const char *v8;
  double v9;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectWithIdentifierNoCreate_(v6, v8, v9, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

BOOL sub_22AD57D38(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  void *v8;
  double v9;
  void *v10;
  _BOOL8 v11;

  v4 = a2;
  objc_msgSend_unwrap_(TMLJSNil, v5, v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_tmlSignalHandlerForSignal_(v4, v7, v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id sub_22AD57DB0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  const char *v10;
  void *v11;
  double v12;
  id v13;
  const char *v14;
  double v15;
  id v17;

  v6 = a2;
  v7 = a4;
  objc_msgSend_unwrap_(TMLJSNil, v8, v9, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend_tmlSignalHandlerForSignal_(v6, v10, v12, v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v17 = 0;
      objc_msgSend_emitTMLSignal_withArguments_returnValue_(v6, v14, v15, v11, v7, &v17);
      v13 = v17;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id sub_22AD57E64(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;

  v2 = a2;
  objc_msgSend_ensureClass_(TMLRuntime, v3, v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objcClass(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t sub_22AD57F6C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  char isKindOfClass;

  v4 = a2;
  v5 = a3;
  objc_msgSend_ensureClass_(TMLRuntime, v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objcClass(v8, v9, v10);
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL sub_22AD58094(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  char isNil;
  const char *v9;
  double v10;
  BOOL v11;
  id v12;
  char v13;
  const char *v14;
  double v15;
  id v16;
  char v17;
  const char *v18;
  double v19;
  _BOOL8 v20;

  v4 = a2;
  v5 = a3;
  isNil = objc_msgSend_isNil_(TMLJSNil, v6, v7, v4);
  v11 = 1;
  if (v4 && (isNil & 1) == 0)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v12 == v4;

  }
  v13 = objc_msgSend_isNil_(TMLJSNil, v9, v10, v5);
  v20 = 0;
  if (v5 && (v13 & 1) == 0)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v17 = v16 == v5 || v11;
    if ((v17 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (v4 == v5 || (objc_msgSend_isEqualToDictionary_(v4, v18, v19, v5) & 1) != 0))
        {
          v20 = 1;
        }
      }
    }
  }

  return v20;
}

uint64_t sub_22AD581A0(double a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](a3, sel_boundingRectWithSize_options_attributes_context_, a1);
}

void sub_22AD59C0C(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  NSString *v9;
  Class v10;
  const char *v11;
  double v12;
  id v13;

  v2 = strlen(a838477763loe1q);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, a838477763loe1q, v2, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, v8, CFSTR("%@%@IndexPath"), CFSTR("UI"), CFSTR("Mutable"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = NSClassFromString(v9);
    objc_msgSend_tmlMakeJSObjectClass(v10, v11, v12);

  }
}

void sub_22AD5A180(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  id v22;

  v4 = a3;
  objc_msgSend_description(a2, v5, v6);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BDF67F8]);
  objc_msgSend_description(v22, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v9, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles_(v10, v17, v18, v13, v16, 0, CFSTR("OK"), 0);

  objc_msgSend_show(v19, v20, v21);
}

double sub_22AD5A248(double a1, uint64_t a2, const char *a3)
{
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], a3, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemVersion(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v6, v7, v8);
  v10 = v9;

  return v10;
}

id sub_22AD5A29C(double a1, uint64_t a2, const char *a3)
{
  void *v5;
  id v6;
  const char *v7;
  void *v8;

  objc_msgSend_unwrap_(TMLJSNil, a3, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BEBB510]);
  v8 = (void *)objc_msgSend_initWithTextAlignment_location_options_(v6, v7, a1, a3, v5);

  return v8;
}

uint64_t sub_22AD5A300(double a1)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDD15D8], sel_indexPathForRow_inSection_, a1);
}

uint64_t sub_22AD5A314(double a1)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDD15D8], sel_indexPathForItem_inSection_, a1);
}

uint64_t sub_22AD5A328(double a1)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDD15E0], sel_indexSetWithIndex_, a1);
}

id sub_22AD5A338(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  const char *v9;
  double v10;
  id v11;
  const char *v12;
  char isKindOfClass;
  double v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  double v21;
  void *v22;
  void *v23;
  const char *v24;
  double v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  const char *v30;
  double v31;
  void *v32;
  id v33;
  const char *v34;
  double v35;
  void *v36;
  id v37;
  id v38;
  const char *v39;
  double v40;
  void *v41;
  id v42;
  const char *v43;
  double v44;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;

  v46 = a3;
  v7 = a2;
  v8 = a4;
  objc_msgSend_unwrap_(TMLJSNil, v9, v10, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v15 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend_componentsJoinedByString_(v7, v12, v14, CFSTR("-"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_currentContext(TMLJSEnvironment, v12, v14, v46);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = v16;
    if (qword_255B51C98 != -1)
      dispatch_once(&qword_255B51C98, &unk_24F5027E0);
    v19 = objc_alloc(MEMORY[0x24BDBCED8]);
    v22 = (void *)objc_msgSend_initWithCapacity_(v19, v20, v21, 16);
    v23 = (void *)qword_255B51C90;
    v26 = objc_msgSend_length(v17, v24, v25);
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = sub_22AD63EA4;
    v52[3] = &unk_24F502808;
    v53 = v17;
    v54 = v18;
    v27 = v22;
    v55 = v27;
    v28 = v18;
    v29 = v17;
    objc_msgSend_enumerateMatchesInString_options_range_usingBlock_(v23, v30, v31, v29, 0, 0, v26, v52);
    v32 = v55;
    v11 = v27;

    if ((isKindOfClass & 1) != 0)
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v36 = (void *)objc_msgSend_initWithCapacity_(v33, v34, v35, 64);
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = sub_22AD5A6B4;
    v47[3] = &unk_24F502180;
    v37 = v36;
    v48 = v37;
    v51 = v46;
    v49 = v8;
    v38 = v11;
    v50 = v38;
    objc_msgSend_enumerateObjectsUsingBlock_(v7, v39, v40, v47);
    v41 = v50;
    v42 = v37;

    v11 = v38;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(MEMORY[0x24BDD1628], v43, v44, v7, v46, v8, v11);
    else
      objc_msgSend_array(MEMORY[0x24BDBCE30], v43, v44);
    v42 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v42;
}

void sub_22AD5A640(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    objc_msgSend_currentContext(TMLJSEnvironment, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raiseException_(v5, v6, v7, v2);

    objc_msgSend_array(MEMORY[0x24BDBCE30], v8, v9);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x22AD5A5F8);
  }
  _Unwind_Resume(exception_object);
}

void sub_22AD5A6B4(_QWORD *a1, const char *a2, double a3)
{
  void *v3;
  const char *v4;
  double v5;
  id v6;

  v3 = (void *)a1[4];
  objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(MEMORY[0x24BDD1628], a2, a3, a2, a1[7], a1[5], a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v3, v4, v5, v6);

}

id sub_22AD5A708(double a1, double a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9)
{
  id v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;

  v16 = a8;
  objc_msgSend_unwrap_(TMLJSNil, v17, v18, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unwrap_(TMLJSNil, v20, v21, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x24BDD1628], v23, a1, v19, a6, a7, v22, a9, a2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v24;
  if (a3 > 0.0)
  {
    *(float *)&v26 = a3;
    objc_msgSend_setPriority_(v24, v25, v26);
  }

  return v27;
}

id sub_22AD5A850(float a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  _QWORD v9[4];
  float v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a1 > 0.0)
    {
      *(float *)&v6 = a1;
      objc_msgSend_setPriority_(v4, v5, v6);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_22AD5A914;
      v9[3] = &unk_24F502220;
      v10 = a1;
      objc_msgSend_enumerateObjectsUsingBlock_(v4, v7, COERCE_DOUBLE(3221225472), v9);
    }
  }
  return v4;
}

void sub_22AD5A914(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 32);
    if (*(float *)&v4 > 0.0)
      objc_msgSend_setPriority_(v5, v3, v4);
  }

}

id sub_22AD5A974(uint64_t a1, void *a2)
{
  UIImage *v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    UIImagePNGRepresentation(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id sub_22AD5A9D0(CGFloat a1, uint64_t a2, void *a3)
{
  UIImage *v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    UIImageJPEGRepresentation(v4, a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL sub_22AD5AA3C(double a1, uint64_t a2, void *a3)
{
  return (unint64_t)(objc_msgSend_integerValue(a3, (const char *)a3, a1) - 3) < 2;
}

BOOL sub_22AD5AA60(double a1, uint64_t a2, void *a3)
{
  return (unint64_t)(objc_msgSend_integerValue(a3, (const char *)a3, a1) - 1) < 2;
}

BOOL sub_22AD5AA84(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  _BOOL8 v5;

  v2 = a2;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_horizontalSizeClass(v2, v3, v4) != 0;

  return v5;
}

BOOL sub_22AD5AAE0(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  _BOOL8 v5;

  v2 = a2;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_verticalSizeClass(v2, v3, v4) != 0;

  return v5;
}

void sub_22AD5AB3C(double a1, double a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  id v34;

  v34 = a5;
  v10 = a6;
  if ((objc_msgSend_isObject(v34, v11, v12) & 1) != 0)
  {
    objc_msgSend_blockWithFunction_(TMLBlock, v13, v14, v34);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isObject(v10, v16, v17))
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v18, v19, "B");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v21, v22, v10, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x22E2E7E44]();

      objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x24BDF6F90], v25, a1, a4, v15, v24, a2);
    }
    else
    {
      v24 = 0;
      objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x24BDF6F90], v18, a1, a4, v15, 0, a2);
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v26, v27, v28, CFSTR("Animations is not a function"), v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v31, v32, v33, v24);

  }
}

void sub_22AD5AC9C(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  id v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  id v38;

  v38 = a7;
  v14 = a8;
  if ((objc_msgSend_isObject(v38, v15, v16) & 1) != 0)
  {
    objc_msgSend_blockWithFunction_(TMLBlock, v17, v18, v38);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isObject(v14, v20, v21))
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v22, v23, "B");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v25, v26, v14, v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x22E2E7E44]();

      objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_(MEMORY[0x24BDF6F90], v29, a1, a6, v19, v28, a2, a3, a4);
    }
    else
    {
      v28 = 0;
      objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_(MEMORY[0x24BDF6F90], v22, a1, a6, v19, 0, a2, a3, a4);
    }
  }
  else
  {
    v30 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v30, v31, v32, CFSTR("Animations is not a function"), v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v35, v36, v37, v28);

  }
}

void sub_22AD5AE14(double a1, double a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  id v34;

  v34 = a5;
  v10 = a6;
  if ((objc_msgSend_isObject(v34, v11, v12) & 1) != 0)
  {
    objc_msgSend_blockWithFunction_(TMLBlock, v13, v14, v34);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isObject(v10, v16, v17))
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v18, v19, "B");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v21, v22, v10, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x22E2E7E44]();

      objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(MEMORY[0x24BDF6F90], v25, a1, a4, v15, v24, a2);
    }
    else
    {
      v24 = 0;
      objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(MEMORY[0x24BDF6F90], v18, a1, a4, v15, 0, a2);
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v26, v27, v28, CFSTR("Animations is not a function"), v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v31, v32, v33, v24);

  }
}

void sub_22AD5AF74(double a1, double a2, uint64_t a3, void *a4)
{
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  id v21;

  v21 = a4;
  if ((objc_msgSend_isObject(v21, v6, v7) & 1) != 0)
  {
    objc_msgSend_blockWithFunction_(TMLBlock, v8, v9, v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x24BDF6F90], v11, a1, v10, a2);
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v12, v13, v14, CFSTR("Animations is not a function"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v18, v19, v20, v15);

  }
}

void sub_22AD5B050(double a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  id v35;

  v35 = a3;
  v10 = a5;
  v11 = a6;
  if ((objc_msgSend_isObject(v10, v12, v13) & 1) != 0)
  {
    objc_msgSend_blockWithFunction_(TMLBlock, v14, v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isObject(v11, v17, v18))
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v19, v20, "B");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v22, v23, v11, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x22E2E7E44]();

      objc_msgSend_transitionWithView_duration_options_animations_completion_(MEMORY[0x24BDF6F90], v26, a1, v35, a4, v16, v25);
    }
    else
    {
      v25 = 0;
      objc_msgSend_transitionWithView_duration_options_animations_completion_(MEMORY[0x24BDF6F90], v19, a1, v35, a4, v16, 0);
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v27, v28, v29, CFSTR("Animations is not a function"), v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v32, v33, v34, v25);

  }
}

void sub_22AD5B1C4(double a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  void *v25;
  id v26;

  v10 = a6;
  v11 = a4;
  objc_msgSend_unwrap_(TMLJSNil, v12, v13, a3);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unwrap_(TMLJSNil, v14, v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isObject(v10, v17, v18))
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v19, v20, "B");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v22, v23, v10, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x22E2E7E44]();

  }
  else
  {
    v25 = 0;
  }
  objc_msgSend_transitionFromView_toView_duration_options_completion_(MEMORY[0x24BDF6F90], v19, a1, v26, v16, a5, v25);

}

void sub_22AD5B2E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  id v38;

  v10 = a5;
  v11 = a6;
  objc_msgSend_unwrap_(TMLJSNil, v12, v13, a3);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isObject(v10, v14, v15) & 1) != 0)
  {
    objc_msgSend_blockWithFunction_(TMLBlock, v16, v17, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isObject(v11, v19, v20))
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v21, v22, "B");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v24, v25, v11, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x22E2E7E44]();

      objc_msgSend_performSystemAnimation_onViews_options_animations_completion_(MEMORY[0x24BDF6F90], v28, v29, a2, v38, a4, v18, v27);
    }
    else
    {
      v27 = 0;
      objc_msgSend_performSystemAnimation_onViews_options_animations_completion_(MEMORY[0x24BDF6F90], v21, v22, a2, v38, a4, v18, 0);
    }
  }
  else
  {
    v30 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v30, v31, v32, CFSTR("Animations is not a function"), v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v35, v36, v37, v27);

  }
}

void sub_22AD5B464(uint64_t a1, void *a2)
{
  const char *v2;
  double v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  id v18;

  v18 = a2;
  if ((objc_msgSend_isObject(v18, v2, v3) & 1) != 0)
  {
    objc_msgSend_blockWithFunction_(TMLBlock, v4, v5, v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performWithoutAnimation_(MEMORY[0x24BDF6F90], v7, v8, v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v9, v10, v11, CFSTR("Animations is not a function"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v15, v16, v17, v12);

  }
}

uint64_t sub_22AD5B528(double a1)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDF6F90], sel_setAnimationsEnabled_, a1);
}

void sub_22AD5B56C(double a1, uint64_t a2, const char *a3)
{
  UIAccessibilityNotifications v3;
  const char *v4;
  double v5;
  void *v6;
  id argument;

  v3 = a3;
  objc_msgSend_unwrap_(TMLJSNil, a3, a1);
  argument = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_attributedString(argument, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v3, v6);

  }
  else
  {
    UIAccessibilityPostNotification(v3, argument);
  }

}

BOOL sub_22AD5B5F4(int a1, UIContentSizeCategory category)
{
  return UIContentSizeCategoryIsAccessibilityCategory(category);
}

id sub_22AD5B5FC(uint64_t a1, void *a2)
{
  NSString *v2;
  NSString *v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  UIAccessibilityFocusedElement(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id sub_22AD5B654(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend_isObject(v7, v8, v9))
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v10, v11, "@");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_blockWithFunction_argumentsEncoding_(TMLBlock, v13, v14, v7, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x22E2E7E44]();

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x24BDF67E8], v10, v11, v6, a3, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void sub_22AD63E68(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x24BDD1798], a3, a1, CFSTR("\\[(\\w+)[^\\]]*\\]"), 0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255B51C90;
  qword_255B51C90 = v3;

}

void sub_22AD63EA4(uint64_t a1, void *a2, double a3)
{
  void *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend_rangeAtIndex_(a2, (const char *)a2, a3, 1);
  objc_msgSend_substringWithRange_(v4, v6, v7, v5, v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectWithIdentifier_(*(void **)(a1 + 40), v8, v9, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(*(void **)(a1 + 48), v11, v12, v10, v13);

}

void sub_22AD63F1C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  id v15;

  v3 = a3;
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, v5, &unk_24F502828, CFSTR("image"));
  objc_msgSend_objectForKeyedSubscript_(v3, v6, v7, CFSTR("image"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v8, v9, v10, &unk_24F502848, CFSTR("systemImageNamed"));

  objc_msgSend_objectForKeyedSubscript_(v3, v11, v12, CFSTR("image"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v15, v13, v14, &unk_24F502868, CFSTR("withdata"));
}

uint64_t sub_22AD63FC4(double a1, uint64_t a2, const char *a3)
{
  return objc_msgSend_imageNamed_(MEMORY[0x24BDF6AC8], a3, a1, a3);
}

id sub_22AD63FD4(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  id v9;
  void *v10;

  v2 = a2;
  objc_msgSend_systemImageNamed_(MEMORY[0x24BDF6AC8], v3, v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5)
  {
    v9 = v5;
  }
  else
  {
    objc_msgSend_imageNamed_(MEMORY[0x24BDF6AC8], v6, v7, v2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

id sub_22AD64040(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  const char *v4;
  double v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc(MEMORY[0x24BDF6AC8]);
    v6 = (void *)objc_msgSend_initWithData_(v3, v4, v5, v2);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t sub_22AD640A4(void *a1)
{
  id v1;
  const char *v2;
  double v3;

  v1 = objc_retainAutorelease(a1);
  return objc_msgSend_CGImage(v1, v2, v3);
}

id sub_22AD640C4(void *a1, const char *a2, double a3)
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  double v13;
  const char *v15;
  uint64_t v16;
  void *v17;
  CGSize v19;

  objc_msgSend_size(a1, a2, a3);
  if (v4 <= 4.0)
    v6 = v4 * 64.0;
  else
    v6 = v4;
  if (v5 <= 4.0)
    v7 = v5 * 64.0;
  else
    v7 = v5;
  v8 = a1;
  objc_msgSend_size(v8, v9, v10);
  if (v6 != v12 || v7 != v13)
  {
    v19.width = v6;
    v19.height = v7;
    UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
    objc_msgSend_drawAsPatternInRect_(v8, v15, 0.0, 0.0, v6, v7);
    UIGraphicsGetImageFromCurrentImageContext();
    v16 = objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    v8 = (id)v16;
  }
  objc_msgSend_colorWithPatternImage_(MEMORY[0x24BDF6950], v11, v12, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t sub_22AD6418C(uint64_t a1, const char *a2, void *a3, double a4)
{
  double v5;

  objc_msgSend_UIEdgeInsets(a3, a2, a4);
  return MEMORY[0x24BEDD108](a1, sel_resizableImageWithCapInsets_resizingMode_, v5);
}

id sub_22AD641BC(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9;
  const char *v10;
  double v11;
  CGImage *v12;
  CGImage *v13;
  const char *v14;
  double v15;
  void *v16;
  CGRect v18;

  v9 = objc_retainAutorelease(a1);
  v12 = (CGImage *)objc_msgSend_CGImage(v9, v10, v11);
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  v13 = CGImageCreateWithImageInRect(v12, v18);
  objc_msgSend_imageWithCGImage_(MEMORY[0x24BDF6AC8], v14, v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v13);
  return v16;
}

id sub_22AD64238(void *a1, const char *a2, double a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  TMLRect *v7;
  const char *v8;

  objc_msgSend_size(a1, a2, a3);
  v4 = v3;
  v6 = v5;
  v7 = [TMLRect alloc];
  return (id)objc_msgSend_initWithRect_(v7, v8, 0.0, 0.0, v4, v6);
}

double sub_22AD6427C(void *a1, const char *a2, double a3)
{
  double v3;
  double v4;
  double result;

  objc_msgSend_size(a1, a2, a3);
  result = v3 / v4;
  if (v4 <= 0.0)
    return 1.0;
  return result;
}

double sub_22AD642A0(void *a1, const char *a2, double a3)
{
  double v3;

  objc_msgSend_size(a1, a2, a3);
  return v3;
}

void sub_22AD64AFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22AD64B1C(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  id v15;

  v15 = a3;
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v7, v8, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9
    && (objc_msgSend_isEqual_(v9, v10, v11, v15) & 1) == 0
    && (objc_msgSend_canMergeFromPropertyDescriptor_(v12, v13, v14, v15) & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void sub_22AD64BAC(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v7, v8, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9 && (objc_msgSend_isEqual_(v9, v10, v11, v13) & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void sub_22AD64C2C(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v7, v8, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9 && (objc_msgSend_isEqual_(v9, v10, v11, v13) & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void sub_22AD64EC4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  int isEqual;
  const char *v13;
  double v14;
  id v15;

  v15 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend_objectForKey_(v5, v7, v8, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v9, v10, v11, v6);

  if (isEqual)
    objc_msgSend_removeObjectForKey_(*(void **)(a1 + 32), v13, v14, v15);

}

uint64_t sub_22AD64F44(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addProperty_(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_22AD64F4C(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addMethod_(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_22AD64F54(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addSignal_(*(void **)(a1 + 32), a2, a3);
}

void sub_22AD651CC(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0x30uLL, 0x10700407919B52CuLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD65230(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0x48uLL, 0x10F004036FA40C8uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD65294(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0x80uLL, 0x10F0040B03B4CD9uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD652F8(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0x48uLL, 0x10F004036FA40C8uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD6569C(objc_class *a1)
{
  objc_method *InstanceMethod;
  objc_method *v3;
  objc_method *v4;
  objc_method *v5;
  objc_method *v6;
  objc_method *v7;
  objc_method *v8;
  objc_method *v9;
  objc_method *v10;
  objc_method *v11;
  objc_method *v12;
  objc_method *v13;
  objc_method *v14;
  objc_method *v15;
  objc_method *v16;
  objc_method *v17;
  objc_method *v18;
  objc_method *v19;
  objc_method *v20;
  objc_method *v21;
  objc_method *v22;
  objc_method *v23;
  objc_method *v24;
  objc_method *v25;
  objc_method *v26;
  objc_method *v27;
  objc_method *v28;
  objc_method *v29;
  objc_method *v30;
  objc_method *v31;
  objc_method *v32;
  objc_method *v33;
  objc_method *v34;
  objc_method *v35;
  objc_method *v36;
  objc_method *v37;
  objc_method *v38;
  objc_method *v39;
  objc_method *v40;
  objc_method *v41;
  objc_method *v42;
  objc_method *v43;
  objc_method *v44;
  objc_method *v45;
  objc_method *v46;
  objc_method *v47;
  objc_method *v48;
  objc_method *v49;
  objc_method *v50;
  objc_method *v51;
  objc_method *v52;
  objc_method *v53;

  InstanceMethod = class_getInstanceMethod(a1, sel_loadView);
  v3 = class_getInstanceMethod(a1, sel_tmlLoadViewOverride);
  method_exchangeImplementations(InstanceMethod, v3);
  v4 = class_getInstanceMethod(a1, sel_viewDidLoad);
  v5 = class_getInstanceMethod(a1, sel_tmlViewDidLoad);
  method_exchangeImplementations(v4, v5);
  v6 = class_getInstanceMethod(a1, sel_viewWillAppear_);
  v7 = class_getInstanceMethod(a1, sel_tmlViewWillAppear_);
  method_exchangeImplementations(v6, v7);
  v8 = class_getInstanceMethod(a1, sel_viewDidAppear_);
  v9 = class_getInstanceMethod(a1, sel_tmlViewDidAppear_);
  method_exchangeImplementations(v8, v9);
  v10 = class_getInstanceMethod(a1, sel_viewWillDisappear_);
  v11 = class_getInstanceMethod(a1, sel_tmlViewWillDisappear_);
  method_exchangeImplementations(v10, v11);
  v12 = class_getInstanceMethod(a1, sel_viewDidDisappear_);
  v13 = class_getInstanceMethod(a1, sel_tmlViewDidDisappear_);
  method_exchangeImplementations(v12, v13);
  v14 = class_getInstanceMethod(a1, sel_viewWillLayoutSubviews);
  v15 = class_getInstanceMethod(a1, sel_tmlViewWillLayoutSubviews);
  method_exchangeImplementations(v14, v15);
  v16 = class_getInstanceMethod(a1, sel_viewDidLayoutSubviews);
  v17 = class_getInstanceMethod(a1, sel_tmlViewDidLayoutSubviews);
  method_exchangeImplementations(v16, v17);
  v18 = class_getInstanceMethod(a1, sel_willMoveToParentViewController_);
  v19 = class_getInstanceMethod(a1, sel_tmlWillMoveToParentViewController_);
  method_exchangeImplementations(v18, v19);
  v20 = class_getInstanceMethod(a1, sel_updateViewConstraints);
  v21 = class_getInstanceMethod(a1, sel_tmlUpdateViewConstraints);
  method_exchangeImplementations(v20, v21);
  v22 = class_getInstanceMethod(a1, sel_encodeRestorableStateWithCoder_);
  v23 = class_getInstanceMethod(a1, sel_tmlEncodeRestorableStateWithCoder_);
  method_exchangeImplementations(v22, v23);
  v24 = class_getInstanceMethod(a1, sel_decodeRestorableStateWithCoder_);
  v25 = class_getInstanceMethod(a1, sel_tmlDecodeRestorableStateWithCoder_);
  method_exchangeImplementations(v24, v25);
  v26 = class_getInstanceMethod(a1, sel_viewWillTransitionToSize_withTransitionCoordinator_);
  v27 = class_getInstanceMethod(a1, sel_tmlViewWillTransitionToSize_withTransitionCoordinator_);
  method_exchangeImplementations(v26, v27);
  v28 = class_getInstanceMethod(a1, sel_willTransitionToTraitCollection_withTransitionCoordinator_);
  v29 = class_getInstanceMethod(a1, sel_tmlWillTransitionToTraitCollection_withTransitionCoordinator_);
  method_exchangeImplementations(v28, v29);
  v30 = class_getInstanceMethod(a1, sel_previewActionItems);
  v31 = class_getInstanceMethod(a1, sel_tmlPreviewActionItems);
  method_exchangeImplementations(v30, v31);
  v32 = class_getInstanceMethod(a1, sel_traitCollectionDidChange_);
  v33 = class_getInstanceMethod(a1, sel_tmlTraitCollectionDidChange_);
  method_exchangeImplementations(v32, v33);
  v34 = class_getInstanceMethod(a1, sel_accessibilityPerformEscape);
  v35 = class_getInstanceMethod(a1, sel_tmlAccessibilityPerformEscape);
  method_exchangeImplementations(v34, v35);
  v36 = class_getInstanceMethod(a1, sel_accessibilityPerformMagicTap);
  v37 = class_getInstanceMethod(a1, sel_tmlAccessibilityPerformMagicTap);
  method_exchangeImplementations(v36, v37);
  v38 = class_getInstanceMethod(a1, sel_preferredStatusBarStyle);
  v39 = class_getInstanceMethod(a1, sel_tmlPreferredStatusBarStyle);
  method_exchangeImplementations(v38, v39);
  v40 = class_getInstanceMethod(a1, sel_prefersStatusBarHidden);
  v41 = class_getInstanceMethod(a1, sel_tmlPrefersStatusBarHidden);
  method_exchangeImplementations(v40, v41);
  v42 = class_getInstanceMethod(a1, sel_preferredStatusBarUpdateAnimation);
  v43 = class_getInstanceMethod(a1, sel_tmlPreferredStatusBarUpdateAnimation);
  method_exchangeImplementations(v42, v43);
  v44 = class_getInstanceMethod(a1, sel_childViewControllerForStatusBarStyle);
  v45 = class_getInstanceMethod(a1, sel_tmlChildViewControllerForStatusBarStyle);
  method_exchangeImplementations(v44, v45);
  v46 = class_getInstanceMethod(a1, sel_childViewControllerForStatusBarHidden);
  v47 = class_getInstanceMethod(a1, sel_tmlChildViewControllerForStatusBarHidden);
  method_exchangeImplementations(v46, v47);
  v48 = class_getInstanceMethod(a1, sel_shouldAutorotate);
  v49 = class_getInstanceMethod(a1, sel_tmlShouldAutorotate);
  method_exchangeImplementations(v48, v49);
  v50 = class_getInstanceMethod(a1, sel_supportedInterfaceOrientations);
  v51 = class_getInstanceMethod(a1, sel_tmlSupportedInterfaceOrientations);
  method_exchangeImplementations(v50, v51);
  v52 = class_getInstanceMethod(a1, sel_preferredInterfaceOrientationForPresentation);
  v53 = class_getInstanceMethod(a1, sel_tmlPreferredInterfaceOrientationForPresentation);
  method_exchangeImplementations(v52, v53);
}

id sub_22AD65B90(void *a1)
{
  return objc_getAssociatedObject(a1, &unk_22AD83A50);
}

id sub_22AD65B9C()
{
  void *v0;
  objc_class *v1;
  const char *Name;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  v0 = (void *)MEMORY[0x24BDD17C8];
  v1 = (objc_class *)objc_opt_class();
  Name = class_getName(v1);
  objc_msgSend_stringWithUTF8String_(v0, v3, v4, Name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_(v8, v9, v10, v5, CFSTR("tml"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_22AD65C18(void *a1, uint64_t a2, void *a3)
{
  objc_setAssociatedObject(a1, &unk_22AD83A51, a3, (void *)3);
}

id sub_22AD65C28(void *a1)
{
  return objc_getAssociatedObject(a1, &unk_22AD83A51);
}

TMLContext *sub_22AD65C34(void *a1)
{
  TMLContext *v2;
  TMLContext *v3;
  const char *v4;
  double v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[4];
  TMLContext *v22;

  objc_getAssociatedObject(a1, &unk_22AD83A50);
  v2 = (TMLContext *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_alloc_init(TMLContext);
    objc_msgSend_tmlObjects(a1, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_22AD65DC8;
    v21[3] = &unk_24F4FE128;
    v2 = v3;
    v22 = v2;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v8, v9, v21);

    objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v10, v11, a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_withIdentifier_(v2, v13, v14, v12, CFSTR("owner"));

    objc_setAssociatedObject(a1, &unk_22AD83A50, v2, (void *)1);
    objc_initWeak(&location, v2);
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = sub_22AD65DD4;
    v18[3] = &unk_24F4FE150;
    objc_copyWeak(&v19, &location);
    objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v15, v16, v18, a1);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v2;
}

void sub_22AD65DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_22AD65DC8(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_addObject_withIdentifier_(*(void **)(a1 + 32), a2, a4, a3, a2);
}

void sub_22AD65DD4(uint64_t a1)
{
  const char *v1;
  double v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_dispose(WeakRetained, v1, v2);

}

void sub_22AD65E00(void *a1)
{
  void *v2;
  const char *v3;
  double v4;

  objc_getAssociatedObject(a1, &unk_22AD83A50);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispose(v2, v3, v4);

  objc_setAssociatedObject(a1, &unk_22AD83A50, 0, (void *)1);
}

uint64_t sub_22AD65E54(void *a1, const char *a2, double a3)
{
  int isViewLoaded;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t ViewControllerFromPath;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;

  isViewLoaded = objc_msgSend_isViewLoaded(a1, a2, a3);
  objc_msgSend_tmlViewPath(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ViewControllerFromPath = objc_msgSend_tmlLoadViewControllerFromPath_(a1, v8, v9, v7);

  if ((_DWORD)ViewControllerFromPath && isViewLoaded)
  {
    objc_msgSend_view(a1, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bounds(v13, v14, v15);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = *MEMORY[0x24BDBF090];
    v25 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v26 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v27 = *(double *)(MEMORY[0x24BDBF090] + 24);
    objc_msgSend_view(a1, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBounds_(v30, v31, v24, v25, v26, v27);

    objc_msgSend_view(a1, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBounds_(v34, v35, v17, v19, v21, v23);

    objc_msgSend_view(a1, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_layoutIfNeeded(v38, v39, v40);

  }
  return ViewControllerFromPath;
}

uint64_t sub_22AD65F70(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  int isViewLoaded;
  const char *v8;
  double v9;
  uint64_t ViewControllerWithSource;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;

  v4 = a3;
  isViewLoaded = objc_msgSend_isViewLoaded(a1, v5, v6);
  ViewControllerWithSource = objc_msgSend_tmlLoadViewControllerWithSource_(a1, v8, v9, v4);

  if ((_DWORD)ViewControllerWithSource && isViewLoaded)
  {
    objc_msgSend_view(a1, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bounds(v13, v14, v15);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = *MEMORY[0x24BDBF090];
    v25 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v26 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v27 = *(double *)(MEMORY[0x24BDBF090] + 24);
    objc_msgSend_view(a1, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBounds_(v30, v31, v24, v25, v26, v27);

    objc_msgSend_view(a1, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBounds_(v34, v35, v17, v19, v21, v23);

    objc_msgSend_view(a1, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_layoutIfNeeded(v38, v39, v40);

  }
  return ViewControllerWithSource;
}

id sub_22AD66088(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;

  v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  objc_msgSend__tmlEnsureContext(a1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadSource_(v9, v10, v11, v4);

  objc_msgSend__tmlEnsureContext(a1, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootObject(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id sub_22AD66100(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;

  v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  objc_msgSend__tmlEnsureContext(a1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadSourceFromPath_(v9, v10, v11, v4);

  objc_msgSend__tmlEnsureContext(a1, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootObject(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t sub_22AD66178(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;

  v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  objc_msgSend__tmlEnsureContext(a1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadSourceFromPath_(v9, v10, v11, v4);

  objc_msgSend__tmlEnsureContext(a1, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootObject(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_setView_(a1, v18, v19, v17);
  }
  else if ((objc_msgSend_isEqual_(v17, v18, v19, a1) & 1) == 0)
  {
    v23 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, v21, CFSTR("Expected to load UIViewController or UIView for %@"), v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v23, v25, v26, CFSTR("TMLRuntimeException"), v24, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raiseException_(TMLExceptionHandler, v28, v29, v27);

    v22 = 0;
    goto LABEL_6;
  }
  v22 = 1;
LABEL_6:

  return v22;
}

uint64_t sub_22AD662B8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;

  v4 = a3;
  objc_msgSend__tmlUnloadContext(a1, v5, v6);
  objc_msgSend__tmlEnsureContext(a1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadSource_(v9, v10, v11, v4);

  objc_msgSend__tmlEnsureContext(a1, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootObject(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_setView_(a1, v18, v19, v17);
  }
  else if ((objc_msgSend_isEqual_(v17, v18, v19, a1) & 1) == 0)
  {
    v23 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, v21, CFSTR("Expected to load UIViewController or UIView for %@"), v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v23, v25, v26, CFSTR("TMLRuntimeException"), v24, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raiseException_(TMLExceptionHandler, v28, v29, v27);

    v22 = 0;
    goto LABEL_6;
  }
  v22 = 1;
LABEL_6:

  return v22;
}

void sub_22AD663F8(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_isEqualToString_(v7, v8, v9, CFSTR("view"))
    && (objc_msgSend_isViewLoaded(a1, v10, v11) & 1) == 0)
  {
    objc_setAssociatedObject(a1, &unk_22AD83A52, v6, (void *)1);
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&off_255B7B820;
    objc_msgSendSuper2(&v12, sel_setTMLValue_forKeyPath_, v6, v7);
  }

}

void sub_22AD6649C(void *a1)
{
  const char *v2;
  void *v3;
  double v4;
  objc_super v5;

  objc_getAssociatedObject(a1, &unk_22AD83A52);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_setAssociatedObject(a1, &unk_22AD83A52, 0, (void *)1);
    v5.receiver = a1;
    v5.super_class = (Class)&off_255B7B820;
    objc_msgSendSuper2(&v5, sel_setTMLValue_forKeyPath_, v3, CFSTR("view"));
  }
  else
  {
    objc_msgSend_tmlLoadViewOverride(a1, v2, v4);
  }

}

uint64_t sub_22AD66528(void *a1, const char *a2, double a3)
{
  const char *v4;
  double v5;

  objc_msgSend_tmlViewDidLoad(a1, a2, a3);
  return objc_msgSend_emitTMLSignal_withArguments_(a1, v4, v5, CFSTR("viewDidLoad"), 0);
}

void sub_22AD66558(void *a1, const char *a2, uint64_t a3, double a4)
{
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_tmlViewWillAppear_(a1, a2, a4);
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v10, v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(a1, v12, v13, CFSTR("viewWillAppear"), v11);

}

void sub_22AD6660C(void *a1, const char *a2, uint64_t a3, double a4)
{
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_tmlViewDidAppear_(a1, a2, a4);
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v10, v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(a1, v12, v13, CFSTR("viewDidAppear"), v11);

}

void sub_22AD666C0(void *a1, const char *a2, uint64_t a3, double a4)
{
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_tmlViewWillDisappear_(a1, a2, a4);
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v10, v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(a1, v12, v13, CFSTR("viewWillDisappear"), v11);

}

void sub_22AD66774(void *a1, const char *a2, uint64_t a3, double a4)
{
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_tmlViewDidDisappear_(a1, a2, a4);
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v10, v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(a1, v12, v13, CFSTR("viewDidDisappear"), v11);

}

uint64_t sub_22AD66828(void *a1, const char *a2, double a3)
{
  const char *v4;
  double v5;

  objc_msgSend_tmlViewWillLayoutSubviews(a1, a2, a3);
  return objc_msgSend_emitTMLSignal_withArguments_(a1, v4, v5, CFSTR("viewWillLayoutSubviews"), 0);
}

uint64_t sub_22AD66858(void *a1, const char *a2, double a3)
{
  const char *v4;
  double v5;

  objc_msgSend_tmlViewDidLayoutSubviews(a1, a2, a3);
  return objc_msgSend_emitTMLSignal_withArguments_(a1, v4, v5, CFSTR("viewDidLayoutSubviews"), 0);
}

uint64_t sub_22AD66888(void *a1, const char *a2, double a3)
{
  const char *v4;
  double v5;

  objc_msgSend_tmlUpdateViewConstraints(a1, a2, a3);
  return objc_msgSend_emitTMLSignal_withArguments_(a1, v4, v5, CFSTR("updateViewConstraints"), 0);
}

void sub_22AD668B8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  int v9;
  id v10;
  const char *v11;
  double v12;
  id v13;

  v4 = a3;
  objc_msgSend_tmlEncodeRestorableStateWithCoder_(a1, v5, v6, v4);
  v13 = 0;
  v9 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, v7, v8, CFSTR("saveRestorableState"), 0, &v13);
  v10 = v13;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_encodeObject_forKey_(v4, v11, v12, v10, CFSTR("TML.RestorableState"));
  }

}

void sub_22AD66960(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_tmlDecodeRestorableStateWithCoder_(a1, v5, v6, v4);
  objc_msgSend_decodeObjectForKey_(v4, v7, v8, CFSTR("TML.RestorableState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15[0] = v9;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v10, v11, v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emitTMLSignal_withArguments_(a1, v13, v14, CFSTR("loadRestorableState"), v12);

  }
}

void sub_22AD66A40(void *a1, double a2, double a3, uint64_t a4, void *a5)
{
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  double v12;
  _QWORD v13[4];
  id v14[3];
  _QWORD v15[4];
  id v16[3];
  id location;

  v8 = a5;
  objc_msgSend_tmlViewWillTransitionToSize_withTransitionCoordinator_(a1, v9, a2, v8, a3);
  objc_initWeak(&location, a1);
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_22AD66B6C;
  v15[3] = &unk_24F5029C0;
  objc_copyWeak(v16, &location);
  v16[1] = *(id *)&a2;
  v16[2] = *(id *)&a3;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = sub_22AD66C28;
  v13[3] = &unk_24F5029C0;
  objc_copyWeak(v14, &location);
  v14[1] = *(id *)&a2;
  v14[2] = *(id *)&a3;
  objc_msgSend_animateAlongsideTransition_completion_(v8, v11, v12, v15, v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

void sub_22AD66B48(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_22AD66B6C(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_convertSize_(TMLTypes, v3, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v5, v6, v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(WeakRetained, v8, v9, CFSTR("viewWillTransitionToSize"), v7);

}

void sub_22AD66C28(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_convertSize_(TMLTypes, v3, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v5, v6, v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(WeakRetained, v8, v9, CFSTR("viewDidTransitionToSize"), v7);

}

void sub_22AD66CE4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  double v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  void *v24;
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend_traitEnvironment_willTransitionToTraitCollection_fromPreviousTraitCollection_(TMLUITraitCollection, v8, v9, a1, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlWillTransitionToTraitCollection_withTransitionCoordinator_(a1, v11, v12, v6, v7);
  objc_initWeak(&location, a1);
  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_22AD66E50;
  v22[3] = &unk_24F5029E8;
  v14 = v10;
  v23 = v14;
  v24 = a1;
  v15 = v6;
  v25 = v15;
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = sub_22AD66EF0;
  v19[3] = &unk_24F502A10;
  objc_copyWeak(&v21, &location);
  v16 = v15;
  v20 = v16;
  objc_msgSend_animateAlongsideTransition_completion_(v7, v17, v18, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void sub_22AD66E34(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_22AD66E50(uint64_t a1, const char *a2, double a3)
{
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_emitTMLSignal_withArguments_(*(void **)(a1 + 32), a2, a3, CFSTR("enter"), 0);
  v4 = *(void **)(a1 + 40);
  v10[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v5, v6, v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v4, v8, v9, CFSTR("willTransitionToTraitCollection"), v7);

}

void sub_22AD66EF0(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v3, v4, v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(WeakRetained, v6, v7, CFSTR("didTransitionToTraitCollection"), v5);

}

void sub_22AD66F8C(void *a1, const char *a2, uint64_t a3, double a4)
{
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  id v13;

  objc_msgSend_tmlTraitCollectionDidChange_(a1, a2, a4);
  if (!a3)
  {
    objc_msgSend_traitCollection(a1, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_traitEnvironment_willTransitionToTraitCollection_fromPreviousTraitCollection_(TMLUITraitCollection, v9, v10, a1, v8, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_emitTMLSignal_withArguments_(v13, v11, v12, CFSTR("enter"), 0);
  }
}

void sub_22AD67028(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  void *v10;
  const char *v11;
  double v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_tmlWillMoveToParentViewController_(a1, v5, v6, a1);
  v9 = v4;
  if (!v4)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v7, v8, v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(a1, v11, v12, CFSTR("willMoveToParentViewController"), v10);

  if (!v4)
}

id sub_22AD670F4(void *a1)
{
  return objc_getAssociatedObject(a1, &unk_22AD83A53);
}

void sub_22AD67100(void *a1, uint64_t a2, void *a3)
{
  objc_setAssociatedObject(a1, &unk_22AD83A53, a3, (void *)3);
}

uint64_t sub_22AD67110(void *a1)
{
  void *v2;
  const char *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;

  objc_getAssociatedObject(a1, &unk_22AD83A54);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend_integerValue(v2, v3, v4);
  else
    v5 = objc_msgSend_tmlPreferredStatusBarStyle(a1, v3, v4);
  v6 = v5;

  return v6;
}

uint64_t sub_22AD6717C(void *a1, const char *a2, double a3)
{
  void *v4;
  double v5;

  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &unk_22AD83A54, v4, (void *)3);

  return MEMORY[0x24BEDD108](a1, sel_setNeedsStatusBarAppearanceUpdate, v5);
}

uint64_t sub_22AD671CC(void *a1)
{
  void *v2;
  const char *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;

  objc_getAssociatedObject(a1, &unk_22AD83A55);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend_BOOLValue(v2, v3, v4);
  else
    v5 = objc_msgSend_tmlPrefersStatusBarHidden(a1, v3, v4);
  v6 = v5;

  return v6;
}

uint64_t sub_22AD67238(void *a1, const char *a2, double a3)
{
  void *v4;
  double v5;

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &unk_22AD83A55, v4, (void *)3);

  return MEMORY[0x24BEDD108](a1, sel_setNeedsStatusBarAppearanceUpdate, v5);
}

uint64_t sub_22AD67288(void *a1)
{
  void *v2;
  const char *v3;
  double v4;
  uint64_t updated;
  uint64_t v6;

  objc_getAssociatedObject(a1, &unk_22AD83A56);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    updated = objc_msgSend_integerValue(v2, v3, v4);
  else
    updated = objc_msgSend_tmlPreferredStatusBarUpdateAnimation(a1, v3, v4);
  v6 = updated;

  return v6;
}

uint64_t sub_22AD672F4(void *a1, const char *a2, double a3)
{
  void *v4;
  double v5;

  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &unk_22AD83A56, v4, (void *)3);

  return MEMORY[0x24BEDD108](a1, sel_setNeedsStatusBarAppearanceUpdate, v5);
}

id sub_22AD67344(void *a1)
{
  void *v2;
  const char *v3;
  double v4;
  id v5;
  void *v6;

  objc_getAssociatedObject(a1, &unk_22AD83A57);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v2;
  }
  else
  {
    objc_msgSend_tmlChildViewControllerForStatusBarStyle(a1, v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t sub_22AD673B0(void *a1, uint64_t a2, void *a3)
{
  double v4;

  objc_setAssociatedObject(a1, &unk_22AD83A57, a3, (void *)1);
  return MEMORY[0x24BEDD108](a1, sel_setNeedsStatusBarAppearanceUpdate, v4);
}

id sub_22AD673E0(void *a1)
{
  void *v2;
  const char *v3;
  double v4;
  id v5;
  void *v6;

  objc_getAssociatedObject(a1, &unk_22AD83A58);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v2;
  }
  else
  {
    objc_msgSend_tmlChildViewControllerForStatusBarHidden(a1, v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t sub_22AD6744C(void *a1, uint64_t a2, void *a3)
{
  double v4;

  objc_setAssociatedObject(a1, &unk_22AD83A58, a3, (void *)1);
  return MEMORY[0x24BEDD108](a1, sel_setNeedsStatusBarAppearanceUpdate, v4);
}

uint64_t sub_22AD6747C(void *a1)
{
  const char *v2;
  double v3;
  int v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v12 = 0;
  v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, v2, v3, CFSTR("accessibilityPerformEscape"), 0, &v12);
  v5 = v12;
  v8 = v5;
  if (v4)
    v9 = objc_msgSend_BOOLValue(v5, v6, v7);
  else
    v9 = objc_msgSend_tmlAccessibilityPerformEscape(a1, v6, v7);
  v10 = v9;

  return v10;
}

uint64_t sub_22AD6751C(void *a1)
{
  const char *v2;
  double v3;
  int v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v12 = 0;
  v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, v2, v3, CFSTR("accessibilityPerformMagicTap"), 0, &v12);
  v5 = v12;
  v8 = v5;
  if (v4)
    v9 = objc_msgSend_BOOLValue(v5, v6, v7);
  else
    v9 = objc_msgSend_tmlAccessibilityPerformMagicTap(a1, v6, v7);
  v10 = v9;

  return v10;
}

uint64_t sub_22AD675BC(void *a1, const char *a2, double a3)
{
  int v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t ShouldAutorotate;
  uint64_t v10;
  id v12;

  v12 = 0;
  v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, a2, a3, CFSTR("shouldAutorotate"), 0, &v12);
  v5 = v12;
  v8 = v5;
  if (v4)
    ShouldAutorotate = objc_msgSend_BOOLValue(v5, v6, v7);
  else
    ShouldAutorotate = objc_msgSend_tmlShouldAutorotate(a1, v6, v7);
  v10 = ShouldAutorotate;

  return v10;
}

uint64_t sub_22AD67634(void *a1, const char *a2, double a3)
{
  int v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, a2, a3, CFSTR("supportedInterfaceOrientations"), 0, &v12);
  v5 = v12;
  v8 = v5;
  if (v4)
    v9 = objc_msgSend_unsignedIntegerValue(v5, v6, v7);
  else
    v9 = objc_msgSend_tmlSupportedInterfaceOrientations(a1, v6, v7);
  v10 = v9;

  return v10;
}

uint64_t sub_22AD676AC(void *a1, const char *a2, double a3)
{
  int v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  v4 = objc_msgSend_emitTMLSignal_withArguments_returnValue_(a1, a2, a3, CFSTR("preferredInterfaceOrientationForPresentation"), 0, &v12);
  v5 = v12;
  v8 = v5;
  if (v4)
    v9 = objc_msgSend_integerValue(v5, v6, v7);
  else
    v9 = objc_msgSend_tmlPreferredInterfaceOrientationForPresentation(a1, v6, v7);
  v10 = v9;

  return v10;
}

void sub_22AD67804(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen("838477767]=UmQ@}HaPU+O2M#[CdLI77HUO8/fVwcY?)S>in3bn9F]0u$V0!r6Rw:-KjjJoT@U/IAkJS:lrLvql%6UkvOi@k6r2e#W]H#(Rr?@[HxF=}$2*Vl>YM&8P@h+Kj5d8tEG}@=@#nnc)!KlA$.XtSIt7sS*{88/ps3Hv^27c$$$y*?Q2A-M)=Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#b625[x!D1z1e2TIG/y*?Q2AV#?q9:@(3z*cn0x>8mcA+d*Wp?:AYB-I4&y*?P#vpK6=1y=p/y:6]c5[t&$By/uipJ*q&y*?P&x>qG3231k}x>qG90u@J>6)15bCxlO%vr(r<v@1CIzGG]qy&Zi(vScg3a}+j*wmYN*xjk)[5^An-ygQ)%a@HZ#A+eV&C$8Z)l${ZYy*?P41y=p/y-0f%777E[x>g^[m@&3Yx([Rk26j)bx(mL<VipNPk#{/@v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6a%470Abn%dwPyEMD1z1e4ma2>y*?Q2A.G[!wPwQ*a}+j*wmYN*xjk)[5^An-ygQ)%a%EvhAa@*7B-I4+zCU4SBAIRnp&yz@x<$)&5^hVZz!{l>a%NBjAa@*7B-I4+zCU4SBAIRnq*0e2wO#3&wd/2Oz/oCe0u@S[7i0$$BAIRnnP4vsv@#<lwKf*Fx)a521y=p/y-0gdfBwLoByxiip?:AYB-I4+zCU4SBAIRn5ci%&B97&hBwMWYBAIRnnP4vsv@#<lwIL>B6MXwmA8pmUBAIRnnP4vsv@#<lwE[>^6MXwmA8pmUBAIRnnP4vsv@#<lwIQg+3o-uxv@#<lwL3=ox>8mcA+dNWBAzCsq/(C*Bv*sTxjTCGze-{9x<$)&s7#+&rb#zYBvf$.y?m9#x(v(27AaLa4%h&2x((ZXy&0V)BzkVh5!Obnrb#zYBvf$.y?m9#x(v(kkpZX!v@#<lwL3=ox>8mcA+dNWBAzCsq/(C*Bv*sTxjTCGze-{9x<$)&s7#+&rb#zYBvf$.y?m9#x(v(IgnU6VjAb1ABAIRnnP4vsv@#<lwKpJYBz(4}Bz(a&zdd6*lVl*Xvrui)y?lWZBzaS]vqf*Jz!%l3v@#B6zv^Q5bNL67A:-W7lVl^SwN/*@z/cg1ry{egvqf*Jz!%l3v@#B6zx.m{Aa@*7B-I4+zCU4SBAIRnluNx(z/eG}z/wo+vp%dsz/6D4Bzki2wMJO/xJf1Xx((ZXy&0V)BzkVhiX&&98!<v&x>8mcA+d*Wp?:AYB-I4(B-qqrA=+(65cs3}d}%63x>8mcA+d*Wp?:AYB-I4(B-qqrA=+(6bh0bbbTCEcx>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AZTFPwOkB[wG(j6gh{@qBAIRnnP4vsv@#<lwKyxNBAhqoy?mS*x(4P:Bz(a{x>8mcA+d*Wp?:AYB-I480ua0a8Goz2BAIRnx(m)7v@#<lwN/T@BAhqoy?mS196)R4x>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AWQ#kBQx{zx>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3A-V%>y/tB:A=+b(v@#<lwL3=ox>8mcA+b^.8AFizAa@*7B-I5czG6r1BAIRnv@DmbA=k=gwPwz6k#{/@v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6c&$Pl3nDHlv@#<lwL3=ox>8mcA+dQRzGG]qy&0W6l${ggBz(a{x>8mcA+d*Wp?:AYB-I480ua0a8Goz2BAIRnx(m)7v@#<lwN/T@BAhqoy?mS196)R4x>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AWQ#k/z#sAAa@*7B-I4+zCU4SBAIRnlVl<:A=k=gwPymGx(4u>rbUYSvrcD^x>8mcA+d*Wp?:AYB-I4{x([2SA=M8s5ciXg3l0>$v@#<lwOD43x>8mcA+e:0zGG]qy&0W65/:hrp?:AYB-I4+zCU4SBAIRnlVl<:A=k=gwPwX23i+0YA=k$h2tOh^A=M8sb0{l.v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6i+z/my?mcRz=p:^A=+b(v@#<lwL3=ox>8mcA+er^Bza9-A=k$Vc&$Pm3nMNmv"
         "@#<lwL3=ox>8mcA+dQRzGG]qy&0W6l${ggByxiip?:AYB-I4+zCU4SBAIRn5ciXg3l0>$v@#<lwOD43x>8mcA+e:0zGG]qy&0W65/:hrp?:AYB-"
         "I4+zCU4SBAIRnlVl<:A=k=gwPxg2dHXQzmSiA!wmoN]z/b");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, "838477767]=UmQ@}HaPU+O2M#[CdLI77HUO8/fVwcY?)S>in3bn9F]0u$V0!r6Rw:-KjjJoT@U/IAkJS:lrLvql%6UkvOi@k6r2e#W]H#(Rr?@[HxF=}$2*Vl>YM&8P@h+Kj5d8tEG}@=@#nnc)!KlA$.XtSIt7sS*{88/ps3Hv^27c$$$y*?Q2A-M)=Cscp^BAhqoy?mS15lhq5x>qGQz/fVqz!%l3AV#b625[x!D1z1e2TIG/y*?Q2AV#?q9:@(3z*cn0x>8mcA+d*Wp?:AYB-I4&y*?P#vpK6=1y=p/y:6]c5[t&$By/uipJ*q&y*?P&x>qG3231k}x>qG90u@J>6)15bCxlO%vr(r<v@1CIzGG]qy&Zi(vScg3a}+j*wmYN*xjk)[5^An-ygQ)%a@HZ#A+eV&C$8Z)l${ZYy*?P41y=p/y-0f%777E[x>g^[m@&3Yx([Rk26j)bx(mL<VipNPk#{/@v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6a%470Abn%dwPyEMD1z1e4ma2>y*?Q2A.G[!wPwQ*a}+j*wmYN*xjk)[5^An-ygQ)%a%EvhAa@*7B-I4+zCU4SBAIRnp&yz@x<$)&5^hVZz!{l>a%NBjAa@*7B-I4+zCU4SBAIRnq*0e2wO#3&wd/2Oz/oCe0u@S[7i0$$BAIRnnP4vsv@#<lwKf*Fx)a521y=p/y-0gdfBwLoByxiip?:AYB-I4+zCU4SBAIRn5ci%&B97&hBwMWYBAIRnnP4vsv@#<lwIL>B6MXwmA8pmUBAIRnnP4vsv@#<lwE[>^6MXwmA8pmUBAIRnnP4vsv@#<lwIQg+3o-uxv@#<lwL3=ox>8mcA+dNWBAzCsq/(C*Bv*sTxjTCGze-{9x<$)&s7#+&rb#zYBvf$.y?m9#x(v(27AaLa4%h&2x((ZXy&0V)BzkVh5!Obnrb#zYBvf$.y?m9#x(v(kkpZX!v@#<lwL3=ox>8mcA+dNWBAzCsq/(C*Bv*sTxjTCGze-{9x<$)&s7#+&rb#zYBvf$.y?m9#x(v(IgnU6VjAb1ABAIRnnP4vsv@#<lwKpJYBz(4}Bz(a&zdd6*lVl*Xvrui)y?lWZBzaS]vqf*Jz!%l3v@#B6zv^Q5bNL67A:-W7lVl^SwN/*@z/cg1ry{egvqf*Jz!%l3v@#B6zx.m{Aa@*7B-I4+zCU4SBAIRnluNx(z/eG}z/wo+vp%dsz/6D4Bzki2wMJO/xJf1Xx((ZXy&0V)BzkVhiX&&98!<v&x>8mcA+d*Wp?:AYB-I4(B-qqrA=+(65cs3}d}%63x>8mcA+d*Wp?:AYB-I4(B-qqrA=+(6bh0bbbTCEcx>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AZTFPwOkB[wG(j6gh{@qBAIRnnP4vsv@#<lwKyxNBAhqoy?mS*x(4P:Bz(a{x>8mcA+d*Wp?:AYB-I480ua0a8Goz2BAIRnx(m)7v@#<lwN/T@BAhqoy?mS196)R4x>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AWQ#kBQx{zx>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3A-V%>y/tB:A=+b(v@#<lwL3=ox>8mcA+b^.8AFizAa@*7B-I5czG6r1BAIRnv@DmbA=k=gwPwz6k#{/@v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6c&$Pl3nDHlv@#<lwL3=ox>8mcA+dQRzGG]qy&0W6l${ggBz(a{x>8mcA+d*Wp?:AYB-I480ua0a8Goz2BAIRnx(m)7v@#<lwN/T@BAhqoy?mS196)R4x>8mcA+d*Wp?:AYB-I4Xz/fVqz!%l3AWQ#k/z#sAAa@*7B-I4+zCU4SBAIRnlVl"
    "<:A=k=gwPymGx(4u>rbUYSvrcD^x>8mcA+d*Wp?:AYB-I4{x([2SA=M8s5ciXg3l0>$v@#<lwOD43x>8mcA+e:0zGG]qy&0W65/:hrp?:AYB-I4+zCU4"
    "SBAIRnlVl<:A=k=gwPwX23i+0YA=k$h2tOh^A=M8sb0{l.v@#<lwL3=ox>8mcA+dQRzGG]qy&0W6i+z/my?mcRz=p:^A=+b(v@#<lwL3=ox>8mcA+er^"
    "Bza9-A=k$Vc&$Pm3nMNmv@#<lwL3=ox>8mcA+dQRzGG]qy&0W6l${ggByxiip?:AYB-I4+zCU4SBAIRn5ciXg3l0>$v@#<lwOD43x>8mcA+e:0zGG]qy"
    "&0W65/:hrp?:AYB-I4+zCU4SBAIRnlVl<:A=k=gwPxg2dHXQzmSiA!wmoN]z/b",
    v2,
    0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

uint64_t sub_22AD68050(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addDeclaration_(*(void **)(a1 + 32), a2, a3, a2);
}

uint64_t sub_22AD6805C(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  return objc_msgSend_addSignalHandler_signalTarget_(*(void **)(a1 + 32), a2, a4, a3, a2);
}

void sub_22AD68068(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend_objectForKeyedSubscript_(v3, v5, v6, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_(v2, v7, v8, v4, v9);

}

uint64_t sub_22AD680C8(uint64_t a1, const char *a2, double a3)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, a3, a2);
}

void sub_22AD681AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AD681C4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22AD681D4(uint64_t a1)
{

}

void sub_22AD681DC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  int isEqualToString;
  id v13;

  v13 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_propertyName(v13, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v9, v10, v11, *(_QWORD *)(a1 + 32));

    if (isEqualToString)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

void sub_22AD68358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AD68370(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  int isEqualToString;
  id v13;

  v13 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_signalName(v13, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v9, v10, v11, *(_QWORD *)(a1 + 32));

    if (isEqualToString)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

void sub_22AD68774(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  id v7;
  const char *v8;
  double v9;
  const char *v10;
  const char *v11;
  double v12;
  id v13;
  const char *v14;
  double v15;
  const char *v16;
  CFNumberType Type;
  const char *v18;
  double v19;
  void *v20;
  int v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  char isKindOfClass;
  int v29;
  int v30;
  id v31;

  v5 = a2;
  v6 = malloc_type_malloc(0x58uLL, 0x1070040EA06F8A7uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) + 8 * a3) = v6;
  sub_22AD3C800((uint64_t)v6);
  v7 = objc_retainAutorelease(v5);
  v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);
  v6[3] = strdup(v10);
  objc_msgSend_objectForKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v11, v12, v7);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *((_DWORD *)v6 + 8) = 1;
    v13 = objc_retainAutorelease(v31);
    v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
    v6[5] = strdup(v16);
LABEL_11:
    v20 = v31;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    Type = CFNumberGetType((CFNumberRef)v31);
    if ((unint64_t)Type <= kCFNumberCGFloatType)
    {
      if (((1 << Type) & 0x13060) != 0)
      {
        *((_DWORD *)v6 + 8) = 3;
        objc_msgSend_floatValue(v31, v18, v19);
        v20 = v31;
        *((_DWORD *)v6 + 17) = v21;
        *((_DWORD *)v6 + 16) = 1;
        goto LABEL_12;
      }
      if (Type == kCFNumberCharType)
      {
        *((_DWORD *)v6 + 8) = 4;
        v29 = objc_msgSend_BOOLValue(v31, v18, v19);
        v20 = v31;
        *((_DWORD *)v6 + 14) = 1;
        *((_DWORD *)v6 + 15) = v29;
        goto LABEL_12;
      }
    }
    *((_DWORD *)v6 + 8) = 2;
    v30 = objc_msgSend_integerValue(v31, v18, v19);
    v20 = v31;
    *((_DWORD *)v6 + 12) = 1;
    *((_DWORD *)v6 + 13) = v30;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *((_DWORD *)v6 + 8) = 5;
    v22 = malloc_type_malloc(0x30uLL, 0x10F004065BF17CFuLL);
    v6[9] = v22;
    objc_msgSend_encode_(v31, v23, v24, v22);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *((_DWORD *)v6 + 8) = 6;
    v25 = malloc_type_malloc(0xA0uLL, 0x10F0040C95C2125uLL);
    v6[10] = v25;
    objc_msgSend_encode_(v31, v26, v27, v25);
    goto LABEL_11;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v20 = v31;
  if ((isKindOfClass & 1) != 0)
    *((_DWORD *)v6 + 8) = 0;
LABEL_12:

}

void sub_22AD689B4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0xA0uLL, 0x10F0040C95C2125uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD68A18(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  char *v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v5, v3, v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_addObject_(*(void **)(a1 + 40), v5, v4, v5);
  }

}

void sub_22AD68AA0(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0x30uLL, 0x10700407919B52CuLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD68B04(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0x48uLL, 0x10F004036FA40C8uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD68B68(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  const char *v7;
  double v8;
  _QWORD *v9;
  const char *v10;
  double v11;
  id v12;
  const char *v13;
  double v14;
  const char *v15;
  id v16;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6 = a2;
  objc_msgSend_objectForKeyedSubscript_(v5, v7, v8, v6);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v9 = malloc_type_malloc(0x38uLL, 0x107004014DBB691uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) + 8 * a3) = v9;
  objc_msgSend_encode_(v16, v10, v11, v9);
  v12 = objc_retainAutorelease(v6);
  v15 = (const char *)objc_msgSend_UTF8String(v12, v13, v14);

  v9[6] = strdup(v15);
}

char *sub_22AD68C18(uint64_t a1, id a2, uint64_t a3)
{
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  char *result;

  v5 = objc_retainAutorelease(a2);
  v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
  result = strdup(v8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) + 8 * a3) = result;
  return result;
}

void sub_22AD693BC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  id v17;

  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v17 = v5;
  objc_msgSend_identifier(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_applyCategory_(v12, v13, v14, v17);
    objc_msgSend_addIndex_(*(void **)(a1 + 40), v15, v16, a3);
  }

}

void sub_22AD695F8(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_addProperty_(*(void **)(a1 + 32), v3, v4, v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_addSignal_(*(void **)(a1 + 32), v5, v6, v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend_addMethod_(*(void **)(a1 + 32), v7, v8, v9);
    }
  }

}

void sub_22AD697AC(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  int isEqualToString;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  id v35;

  v35 = a2;
  objc_msgSend_type(v35, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v5, v6, v7, CFSTR("Class"));

  if (isEqualToString)
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend_convertObject_toClass_(v9, v10, v11, v35, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objcClassName(*(void **)(a1 + 40), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_length(v15, v16, v17);
    v21 = *(void **)(a1 + 40);
    if (v19)
      objc_msgSend_objcClassName(v21, v18, v20);
    else
      objc_msgSend_className(v21, v18, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_identifier(v35, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v23, v27, v28, CFSTR("%@_%@"), v22, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objcClassName(v12, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
      objc_msgSend_setObjcClassName_(v12, v33, v34, v29);
    objc_msgSend_addChildClass_(*(void **)(a1 + 40), v33, v34, v12);

  }
}

void sub_22AD69A08(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_addSignal_(*(void **)(a1 + 32), v3, v4, v5);

}

void sub_22AD69DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AD69DBC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22AD69DCC(uint64_t a1)
{

}

void sub_22AD69DD4(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  const char *v12;
  double v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  _BYTE *v19;

  v6 = a3;
  objc_msgSend_objects(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_22AD69EA4;
  v15[3] = &unk_24F502AB8;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v16 = v10;
  v18 = v11;
  v14 = v6;
  v17 = v14;
  v19 = a4;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v12, v13, v15);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

}

void sub_22AD69EA4(uint64_t a1, void *a2, double a3)
{
  void *v4;
  const char *v5;
  double v6;
  int isEqualToString;

  objc_msgSend_identifier(a2, (const char *)a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v4, v5, v6, *(_QWORD *)(a1 + 32));

  if (isEqualToString)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    **(_BYTE **)(a1 + 56) = 1;
  }
}

void sub_22AD6A1D0(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0x80uLL, 0x10F0040B03B4CD9uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD6A234(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0xA0uLL, 0x10F0040C95C2125uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD6A298(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0x28uLL, 0x1070040084410A6uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

void sub_22AD6A2FC(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  double v7;
  id v8;

  v8 = a2;
  v5 = malloc_type_malloc(0x48uLL, 0x10F00406F9DE22FuLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 8 * a3) = v5;
  objc_msgSend_encode_(v8, v6, v7, v5);

}

char *sub_22AD6A360(uint64_t a1, id a2, uint64_t a3)
{
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  char *result;

  v5 = objc_retainAutorelease(a2);
  v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
  result = strdup(v8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 8 * a3) = result;
  return result;
}

id sub_22AD6AD84()
{
  if (qword_255B51CB0 != -1)
    dispatch_once(&qword_255B51CB0, &unk_24F502B40);
  return (id)qword_255B51CA8;
}

void sub_22AD6ADC4(double a1, uint64_t a2, const char *a3)
{
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;
  const char *v49;
  double v50;
  const char *v51;
  double v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  const char *v57;
  double v58;
  const char *v59;
  double v60;
  const char *v61;
  double v62;
  const char *v63;
  double v64;
  const char *v65;
  double v66;
  const char *v67;
  double v68;
  const char *v69;
  double v70;
  const char *v71;
  double v72;
  const char *v73;
  double v74;
  const char *v75;
  double v76;
  const char *v77;
  double v78;
  const char *v79;
  double v80;
  const char *v81;
  double v82;
  const char *v83;
  double v84;
  const char *v85;
  double v86;
  const char *v87;
  double v88;
  const char *v89;
  double v90;
  const char *v91;
  double v92;
  const char *v93;
  double v94;
  const char *v95;
  double v96;
  const char *v97;
  double v98;
  const char *v99;
  double v100;
  const char *v101;
  double v102;
  const char *v103;
  double v104;
  const char *v105;
  double v106;
  const char *v107;
  double v108;
  const char *v109;
  double v110;
  const char *v111;
  double v112;
  const char *v113;
  double v114;
  const char *v115;
  double v116;
  void *v117;
  const char *v118;
  double v119;
  void *v120;
  const char *v121;
  double v122;
  void *v123;
  const char *v124;
  double v125;
  void *v126;
  const char *v127;
  double v128;
  void *v129;
  const char *v130;
  double v131;
  void *v132;
  const char *v133;
  double v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  _QWORD v194[62];
  _QWORD v195[64];

  v195[62] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a3, a1, "v");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v194[0] = v193;
  v195[0] = &unk_24F502B80;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v3, v4, CFSTR("%s%s"), "v", "@");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v194[1] = v192;
  v195[1] = &unk_24F502BC8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, v6, CFSTR("%s%s%s"), "v", "@", "@");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v194[2] = v191;
  v195[2] = &unk_24F502C10;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, v8, CFSTR("%s%s%s%s"), "v", "@", "@", "@");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v194[3] = v190;
  v195[3] = &unk_24F502C58;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, v10, CFSTR("%s%s%s%s"), "v", "@", "@", "@");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v189, v11, v12, CFSTR("?"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v194[4] = v188;
  v195[4] = &unk_24F502CA0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, v14, "v", "@", "@", "@", "@");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v194[5] = v187;
  v195[5] = &unk_24F502CE8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, v16, CFSTR("%s%s"), "v", "B");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v194[6] = v186;
  v195[6] = &unk_24F502D30;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, v18, CFSTR("%s%s%s"), "v", "@", "B");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v194[7] = v185;
  v195[7] = &unk_24F502D78;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, v20, CFSTR("%s%s%s%s"), "v", "@", "@", "B");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v194[8] = v184;
  v195[8] = &unk_24F502DC0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v21, v22, CFSTR("%s%s%s%s"), "v", "@", "@", "f");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v194[9] = v183;
  v195[9] = &unk_24F502E08;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v23, v24, CFSTR("%s%s%s%s"), "v", "@", "@", "d");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v194[10] = v182;
  v195[10] = &unk_24F502E50;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, v26, CFSTR("%s%s%s"), "v", "@", "q");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v194[11] = v181;
  v195[11] = &unk_24F502E98;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v27, v28, CFSTR("%s%s%s%s"), "v", "@", "@", "q");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v194[12] = v180;
  v195[12] = &unk_24F502EE0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v29, v30, CFSTR("%s%s%s%s"), "v", "@", "q", "q");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v194[13] = v179;
  v195[13] = &unk_24F502F28;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v31, v32, CFSTR("%s%s%s"), "v", "@", "i");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v194[14] = v178;
  v195[14] = &unk_24F502F70;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v33, v34, CFSTR("%s%s%sN%s"), "v", "@", "{CGPoint=dd}", "^{CGPoint=dd}");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v194[15] = v177;
  v195[15] = &unk_24F502FB8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v35, v36, CFSTR("%s%sN%sN^%s"), "v", "@", "^{CGRect={CGPoint=dd}{CGSize=dd}}", "@");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v194[16] = v176;
  v195[16] = &unk_24F503000;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v37, v38, CFSTR("%s%s%s%s"), "v", "@", "q", "B");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v194[17] = v175;
  v195[17] = &unk_24F5030A8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v39, v40, CFSTR("%s%s%s%s"), "v", "@", "q", "@");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v194[18] = v174;
  v195[18] = &unk_24F5030F0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v41, v42, CFSTR("%s%s%s%s%s"), "v", "@", "@", "Q", "Q");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v194[19] = v173;
  v195[19] = &unk_24F503138;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v43, v44, CFSTR("%s%s%s%s%s"), "v", "@", "B", "@", "B");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v194[20] = v172;
  v195[20] = &unk_24F503180;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v45, v46, CFSTR("%s%s%s%s%s%s"), "v", "@", "@", "@", "@", "@");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v194[21] = v171;
  v195[21] = &unk_24F5031C8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v47, v48, CFSTR("%s%s%s%s"), "{CGSize=dd}", "@", "@", "@");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v194[22] = v170;
  v195[22] = &unk_24F503210;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v49, v50, CFSTR("%s%s%s%s"), "v", "@", "{_NSRange=QQ}", "@");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v194[23] = v169;
  v195[23] = &unk_24F503258;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v51, v52, "@");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v194[24] = v168;
  v195[24] = &unk_24F5032A0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v53, v54, "d");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v194[25] = v167;
  v195[25] = &unk_24F5032E8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v55, v56, "q");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v194[26] = v166;
  v195[26] = &unk_24F503330;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v57, v58, CFSTR("%s%s"), "@", "@");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v194[27] = v165;
  v195[27] = &unk_24F503350;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v59, v60, CFSTR("%s%s%s"), "@", "@", "@");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v194[28] = v164;
  v195[28] = &unk_24F503398;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v61, v62, CFSTR("%s%s%s%s"), "@", "@", "@", "@");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v194[29] = v163;
  v195[29] = &unk_24F5033E0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v63, v64, CFSTR("%s%s%s"), "@", "@", "q");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v194[30] = v162;
  v195[30] = &unk_24F503428;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v65, v66, CFSTR("%s%s%s%s"), "@", "@", "q", "q");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v194[31] = v161;
  v195[31] = &unk_24F503470;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v67, v68, CFSTR("%s%s%s%s%s"), "@", "@", "@", "@", "@");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v194[32] = v160;
  v195[32] = &unk_24F5034B8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v69, v70, CFSTR("%s%s%s%s%s"), "@", "@", "q", "q", "@");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v194[33] = v159;
  v195[33] = &unk_24F503500;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v71, v72, CFSTR("%s%s%s%s%s"), "@", "@", "q", "@", "@");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v194[34] = v158;
  v195[34] = &unk_24F503548;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v73, v74, CFSTR("%s%s%s"), "v", "q", "q");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v194[35] = v157;
  v195[35] = &unk_24F503590;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v75, v76, CFSTR("%s%s"), "q", "@");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v194[36] = v156;
  v195[36] = &unk_24F5035B0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v77, v78, CFSTR("%s%s"), "Q", "@");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v194[37] = v155;
  v195[37] = &unk_24F5035F8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v79, v80, CFSTR("%s%s"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v194[38] = v154;
  v195[38] = &unk_24F503640;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v81, v82, CFSTR("%s%s%s"), "q", "@", "q");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v194[39] = v153;
  v195[39] = &unk_24F503688;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v83, v84, CFSTR("%s%s%s"), "B", "@", "q");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v194[40] = v152;
  v195[40] = &unk_24F5036D0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v85, v86, CFSTR("%s%s"), "B", "@");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v194[41] = v151;
  v195[41] = &unk_24F503718;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v87, v88, CFSTR("%s%s"), "d", "@");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v194[42] = v150;
  v195[42] = &unk_24F503760;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v89, v90, CFSTR("%s%s%s"), "{CGPoint=dd}", "@", "{CGPoint=dd}");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v194[43] = v149;
  v195[43] = &unk_24F5037A8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v91, v92, CFSTR("%s%s%s%s"), "B", "@", "{_NSRange=QQ}", "@");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v194[44] = v148;
  v195[44] = &unk_24F5037F0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v93, v94, CFSTR("%s%s%s%s"), "B", "@", "@", "{_NSRange=QQ}");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v194[45] = v147;
  v195[45] = &unk_24F503838;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v95, v96, CFSTR("%s%s%s%s"), "q", "@", "@", "q");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v194[46] = v146;
  v195[46] = &unk_24F503880;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v97, v98, CFSTR("%s%s%s%s"), "B", "@", "@", "q");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v194[47] = v145;
  v195[47] = &unk_24F5038C8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v99, v100, CFSTR("%s%s%s%s"), "B", "@", "@", "q");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v194[48] = v144;
  v195[48] = &unk_24F503910;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v101, v102, CFSTR("%s%s%s%s"), "B", "@", "@", "@");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v194[49] = v143;
  v195[49] = &unk_24F503930;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v103, v104, CFSTR("%s%s%s%s"), "d", "@", "@", "q");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v194[50] = v142;
  v195[50] = &unk_24F503978;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v105, v106, CFSTR("%s%s%s%s"), "{UIEdgeInsets=dddd}", "@", "@", "q");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v194[51] = v141;
  v195[51] = &unk_24F5039C0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v107, v108, CFSTR("%s%s%s"), "d", "@", "@");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v194[52] = v140;
  v195[52] = &unk_24F503A08;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v109, v110, CFSTR("%s%s%s"), "q", "@", "@");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v194[53] = v139;
  v195[53] = &unk_24F503A50;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v111, v112, CFSTR("%s%s%s"), "B", "@", "@");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v194[54] = v138;
  v195[54] = &unk_24F503A98;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v113, v114, CFSTR("%s%s%s"), "d", "@", "q");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v194[55] = v137;
  v195[55] = &unk_24F503AE0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v115, v116, CFSTR("%s%s"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v194[56] = v117;
  v195[56] = &unk_24F503B28;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v118, v119, CFSTR("%s%s%s"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v194[57] = v120;
  v195[57] = &unk_24F503B70;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v121, v122, CFSTR("%s%s%s%s"), "{CGSize=dd}", "@", "@", "q");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v194[58] = v123;
  v195[58] = &unk_24F503BB8;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v124, v125, CFSTR("%s%s%s%s"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v194[59] = v126;
  v195[59] = &unk_24F503C00;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v127, v128, CFSTR("%s%s%s%s%s"), "B", "@", "@", "@", "B");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v194[60] = v129;
  v195[60] = &unk_24F503C48;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v130, v131, CFSTR("%s%s%s%s%s"), "B", "@", "@", "{_NSRange=QQ}", "q");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v194[61] = v132;
  v195[61] = &unk_24F503C90;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v133, v134, v195, v194, 62);
  v135 = objc_claimAutoreleasedReturnValue();
  v136 = (void *)qword_255B51CA8;
  qword_255B51CA8 = v135;

}

IMP sub_22AD6BBBC(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6BC48;
  v7[3] = &unk_24F502BA8;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD6BC48(uint64_t a1, void *a2, double a3)
{
  return objc_msgSend_emitTMLSignal_withArguments_(a2, (const char *)a2, a3, *(_QWORD *)(a1 + 32), 0);
}

IMP sub_22AD6BC58(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6BCE4;
  v7[3] = &unk_24F502BF0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6BCE4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v6, v8, v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v5, v12, v13, v9, v11);

  if (!v7)
}

IMP sub_22AD6BDBC(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6BE48;
  v7[3] = &unk_24F502C38;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6BE48(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v10 = a4;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v13;
  v14 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v11, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v7, v16, v17, v12, v15);

  if (!v10)
  {

    if (v8)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v8)
    goto LABEL_9;
LABEL_7:

}

IMP sub_22AD6BF68(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6BFF4;
  v7[3] = &unk_24F502C80;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6BFF4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v13 = a5;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[0] = v16;
  v17 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14, v22[0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v17;
  v18 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, v14, v22, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v9, v20, v21, v15, v19);

  if (v13)
  {
    if (v11)
      goto LABEL_9;
LABEL_12:

    if (v10)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v11)
    goto LABEL_12;
LABEL_9:
  if (!v10)
    goto LABEL_13;
LABEL_10:

}

IMP sub_22AD6C158(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6C1E4;
  v7[3] = &unk_24F502CC8;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6C1E4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v13 = a5;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[0] = v16;
  v17 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14, v24[0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)objc_msgSend_copy(v13, v12, v14, v24[0], v17);
  v24[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v19, v20, v24, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v9, v22, v23, v15, v21);

  if (!v11)
  {

    if (v10)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
LABEL_7:

}

IMP sub_22AD6C330(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6C3BC;
  v7[3] = &unk_24F502D10;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6C3BC(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  id v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  double v24;
  id v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v25 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v15 = a6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[0] = v18;
  v19 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[1] = v19;
  v20 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[2] = v20;
  v21 = v15;
  if (!v15)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[3] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, v16, v27, 4, v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v26, v23, v24, v17, v22);

  if (v15)
  {
    if (v13)
      goto LABEL_11;
  }
  else
  {

    if (v13)
    {
LABEL_11:
      if (v12)
        goto LABEL_12;
LABEL_16:

      if (v11)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v12)
    goto LABEL_16;
LABEL_12:
  if (!v11)
    goto LABEL_17;
LABEL_13:

}

IMP sub_22AD6C560(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6C5EC;
  v7[3] = &unk_24F502D58;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6C5EC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  objc_msgSend_numberWithBool_(v5, v7, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v10, v11, v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v6, v13, v14, v4, v12);

}

IMP sub_22AD6C6A8(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6C734;
  v7[3] = &unk_24F502DA0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6C734(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  const char *v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v9 = a3;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[0] = v12;
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v8, v10, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, v15, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v7, v17, v18, v11, v16);

  if (!v9)
}

IMP sub_22AD6C830(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6C8BC;
  v7[3] = &unk_24F502DE8;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6C8BC(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v12 = a4;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = v15;
  v16 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13, v23[0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v11, v13, a5, v23[0], v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v9, v21, v22, v14, v20);

  if (!v12)
  {

    if (v10)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
LABEL_7:

}

IMP sub_22AD6CA00(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6CA8C;
  v7[3] = &unk_24F502E30;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6CA8C(uint64_t a1, void *a2, void *a3, void *a4, float a5)
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v12 = a4;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = v15;
  v16 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13, v23[0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  *(float *)&v13 = a5;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v11, v13, v23[0], v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v9, v21, v22, v14, v20);

  if (!v12)
  {

    if (v10)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
LABEL_7:

}

IMP sub_22AD6CBD8(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6CC64;
  v7[3] = &unk_24F502E78;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6CC64(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v12 = a4;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = v15;
  v16 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13, v23[0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v11, a5, v23[0], v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v9, v21, v22, v14, v20);

  if (!v12)
  {

    if (v10)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
LABEL_7:

}

IMP sub_22AD6CDB0(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6CE3C;
  v7[3] = &unk_24F502EC0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6CE3C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  const char *v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v9 = a3;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[0] = v12;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v8, v10, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, v15, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v7, v17, v18, v11, v16);

  if (!v9)
}

IMP sub_22AD6CF38(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6CFC4;
  v7[3] = &unk_24F502F08;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6CFC4(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v12 = a4;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = v15;
  v16 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13, v23[0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v11, v13, a5, v23[0], v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v9, v21, v22, v14, v20);

  if (!v12)
  {

    if (v10)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
LABEL_7:

}

IMP sub_22AD6D108(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6D194;
  v7[3] = &unk_24F502F50;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6D194(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  const char *v10;
  id v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v11 = a3;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v10, v12, a4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v15;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v16, v17, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v19, v20, v24, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v9, v22, v23, v13, v21);

  if (!v11)
}

IMP sub_22AD6D2B8(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6D344;
  v7[3] = &unk_24F502F98;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6D344(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  const char *v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v9 = a3;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[0] = v12;
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v8, v10, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, v15, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v7, v17, v18, v11, v16);

  if (!v9)
}

IMP sub_22AD6D440(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6D4CC;
  v7[3] = &unk_24F502FE0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6D4CC(uint64_t a1, void *a2, void *a3, uint64_t a4, double a5, double a6)
{
  id v11;
  const char *v12;
  id v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v13 = a3;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_convertPoint_(TMLTypes, v12, a5, a6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend_valueWithPointer_(MEMORY[0x24BDD1968], v18, v19, a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v20;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v21, v22, v26, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v11, v24, v25, v15, v23);

  if (!v13)
}

IMP sub_22AD6D604(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6D690;
  v7[3] = &unk_24F503088;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6D690(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  const char *v10;
  id v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v11 = a3;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[0] = v14;
  v15 = MEMORY[0x24BDAC760];
  v27[4] = a4;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_22AD6D84C;
  v28[3] = &unk_24F503020;
  v28[4] = a4;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = sub_22AD6D868;
  v27[3] = &unk_24F503040;
  objc_msgSend_pointerWithReadBlock_writeBlock_(TMLPointer, v10, v12, v28, v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  v25[4] = a5;
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = sub_22AD6D8D8;
  v26[3] = &unk_24F503020;
  v26[4] = a5;
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = sub_22AD6D8E4;
  v25[3] = &unk_24F503060;
  objc_msgSend_pointerWithReadBlock_writeBlock_(TMLPointer, v17, v18, v26, v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v19;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v20, v21, v29, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v9, v23, v24, v13, v22);

  if (!v11)
}

uint64_t sub_22AD6D84C(uint64_t a1, const char *a2)
{
  return objc_msgSend_convertRect_(TMLTypes, a2, **(double **)(a1 + 32), *(double *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(*(_QWORD *)(a1 + 32) + 16), *(double *)(*(_QWORD *)(a1 + 32) + 24));
}

void sub_22AD6D868(uint64_t a1, void *a2)
{
  const char *v3;
  double v4;
  _QWORD *v5;
  void *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = *(_QWORD **)(a1 + 32);
    objc_msgSend_CGRectValue(v13, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v6, v7, v8);
    *v5 = v9;
    v5[1] = v10;
    v5[2] = v11;
    v5[3] = v12;

  }
}

id sub_22AD6D8D8(uint64_t a1)
{
  return **(id **)(a1 + 32);
}

void sub_22AD6D8E4(uint64_t a1, void *a2)
{
  objc_storeStrong(*(id **)(a1 + 32), a2);
}

IMP sub_22AD6D8EC(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6D978;
  v7[3] = &unk_24F5030D0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6D978(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  const char *v10;
  id v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v11 = a3;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v10, v12, a4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v15;
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v16, v17, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v19, v20, v24, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v9, v22, v23, v13, v21);

  if (!v11)
}

IMP sub_22AD6DA9C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6DB28;
  v7[3] = &unk_24F503118;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6DB28(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  const char *v21;
  double v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v12 = a5;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v11, v13, a4, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v19 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v19;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, v18, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v9, v21, v22, v14, v20);

  if (!v12)
  if (!v10)

}

IMP sub_22AD6DC64(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6DCF0;
  v7[3] = &unk_24F503160;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6DCF0(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  const char *v13;
  id v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v14 = a4;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[0] = v17;
  v18 = v14;
  if (!v14)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[1] = v18;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v13, v15, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v19;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v20, v21, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v22;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v23, v24, v28, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v11, v26, v27, v16, v25);

  if (!v14)
  {

    if (v12)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v12)
    goto LABEL_9;
LABEL_7:

}

IMP sub_22AD6DE5C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6DEE8;
  v7[3] = &unk_24F5031A8;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6DEE8(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  const char *v13;
  id v14;
  double v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v14 = a5;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[0] = v17;
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v13, v15, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v19;
  v21 = v14;
  if (!v14)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[2] = v21;
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v18, v20, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v22;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v23, v24, v28, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v11, v26, v27, v16, v25);

  if (!v14)
  if (!v12)

}

IMP sub_22AD6E04C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6E0D8;
  v7[3] = &unk_24F5031F0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6E0D8(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  id v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  uint64_t v29;
  id v30;
  _QWORD v31[6];

  v31[5] = *MEMORY[0x24BDAC8D0];
  v30 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v18 = a7;
  v29 = *(_QWORD *)(a1 + 32);
  v20 = (uint64_t)v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v19);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v20;
  v31[0] = v20;
  v21 = v14;
  if (!v14)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[1] = v21;
  v22 = v15;
  if (!v15)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[2] = v22;
  v23 = v16;
  if (!v16)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[3] = v23;
  v24 = v18;
  if (!v18)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[4] = v24;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v17, v19, v31, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v30, v26, v27, v29, v25);

  if (v18)
  {
    if (v16)
      goto LABEL_13;
  }
  else
  {

    if (v16)
    {
LABEL_13:
      if (v15)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (v15)
  {
LABEL_14:
    if (v14)
      goto LABEL_15;
LABEL_20:

    if (v13)
      goto LABEL_16;
LABEL_21:

    goto LABEL_16;
  }
LABEL_19:

  if (!v14)
    goto LABEL_20;
LABEL_15:
  if (!v13)
    goto LABEL_21;
LABEL_16:

}

IMP sub_22AD6E2BC(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6E348;
  v7[3] = &unk_24F503238;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD6E348(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  id v22;
  const char *v23;
  double v24;
  double v25;
  double v26;
  id v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v13 = a5;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[0] = v16;
  v17 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[1] = v17;
  v18 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, v14, v29, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v20, v21, v15, v19, &v28);
  v22 = v28;

  if (v13)
  {
    if (v11)
      goto LABEL_9;
LABEL_12:

    if (v10)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v11)
    goto LABEL_12;
LABEL_9:
  if (!v10)
    goto LABEL_13;
LABEL_10:
  objc_msgSend_CGSizeValue(v22, v23, v24);
  v26 = v25;

  return v26;
}

IMP sub_22AD6E4E4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6E570;
  v7[3] = &unk_24F503280;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6E570(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  const char *v13;
  id v14;
  double v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  const char *v23;
  double v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v14 = a6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_convertRange_(TMLTypes, v13, v15, a4, a5, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v21 = v14;
  if (!v14)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v20, v25, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v11, v23, v24, v16, v22);

  if (!v14)
  if (!v12)

}

IMP sub_22AD6E6B4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6E740;
  v7[3] = &unk_24F5032C8;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_22AD6E740(uint64_t a1, void *a2, double a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(a2, (const char *)a2, a3, v3, 0, &v5);
  return v5;
}

IMP sub_22AD6E778(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6E804;
  v7[3] = &unk_24F503310;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD6E804(uint64_t a1, void *a2, double a3)
{
  uint64_t v3;
  id v4;
  const char *v5;
  double v6;
  double v7;
  double v8;
  id v10;

  v3 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(a2, (const char *)a2, a3, v3, 0, &v10);
  v4 = v10;
  objc_msgSend_doubleValue(v4, v5, v6);
  v8 = v7;

  return v8;
}

IMP sub_22AD6E860(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6E8EC;
  v7[3] = &unk_24F503310;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD6E8EC(uint64_t a1, void *a2, double a3)
{
  uint64_t v3;
  id v4;
  const char *v5;
  double v6;
  double v7;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v9 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(a2, (const char *)a2, a3, v3, 0, &v9);
  v4 = v9;
  v7 = (double)objc_msgSend_integerValue(v4, v5, v6);

  return v7;
}

IMP sub_22AD6E948(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6E9D4;
  v7[3] = &unk_24F503378;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_22AD6E9D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  id v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v6, v8, v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v16);
  v14 = v16;

  if (!v7)
  return v14;
}

IMP sub_22AD6EAC4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6EB50;
  v7[3] = &unk_24F5033C0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_22AD6EB50(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  id v18;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v10 = a4;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[0] = v13;
  v14 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[1] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v11, v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v16, v17, v12, v15, &v20);
  v18 = v20;

  if (!v10)
  {

    if (v8)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v8)
    goto LABEL_9;
LABEL_7:

  return v18;
}

IMP sub_22AD6EC88(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6ED14;
  v7[3] = &unk_24F503408;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_22AD6ED14(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  id v22;
  id v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v13 = a5;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[0] = v16;
  v17 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v17;
  v18 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, v14, v25, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v20, v21, v15, v19, &v24);
  v22 = v24;

  if (v13)
  {
    if (v11)
      goto LABEL_9;
LABEL_12:

    if (v10)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v11)
    goto LABEL_12;
LABEL_9:
  if (!v10)
    goto LABEL_13;
LABEL_10:

  return v22;
}

IMP sub_22AD6EE90(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6EF1C;
  v7[3] = &unk_24F503450;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_22AD6EF1C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  const char *v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  id v19;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v9 = a3;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[0] = v12;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v8, v10, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, v15, v22, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v17, v18, v11, v16, &v21);
  v19 = v21;

  if (!v9)
  return v19;
}

IMP sub_22AD6F030(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6F0BC;
  v7[3] = &unk_24F503498;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_22AD6F0BC(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  const char *v10;
  id v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  id v24;
  id v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v11 = a3;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[0] = v14;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v10, v12, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v15;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v16, v17, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v19, v20, v27, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v22, v23, v13, v21, &v26);
  v24 = v26;

  if (!v11)
  return v24;
}

IMP sub_22AD6F1F8(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6F284;
  v7[3] = &unk_24F5034E0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_22AD6F284(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  id v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  double v24;
  id v25;
  id v27;
  id v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v27 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v15 = a6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[0] = v18;
  v19 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[1] = v19;
  v20 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[2] = v20;
  v21 = v15;
  if (!v15)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[3] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, v16, v29, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v27, v23, v24, v17, v22, &v28);
  v25 = v28;

  if (v15)
  {
    if (v13)
      goto LABEL_11;
  }
  else
  {

    if (v13)
    {
LABEL_11:
      if (v12)
        goto LABEL_12;
LABEL_16:

      if (v11)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v12)
    goto LABEL_16;
LABEL_12:
  if (!v11)
    goto LABEL_17;
LABEL_13:

  return v25;
}

IMP sub_22AD6F440(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6F4CC;
  v7[3] = &unk_24F503528;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_22AD6F4CC(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  const char *v13;
  id v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  const char *v26;
  double v27;
  id v28;
  id v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v14 = a6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[0] = v17;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v13, v15, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v18;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v19, v20, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v22;
  v24 = v14;
  if (!v14)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[3] = v24;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v21, v23, v31, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v11, v26, v27, v16, v25, &v30);
  v28 = v30;

  if (!v14)
  if (!v12)

  return v28;
}

IMP sub_22AD6F648(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6F6D4;
  v7[3] = &unk_24F503570;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

id sub_22AD6F6D4(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  id v15;
  double v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  double v26;
  id v27;
  id v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a5;
  v15 = a6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[0] = v18;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v14, v16, a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v20;
  v22 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[2] = v22;
  v23 = v15;
  if (!v15)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v19, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[3] = v23;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v19, v21, v30, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v11, v25, v26, v17, v24, &v29);
  v27 = v29;

  if (v15)
  {
    if (v13)
      goto LABEL_9;
  }
  else
  {

    if (v13)
      goto LABEL_9;
  }

LABEL_9:
  if (!v12)

  return v27;
}

IMP sub_22AD6F870(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6F8FC;
  v7[3] = &unk_24F502F50;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

void sub_22AD6F8FC(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  const char *v10;
  id v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v11 = a3;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v10, v12, a4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v15;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v16, v17, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v19, v20, v24, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(v9, v22, v23, v13, v21);

  if (!v11)
}

IMP sub_22AD6FA20(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6FAAC;
  v7[3] = &unk_24F5035D8;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD6FAAC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  id v14;
  const char *v15;
  double v16;
  uint64_t v17;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v6, v8, v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v19);
  v14 = v19;

  if (!v7)
  v17 = objc_msgSend_integerValue(v14, v15, v16);

  return v17;
}

IMP sub_22AD6FBAC(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6FC38;
  v7[3] = &unk_24F503620;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD6FC38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  id v14;
  const char *v15;
  double v16;
  uint64_t v17;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v6, v8, v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v19);
  v14 = v19;

  if (!v7)
  v17 = objc_msgSend_unsignedIntegerValue(v14, v15, v16);

  return v17;
}

IMP sub_22AD6FD38(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6FDC4;
  v7[3] = &unk_24F503668;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD6FDC4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  id v14;
  const char *v15;
  double v16;
  double v17;
  double v18;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v6, v8, v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v20);
  v14 = v20;

  if (!v7)
  objc_msgSend_CGRectValue(v14, v15, v16);
  v18 = v17;

  return v18;
}

IMP sub_22AD6FEEC(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD6FF78;
  v7[3] = &unk_24F5036B0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD6FF78(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  const char *v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  id v19;
  const char *v20;
  double v21;
  uint64_t v22;
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v9 = a3;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[0] = v12;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v8, v10, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, v15, v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v17, v18, v11, v16, &v24);
  v19 = v24;

  if (!v9)
  v22 = objc_msgSend_integerValue(v19, v20, v21);

  return v22;
}

IMP sub_22AD7009C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD70128;
  v7[3] = &unk_24F5036F8;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD70128(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  const char *v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  id v19;
  const char *v20;
  double v21;
  uint64_t v22;
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v9 = a3;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[0] = v12;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v8, v10, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, v15, v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v17, v18, v11, v16, &v24);
  v19 = v24;

  if (!v9)
  v22 = objc_msgSend_BOOLValue(v19, v20, v21);

  return v22;
}

IMP sub_22AD7024C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD702D8;
  v7[3] = &unk_24F503740;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD702D8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  id v14;
  const char *v15;
  double v16;
  uint64_t v17;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v6, v8, v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v19);
  v14 = v19;

  if (!v7)
  v17 = objc_msgSend_BOOLValue(v14, v15, v16);

  return v17;
}

IMP sub_22AD703D8(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD70464;
  v7[3] = &unk_24F503788;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD70464(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  id v14;
  const char *v15;
  double v16;
  double v17;
  double v18;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v6, v8, v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v5, v12, v13, v9, v11, &v20);
  v14 = v20;

  if (!v7)
  objc_msgSend_doubleValue(v14, v15, v16);
  v18 = v17;

  return v18;
}

IMP sub_22AD7056C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD705F8;
  v7[3] = &unk_24F5037D0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD705F8(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  id v9;
  const char *v10;
  id v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  id v21;
  const char *v22;
  double v23;
  double v24;
  double v25;
  id v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v11 = a3;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[0] = v14;
  objc_msgSend_convertPoint_(TMLTypes, v10, a4, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v15;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, v17, v28, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v19, v20, v13, v18, &v27);
  v21 = v27;

  if (!v11)
  objc_msgSend_CGPointValue(v21, v22, v23);
  v25 = v24;

  return v25;
}

IMP sub_22AD70734(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD707C0;
  v7[3] = &unk_24F503818;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD707C0(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  const char *v13;
  id v14;
  double v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  const char *v23;
  double v24;
  id v25;
  const char *v26;
  double v27;
  unsigned int v28;
  id v30;
  _QWORD v31[4];

  v31[3] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v14 = a6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[0] = v17;
  objc_msgSend_convertRange_(TMLTypes, v13, v15, a4, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v19;
  v21 = v14;
  if (!v14)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[2] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v20, v31, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v11, v23, v24, v16, v22, &v30);
  v25 = v30;

  if (!v14)
  if (!v12)

  v28 = objc_msgSend_BOOLValue(v25, v26, v27);
  return v28;
}

IMP sub_22AD7092C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD709B8;
  v7[3] = &unk_24F503860;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD709B8(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  const char *v13;
  id v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  id v25;
  const char *v26;
  double v27;
  unsigned int v28;
  id v30;
  _QWORD v31[4];

  v31[3] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v14 = a4;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[0] = v17;
  v18 = v14;
  if (!v14)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[1] = v18;
  objc_msgSend_convertRange_(TMLTypes, v13, v15, a5, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v19;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v20, v21, v31, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v11, v23, v24, v16, v22, &v30);
  v25 = v30;

  if (!v14)
  {

    if (v12)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v12)
    goto LABEL_9;
LABEL_7:
  v28 = objc_msgSend_BOOLValue(v25, v26, v27);

  return v28;
}

IMP sub_22AD70B2C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD70BB8;
  v7[3] = &unk_24F5038A8;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD70BB8(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;
  const char *v24;
  double v25;
  uint64_t v26;
  id v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v12 = a4;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[0] = v15;
  v16 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[1] = v16;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v11, v13, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v29, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v28);
  v23 = v28;

  if (!v12)
  {

    if (v10)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
LABEL_7:
  v26 = objc_msgSend_integerValue(v23, v24, v25);

  return v26;
}

IMP sub_22AD70D24(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD70DB0;
  v7[3] = &unk_24F5038F0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD70DB0(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;
  const char *v24;
  double v25;
  uint64_t v26;
  id v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v12 = a4;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[0] = v15;
  v16 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[1] = v16;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v11, v13, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v29, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v28);
  v23 = v28;

  if (!v12)
  {

    if (v10)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
LABEL_7:
  v26 = objc_msgSend_BOOLValue(v23, v24, v25);

  return v26;
}

IMP sub_22AD70F1C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD70FA8;
  v7[3] = &unk_24F5038F0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD70FA8(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;
  const char *v24;
  double v25;
  uint64_t v26;
  id v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v12 = a4;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[0] = v15;
  v16 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[1] = v16;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v11, v13, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v29, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v28);
  v23 = v28;

  if (!v12)
  {

    if (v10)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
LABEL_7:
  v26 = objc_msgSend_BOOLValue(v23, v24, v25);

  return v26;
}

IMP sub_22AD71114(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD711A0;
  v7[3] = &unk_24F503958;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD711A0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  id v22;
  const char *v23;
  double v24;
  uint64_t v25;
  id v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v13 = a5;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[0] = v16;
  v17 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[1] = v17;
  v18 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, v14, v28, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v20, v21, v15, v19, &v27);
  v22 = v27;

  if (v13)
  {
    if (v11)
      goto LABEL_9;
LABEL_12:

    if (v10)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v11)
    goto LABEL_12;
LABEL_9:
  if (!v10)
    goto LABEL_13;
LABEL_10:
  v25 = objc_msgSend_BOOLValue(v22, v23, v24);

  return v25;
}

IMP sub_22AD7132C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD713B8;
  v7[3] = &unk_24F5039A0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD713B8(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;
  const char *v24;
  double v25;
  double v26;
  double v27;
  id v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v12 = a4;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[0] = v15;
  v16 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[1] = v16;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v11, v13, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v30, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v29);
  v23 = v29;

  if (!v12)
  {

    if (v10)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
LABEL_7:
  objc_msgSend_doubleValue(v23, v24, v25);
  v27 = v26;

  return v27;
}

IMP sub_22AD7152C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD715B8;
  v7[3] = &unk_24F5039E8;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD715B8(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;
  const char *v24;
  double v25;
  double v26;
  double v27;
  id v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v12 = a4;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[0] = v15;
  v16 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[1] = v16;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v11, v13, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v30, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v29);
  v23 = v29;

  if (!v12)
  {

    if (v10)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
LABEL_7:
  objc_msgSend_UIEdgeInsetsValue(v23, v24, v25);
  v27 = v26;

  return v27;
}

IMP sub_22AD7174C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD717D8;
  v7[3] = &unk_24F503A30;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD717D8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  id v18;
  const char *v19;
  double v20;
  double v21;
  double v22;
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v10 = a4;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[0] = v13;
  v14 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v11, v25, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v16, v17, v12, v15, &v24);
  v18 = v24;

  if (!v10)
  {

    if (v8)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v8)
    goto LABEL_9;
LABEL_7:
  objc_msgSend_doubleValue(v18, v19, v20);
  v22 = v21;

  return v22;
}

IMP sub_22AD71928(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD719B4;
  v7[3] = &unk_24F503A78;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD719B4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  id v18;
  const char *v19;
  double v20;
  uint64_t v21;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v10 = a4;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[0] = v13;
  v14 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[1] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v11, v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v16, v17, v12, v15, &v23);
  v18 = v23;

  if (!v10)
  {

    if (v8)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v8)
    goto LABEL_9;
LABEL_7:
  v21 = objc_msgSend_integerValue(v18, v19, v20);

  return v21;
}

IMP sub_22AD71AFC(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD71B88;
  v7[3] = &unk_24F503AC0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD71B88(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  id v18;
  const char *v19;
  double v20;
  uint64_t v21;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v10 = a4;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[0] = v13;
  v14 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[1] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, v11, v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v16, v17, v12, v15, &v23);
  v18 = v23;

  if (!v10)
  {

    if (v8)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v8)
    goto LABEL_9;
LABEL_7:
  v21 = objc_msgSend_BOOLValue(v18, v19, v20);

  return v21;
}

IMP sub_22AD71CD0(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD71D5C;
  v7[3] = &unk_24F503B08;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD71D5C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  const char *v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  id v19;
  const char *v20;
  double v21;
  double v22;
  double v23;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v9 = a3;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[0] = v12;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v8, v10, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, v15, v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v7, v17, v18, v11, v16, &v25);
  v19 = v25;

  if (!v9)
  objc_msgSend_doubleValue(v19, v20, v21);
  v23 = v22;

  return v23;
}

IMP sub_22AD71E88(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD71F14;
  v7[3] = &unk_24F503B50;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD71F14(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  id v19;
  const char *v20;
  double v21;
  double v22;
  double v23;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = a2;
  objc_msgSend_convertRect_(TMLTypes, v12, a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, v15, v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v11, v17, v18, v10, v16, &v25);

  v19 = v25;
  objc_msgSend_CGRectValue(v19, v20, v21);
  v23 = v22;

  return v23;
}

IMP sub_22AD72038(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD720C4;
  v7[3] = &unk_24F503B98;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD720C4(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  uint64_t v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  id v29;
  const char *v30;
  double v31;
  double v32;
  double v33;
  id v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v18 = *(_QWORD *)(a1 + 32);
  v19 = a2;
  objc_msgSend_convertRect_(TMLTypes, v20, a3, a4, a5, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v21;
  objc_msgSend_convertRect_(TMLTypes, v22, a7, a8, a9, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v23;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v24, v25, v36, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v19, v27, v28, v18, v26, &v35);

  v29 = v35;
  objc_msgSend_CGRectValue(v29, v30, v31);
  v33 = v32;

  return v33;
}

IMP sub_22AD72238(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD722C4;
  v7[3] = &unk_24F503BE0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD722C4(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;
  const char *v24;
  double v25;
  double v26;
  double v27;
  id v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v12 = a4;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[0] = v15;
  v16 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[1] = v16;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v11, v13, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v30, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v9, v21, v22, v14, v20, &v29);
  v23 = v29;

  if (!v12)
  {

    if (v10)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_9;
LABEL_7:
  objc_msgSend_CGSizeValue(v23, v24, v25);
  v27 = v26;

  return v27;
}

IMP sub_22AD72440(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD724CC;
  v7[3] = &unk_24F503C28;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

double sub_22AD724CC(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  id v21;
  const char *v22;
  id v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  id v35;
  const char *v36;
  double v37;
  double v38;
  double v39;
  id v41;
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  v21 = a2;
  v23 = a3;
  v25 = *(_QWORD *)(a1 + 32);
  v26 = v23;
  if (!v23)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v22, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[0] = v26;
  objc_msgSend_convertRect_(TMLTypes, v22, a4, a5, a6, a7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v27;
  objc_msgSend_convertRect_(TMLTypes, v28, a8, a9, a10, a11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v29;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v30, v31, v42, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v21, v33, v34, v25, v32, &v41);
  v35 = v41;

  if (!v23)
  objc_msgSend_CGRectValue(v35, v36, v37);
  v39 = v38;

  return v39;
}

IMP sub_22AD72680(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD7270C;
  v7[3] = &unk_24F503C70;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD7270C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  const char *v13;
  id v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  id v26;
  const char *v27;
  double v28;
  uint64_t v29;
  id v31;
  id v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v31 = a2;
  v11 = a3;
  v12 = a4;
  v14 = a5;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[0] = v17;
  v18 = v12;
  if (!v12)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[1] = v18;
  v19 = v14;
  if (!v14)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[2] = v19;
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v13, v15, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v20;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v21, v22, v33, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v31, v24, v25, v16, v23, &v32);
  v26 = v32;

  if (v14)
  {
    if (v12)
      goto LABEL_9;
LABEL_12:

    if (v11)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v12)
    goto LABEL_12;
LABEL_9:
  if (!v11)
    goto LABEL_13;
LABEL_10:
  v29 = objc_msgSend_BOOLValue(v26, v27, v28);

  return v29;
}

IMP sub_22AD728C0(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  IMP v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD7294C;
  v7[3] = &unk_24F503CB8;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  v5 = imp_implementationWithBlock(v4);

  return v5;
}

uint64_t sub_22AD7294C(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v13;
  id v14;
  const char *v15;
  id v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  id v30;
  const char *v31;
  double v32;
  unsigned int v33;
  id v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  v14 = a3;
  v16 = a4;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = v14;
  if (!v14)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v15, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[0] = v19;
  v20 = v16;
  if (!v16)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v15, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[1] = v20;
  objc_msgSend_convertRange_(TMLTypes, v15, v17, a5, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v21;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v22, v23, a7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v24;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v25, v26, v36, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend_emitTMLSignal_withArguments_returnValue_(v13, v28, v29, v18, v27, &v35);
  v30 = v35;

  if (!v16)
  {

    if (v14)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v14)
    goto LABEL_9;
LABEL_7:
  v33 = objc_msgSend_BOOLValue(v30, v31, v32);

  return v33;
}

char *sub_22AD72D08(uint64_t a1, id a2, uint64_t a3)
{
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  char *result;

  v5 = objc_retainAutorelease(a2);
  v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
  result = strdup(v8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8 * a3) = result;
  return result;
}

void sub_22AD73258(uint64_t a1)
{
  size_t v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  id v7;

  v2 = strlen(a83847776gUj32C);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v3, v4, a83847776gUj32C, v2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_loadClasses_(TMLContext, v5, v6, v7);

}

void sub_22AD74E28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;
  id v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v24 = a2;
  v5 = a3;
  if (objc_msgSend_isEqualToString_(v24, v6, v7, CFSTR("state")))
  {
    if (objc_msgSend_type(v5, v8, v9) != 5)
    {
      v12 = (void *)MEMORY[0x24BDBCE88];
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_description(v5, v10, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v13, v15, v16, CFSTR("State property type is unexpected %@"), v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("property");
      v26[0] = v5;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v18, v19, v26, &v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v12, v21, v22, CFSTR("TMLRuntimeException"), v17, v20);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v23);
    }
  }
  else
  {
    objc_msgSend_verifyStateProperty_withClass_(*(void **)(a1 + 32), v8, v9, v5, *(_QWORD *)(a1 + 40));
  }

}

void sub_22AD74F7C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  objc_class *v9;
  id v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  NSString *v20;
  SEL v21;
  void *v22;
  void (*v23)(void);
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  NSString *v42;
  objc_class *v43;
  const char *v44;
  void *v45;
  const char *v46;
  double v47;
  void *v48;
  const char *v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  void *v54;
  const char *v55;
  double v56;
  void *v57;
  const char *v58;
  double v59;
  void *v60;
  const char *v61;
  double v62;
  void *v63;
  const char *v64;
  double v65;
  NSString *v66;
  SEL v67;
  void *v68;
  void (*v69)(void);
  void *v70;
  const char *v71;
  double v72;
  void *v73;
  const char *v74;
  double v75;
  void *v76;
  const char *v77;
  double v78;
  void *v79;
  const char *v80;
  double v81;
  void *v82;
  const char *v83;
  double v84;
  void *v85;
  const char *v86;
  double v87;
  NSString *v88;
  objc_class *v89;
  const char *v90;
  uint64_t v91;
  _QWORD v92[5];
  _QWORD v93[5];
  objc_property_attribute_t attributes;
  __int128 v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend_isEqualToString_(a2, v6, v7, CFSTR("state")) & 1) == 0)
  {
    attributes = (objc_property_attribute_t)xmmword_24F503CD8;
    v95 = xmmword_24F503CE8;
    v9 = *(objc_class **)(a1 + 32);
    objc_msgSend_propertyName(v5, v8, COERCE_DOUBLE(0x22ADAA9FBLL));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);
    class_addProperty(v9, v13, &attributes, 2u);

    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_propertyName(v5, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v14, v18, v19, CFSTR("%@ForState:"), v17);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();

    v21 = NSSelectorFromString(v20);
    v93[0] = MEMORY[0x24BDAC760];
    v93[1] = 3221225472;
    v93[2] = sub_22AD75344;
    v93[3] = &unk_24F503CF8;
    v93[4] = v21;
    v22 = (void *)MEMORY[0x22E2E7E44](v93);
    v23 = imp_implementationWithBlock(v22);

    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_propertyName(v5, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v27, v28, v29, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_capitalizedString(v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_propertyName(v5, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringFromIndex_(v36, v37, v38, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v24, v40, v41, CFSTR("get%@%@"), v33, v39);
    v42 = (NSString *)objc_claimAutoreleasedReturnValue();

    v43 = *(objc_class **)(a1 + 32);
    v44 = NSSelectorFromString(v42);
    class_addMethod(v43, v44, v23, "@@:");
    v45 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_propertyName(v5, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v48, v49, v50, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_capitalizedString(v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_propertyName(v5, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringFromIndex_(v57, v58, v59, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v45, v61, v62, CFSTR("%@%@"), v54, v60);
    v91 = a1;
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v45, v64, v65, CFSTR("set%@:forState:"), v63);
    v66 = (NSString *)objc_claimAutoreleasedReturnValue();

    v67 = NSSelectorFromString(v66);
    v92[0] = MEMORY[0x24BDAC760];
    v92[1] = 3221225472;
    v92[2] = sub_22AD753CC;
    v92[3] = &unk_24F503D18;
    v92[4] = v67;
    v68 = (void *)MEMORY[0x22E2E7E44](v92);
    v69 = imp_implementationWithBlock(v68);

    v70 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_propertyName(v5, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v73, v74, v75, 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_capitalizedString(v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_propertyName(v5, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringFromIndex_(v82, v83, v84, 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v70, v86, v87, CFSTR("set%@%@:"), v79, v85);
    v88 = (NSString *)objc_claimAutoreleasedReturnValue();

    v89 = *(objc_class **)(v91 + 32);
    v90 = NSSelectorFromString(v88);
    class_addMethod(v89, v90, v69, "v@:@");

  }
}

id sub_22AD75344(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  objc_class *v7;
  IMP MethodImplementation;
  uint64_t v9;
  const char *v10;
  double v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  objc_msgSend_tmlParent(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v7, *(SEL *)(a1 + 32));
    v9 = *(_QWORD *)(a1 + 32);
    v12 = objc_msgSend_state(v3, v10, v11);
    ((void (*)(void *, uint64_t, uint64_t))MethodImplementation)(v6, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_22AD753CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  double v7;
  void *v8;
  objc_class *v9;
  IMP MethodImplementation;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend_tmlParent(v15, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v9, *(SEL *)(a1 + 32));
    v11 = *(_QWORD *)(a1 + 32);
    v14 = objc_msgSend_state(v15, v12, v13);
    ((void (*)(void *, uint64_t, id, uint64_t))MethodImplementation)(v8, v11, v5, v14);
  }

}

id sub_22AD75994(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  TMLContext *v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  _QWORD v21[4];
  id v22;
  id location;

  v3 = a3;
  v4 = objc_alloc_init(TMLContext);
  objc_msgSend_loadSourceFromPath_(v4, v5, v6, v3);
  objc_msgSend_rootObject(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlIdentifier(v9, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_withIdentifier_(v4, v16, v17, v12, v15);

  objc_setAssociatedObject(v9, &unk_22AD83A61, v4, (void *)1);
  objc_initWeak(&location, v4);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_22AD75AE8;
  v21[3] = &unk_24F4FE150;
  objc_copyWeak(&v22, &location);
  objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v18, v19, v21, v9);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v9;
}

void sub_22AD75ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22AD75AE8(uint64_t a1)
{
  const char *v1;
  double v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_dispose(WeakRetained, v1, v2);

}

void sub_22AD75B14(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v3 = a3;
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, v5, &unk_24F503D78, CFSTR("url"));
  objc_msgSend_objectForKeyedSubscript_(v3, v6, v7, CFSTR("url"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v10, v8, v9, &unk_24F503DB8, CFSTR("components"));
}

id sub_22AD75B88(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v2, v3, v4))
  {
    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v5, v6, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id sub_22AD75BF8(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v2, v3, v4))
  {
    objc_msgSend_componentsWithString_(MEMORY[0x24BDD1808], v5, v6, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id sub_22AD75C68(uint64_t a1)
{
  id v2;
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  double v16;
  void *v17;
  id v18;
  const char *v19;
  double v20;
  uint64_t v21;
  const char *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDD1808]);
  v5 = (void *)objc_msgSend_initWithURL_resolvingAgainstBaseURL_(v2, v3, v4, a1, 1);
  objc_msgSend_queryItems(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v8, v9, v10))
  {
    v13 = (void *)MEMORY[0x24BDBCED8];
    v14 = objc_msgSend_count(v8, v11, v12);
    objc_msgSend_dictionaryWithCapacity_(v13, v15, v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v18 = v8;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, v20, &v43, v47, 16);
    if (v21)
    {
      v24 = v21;
      v25 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(v18);
          v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend_value(v27, v22, v23, (_QWORD)v43);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByRemovingPercentEncoding(v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend_name(v27, v32, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v17, v35, v36, v31, v34);

          }
        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, v23, &v43, v47, 16);
      }
      while (v24);
    }

    if (objc_msgSend_count(v17, v37, v38))
    {
      objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v39, v40, v17);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = 0;
    }

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

id sub_22AD75E40(void *a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v6, v9, v10, v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_withQueryParameters_(a1, v12, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id sub_22AD75EF8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  id v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  id v36;
  id v37;
  const char *v38;
  double v39;
  uint64_t v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  double v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  void *v57;
  const char *v58;
  double v59;
  const char *v60;
  double v61;
  void *v62;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  void *v68;
  _QWORD v69[2];

  v69[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (qword_255B51CC8 != -1)
    dispatch_once(&qword_255B51CC8, &unk_24F503DD8);
  v5 = objc_alloc(MEMORY[0x24BDD17C0]);
  v8 = (void *)objc_msgSend_initWithKey_ascending_(v5, v6, v7, CFSTR("name"), 1);
  v9 = objc_alloc(MEMORY[0x24BDD1808]);
  v12 = (void *)objc_msgSend_initWithURL_resolvingAgainstBaseURL_(v9, v10, v11, a1, 0);
  objc_msgSend_percentEncodedQuery(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setQuery_(v12, v16, v17, v15);

  objc_msgSend_queryItems(v12, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_mutableCopy(v20, v21, v22);

  if (v23)
  {
    v66[0] = MEMORY[0x24BDAC760];
    v66[1] = 3221225472;
    v66[2] = sub_22AD7622C;
    v66[3] = &unk_24F4FE128;
    v24 = v23;
    v67 = v24;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v25, v26, v66);
    if (objc_msgSend_count(v24, v27, v28))
    {
      v69[0] = v8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v29, v30, v69, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sortUsingDescriptors_(v24, v32, v33, v31);

      objc_msgSend_setQueryItems_(v12, v34, v35, v24);
    }
    v36 = v67;
  }
  else
  {
    v37 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v40 = objc_msgSend_count(v4, v38, v39);
    v43 = (void *)objc_msgSend_initWithCapacity_(v37, v41, v42, v40);
    v64[0] = MEMORY[0x24BDAC760];
    v64[1] = 3221225472;
    v64[2] = sub_22AD7647C;
    v64[3] = &unk_24F4FE128;
    v36 = v43;
    v65 = v36;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v44, v45, v64);
    if (objc_msgSend_count(v36, v46, v47))
    {
      v68 = v8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v48, v49, &v68, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sortUsingDescriptors_(v36, v51, v52, v50);

      objc_msgSend_setQueryItems_(v12, v53, v54, v36);
    }

  }
  objc_msgSend_query(v12, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPercentEncodedQuery_(v12, v58, v59, v57);

  objc_msgSend_URL(v12, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
}

void sub_22AD761AC(double a1, uint64_t a2, const char *a3)
{
  void *v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD1690];
  objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x24BDD14A8], a3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bitmapRepresentation(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterSetWithBitmapRepresentation_(v3, v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeCharactersInString_(v10, v11, v12, CFSTR("!*'();:@&=+$,/?%#[]"));
  v13 = (void *)qword_255B51CC0;
  qword_255B51CC0 = (uint64_t)v10;

}

void sub_22AD7622C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  id v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  double v23;
  unint64_t v24;
  const char *v25;
  double v26;
  const char *v27;
  unint64_t v28;
  double v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_stringValue(v6, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v5, v10, v11, qword_255B51CC0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v6, v13, v14, qword_255B51CC0);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x24BDD1838]);
    v19 = (void *)objc_msgSend_initWithName_value_(v16, v17, v18, v12, v15);
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v38 = objc_msgSend_count(*(void **)(a1 + 32), v20, COERCE_DOUBLE(0x2020000000));
    v21 = *(void **)(a1 + 32);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = sub_22AD76418;
    v31[3] = &unk_24F503E00;
    v5 = v12;
    v32 = v5;
    v33 = *(id *)(a1 + 32);
    v34 = &v35;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v21, v22, v23, 2, v31);
    v24 = v36[3];
    v28 = objc_msgSend_count(*(void **)(a1 + 32), v25, v26);
    v30 = *(void **)(a1 + 32);
    if (v24 >= v28)
      objc_msgSend_addObject_(v30, v27, v29, v19);
    else
      objc_msgSend_insertObject_atIndex_(v30, v27, v29, v19, v36[3]);

    _Block_object_dispose(&v35, 8);
    v6 = (id)v15;
  }

}

void sub_22AD76400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AD76418(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  void *v6;
  const char *v7;
  double v8;
  int isEqualToString;
  const char *v10;
  double v11;

  objc_msgSend_name(a2, (const char *)a2, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v6, v7, v8, *(_QWORD *)(a1 + 32));

  if (isEqualToString)
  {
    objc_msgSend_removeObjectAtIndex_(*(void **)(a1 + 40), v10, v11, a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
}

void sub_22AD7647C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  id v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  id v21;

  v21 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_stringValue(v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v21, v9, v10, qword_255B51CC0);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v5, v12, v13, qword_255B51CC0);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x24BDD1838]);
    v18 = (void *)objc_msgSend_initWithName_value_(v15, v16, v17, v11, v14);
    objc_msgSend_addObject_(*(void **)(a1 + 32), v19, v20, v18);

    v5 = (id)v14;
    v21 = (id)v11;
  }

}

id sub_22AD76580(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  id v13;
  const char *v14;
  double v15;
  void *v16;
  id v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  uint64_t v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  id v42;
  const char *v43;
  double v44;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, void *);
  void *v49;
  id v50;
  id v51;

  v4 = a3;
  if ((objc_msgSend_isObject(v4, v5, v6) & 1) != 0)
  {
    v9 = objc_alloc(MEMORY[0x24BDD1808]);
    v12 = (void *)objc_msgSend_initWithURL_resolvingAgainstBaseURL_(v9, v10, v11, a1, 0);
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend_queryItems(v12, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = MEMORY[0x24BDAC760];
    v47 = 3221225472;
    v48 = sub_22AD76734;
    v49 = &unk_24F503E28;
    v50 = v4;
    v17 = v13;
    v51 = v17;
    objc_msgSend_enumerateObjectsUsingBlock_(v16, v18, v19, &v46);

    v22 = objc_msgSend_count(v17, v20, v21, v46, v47, v48, v49);
    objc_msgSend_queryItems(v12, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_count(v25, v26, v27);

    if (v22 == v28)
    {
      v31 = a1;
    }
    else
    {
      objc_msgSend_setQueryItems_(v12, v29, v30, v17);
      objc_msgSend_URL(v12, v43, v44);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v42 = v31;

  }
  else
  {
    v32 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v7, v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v32, v34, v35, CFSTR("Callback is not a function"), v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v39, v40, v41, v36);

    v42 = a1;
  }

  return v42;
}

void sub_22AD76734(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  int v19;
  const char *v20;
  double v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend_name(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend_value(v3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v11, v12, v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callWithArguments_(v4, v14, v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_toBool(v16, v17, v18);

  if (v19)
    objc_msgSend_addObject_(*(void **)(a1 + 40), v20, v21, v3);

}

id sub_22AD76828(void *a1, const char *a2, uint64_t a3, double a4)
{
  id v4;

  if (a3)
  {
    objc_msgSend_URLByAppendingPathComponent_(a1, a2, a4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = a1;
  }
  return v4;
}

void sub_22AD768D0(uint64_t a1, CFIndex length, UInt8 *bytes)
{
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 8), bytes, length);
}

void sub_22AD76D88()
{
  id v0;
  const char *v1;
  double v2;
  void *v3;
  const char *v4;
  double v5;
  const __CFData *v6;
  SecCertificateRef v7;
  SecPolicyRef BasicX509;
  SecPolicyRef v9;
  BOOL v10;
  int v11;
  SecTrustRef trust;

  v0 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v1, v2, "MIICWDCCAcGgAwIBAgIJAKX2XHbzG9CnMA0GCSqGSIb3DQEBBQUAMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwHhcNMTUwNzAyMjEzODM4WhcNMjUwNjI5MjEzODM4WjBFMQswCQYDVQQGEwJBVTETMBEGA1UECAwKU29tZS1TdGF0ZTEhMB8GA1UECgwYSW50ZXJuZXQgV2lkZ2l0cyBQdHkgTHRkMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCZNZ0LmFnyWOH1tqI2VRx4NxonFgBtCqYaSlEzooXvbBw7fGPMqSfUeD6NtPFQ1PLH98wtU2I45MARnaE3kyjXiqfwIc0woZps/DbjMlzzYsNhONAunYidUnOheLF3GBjK5BcHM6800t6V+X+dc0q6TRz35vI+ixe8tAPxp97dEwIDAQABo1AwTjAdBgNVHQ4EFgQUezHNL2J1JcWuVBeBheXDzFewGzswHwYDVR0jBBgwFoAUezHNL2J1JcWuVBeBheXDzFewGzswDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOBgQCBgmi6awOQgNJ1uUbQfFLuAgt2IqjnD9hfe/JNoadqeU5tCfp/UkwVvN8sQTnz6bM+yaTvQqQXs62a/b1P7DVMWbCkehLBrZpsZnAq3eLd2s2yF4ywhOEjDBR1zTrG0XhRxMoqNk84SAvSrauK295Wj3DObQDpS92itymTc/iR1Q==", 808, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __CFData *)objc_msgSend_initWithBase64EncodedData_options_(v0, v4, v5, v3, 0);

  v7 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v6);
  BasicX509 = SecPolicyCreateBasicX509();
  v9 = BasicX509;
  if (v7)
    v10 = BasicX509 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    trust = 0;
    if (!SecTrustCreateWithCertificates(v7, BasicX509, &trust))
    {
      v11 = 0;
      if (!MEMORY[0x22E2E78D4](trust, &v11))
        qword_255B51CD0 = MEMORY[0x22E2E78BC](trust);
    }
    CFRelease(trust);
LABEL_14:
    CFRelease(v9);
    if (!v7)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (BasicX509)
    goto LABEL_14;
  if (v7)
LABEL_8:
    CFRelease(v7);
LABEL_9:

}

void sub_22AD76F5C()
{
  void *v0;

  v0 = (void *)qword_255B51CE0;
  qword_255B51CE0 = (uint64_t)&unk_24F534B38;

}

void sub_22AD770E4(double a1, uint64_t a2, const char *a3)
{
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  void *v55;
  const char *v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  void *v64;
  const char *v65;
  double v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[36];
  _QWORD v87[38];

  v87[36] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a3, a1, "B");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v85;
  v87[0] = &unk_24F533E88;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v3, v4, "f");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v84;
  v87[1] = &unk_24F533EA0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v5, v6, "d");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v83;
  v87[2] = &unk_24F533EB8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, v8, "q");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v86[3] = v82;
  v87[3] = &unk_24F533ED0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v9, v10, "i");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v86[4] = v81;
  v87[4] = &unk_24F533ED0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v11, v12, "q");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v86[5] = v80;
  v87[5] = &unk_24F533ED0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v13, v14, "Q");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v86[6] = v79;
  v87[6] = &unk_24F533EE8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v15, v16, "I");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v86[7] = v78;
  v87[7] = &unk_24F533EE8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v17, v18, "Q");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v86[8] = v77;
  v87[8] = &unk_24F533F00;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v19, v20, "Q");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v86[9] = v76;
  v87[9] = &unk_24F533EE8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v21, v22, "{CGSize=dd}");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v86[10] = v75;
  v87[10] = &unk_24F533F90;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v23, v24, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v86[11] = v74;
  v87[11] = &unk_24F533FA8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v25, v26, "{CGPoint=dd}");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v86[12] = v73;
  v87[12] = &unk_24F533FC0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v27, v28, "{CGVector=dd}");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v86[13] = v72;
  v87[13] = &unk_24F533FD8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v29, v30, "{UIOffset=dd}");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v86[14] = v71;
  v87[14] = &unk_24F534128;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v31, v32, "{CGAffineTransform=dddddd}");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v86[15] = v70;
  v87[15] = &unk_24F533FF0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v33, v34, "{CATransform3D=dddddddddddddddd}");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v86[16] = v69;
  v87[16] = &unk_24F534008;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v35, v36, "{UIEdgeInsets=dddd}");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v86[17] = v37;
  v87[17] = &unk_24F534020;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v38, v39, "{NSDirectionalEdgeInsets=dddd}");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v86[18] = v40;
  v87[18] = &unk_24F534038;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v41, v42, "{_NSRange=QQ}");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v86[19] = v43;
  v87[19] = &unk_24F534050;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v44, v45, "@");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v86[20] = v46;
  v87[20] = &unk_24F534110;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v47, v48, "#");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v86[21] = v49;
  v87[21] = &unk_24F534110;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v50, v51, "^v");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v86[22] = v52;
  v87[22] = &unk_24F533F18;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v53, v54, "^{CGColor=}");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v86[23] = v55;
  v87[23] = &unk_24F533F18;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v56, v57, "^{CGPath=}");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v86[24] = v58;
  v87[24] = &unk_24F533F18;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v59, v60, "^@");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v86[25] = v61;
  v87[25] = &unk_24F5340E0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v62, v63, "v");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v86[26] = v64;
  v86[27] = CFSTR("@\"NSString\"");
  v87[26] = &unk_24F533E70;
  v87[27] = &unk_24F533F30;
  v86[28] = CFSTR("@\"NSAttributedString\"");
  v86[29] = CFSTR("@\"NSURL\"");
  v87[28] = &unk_24F533F48;
  v87[29] = &unk_24F534080;
  v86[30] = CFSTR("@\"NSArray\"");
  v86[31] = CFSTR("@\"NSDictionary\"");
  v87[30] = &unk_24F534098;
  v87[31] = &unk_24F5340B0;
  v86[32] = CFSTR("@\"TMLBlock\"");
  v86[33] = CFSTR("@\"UIColor\"");
  v87[32] = &unk_24F534098;
  v87[33] = &unk_24F533F60;
  v86[34] = CFSTR("@\"UIFont\"");
  v86[35] = CFSTR("@\"UIImage\"");
  v87[34] = &unk_24F533F78;
  v87[35] = &unk_24F534068;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v65, v66, v87, v86, 36);
  v67 = objc_claimAutoreleasedReturnValue();
  v68 = (void *)qword_255B51CF0;
  qword_255B51CF0 = v67;

}

void sub_22AD77764(double a1, uint64_t a2, const char *a3)
{
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  void *v55;
  const char *v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  void *v64;
  const char *v65;
  double v66;
  void *v67;
  const char *v68;
  double v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _QWORD v92[29];
  _QWORD v93[31];

  v93[29] = *MEMORY[0x24BDAC8D0];
  v92[0] = &unk_24F533E70;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a3, a1, "v");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v91;
  v92[1] = &unk_24F533E88;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v3, v4, "B");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v90;
  v92[2] = &unk_24F533EA0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v5, v6, "f");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = v89;
  v92[3] = &unk_24F533EB8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, v8, "d");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = v88;
  v92[4] = &unk_24F533ED0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v9, v10, "q");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v93[4] = v87;
  v92[5] = &unk_24F533EE8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v11, v12, "Q");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v93[5] = v86;
  v92[6] = &unk_24F533F00;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v13, v14, "Q");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v93[6] = v85;
  v92[7] = &unk_24F533F90;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v15, v16, "{CGSize=dd}");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v93[7] = v84;
  v92[8] = &unk_24F533FA8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v17, v18, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v93[8] = v83;
  v92[9] = &unk_24F533FC0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v19, v20, "{CGPoint=dd}");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v93[9] = v82;
  v92[10] = &unk_24F533FD8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v21, v22, "{CGVector=dd}");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v93[10] = v81;
  v92[11] = &unk_24F534128;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v23, v24, "{UIOffset=dd}");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v93[11] = v80;
  v92[12] = &unk_24F533FF0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v25, v26, "{CGAffineTransform=dddddd}");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v93[12] = v79;
  v92[13] = &unk_24F534008;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v27, v28, "{CATransform3D=dddddddddddddddd}");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v93[13] = v78;
  v92[14] = &unk_24F534020;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v29, v30, "{UIEdgeInsets=dddd}");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v93[14] = v77;
  v92[15] = &unk_24F534038;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v31, v32, "{NSDirectionalEdgeInsets=dddd}");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v93[15] = v76;
  v92[16] = &unk_24F534050;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v33, v34, "{_NSRange=QQ}");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v93[16] = v75;
  v92[17] = &unk_24F533F18;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v35, v36, "^v");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v93[17] = v74;
  v92[18] = &unk_24F534110;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v37, v38, "@");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v93[18] = v73;
  v92[19] = &unk_24F533F30;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v39, v40, "@");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v93[19] = v72;
  v92[20] = &unk_24F533F48;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v41, v42, "@");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v93[20] = v43;
  v92[21] = &unk_24F534098;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v44, v45, "@");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v93[21] = v46;
  v92[22] = &unk_24F5340B0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v47, v48, "@");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v93[22] = v49;
  v92[23] = &unk_24F5340C8;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v50, v51, "@?");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v93[23] = v52;
  v92[24] = &unk_24F533F60;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v53, v54, "@");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v93[24] = v55;
  v92[25] = &unk_24F533F78;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v56, v57, "@");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v93[25] = v58;
  v92[26] = &unk_24F534068;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v59, v60, "@");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v93[26] = v61;
  v92[27] = &unk_24F5340E0;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v62, v63, "^@");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v93[27] = v64;
  v92[28] = &unk_24F534080;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v65, v66, "@");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v93[28] = v67;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v68, v69, v93, v92, 29);
  v70 = objc_claimAutoreleasedReturnValue();
  v71 = (void *)qword_255B51D00;
  qword_255B51D00 = v70;

}

id sub_22AD781C8(uint64_t a1, double a2, double a3)
{
  id v5;
  const char *v6;

  v5 = objc_alloc(*(Class *)(a1 + 32));
  return (id)objc_msgSend_initWithVector_(v5, v6, a2, a3);
}

void sub_22AD78288(uint64_t a1)
{
  id v1;
  const char *v2;
  double v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___TMLJSNil;
  v1 = objc_msgSendSuper2(&v6, sel_allocWithZone_, 0);
  v4 = objc_msgSend_init(v1, v2, v3);
  v5 = (void *)qword_255B51D10;
  qword_255B51D10 = v4;

}

BOOL sub_22AD783E0(int a1, int a2, JSStringRef a)
{
  return !JSStringIsEqualToUTF8CString(a, "Symbol.toPrimitive");
}

uint64_t sub_22AD78404(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22AD7840C()
{
  return 1;
}

uint64_t sub_22AD78418(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22AD78420()
{
  return 0;
}

JSValueRef sub_22AD78428(const OpaqueJSContext *a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
      return JSValueMakeNull(a1);
    case 2:
      return JSValueMakeBoolean(a1, 0);
    case 3:
      return JSValueMakeNumber(a1, 0.0);
  }
  return JSValueMakeUndefined(a1);
}

void sub_22AD787A0(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_setWithObject_(MEMORY[0x24BDBCF20], a3, a1, CFSTR("dictionary"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255B51D28;
  qword_255B51D28 = v3;

}

void sub_22AD78B28(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  id v21;

  v21 = a3;
  objc_msgSend_setObject_forKeyedSubscript_(v21, v3, v4, &unk_24F504018, CFSTR("rgb"));
  objc_msgSend_setObject_forKeyedSubscript_(v21, v5, v6, &unk_24F504058, CFSTR("rgba"));
  objc_msgSend_setObject_forKeyedSubscript_(v21, v7, v8, &unk_24F504078, CFSTR("hsb"));
  objc_msgSend_setObject_forKeyedSubscript_(v21, v9, v10, &unk_24F504098, CFSTR("hsba"));
  objc_msgSend_setObject_forKeyedSubscript_(v21, v11, v12, &unk_24F5040B8, CFSTR("color"));
  objc_msgSend_setObject_forKeyedSubscript_(v21, v13, v14, &unk_24F5040F8, CFSTR("colorWithAlpha"));
  objc_msgSend_setObject_forKeyedSubscript_(v21, v15, v16, &unk_24F504118, CFSTR("colorWithWhite"));
  objc_msgSend_setObject_forKeyedSubscript_(v21, v17, v18, &unk_24F504138, CFSTR("invertedColor"));
  objc_msgSend_setObject_forKeyedSubscript_(v21, v19, v20, &unk_24F504178, CFSTR("dynamicColor"));

}

uint64_t sub_22AD78C20(double a1, double a2, double a3, uint64_t a4, const char *a5)
{
  return objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], a5, a1 / 255.0, a2 / 255.0, a3 / 255.0, 1.0);
}

uint64_t sub_22AD78C44(double a1, double a2, double a3, uint64_t a4, const char *a5)
{
  return objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], a5, a1 / 255.0, a2 / 255.0, a3 / 255.0);
}

uint64_t sub_22AD78C64(double a1)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDF6950], sel_colorWithHue_saturation_brightness_alpha_, a1 / 360.0);
}

uint64_t sub_22AD78C80(double a1)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDF6950], sel_colorWithHue_saturation_brightness_alpha_, a1 / 360.0);
}

id sub_22AD78C98(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;

  v2 = a2;
  sub_22AD791D8();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v4, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    sub_22AD78CFC(v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id sub_22AD78CFC(void *a1)
{
  id v1;
  const char *v2;
  double v3;
  const char *v4;
  double v5;
  id v6;
  const char *v7;
  double v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  const char *v12;
  id v13;
  const char *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3) == 4)
  {
    v6 = objc_retainAutorelease(v1);
    v9 = objc_msgSend_UTF8String(v6, v7, v8);
    v10 = strtol((const char *)(v9 + 1), 0, 16);
    LODWORD(v10) = ((v10 & 0xF00) << 12) & 0xFFF00FF0 | ((v10 >> 4) << 12) | (16 * v10) | v10 & 0xF;
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v11, (float)((float)BYTE2(v10) / 255.0), (float)((float)BYTE1(v10) / 255.0), (float)((float)v10 / 255.0), 1.0);
  }
  else
  {
    if (objc_msgSend_length(v1, v4, v5) == 7)
    {
      v13 = objc_retainAutorelease(v1);
      v16 = objc_msgSend_UTF8String(v13, v14, v15);
      v17 = strtol((const char *)(v16 + 1), 0, 16);
    }
    else
    {
      LODWORD(v17) = 0;
    }
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v12, (float)((float)BYTE2(v17) / 255.0), (float)((float)BYTE1(v17) / 255.0), (float)((float)v17 / 255.0), 1.0);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id sub_22AD78E04(double a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = a3;
  sub_22AD791D8();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    sub_22AD78CFC(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_colorWithAlphaComponent_(v8, v9, a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t sub_22AD78E8C(double a1)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDF6950], sel_colorWithWhite_alpha_, a1);
}

id sub_22AD78E98(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  void *v10;
  double v12;
  double v13;
  double v14;
  double v15;

  v2 = a2;
  sub_22AD791D8();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v4, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    sub_22AD78CFC(v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = 0.0;
  v15 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  objc_msgSend_getRed_green_blue_alpha_(v6, v7, v8, &v15, &v14, &v13, &v12);
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v9, 1.0 - v15, 1.0 - v14, 1.0 - v13, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id sub_22AD78F58(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  const char *v17;
  double v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;

  v4 = a2;
  v5 = a3;
  sub_22AD791D8();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    sub_22AD78CFC(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sub_22AD791D8();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    sub_22AD78CFC(v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)MEMORY[0x24BDF6950];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_22AD79084;
  v21[3] = &unk_24F5041A0;
  v22 = v13;
  v23 = v9;
  v15 = v9;
  v16 = v13;
  objc_msgSend_colorWithDynamicProvider_(v14, v17, v18, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id sub_22AD79084(uint64_t a1, void *a2, double a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend_userInterfaceStyle(a2, (const char *)a2, a3);
  v5 = 40;
  if (v4 == 2)
    v5 = 32;
  return *(id *)(a1 + v5);
}

uint64_t sub_22AD790BC(void *a1)
{
  id v1;
  const char *v2;
  double v3;

  v1 = objc_retainAutorelease(a1);
  return objc_msgSend_CGColor(v1, v2, v3);
}

id sub_22AD790D0(void *a1, const char *a2, double a3)
{
  void *v4;
  CGContext *CurrentContext;
  id v6;
  const char *v7;
  double v8;
  CGColor *v9;
  const char *v10;
  double v11;
  CGSize v13;
  CGRect v14;

  if (qword_255B51D40 != -1)
    dispatch_once(&qword_255B51D40, &unk_24F5041C0);
  objc_msgSend_objectForKey_((void *)qword_255B51D38, a2, a3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v13.width = 1.0;
    v13.height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v13, 1, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    v6 = objc_retainAutorelease(a1);
    v9 = (CGColor *)objc_msgSend_CGColor(v6, v7, v8);
    CGContextSetFillColorWithColor(CurrentContext, v9);
    v14.origin.x = 0.0;
    v14.origin.y = 0.0;
    v14.size.width = 1.0;
    v14.size.height = 1.0;
    CGContextFillRect(CurrentContext, v14);
    UIGraphicsGetImageFromCurrentImageContext();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend_setObject_forKey_((void *)qword_255B51D38, v10, v11, v4, v6);
  }
  return v4;
}

void sub_22AD791AC(double a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x24BDD1650], a3, a1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255B51D38;
  qword_255B51D38 = v3;

}

id sub_22AD791D8()
{
  if (qword_255B51D50 != -1)
    dispatch_once(&qword_255B51D50, &unk_24F5041E0);
  return (id)qword_255B51D48;
}

void sub_22AD79218(double a1, uint64_t a2, const char *a3)
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  const char *v104;
  const char *v105;
  const char *v106;
  const char *v107;
  const char *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  const char *v112;
  const char *v113;
  const char *v114;
  const char *v115;
  const char *v116;
  const char *v117;
  const char *v118;
  const char *v119;
  const char *v120;
  const char *v121;
  const char *v122;
  const char *v123;
  const char *v124;
  const char *v125;
  const char *v126;
  const char *v127;
  const char *v128;
  const char *v129;
  const char *v130;
  const char *v131;
  const char *v132;
  const char *v133;
  const char *v134;
  const char *v135;
  const char *v136;
  double v137;
  const char *v138;
  double v139;
  const char *v140;
  double v141;
  const char *v142;
  double v143;
  const char *v144;
  double v145;
  const char *v146;
  double v147;
  const char *v148;
  double v149;
  const char *v150;
  double v151;
  const char *v152;
  double v153;
  const char *v154;
  double v155;
  const char *v156;
  double v157;
  const char *v158;
  double v159;
  const char *v160;
  double v161;
  const char *v162;
  double v163;
  const char *v164;
  double v165;
  const char *v166;
  double v167;
  void *v168;
  const char *v169;
  double v170;
  void *v171;
  const char *v172;
  double v173;
  void *v174;
  const char *v175;
  double v176;
  void *v177;
  const char *v178;
  double v179;
  void *v180;
  const char *v181;
  double v182;
  void *v183;
  const char *v184;
  double v185;
  void *v186;
  const char *v187;
  double v188;
  void *v189;
  const char *v190;
  double v191;
  void *v192;
  const char *v193;
  double v194;
  const char *v195;
  double v196;
  const char *v197;
  double v198;
  const char *v199;
  double v200;
  const char *v201;
  double v202;
  const char *v203;
  double v204;
  const char *v205;
  double v206;
  const char *v207;
  double v208;
  const char *v209;
  double v210;
  const char *v211;
  double v212;
  const char *v213;
  double v214;
  const char *v215;
  double v216;
  const char *v217;
  double v218;
  const char *v219;
  double v220;
  const char *v221;
  double v222;
  const char *v223;
  double v224;
  const char *v225;
  double v226;
  const char *v227;
  double v228;
  const char *v229;
  double v230;
  void *v231;
  const char *v232;
  double v233;
  void *v234;
  const char *v235;
  double v236;
  void *v237;
  const char *v238;
  double v239;
  void *v240;
  const char *v241;
  double v242;
  void *v243;
  const char *v244;
  double v245;
  void *v246;
  const char *v247;
  double v248;
  void *v249;
  const char *v250;
  double v251;
  void *v252;
  const char *v253;
  double v254;
  void *v255;
  const char *v256;
  double v257;
  void *v258;
  const char *v259;
  double v260;
  const char *v261;
  double v262;
  uint64_t v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  _QWORD v431[26];
  _QWORD v432[26];
  _QWORD v433[156];
  _QWORD v434[158];

  v434[156] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a3, a1);
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  v433[0] = CFSTR("aliceblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v3, 0.941176474, 0.972549021, 1.0, 1.0);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  v434[0] = v400;
  v433[1] = CFSTR("antiquewhite");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v4, 0.980392158, 0.921568632);
  v398 = (void *)objc_claimAutoreleasedReturnValue();
  v434[1] = v398;
  v433[2] = CFSTR("aqua");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v5, 0.0, 1.0, 1.0, 1.0);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  v434[2] = v396;
  v433[3] = CFSTR("aquamarine");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v6, 0.498039216, 1.0, 0.831372559, 1.0);
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  v434[3] = v395;
  v433[4] = CFSTR("azure");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v7, 0.941176474, 1.0, 1.0, 1.0);
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  v434[4] = v394;
  v433[5] = CFSTR("beige");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v8, 0.960784316, 0.960784316, 0.862745106, 1.0);
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  v434[5] = v393;
  v433[6] = CFSTR("bisque");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v9, 1.0);
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v434[6] = v392;
  v433[7] = CFSTR("blanchedalmond");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v10, 1.0, 0.921568632);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  v434[7] = v391;
  v433[8] = CFSTR("blueviolet");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v11, 0.541176498, 0.168627456, 0.886274517, 1.0);
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  v434[8] = v390;
  v433[9] = CFSTR("burlywood");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v12, 0.870588243, 0.721568644);
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  v434[9] = v389;
  v433[10] = CFSTR("cadetblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v13, 0.372549027, 0.619607866);
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  v434[10] = v388;
  v433[11] = CFSTR("chartreuse");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v14, 0.498039216, 1.0, 0.0, 1.0);
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  v434[11] = v387;
  v433[12] = CFSTR("chocolate");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v15, 0.823529422, 0.411764711);
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  v434[12] = v386;
  v433[13] = CFSTR("coral");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v16, 1.0, 0.498039216, 0.313725501, 1.0);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  v434[13] = v385;
  v433[14] = CFSTR("cornflowerblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v17, 0.392156869, 0.58431375, 0.929411769, 1.0);
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  v434[14] = v384;
  v433[15] = CFSTR("cornsilk");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v18, 1.0, 0.972549021, 0.862745106, 1.0);
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  v434[15] = v383;
  v433[16] = CFSTR("crimson");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v19, 0.862745106, 0.0784313753);
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  v434[16] = v382;
  v433[17] = CFSTR("darkblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v20, 0.0, 0.0, 0.545098066, 1.0);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  v434[17] = v381;
  v433[18] = CFSTR("darkcyan");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v21, 0.0, 0.545098066, 0.545098066, 1.0);
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  v434[18] = v380;
  v433[19] = CFSTR("darkgoldenrod");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v22, 0.721568644, 0.525490224, 0.0431372561, 1.0);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  v434[19] = v379;
  v433[20] = CFSTR("darkgreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v23, 0.0, 0.392156869, 0.0, 1.0);
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  v434[20] = v378;
  v433[21] = CFSTR("darkgrey");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v24, 0.662745118, 0.662745118, 0.662745118, 1.0);
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  v434[21] = v377;
  v433[22] = CFSTR("darkkhaki");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v25, 0.741176486, 0.717647076, 0.419607848, 1.0);
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  v434[22] = v376;
  v433[23] = CFSTR("darkmagenta");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v26, 0.545098066, 0.0, 0.545098066, 1.0);
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  v434[23] = v375;
  v433[24] = CFSTR("darkolivegreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v27, 0.333333343, 0.419607848, 0.184313729, 1.0);
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  v434[24] = v374;
  v433[25] = CFSTR("darkorange");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v28, 1.0);
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  v434[25] = v373;
  v433[26] = CFSTR("darkorchid");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v29, 0.600000024);
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  v434[26] = v372;
  v433[27] = CFSTR("darkred");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v30, 0.545098066, 0.0, 0.0, 1.0);
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  v434[27] = v371;
  v433[28] = CFSTR("darksalmon");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v31, 0.913725495, 0.588235319);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  v434[28] = v370;
  v433[29] = CFSTR("darkseagreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v32, 0.56078434);
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  v434[29] = v369;
  v433[30] = CFSTR("darkslateblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v33, 0.282352954, 0.239215687, 0.545098066, 1.0);
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  v434[30] = v368;
  v433[31] = CFSTR("darkslategray");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v34, 0.184313729, 0.309803933, 0.309803933, 1.0);
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  v434[31] = v367;
  v433[32] = CFSTR("darkslategrey");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v35, 0.184313729, 0.309803933, 0.309803933, 1.0);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  v434[32] = v366;
  v433[33] = CFSTR("darkturquoise");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v36, 0.0);
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  v434[33] = v365;
  v433[34] = CFSTR("darkviolet");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v37, 0.580392182, 0.0);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  v434[34] = v364;
  v433[35] = CFSTR("deeppink");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v38, 1.0, 0.0784313753);
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  v434[35] = v363;
  v433[36] = CFSTR("deepskyblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v39, 0.0);
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  v434[36] = v362;
  v433[37] = CFSTR("dimgray");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v40, 0.411764711, 0.411764711, 0.411764711, 1.0);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  v434[37] = v361;
  v433[38] = CFSTR("dimgrey");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v41, 0.411764711, 0.411764711, 0.411764711, 1.0);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  v434[38] = v360;
  v433[39] = CFSTR("dodgerblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v42, 0.117647059);
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  v434[39] = v359;
  v433[40] = CFSTR("firebrick");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v43, 0.698039234, 0.13333334, 0.13333334, 1.0);
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  v434[40] = v358;
  v433[41] = CFSTR("floralwhite");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v44, 1.0, 0.980392158, 0.941176474, 1.0);
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  v434[41] = v357;
  v433[42] = CFSTR("forestgreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v45, 0.13333334, 0.545098066, 0.13333334, 1.0);
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  v434[42] = v356;
  v433[43] = CFSTR("fuchsia");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v46, 1.0, 0.0, 1.0, 1.0);
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  v434[43] = v355;
  v433[44] = CFSTR("gainsboro");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v47, 0.862745106, 0.862745106, 0.862745106, 1.0);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  v434[44] = v354;
  v433[45] = CFSTR("ghostwhite");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v48, 0.972549021, 0.972549021, 1.0, 1.0);
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  v434[45] = v353;
  v433[46] = CFSTR("gold");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v49, 1.0, 0.843137264, 0.0, 1.0);
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  v434[46] = v352;
  v433[47] = CFSTR("goldenrod");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v50, 0.854901969, 0.647058845);
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  v434[47] = v351;
  v433[48] = CFSTR("greenyellow");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v51, 0.678431392, 1.0, 0.184313729, 1.0);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  v434[48] = v350;
  v433[49] = CFSTR("grey");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v52, 0.501960814, 0.501960814, 0.501960814, 1.0);
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  v434[49] = v349;
  v433[50] = CFSTR("honeydew");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v53, 0.941176474, 1.0, 0.941176474, 1.0);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  v434[50] = v348;
  v433[51] = CFSTR("hotpink");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v54, 1.0, 0.411764711);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v434[51] = v347;
  v433[52] = CFSTR("indianred");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v55, 0.80392158, 0.360784322, 0.360784322, 1.0);
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  v434[52] = v346;
  v433[53] = CFSTR("indigo");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v56, 0.294117659, 0.0);
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  v434[53] = v345;
  v433[54] = CFSTR("ivory");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v57, 1.0, 1.0, 0.941176474, 1.0);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  v434[54] = v344;
  v433[55] = CFSTR("khaki");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v58, 0.941176474, 0.90196079, 0.549019635, 1.0);
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  v434[55] = v343;
  v433[56] = CFSTR("lavender");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v59, 0.90196079, 0.90196079, 0.980392158, 1.0);
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  v434[56] = v342;
  v433[57] = CFSTR("lavenderblush");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v60, 1.0, 0.941176474, 0.960784316, 1.0);
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  v434[57] = v341;
  v433[58] = CFSTR("lawngreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v61, 0.486274511, 0.988235295, 0.0, 1.0);
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  v434[58] = v340;
  v433[59] = CFSTR("lemonchiffon");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v62, 1.0, 0.980392158, 0.80392158, 1.0);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  v434[59] = v339;
  v433[60] = CFSTR("lightblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v63, 0.678431392);
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  v434[60] = v338;
  v433[61] = CFSTR("lightcoral");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v64, 0.941176474, 0.501960814, 0.501960814, 1.0);
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  v434[61] = v336;
  v433[62] = CFSTR("lightcyan");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v65, 0.87843138, 1.0, 1.0, 1.0);
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  v434[62] = v335;
  v433[63] = CFSTR("lightgoldenrodyellow");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v66, 0.980392158, 0.980392158, 0.823529422, 1.0);
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  v434[63] = v333;
  v433[64] = CFSTR("lightgreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v67, 0.564705908);
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  v434[64] = v332;
  v433[65] = CFSTR("lightgrey");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v68, 0.827450991, 0.827450991, 0.827450991, 1.0);
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  v434[65] = v331;
  v433[66] = CFSTR("lightpink");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v69, 1.0, 0.713725507, 0.75686276, 1.0);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  v434[66] = v330;
  v433[67] = CFSTR("lightsalmon");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v70, 1.0, 0.627451003, 0.478431374, 1.0);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  v434[67] = v329;
  v433[68] = CFSTR("lightseagreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v71, 0.125490203, 0.698039234, 0.666666687, 1.0);
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  v434[68] = v328;
  v433[69] = CFSTR("lightskyblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v72, 0.529411793, 0.807843149, 0.980392158, 1.0);
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  v434[69] = v327;
  v433[70] = CFSTR("lightslategray");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v73, 0.466666669, 0.533333361, 0.600000024, 1.0);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  v434[70] = v326;
  v433[71] = CFSTR("lightslategrey");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v74, 0.466666669, 0.533333361, 0.600000024, 1.0);
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  v434[71] = v325;
  v433[72] = CFSTR("lightsteelblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v75, 0.690196097, 0.768627465, 0.870588243, 1.0);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  v434[72] = v324;
  v433[73] = CFSTR("lightyellow");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v76, 1.0, 1.0, 0.87843138, 1.0);
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  v434[73] = v323;
  v433[74] = CFSTR("lime");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v77, 0.0, 1.0, 0.0, 1.0);
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v434[74] = v322;
  v433[75] = CFSTR("limegreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v78, 0.196078435, 0.80392158, 0.196078435, 1.0);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  v434[75] = v321;
  v433[76] = CFSTR("linen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v79, 0.980392158, 0.941176474, 0.90196079, 1.0);
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v434[76] = v320;
  v433[77] = CFSTR("maroon");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v80, 0.501960814, 0.0, 0.0, 1.0);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  v434[77] = v319;
  v433[78] = CFSTR("mediumaquamarine");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v81, 0.400000006, 0.80392158, 0.666666687, 1.0);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  v434[78] = v318;
  v433[79] = CFSTR("mediumblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v82, 0.0, 0.0, 0.80392158, 1.0);
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  v434[79] = v317;
  v433[80] = CFSTR("mediumorchid");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v83, 0.729411781, 0.333333343, 0.827450991, 1.0);
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v434[80] = v402;
  v433[81] = CFSTR("mediumpurple");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v84, 0.576470613, 0.43921569);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  v434[81] = v315;
  v433[82] = CFSTR("mediumseagreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v85, 0.235294119);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  v434[82] = v314;
  v433[83] = CFSTR("mediumslateblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v86, 0.482352942, 0.407843143, 0.933333337, 1.0);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  v434[83] = v312;
  v433[84] = CFSTR("mediumspringgreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v87, 0.0, 0.980392158);
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  v434[84] = v311;
  v433[85] = CFSTR("mediumturquoise");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v88, 0.282352954, 0.819607854, 0.800000012, 1.0);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v434[85] = v310;
  v433[86] = CFSTR("mediumvioletred");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v89, 0.78039217, 0.0823529437);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v434[86] = v309;
  v433[87] = CFSTR("midnightblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v90, 0.0980392173, 0.0980392173, 0.43921569, 1.0);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v434[87] = v308;
  v433[88] = CFSTR("mintcream");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v91, 0.960784316, 1.0, 0.980392158, 1.0);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  v434[88] = v305;
  v433[89] = CFSTR("mistyrose");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v92, 1.0, 0.894117653);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v434[89] = v304;
  v433[90] = CFSTR("moccasin");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v93, 1.0, 0.894117653, 0.709803939, 1.0);
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  v434[90] = v313;
  v433[91] = CFSTR("navajowhite");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v94, 1.0, 0.870588243, 0.678431392, 1.0);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v434[91] = v303;
  v433[92] = CFSTR("navy");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v95, 0.0, 0.0, 0.501960814, 1.0);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v434[92] = v302;
  v433[93] = CFSTR("oldlace");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v96, 0.992156863, 0.960784316, 0.90196079, 1.0);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v434[93] = v300;
  v433[94] = CFSTR("olive");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v97, 0.501960814, 0.501960814, 0.0, 1.0);
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v434[94] = v298;
  v433[95] = CFSTR("olivedrab");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v98, 0.419607848, 0.556862772, 0.137254909, 1.0);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  v434[95] = v299;
  v433[96] = CFSTR("orangered");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v99, 1.0, 0.270588249, 0.0, 1.0);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v434[96] = v296;
  v433[97] = CFSTR("orchid");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v100, 0.854901969, 0.43921569, 0.839215696, 1.0);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v434[97] = v294;
  v433[98] = CFSTR("palegoldenrod");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v101, 0.933333337, 0.909803927, 0.666666687, 1.0);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v434[98] = v292;
  v433[99] = CFSTR("palegreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v102, 0.596078455, 0.984313726, 0.596078455, 1.0);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v434[99] = v291;
  v433[100] = CFSTR("paleturquoise");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v103, 0.686274529, 0.933333337, 0.933333337, 1.0);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  v434[100] = v290;
  v433[101] = CFSTR("palevioletred");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v104, 0.858823538, 0.43921569, 0.576470613, 1.0);
  v414 = (void *)objc_claimAutoreleasedReturnValue();
  v434[101] = v414;
  v433[102] = CFSTR("papayawhip");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v105, 1.0, 0.937254906, 0.835294127, 1.0);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v434[102] = v289;
  v433[103] = CFSTR("peachpuff");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v106, 1.0, 0.854901969, 0.725490212, 1.0);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v434[103] = v288;
  v433[104] = CFSTR("peru");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v107, 0.80392158, 0.521568656, 0.247058824, 1.0);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v434[104] = v286;
  v433[105] = CFSTR("pink");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v108, 1.0, 0.752941191, 0.796078444, 1.0);
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v434[105] = v285;
  v433[106] = CFSTR("plum");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v109, 0.866666675, 0.627451003, 0.866666675, 1.0);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  v434[106] = v284;
  v433[107] = CFSTR("powderblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v110, 0.690196097, 0.87843138, 0.90196079, 1.0);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v434[107] = v283;
  v433[108] = CFSTR("rosybrown");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v111, 0.737254918, 0.56078434, 0.56078434, 1.0);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v434[108] = v307;
  v433[109] = CFSTR("royalblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v112, 0.254901975, 0.411764711, 0.882352948, 1.0);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  v434[109] = v306;
  v433[110] = CFSTR("saddlebrown");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v113, 0.545098066, 0.270588249, 0.0745098069, 1.0);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  v434[110] = v287;
  v433[111] = CFSTR("salmon");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v114, 0.980392158, 0.501960814, 0.447058827, 1.0);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v434[111] = v282;
  v433[112] = CFSTR("sandybrown");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v115, 0.956862748, 0.643137276, 0.376470596, 1.0);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  v434[112] = v279;
  v433[113] = CFSTR("seagreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v116, 0.180392161, 0.545098066, 0.34117648, 1.0);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  v434[113] = v295;
  v433[114] = CFSTR("seashell");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v117, 1.0, 0.960784316, 0.933333337, 1.0);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v434[114] = v278;
  v433[115] = CFSTR("sienna");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v118, 0.627451003, 0.321568638, 0.176470593, 1.0);
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  v434[115] = v418;
  v433[116] = CFSTR("silver");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v119, 0.752941191, 0.752941191, 0.752941191, 1.0);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v434[116] = v277;
  v433[117] = CFSTR("skyblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v120, 0.529411793, 0.807843149, 0.921568632, 1.0);
  v422 = (void *)objc_claimAutoreleasedReturnValue();
  v434[117] = v422;
  v433[118] = CFSTR("slateblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v121, 0.41568628, 0.352941185, 0.80392158, 1.0);
  v416 = (void *)objc_claimAutoreleasedReturnValue();
  v434[118] = v416;
  v433[119] = CFSTR("slategray");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v122, 0.43921569, 0.501960814, 0.564705908, 1.0);
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  v434[119] = v337;
  v433[120] = CFSTR("slategrey");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v123, 0.43921569, 0.501960814, 0.564705908, 1.0);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  v434[120] = v408;
  v433[121] = CFSTR("snow");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v124, 1.0, 0.980392158, 0.980392158, 1.0);
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  v434[121] = v404;
  v433[122] = CFSTR("springgreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v125, 0.0, 1.0, 0.498039216, 1.0);
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  v434[122] = v334;
  v433[123] = CFSTR("steelblue");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v126, 0.274509817, 0.509803951, 0.70588237, 1.0);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v434[123] = v276;
  v433[124] = CFSTR("tan");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v127, 0.823529422, 0.70588237, 0.549019635, 1.0);
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  v434[124] = v424;
  v433[125] = CFSTR("teal");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v128, 0.0, 0.501960814, 0.501960814, 1.0);
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  v434[125] = v420;
  v433[126] = CFSTR("thistle");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v129, 0.847058833, 0.749019623, 0.847058833, 1.0);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  v434[126] = v316;
  v433[127] = CFSTR("tomato");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v130, 1.0, 0.388235301, 0.278431386, 1.0);
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  v434[127] = v301;
  v433[128] = CFSTR("turquoise");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v131, 0.250980407, 0.87843138, 0.815686285, 1.0);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  v434[128] = v406;
  v433[129] = CFSTR("violet");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v132, 0.933333337, 0.509803951, 0.933333337, 1.0);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v434[129] = v297;
  v433[130] = CFSTR("wheat");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v133, 0.960784316, 0.870588243, 0.701960802, 1.0);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  v434[130] = v412;
  v433[131] = CFSTR("whitesmoke");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v134, 0.960784316, 0.960784316, 0.960784316, 1.0);
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  v434[131] = v429;
  v433[132] = CFSTR("yellowgreen");
  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v135, 0.603921592, 0.80392158, 0.196078435, 1.0);
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  v434[132] = v427;
  v433[133] = CFSTR("transparent");
  objc_msgSend_clearColor(MEMORY[0x24BDF6950], v136, v137);
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  v434[133] = v410;
  v433[134] = CFSTR("black");
  objc_msgSend_blackColor(MEMORY[0x24BDF6950], v138, v139);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  v434[134] = v293;
  v433[135] = CFSTR("darkGray");
  objc_msgSend_darkGrayColor(MEMORY[0x24BDF6950], v140, v141);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  v434[135] = v281;
  v433[136] = CFSTR("lightGray");
  objc_msgSend_lightGrayColor(MEMORY[0x24BDF6950], v142, v143);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v434[136] = v280;
  v433[137] = CFSTR("white");
  objc_msgSend_whiteColor(MEMORY[0x24BDF6950], v144, v145);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  v434[137] = v275;
  v433[138] = CFSTR("gray");
  objc_msgSend_grayColor(MEMORY[0x24BDF6950], v146, v147);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v434[138] = v274;
  v433[139] = CFSTR("red");
  objc_msgSend_redColor(MEMORY[0x24BDF6950], v148, v149);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v434[139] = v273;
  v433[140] = CFSTR("green");
  objc_msgSend_greenColor(MEMORY[0x24BDF6950], v150, v151);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  v434[140] = v272;
  v433[141] = CFSTR("blue");
  objc_msgSend_blueColor(MEMORY[0x24BDF6950], v152, v153);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v434[141] = v271;
  v433[142] = CFSTR("cyan");
  objc_msgSend_cyanColor(MEMORY[0x24BDF6950], v154, v155);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v434[142] = v270;
  v433[143] = CFSTR("yellow");
  objc_msgSend_yellowColor(MEMORY[0x24BDF6950], v156, v157);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v434[143] = v269;
  v433[144] = CFSTR("magenta");
  objc_msgSend_magentaColor(MEMORY[0x24BDF6950], v158, v159);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v434[144] = v268;
  v433[145] = CFSTR("orange");
  objc_msgSend_orangeColor(MEMORY[0x24BDF6950], v160, v161);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v434[145] = v267;
  v433[146] = CFSTR("purple");
  objc_msgSend_purpleColor(MEMORY[0x24BDF6950], v162, v163);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v434[146] = v266;
  v433[147] = CFSTR("brown");
  objc_msgSend_brownColor(MEMORY[0x24BDF6950], v164, v165);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v434[147] = v265;
  v433[148] = CFSTR("clear");
  objc_msgSend_clearColor(MEMORY[0x24BDF6950], v166, v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v434[148] = v168;
  v433[149] = CFSTR("systemBlue");
  objc_msgSend_systemBlueColor(MEMORY[0x24BDF6950], v169, v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v434[149] = v171;
  v433[150] = CFSTR("systemIndigo");
  objc_msgSend_systemIndigoColor(MEMORY[0x24BDF6950], v172, v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v434[150] = v174;
  v433[151] = CFSTR("systemGreen");
  objc_msgSend_systemGreenColor(MEMORY[0x24BDF6950], v175, v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v434[151] = v177;
  v433[152] = CFSTR("systemOrange");
  objc_msgSend_systemOrangeColor(MEMORY[0x24BDF6950], v178, v179);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v434[152] = v180;
  v433[153] = CFSTR("systemRed");
  objc_msgSend_systemRedColor(MEMORY[0x24BDF6950], v181, v182);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v434[153] = v183;
  v433[154] = CFSTR("systemTeal");
  objc_msgSend_systemTealColor(MEMORY[0x24BDF6950], v184, v185);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v434[154] = v186;
  v433[155] = CFSTR("systemGray");
  objc_msgSend_systemGrayColor(MEMORY[0x24BDF6950], v187, v188);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v434[155] = v189;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v190, v191, v434, v433, 156);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(v426, v193, v194, v192);

  v431[0] = CFSTR("label");
  objc_msgSend_labelColor(MEMORY[0x24BDF6950], v195, v196);
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  v432[0] = v430;
  v431[1] = CFSTR("secondaryLabel");
  objc_msgSend_secondaryLabelColor(MEMORY[0x24BDF6950], v197, v198);
  v428 = (void *)objc_claimAutoreleasedReturnValue();
  v432[1] = v428;
  v431[2] = CFSTR("tertiaryLabel");
  objc_msgSend_tertiaryLabelColor(MEMORY[0x24BDF6950], v199, v200);
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  v432[2] = v425;
  v431[3] = CFSTR("quaternaryLabel");
  objc_msgSend_quaternaryLabelColor(MEMORY[0x24BDF6950], v201, v202);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  v432[3] = v423;
  v431[4] = CFSTR("link");
  objc_msgSend_linkColor(MEMORY[0x24BDF6950], v203, v204);
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  v432[4] = v421;
  v431[5] = CFSTR("placeholderText");
  objc_msgSend_placeholderTextColor(MEMORY[0x24BDF6950], v205, v206);
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  v432[5] = v419;
  v431[6] = CFSTR("separator");
  objc_msgSend_separatorColor(MEMORY[0x24BDF6950], v207, v208);
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  v432[6] = v417;
  v431[7] = CFSTR("opaqueSeparator");
  objc_msgSend_opaqueSeparatorColor(MEMORY[0x24BDF6950], v209, v210);
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  v432[7] = v415;
  v431[8] = CFSTR("systemBackground");
  objc_msgSend_systemBackgroundColor(MEMORY[0x24BDF6950], v211, v212);
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  v432[8] = v413;
  v431[9] = CFSTR("secondarySystemBackground");
  objc_msgSend_secondarySystemBackgroundColor(MEMORY[0x24BDF6950], v213, v214);
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  v432[9] = v411;
  v431[10] = CFSTR("tertiarySystemBackground");
  objc_msgSend_tertiarySystemBackgroundColor(MEMORY[0x24BDF6950], v215, v216);
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  v432[10] = v409;
  v431[11] = CFSTR("systemGroupedBackground");
  objc_msgSend_systemGroupedBackgroundColor(MEMORY[0x24BDF6950], v217, v218);
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  v432[11] = v407;
  v431[12] = CFSTR("secondarySystemGroupedBackground");
  objc_msgSend_secondarySystemGroupedBackgroundColor(MEMORY[0x24BDF6950], v219, v220);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  v432[12] = v405;
  v431[13] = CFSTR("tertiarySystemGroupedBackground");
  objc_msgSend_tertiarySystemGroupedBackgroundColor(MEMORY[0x24BDF6950], v221, v222);
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  v432[13] = v403;
  v431[14] = CFSTR("lightText");
  objc_msgSend_lightTextColor(MEMORY[0x24BDF6950], v223, v224);
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  v432[14] = v401;
  v431[15] = CFSTR("darkText");
  objc_msgSend_darkTextColor(MEMORY[0x24BDF6950], v225, v226);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  v432[15] = v399;
  v431[16] = CFSTR("groupTableViewBackground");
  objc_msgSend_groupTableViewBackgroundColor(MEMORY[0x24BDF6950], v227, v228);
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v432[16] = v397;
  v431[17] = CFSTR("systemFill");
  objc_msgSend_systemFillColor(MEMORY[0x24BDF6950], v229, v230);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v432[17] = v231;
  v431[18] = CFSTR("secondarySystemFill");
  objc_msgSend_secondarySystemFillColor(MEMORY[0x24BDF6950], v232, v233);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v432[18] = v234;
  v431[19] = CFSTR("tertiarySystemFill");
  objc_msgSend_tertiarySystemFillColor(MEMORY[0x24BDF6950], v235, v236);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v432[19] = v237;
  v431[20] = CFSTR("quaternarySystemFill");
  objc_msgSend_quaternarySystemFillColor(MEMORY[0x24BDF6950], v238, v239);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v432[20] = v240;
  v431[21] = CFSTR("systemGray2");
  objc_msgSend_systemGray2Color(MEMORY[0x24BDF6950], v241, v242);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v432[21] = v243;
  v431[22] = CFSTR("systemGray3");
  objc_msgSend_systemGray3Color(MEMORY[0x24BDF6950], v244, v245);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v432[22] = v246;
  v431[23] = CFSTR("systemGray4");
  objc_msgSend_systemGray4Color(MEMORY[0x24BDF6950], v247, v248);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v432[23] = v249;
  v431[24] = CFSTR("systemGray5");
  objc_msgSend_systemGray5Color(MEMORY[0x24BDF6950], v250, v251);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v432[24] = v252;
  v431[25] = CFSTR("systemGray6");
  objc_msgSend_systemGray6Color(MEMORY[0x24BDF6950], v253, v254);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v432[25] = v255;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v256, v257, v432, v431, 26);
  v258 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addEntriesFromDictionary_(v426, v259, v260, v258);
  v263 = objc_msgSend_copy(v426, v261, v262);
  v264 = (void *)qword_255B51D48;
  qword_255B51D48 = v263;

}

void sub_22AD7BE28(void *a1, const char *a2, void *a3)
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  id v26;

  v5 = a3;
  v6 = a1;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_substringWithRange_(v7, v9, v10, 3, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_length(v7, v15, v16);
  objc_msgSend_substringWithRange_(v7, v18, v19, 4, v17 - 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v8, v21, v22, CFSTR("%@%@"), v14, v20);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  v23 = (void *)v6[1];
  objc_msgSend_setObject_forKey_(v23, v24, v25, v5, v26);

}

id sub_22AD7BF1C(void *a1, const char *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;

  v3 = a1;
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[1];

  objc_msgSend_objectForKey_(v5, v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_22AD7BF7C(void *a1, const char *a2, double a3, double a4)
{
  _QWORD *v7;
  void *v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  uint64_t v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  double v28;
  id v29;

  v7 = a1;
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_substringWithRange_(v8, v10, v11, 3, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_length(v8, v16, v17);
  objc_msgSend_substringWithRange_(v8, v19, v20, 4, v18 - 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v22, v23, CFSTR("%@%@"), v15, v21);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  v24 = (void *)v7[1];
  objc_msgSend_valueWithCGPoint_(MEMORY[0x24BDD1968], v25, a3, a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v24, v27, v28, v26, v29);

}

double sub_22AD7C088(uint64_t a1, SEL aSelector)
{
  void *v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  double v9;
  double v10;

  v2 = *(void **)(a1 + 8);
  NSStringFromSelector(aSelector);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v2, v4, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_CGPointValue(v6, v7, v8);
    v10 = v9;
  }
  else
  {
    v10 = *MEMORY[0x24BDBEFB0];
  }

  return v10;
}

void sub_22AD7C11C(void *a1, const char *a2, double a3, double a4)
{
  _QWORD *v7;
  void *v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  uint64_t v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  double v28;
  id v29;

  v7 = a1;
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_substringWithRange_(v8, v10, v11, 3, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_length(v8, v16, v17);
  objc_msgSend_substringWithRange_(v8, v19, v20, 4, v18 - 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v22, v23, CFSTR("%@%@"), v15, v21);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  v24 = (void *)v7[1];
  objc_msgSend_valueWithCGSize_(MEMORY[0x24BDD1968], v25, a3, a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v24, v27, v28, v26, v29);

}

double sub_22AD7C228(uint64_t a1, SEL aSelector)
{
  void *v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  double v9;
  double v10;

  v2 = *(void **)(a1 + 8);
  NSStringFromSelector(aSelector);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v2, v4, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_CGSizeValue(v6, v7, v8);
    v10 = v9;
  }
  else
  {
    v10 = *MEMORY[0x24BDBF148];
  }

  return v10;
}

void sub_22AD7C2BC(void *a1, const char *a2, double a3, double a4, double a5, double a6)
{
  _QWORD *v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  uint64_t v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  double v32;
  id v33;

  v11 = a1;
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_substringWithRange_(v12, v14, v15, 3, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_length(v12, v20, v21);
  objc_msgSend_substringWithRange_(v12, v23, v24, 4, v22 - 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v13, v26, v27, CFSTR("%@%@"), v19, v25);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  v28 = (void *)v11[1];
  objc_msgSend_valueWithCGRect_(MEMORY[0x24BDD1968], v29, a3, a4, a5, a6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v28, v31, v32, v30, v33);

}

double sub_22AD7C3E0(uint64_t a1, SEL aSelector)
{
  void *v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  double v9;
  double v10;

  v2 = *(void **)(a1 + 8);
  NSStringFromSelector(aSelector);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v2, v4, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_CGRectValue(v6, v7, v8);
    v10 = v9;
  }
  else
  {
    v10 = *MEMORY[0x24BDBF090];
  }

  return v10;
}

void sub_22AD7C490(void *a1, const char *a2, double a3)
{
  _QWORD *v5;
  void *v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  double v26;
  id v27;

  v5 = a1;
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_substringWithRange_(v6, v8, v9, 3, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_length(v6, v14, v15);
  objc_msgSend_substringWithRange_(v6, v17, v18, 4, v16 - 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v7, v20, v21, CFSTR("%@%@"), v13, v19);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  v22 = (void *)v5[1];
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v23, a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v22, v25, v26, v24, v27);

}

double sub_22AD7C594(uint64_t a1, SEL aSelector)
{
  void *v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  double v9;
  double v10;

  v2 = *(void **)(a1 + 8);
  NSStringFromSelector(aSelector);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v2, v4, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v9 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_doubleValue(v6, v7, v8);
    v9 = v10;
  }

  return v9;
}

void sub_22AD7C614(void *a1, const char *a2, uint64_t a3)
{
  _QWORD *v5;
  void *v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  id v28;

  v5 = a1;
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_substringWithRange_(v6, v8, v9, 3, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_length(v6, v14, v15);
  objc_msgSend_substringWithRange_(v6, v17, v18, 4, v16 - 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v7, v20, v21, CFSTR("%@%@"), v13, v19);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  v22 = (void *)v5[1];
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v23, v24, a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v22, v26, v27, v25, v28);

}

uint64_t sub_22AD7C718(uint64_t a1, SEL aSelector)
{
  void *v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 8);
  NSStringFromSelector(aSelector);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v2, v4, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = objc_msgSend_unsignedIntegerValue(v6, v7, v8);
  else
    v9 = 0;

  return v9;
}

uint64_t sub_22AD7C7A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  int v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  _BYTE *v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  unsigned __int8 *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  char *v32;
  int v33;
  int v34;
  char v35;
  uint64_t v36;
  int v37;
  int v38;
  size_t v39;
  char *v40;
  int v41;
  char *v42;
  int v43;
  ssize_t v44;
  unint64_t v45;
  int v46;
  unint64_t v47;
  size_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _BYTE *v83;
  uint64_t v84;
  size_t v85;
  char *v86;
  uint64_t v88;
  int v89;

  if (!*(_DWORD *)(a1 + 80))
  {
    *(_DWORD *)(a1 + 80) = 1;
    if (!*(_DWORD *)(a1 + 84))
      *(_DWORD *)(a1 + 84) = 1;
    if (!*(_QWORD *)(a1 + 8))
      *(_QWORD *)(a1 + 8) = *MEMORY[0x24BDAC8E0];
    if (!*(_QWORD *)(a1 + 16))
      *(_QWORD *)(a1 + 16) = *MEMORY[0x24BDAC8E8];
    v2 = *(_QWORD *)(a1 + 40);
    if (!v2 || (v3 = *(_QWORD *)(a1 + 24), (v4 = *(_QWORD *)(v2 + 8 * v3)) == 0))
    {
      sub_22AD7D5AC((_QWORD *)a1);
      v5 = sub_22AD7D64C(*(FILE **)(a1 + 8), 0x4000, a1);
      v3 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v3) = v5;
      v2 = *(_QWORD *)(a1 + 40);
      v4 = *(_QWORD *)(v2 + 8 * v3);
    }
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(v4 + 32);
    v6 = *(_BYTE **)(v4 + 16);
    *(_QWORD *)(a1 + 72) = v6;
    *(_QWORD *)(a1 + 136) = v6;
    *(_QWORD *)(a1 + 8) = **(_QWORD **)(v2 + 8 * v3);
    *(_BYTE *)(a1 + 48) = *v6;
  }
  v7 = *(_QWORD *)a1;
  v88 = *(_QWORD *)a1;
LABEL_13:
  *(_DWORD *)(a1 + 148) = 0;
  v8 = *(_BYTE **)(a1 + 72);
  if (*(_DWORD *)(a1 + 144))
  {
    v9 = (_DWORD)v8 - *(_DWORD *)(a1 + 136);
    *(_DWORD *)(a1 + 144) = 0;
    *(_DWORD *)(a1 + 148) = v9;
  }
  v10 = *(unsigned __int8 *)(a1 + 48);
  *v8 = v10;
  v11 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) + *(_DWORD *)(a1 + 84);
  v12 = v8;
LABEL_16:
  v13 = dword_22AD842FC[256 * (uint64_t)v11 + v10];
  if (v13 >= 1)
  {
    do
    {
      if (dword_22ADA3EFC[v13])
      {
        *(_DWORD *)(a1 + 112) = v13;
        *(_QWORD *)(a1 + 120) = v8;
      }
      v14 = *++v8;
      v13 = dword_22AD842FC[256 * (unint64_t)v13 + v14];
    }
    while (v13 > 0);
  }
  v15 = -v13;
LABEL_21:
  v16 = dword_22ADA3EFC[v15];
  v17 = &v12[-*(int *)(a1 + 148)];
  *(_QWORD *)(a1 + 136) = v17;
  *(_QWORD *)(a1 + 64) = v8 - v17;
  *(_BYTE *)(a1 + 48) = *v8;
  *v8 = 0;
  *(_QWORD *)(a1 + 72) = v8;
  if (v15 != 5 && ((0x29FEFFF5uLL >> v16) & 1) == 0)
  {
    v18 = *(int *)(a1 + 148);
    v19 = *(_QWORD *)(a1 + 64);
    v20 = v19 > v18;
    v21 = v19 - v18;
    if (v20)
    {
      v22 = (unsigned __int8 *)(*(_QWORD *)(a1 + 136) + v18);
      do
      {
        v23 = *v22++;
        if (v23 == 10)
        {
          v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24));
          *(_QWORD *)(v24 + 52) = (*(_DWORD *)(v24 + 52) + 1);
        }
        --v21;
      }
      while (v21);
    }
  }
  while (1)
  {
    switch(v16)
    {
      case 0:
        *v8 = *(_BYTE *)(a1 + 48);
        v8 = (_BYTE *)(*(_QWORD *)(a1 + 120) + 1);
        v15 = *(_DWORD *)(a1 + 112);
        goto LABEL_21;
      case 1:
        v57 = *(_QWORD *)(a1 + 64);
        if (v57)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v57 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_13;
      case 2:
        v58 = *(_QWORD *)(a1 + 64);
        if (v58)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v58 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 3:
        v59 = *(_QWORD *)(a1 + 64);
        if (v59)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v59 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 4:
        v60 = *(_QWORD *)(a1 + 64);
        if (v60)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v60 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 5:
        v61 = *(_QWORD *)(a1 + 64);
        if (v61)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v61 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 6:
        v62 = *(_QWORD *)(a1 + 64);
        if (v62)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v62 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 7:
        v63 = *(_QWORD *)(a1 + 64);
        if (v63)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v63 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 8:
        v64 = *(_QWORD *)(a1 + 64);
        if (v64)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v64 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 9:
        v65 = *(_QWORD *)(a1 + 64);
        if (v65)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v65 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 10:
        v66 = *(_QWORD *)(a1 + 64);
        if (v66)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v66 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 11:
        v67 = *(_QWORD *)(a1 + 64);
        if (v67)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v67 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 12:
        v68 = *(_QWORD *)(a1 + 64);
        if (v68)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v68 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 13:
        v69 = *(_QWORD *)(a1 + 64);
        if (v69)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v69 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 14:
        v70 = *(_QWORD *)(a1 + 64);
        if (v70)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v70 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 15:
        v71 = *(_QWORD *)(a1 + 64);
        if (v71)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v71 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 16:
        v72 = *(_QWORD *)(a1 + 64);
        if (v72)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v72 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 17:
        v73 = *(_QWORD *)(a1 + 64);
        if (v73)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v73 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 18:
        v74 = *(_QWORD *)(a1 + 64);
        if (v74)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v74 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 19:
        v75 = *(_QWORD *)(a1 + 64);
        if (v75)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v75 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 20:
        v76 = *(_QWORD *)(a1 + 64);
        if (v76)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v76 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 21:
        v77 = *(_QWORD *)(a1 + 64);
        if (v77)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v77 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 22:
        v78 = *(_QWORD *)(a1 + 64);
        if (v78)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v78 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 23:
        v79 = *(_QWORD *)(a1 + 64);
        if (v79)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v79 + *(_QWORD *)(a1 + 136) - 1) == 10;
        goto LABEL_138;
      case 24:
        v80 = *(_QWORD *)(a1 + 64);
        if (v80)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v80 + *(_QWORD *)(a1 + 136) - 1) == 10;
LABEL_138:
        if ((*(unsigned int (**)(uint64_t))(v7 + 16))(v7))
          return 0;
        goto LABEL_13;
      case 25:
        v81 = *(_QWORD *)(a1 + 64);
        if (v81)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v81 + *(_QWORD *)(a1 + 136) - 1) == 10;
        *(_DWORD *)(a1 + 84) = 3;
        goto LABEL_134;
      case 26:
        v82 = *(_QWORD *)(a1 + 64);
        if (v82)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v82 + *(_QWORD *)(a1 + 136) - 1) == 10;
        if ((*(unsigned int (**)(uint64_t))(v7 + 16))(v7))
          return 0;
        *(_DWORD *)(a1 + 84) = 1;
        goto LABEL_13;
      case 27:
        *v8 = *(_BYTE *)(a1 + 48);
        v83 = &v12[-*(int *)(a1 + 148)];
        *(_QWORD *)(a1 + 136) = v83;
        *(_QWORD *)(a1 + 64) = v8 - 1 - v83;
        *(_QWORD *)(a1 + 72) = v8 - 1;
        *(_BYTE *)(a1 + 48) = *(v8 - 1);
        *(v8 - 1) = 0;
        *(_QWORD *)(a1 + 72) = v8 - 1;
        goto LABEL_132;
      case 28:
LABEL_132:
        v84 = *(_QWORD *)(a1 + 64);
        if (v84)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = *(unsigned __int8 *)(v84 + *(_QWORD *)(a1 + 136) - 1) == 10;
LABEL_134:
        *(_DWORD *)(a1 + 144) = 1;
        goto LABEL_13;
      case 29:
        v85 = *(_QWORD *)(a1 + 64);
        v86 = *(char **)(a1 + 136);
        if (v85)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48) = v86[v85 - 1] == 10;
        fwrite(v86, v85, 1uLL, *(FILE **)(a1 + 16));
        goto LABEL_13;
      case 30:
        v25 = *(_QWORD *)(a1 + 136);
        *v8 = *(_BYTE *)(a1 + 48);
        v26 = *(_QWORD *)(a1 + 40);
        v27 = *(_QWORD *)(a1 + 24);
        v28 = *(_QWORD *)(v26 + 8 * v27);
        if (*(_DWORD *)(v28 + 64))
        {
          v29 = *(_QWORD *)(a1 + 56);
        }
        else
        {
          v29 = *(_QWORD *)(v28 + 32);
          *(_QWORD *)(a1 + 56) = v29;
          *(_QWORD *)v28 = *(_QWORD *)(a1 + 8);
          v28 = *(_QWORD *)(v26 + 8 * v27);
          *(_DWORD *)(v28 + 64) = 1;
        }
        v30 = *(_QWORD *)(a1 + 72);
        v31 = *(_BYTE **)(v28 + 8);
        if (v30 <= (unint64_t)&v31[v29])
        {
          *(_QWORD *)(a1 + 72) = *(_QWORD *)(a1 + 136) + ~(_DWORD)v25 + (int)v8;
          v15 = sub_22AD7D6D8(a1);
          v8 = *(_BYTE **)(a1 + 72);
          v11 = dword_22ADA40F8[v15];
          if (!v11)
            goto LABEL_72;
          if (dword_22ADA3EFC[v11])
          {
            *(_DWORD *)(a1 + 112) = v11;
            *(_QWORD *)(a1 + 120) = v8;
          }
          v12 = (_BYTE *)(*(_QWORD *)(a1 + 136) + *(int *)(a1 + 148));
          *(_QWORD *)(a1 + 72) = ++v8;
LABEL_74:
          v10 = *v8;
          goto LABEL_16;
        }
        if (v30 > (unint64_t)&v31[v29 + 1])
          sub_22AD7D764("fatal flex scanner internal error--end of buffer missed");
        v32 = *(char **)(a1 + 136);
        if (!*(_DWORD *)(v28 + 60))
        {
          v36 = *(int *)(a1 + 148);
          if (v30 - (_QWORD)&v32[v36] != 1)
            goto LABEL_69;
          goto LABEL_64;
        }
        v33 = ~(_DWORD)v32 + v30;
        if (v33 >= 1)
        {
          v34 = ~(_DWORD)v32 + v30;
          do
          {
            v35 = *v32++;
            *v31++ = v35;
            --v34;
          }
          while (v34);
          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24));
        }
        v89 = v25;
        if (*(_DWORD *)(v28 + 64) == 2)
        {
          *(_QWORD *)(a1 + 56) = 0;
          *(_QWORD *)(v28 + 32) = 0;
        }
        else
        {
          v37 = ~v33;
          v38 = *(_DWORD *)(v28 + 24);
          LODWORD(v39) = v38 + ~v33;
          if (!(_DWORD)v39)
          {
            v40 = *(char **)(a1 + 72);
            do
            {
              if (!*(_DWORD *)(v28 + 40))
              {
                *(_QWORD *)(v28 + 8) = 0;
LABEL_144:
                sub_22AD7D764("fatal error - scanner input buffer overflow");
              }
              v39 = *(_QWORD *)(v28 + 8);
              v41 = 2 * v38;
              *(_DWORD *)(v28 + 24) = v41;
              v42 = (char *)malloc_type_realloc((void *)v39, v41 + 2, 0x7C354E6CuLL);
              *(_QWORD *)(v28 + 8) = v42;
              if (!v42)
                goto LABEL_144;
              v40 = &v42[(int)v40 - (int)v39];
              *(_QWORD *)(a1 + 72) = v40;
              v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24));
              v38 = *(_DWORD *)(v28 + 24);
              LODWORD(v39) = v38 + v37;
            }
            while (!(v38 + v37));
            v7 = v88;
          }
          *__error() = 0;
          if (v39 >= 0x2000)
            v39 = 0x2000;
          else
            v39 = v39;
          v43 = fileno(*(FILE **)(a1 + 8));
          v44 = read(v43, (void *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 8) + v33), v39);
          v45 = (int)v44;
          *(_QWORD *)(a1 + 56) = (int)v44;
          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24));
          *(_QWORD *)(v28 + 32) = (int)v44;
          if (v44 << 32)
          {
            v46 = 0;
            goto LABEL_58;
          }
        }
        if (*(_DWORD *)(a1 + 148) == v33)
        {
          sub_22AD7D798(*(FILE **)(a1 + 8), a1);
          v45 = *(_QWORD *)(a1 + 56);
          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24));
          v46 = 1;
        }
        else
        {
          v45 = 0;
          v46 = 2;
          *(_DWORD *)(v28 + 64) = 2;
        }
LABEL_58:
        v47 = v45 + v33;
        if (v47 <= *(int *)(v28 + 24))
        {
          v53 = *(_QWORD *)(v28 + 8);
        }
        else
        {
          v48 = v47 + (v45 >> 1);
          v49 = malloc_type_realloc(*(void **)(v28 + 8), v48, 0x7C354E6CuLL);
          v50 = *(_QWORD *)(a1 + 40);
          v51 = *(_QWORD *)(a1 + 24);
          *(_QWORD *)(*(_QWORD *)(v50 + 8 * v51) + 8) = v49;
          v52 = *(_QWORD *)(v50 + 8 * v51);
          v53 = *(_QWORD *)(v52 + 8);
          if (!v53)
            sub_22AD7D764("out of dynamic memory in yy_get_next_buffer()");
          *(_DWORD *)(v52 + 24) = v48 - 2;
          v47 = *(_QWORD *)(a1 + 56) + v33;
        }
        *(_QWORD *)(a1 + 56) = v47;
        *(_BYTE *)(v53 + v47) = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 56)
                 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 8)
                 + 1) = 0;
        v54 = *(_QWORD *)(a1 + 40);
        v55 = *(_QWORD *)(a1 + 24);
        v32 = *(char **)(*(_QWORD *)(v54 + 8 * v55) + 8);
        *(_QWORD *)(a1 + 136) = v32;
        if (v46 != 1)
        {
          if (v46)
          {
            v31 = *(_BYTE **)(*(_QWORD *)(v54 + 8 * v55) + 8);
            v29 = *(_QWORD *)(a1 + 56);
LABEL_69:
            *(_QWORD *)(a1 + 72) = &v31[v29];
            v15 = sub_22AD7D6D8(a1);
            v8 = *(_BYTE **)(a1 + 72);
LABEL_72:
            v12 = (_BYTE *)(*(_QWORD *)(a1 + 136) + *(int *)(a1 + 148));
            goto LABEL_21;
          }
          *(_QWORD *)(a1 + 72) = &v32[~v89 + (int)v8];
          v11 = sub_22AD7D6D8(a1);
          v8 = *(_BYTE **)(a1 + 72);
          v12 = (_BYTE *)(*(_QWORD *)(a1 + 136) + *(int *)(a1 + 148));
          goto LABEL_74;
        }
        v36 = *(int *)(a1 + 148);
LABEL_64:
        *(_DWORD *)(a1 + 88) = 0;
        *(_QWORD *)(a1 + 72) = &v32[v36];
        v56 = *(_DWORD *)(a1 + 84);
        if (v56 >= 1)
          --v56;
        v16 = (v56 >> 1) + 31;
        break;
      case 31:
      case 32:
        return 0;
      default:
        sub_22AD7D764("fatal flex scanner internal error--no action found");
    }
  }
}

double sub_22AD7D5AC(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  double result;
  _QWORD *v8;

  v2 = (void *)a1[5];
  if (v2)
  {
    v3 = a1[4];
    if (a1[3] >= (unint64_t)(v3 - 1))
    {
      v4 = v3 + 8;
      v5 = (char *)malloc_type_realloc(v2, 8 * (v3 + 8), 0x7C354E6CuLL);
      a1[5] = v5;
      if (v5)
      {
        v6 = &v5[8 * a1[4]];
        result = 0.0;
        *((_OWORD *)v6 + 2) = 0u;
        *((_OWORD *)v6 + 3) = 0u;
        *(_OWORD *)v6 = 0u;
        *((_OWORD *)v6 + 1) = 0u;
        a1[4] = v4;
        return result;
      }
LABEL_8:
      sub_22AD7D764("out of dynamic memory in yyensure_buffer_stack()");
    }
  }
  else
  {
    v8 = malloc_type_malloc(8uLL, 0x28D39929uLL);
    a1[5] = v8;
    if (!v8)
      goto LABEL_8;
    *v8 = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 3) = xmmword_22ADA4300;
  }
  return result;
}

uint64_t sub_22AD7D64C(FILE *a1, int a2, uint64_t a3)
{
  _DWORD *v6;
  uint64_t v7;
  void *v8;

  v6 = malloc_type_malloc(0x48uLL, 0x28D39929uLL);
  if (!v6
    || (v7 = (uint64_t)v6, v6[6] = a2, v8 = malloc_type_malloc(a2 + 2, 0x28D39929uLL), (*(_QWORD *)(v7 + 8) = v8) == 0))
  {
    sub_22AD7D764("out of dynamic memory in yy_create_buffer()");
  }
  *(_DWORD *)(v7 + 40) = 1;
  sub_22AD7D844(v7, a1, a3);
  return v7;
}

uint64_t sub_22AD7D6D8(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  unint64_t i;
  char *v4;
  int *v5;

  v1 = (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) + 48)
                    + *(_DWORD *)(a1 + 84));
  v2 = (_BYTE *)(*(_QWORD *)(a1 + 136) + *(int *)(a1 + 148));
  for (i = *(_QWORD *)(a1 + 72); (unint64_t)v2 < i; ++v2)
  {
    v4 = (char *)&unk_22AD842FC + 1024 * (uint64_t)(int)v1 + 4 * *v2;
    v5 = (int *)((char *)&unk_22ADA40F8 + 4 * (int)v1);
    if (*v2)
      v5 = (int *)v4;
    v1 = *v5;
    if (dword_22ADA3EFC[v1])
    {
      *(_DWORD *)(a1 + 112) = v1;
      *(_QWORD *)(a1 + 120) = v2;
    }
  }
  return v1;
}

void sub_22AD7D764(const char *a1)
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", a1);
  exit(2);
}

int *sub_22AD7D798(FILE *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;

  v4 = *(_QWORD *)(a2 + 40);
  if (v4 && (v5 = *(_QWORD *)(a2 + 24), *(_QWORD *)(v4 + 8 * v5))
    || (sub_22AD7D5AC((_QWORD *)a2),
        v6 = sub_22AD7D64C(*(FILE **)(a2 + 8), 0x4000, a2),
        v5 = *(_QWORD *)(a2 + 24),
        *(_QWORD *)(*(_QWORD *)(a2 + 40) + 8 * v5) = v6,
        (v4 = *(_QWORD *)(a2 + 40)) != 0))
  {
    v7 = *(_QWORD *)(v4 + 8 * v5);
  }
  else
  {
    v7 = 0;
  }
  result = sub_22AD7D844(v7, a1, a2);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(_QWORD *)(v9 + 8 * v10);
  *(_QWORD *)(a2 + 56) = *(_QWORD *)(v11 + 32);
  v12 = *(_BYTE **)(v11 + 16);
  *(_QWORD *)(a2 + 72) = v12;
  *(_QWORD *)(a2 + 136) = v12;
  *(_QWORD *)(a2 + 8) = **(_QWORD **)(v9 + 8 * v10);
  *(_BYTE *)(a2 + 48) = *v12;
  return result;
}

int *sub_22AD7D844(uint64_t a1, FILE *a2, uint64_t a3)
{
  int v6;
  uint64_t v7;
  int v8;
  _BOOL4 v9;
  int *result;

  v6 = *__error();
  sub_22AD7D9FC(a1, a3);
  *(_QWORD *)a1 = a2;
  *(_DWORD *)(a1 + 60) = 1;
  v7 = *(_QWORD *)(a3 + 40);
  if (v7)
    v7 = *(_QWORD *)(v7 + 8 * *(_QWORD *)(a3 + 24));
  if (v7 != a1)
    *(_QWORD *)(a1 + 52) = 1;
  if (a2)
  {
    v8 = fileno(a2);
    v9 = isatty(v8) > 0;
  }
  else
  {
    v9 = 0;
  }
  *(_DWORD *)(a1 + 44) = v9;
  result = __error();
  *result = v6;
  return result;
}

void sub_22AD7D8E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;

  sub_22AD7D5AC((_QWORD *)a2);
  v4 = *(_QWORD *)(a2 + 40);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 24);
    v6 = *(_QWORD *)(v4 + 8 * v5);
    if (v6 != a1)
    {
      if (v6)
      {
        **(_BYTE **)(a2 + 72) = *(_BYTE *)(a2 + 48);
        v4 = *(_QWORD *)(a2 + 40);
        v5 = *(_QWORD *)(a2 + 24);
        *(_QWORD *)(*(_QWORD *)(v4 + 8 * v5) + 16) = *(_QWORD *)(a2 + 72);
        *(_QWORD *)(*(_QWORD *)(v4 + 8 * v5) + 32) = *(_QWORD *)(a2 + 56);
      }
      *(_QWORD *)(v4 + 8 * v5) = a1;
      v7 = *(_QWORD *)(a2 + 40);
      v8 = *(_QWORD *)(v7 + 8 * v5);
      *(_QWORD *)(a2 + 56) = *(_QWORD *)(v8 + 32);
      v9 = *(_BYTE **)(v8 + 16);
      *(_QWORD *)(a2 + 72) = v9;
      *(_QWORD *)(a2 + 136) = v9;
      *(_QWORD *)(a2 + 8) = **(_QWORD **)(v7 + 8 * v5);
      *(_BYTE *)(a2 + 48) = *v9;
      *(_DWORD *)(a2 + 88) = 1;
    }
  }
}

void *sub_22AD7D98C(size_t a1)
{
  return malloc_type_malloc(a1, 0x28D39929uLL);
}

void sub_22AD7D998(void **a1, uint64_t a2)
{
  uint64_t v3;
  void **v4;

  if (a1)
  {
    v3 = *(_QWORD *)(a2 + 40);
    if (v3)
      v4 = *(void ***)(v3 + 8 * *(_QWORD *)(a2 + 24));
    else
      v4 = 0;
    if (v4 == a1)
      *(_QWORD *)(v3 + 8 * *(_QWORD *)(a2 + 24)) = 0;
    if (*((_DWORD *)a1 + 10))
      free(a1[1]);
    free(a1);
  }
}

uint64_t sub_22AD7D9FC(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;

  if (result)
  {
    *(_QWORD *)(result + 32) = 0;
    **(_BYTE **)(result + 8) = 0;
    *(_BYTE *)(*(_QWORD *)(result + 8) + 1) = 0;
    *(_QWORD *)(result + 16) = *(_QWORD *)(result + 8);
    *(_DWORD *)(result + 48) = 1;
    *(_DWORD *)(result + 64) = 0;
    v2 = *(_QWORD *)(a2 + 40);
    if (v2)
      v3 = *(_QWORD *)(v2 + 8 * *(_QWORD *)(a2 + 24));
    else
      v3 = 0;
    if (v3 == result)
    {
      v4 = *(_QWORD *)(a2 + 24);
      v5 = *(_QWORD *)(v2 + 8 * v4);
      *(_QWORD *)(a2 + 56) = *(_QWORD *)(v5 + 32);
      v6 = *(_BYTE **)(v5 + 16);
      *(_QWORD *)(a2 + 72) = v6;
      *(_QWORD *)(a2 + 136) = v6;
      *(_QWORD *)(a2 + 8) = **(_QWORD **)(v2 + 8 * v4);
      *(_BYTE *)(a2 + 48) = *v6;
    }
  }
  return result;
}

void sub_22AD7DA80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;

  if (a1)
  {
    sub_22AD7D5AC((_QWORD *)a2);
    v4 = *(_QWORD *)(a2 + 40);
    v5 = *(_QWORD *)(a2 + 24);
    if (*(_QWORD *)(v4 + 8 * v5))
    {
      **(_BYTE **)(a2 + 72) = *(_BYTE *)(a2 + 48);
      v4 = *(_QWORD *)(a2 + 40);
      v6 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(*(_QWORD *)(v4 + 8 * v6) + 16) = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(*(_QWORD *)(v4 + 8 * v6) + 32) = *(_QWORD *)(a2 + 56);
      v5 = v6 + 1;
      *(_QWORD *)(a2 + 24) = v6 + 1;
    }
    *(_QWORD *)(v4 + 8 * v5) = a1;
    v7 = *(_QWORD *)(a2 + 40);
    v8 = *(_QWORD *)(v7 + 8 * v5);
    *(_QWORD *)(a2 + 56) = *(_QWORD *)(v8 + 32);
    v9 = *(_BYTE **)(v8 + 16);
    *(_QWORD *)(a2 + 72) = v9;
    *(_QWORD *)(a2 + 136) = v9;
    *(_QWORD *)(a2 + 8) = **(_QWORD **)(v7 + 8 * v5);
    *(_BYTE *)(a2 + 48) = *v9;
    *(_DWORD *)(a2 + 88) = 1;
  }
}

void sub_22AD7DB2C(uint64_t a1)
{
  uint64_t v1;
  void **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    v3 = *(void ***)(v1 + 8 * *(_QWORD *)(a1 + 24));
    if (v3)
    {
      sub_22AD7D998(v3, a1);
      v4 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = 0;
      if (v4)
        *(_QWORD *)(a1 + 24) = --v4;
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
      {
        v6 = *(_QWORD *)(v5 + 8 * v4);
        if (v6)
        {
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(v6 + 32);
          v7 = *(_BYTE **)(v6 + 16);
          *(_QWORD *)(a1 + 72) = v7;
          *(_QWORD *)(a1 + 136) = v7;
          *(_QWORD *)(a1 + 8) = **(_QWORD **)(v5 + 8 * v4);
          *(_BYTE *)(a1 + 48) = *v7;
          *(_DWORD *)(a1 + 88) = 1;
        }
      }
    }
  }
}

char *sub_22AD7DBBC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  char *v5;
  char *v8;

  v3 = a2 - 2;
  if (a2 < 2 || *(_BYTE *)(a1 + v3) || *(_BYTE *)(a2 + a1 - 1))
    return 0;
  v8 = (char *)malloc_type_malloc(0x48uLL, 0x28D39929uLL);
  if (!v8)
    sub_22AD7D764("out of dynamic memory in yy_scan_buffer()");
  v5 = v8;
  *((_DWORD *)v8 + 6) = v3;
  *((_QWORD *)v8 + 1) = a1;
  *((_QWORD *)v8 + 2) = a1;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 4) = (int)v3;
  *((_QWORD *)v8 + 5) = 0;
  *((_DWORD *)v8 + 12) = 1;
  *(_QWORD *)(v8 + 60) = 0;
  sub_22AD7D8E0((uint64_t)v8, a3);
  return v5;
}

char *sub_22AD7DC60(char *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = (int)strlen(a1);
  return sub_22AD7DC90(a1, v4, a2);
}

char *sub_22AD7DC90(char *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  char v10;
  char *result;

  v6 = a2 + 2;
  v7 = malloc_type_malloc(a2 + 2, 0x28D39929uLL);
  if (!v7)
    sub_22AD7D764("out of dynamic memory in yy_scan_bytes()");
  if (a2)
  {
    v8 = v7;
    v9 = a2;
    do
    {
      v10 = *a1++;
      *v8++ = v10;
      --v9;
    }
    while (v9);
  }
  *(_WORD *)&v7[a2] = 0;
  result = sub_22AD7DBBC((uint64_t)v7, v6, a3);
  if (!result)
    sub_22AD7D764("bad buffer in yy_scan_bytes()");
  *((_DWORD *)result + 10) = 1;
  return result;
}

uint64_t sub_22AD7DD24(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_22AD7DD2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1 && (v2 = *(_QWORD *)(v1 + 8 * *(_QWORD *)(a1 + 24))) != 0)
    return *(unsigned int *)(v2 + 52);
  else
    return 0;
}

uint64_t sub_22AD7DD50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1 && (v2 = *(_QWORD *)(v1 + 8 * *(_QWORD *)(a1 + 24))) != 0)
    return *(unsigned int *)(v2 + 56);
  else
    return 0;
}

uint64_t sub_22AD7DD74(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t sub_22AD7DD7C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t sub_22AD7DD84(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

uint64_t sub_22AD7DD8C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 136);
}

uint64_t sub_22AD7DD94(uint64_t result, _QWORD *a2)
{
  *a2 = result;
  return result;
}

uint64_t sub_22AD7DD9C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a2 + 40);
  if (!v2 || (v3 = *(_QWORD *)(v2 + 8 * *(_QWORD *)(a2 + 24))) == 0)
    sub_22AD7D764("yyset_lineno called with no buffer");
  *(_DWORD *)(v3 + 52) = result;
  return result;
}

uint64_t sub_22AD7DDD0(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a2 + 40);
  if (!v2 || (v3 = *(_QWORD *)(v2 + 8 * *(_QWORD *)(a2 + 24))) == 0)
    sub_22AD7D764("yyset_column called with no buffer");
  *(_DWORD *)(v3 + 56) = result;
  return result;
}

uint64_t sub_22AD7DE04(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 8) = result;
  return result;
}

uint64_t sub_22AD7DE0C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 16) = result;
  return result;
}

uint64_t sub_22AD7DE14(uint64_t a1)
{
  return *(unsigned int *)(a1 + 132);
}

uint64_t sub_22AD7DE1C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 132) = result;
  return result;
}

uint64_t sub_22AD7DE24(uint64_t *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  int *v6;
  int v7;

  if (a1)
  {
    v2 = malloc_type_malloc(0x98uLL, 0x28D39929uLL);
    *a1 = (uint64_t)v2;
    if (v2)
    {
      v3 = v2;
      result = 0;
      v3[18] = 0;
      *((_OWORD *)v3 + 7) = 0u;
      *((_OWORD *)v3 + 8) = 0u;
      *((_OWORD *)v3 + 5) = 0u;
      *((_OWORD *)v3 + 6) = 0u;
      *((_OWORD *)v3 + 3) = 0u;
      *((_OWORD *)v3 + 4) = 0u;
      *((_OWORD *)v3 + 1) = 0u;
      *((_OWORD *)v3 + 2) = 0u;
      *(_OWORD *)v3 = 0u;
      v5 = *a1;
      *(_DWORD *)(v5 + 92) = 0;
      *(_DWORD *)(v5 + 96) = 0;
      *(_QWORD *)(v5 + 104) = 0;
      *(_OWORD *)(v5 + 8) = 0u;
      *(_OWORD *)(v5 + 24) = 0u;
      *(_QWORD *)(v5 + 40) = 0;
      *(_QWORD *)(v5 + 72) = 0;
      *(_QWORD *)(v5 + 80) = 0;
      return result;
    }
    v6 = __error();
    v7 = 12;
  }
  else
  {
    v6 = __error();
    v7 = 22;
  }
  *v6 = v7;
  return 1;
}

uint64_t sub_22AD7DEBC(uint64_t a1, uint64_t *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t result;
  uint64_t v7;
  int *v8;
  int v9;

  if (a2)
  {
    v4 = malloc_type_malloc(0x98uLL, 0x28D39929uLL);
    *a2 = (uint64_t)v4;
    if (v4)
    {
      v5 = v4;
      result = 0;
      v5[18] = 0;
      *((_OWORD *)v5 + 7) = 0u;
      *((_OWORD *)v5 + 8) = 0u;
      *((_OWORD *)v5 + 5) = 0u;
      *((_OWORD *)v5 + 6) = 0u;
      *((_OWORD *)v5 + 3) = 0u;
      *((_OWORD *)v5 + 4) = 0u;
      *((_OWORD *)v5 + 1) = 0u;
      *((_OWORD *)v5 + 2) = 0u;
      *(_OWORD *)v5 = 0u;
      v7 = *a2;
      *(_QWORD *)v7 = a1;
      *(_DWORD *)(v7 + 92) = 0;
      *(_DWORD *)(v7 + 96) = 0;
      *(_QWORD *)(v7 + 104) = 0;
      *(_OWORD *)(v7 + 8) = 0u;
      *(_OWORD *)(v7 + 24) = 0u;
      *(_QWORD *)(v7 + 40) = 0;
      *(_QWORD *)(v7 + 72) = 0;
      *(_QWORD *)(v7 + 80) = 0;
      return result;
    }
    v8 = __error();
    v9 = 12;
  }
  else
  {
    v8 = __error();
    v9 = 22;
  }
  *v8 = v9;
  return 1;
}

uint64_t sub_22AD7DF5C(uint64_t a1)
{
  _QWORD *i;

  for (i = *(_QWORD **)(a1 + 40); i; i = *(_QWORD **)(a1 + 40))
  {
    if (!i[*(_QWORD *)(a1 + 24)])
      break;
    sub_22AD7D998((void **)i[*(_QWORD *)(a1 + 24)], a1);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * *(_QWORD *)(a1 + 24)) = 0;
    sub_22AD7DB2C(a1);
  }
  free(i);
  *(_QWORD *)(a1 + 40) = 0;
  free(*(void **)(a1 + 104));
  free((void *)a1);
  return 0;
}

void *sub_22AD7DFD0(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0x7C354E6CuLL);
}

uint64_t sub_22AD7DFDC(const char *a1, uint64_t a2)
{
  FILE *v3;
  FILE *v4;
  uint64_t v6;
  uint64_t v7;

  v7 = 0;
  v3 = fopen(a1, "r");
  if (!v3)
    return *__error();
  v4 = v3;
  if (sub_22AD7DEBC(a2, &v7))
    return 1;
  v6 = v7;
  *(_QWORD *)(v7 + 8) = v4;
  sub_22AD7C7A8(v6);
  sub_22AD7DF5C(v7);
  fclose(v4);
  return 0;
}

uint64_t sub_22AD7E05C(char *a1, uint64_t a2)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = 0;
  if (sub_22AD7DEBC(a2, &v9))
    return 1;
  v4 = strlen(a1);
  v5 = sub_22AD7DC90(a1, v4, v9);
  v6 = v9;
  v7 = *(_QWORD *)(v9 + 40);
  if (!v7 || (v8 = *(_QWORD *)(v7 + 8 * *(_QWORD *)(v9 + 24))) == 0)
    sub_22AD7D764("yyset_lineno called with no buffer");
  *(_DWORD *)(v8 + 52) = 0;
  sub_22AD7C7A8(v6);
  sub_22AD7D998((void **)v5, v9);
  sub_22AD7DF5C(v9);
  return 0;
}

void sub_22AD7E104()
{
  __assert_rtn("protobuf_c_message_get_packed_size", "protobuf-c.c", 643, "((message)->descriptor)->magic == PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC");
}

void sub_22AD7E12C()
{
  __assert_rtn("required_field_get_packed_size", "protobuf-c.c", 457, "0");
}

void sub_22AD7E154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22AD3A0A0("sizeof_elt_in_repeated_array", "protobuf-c.c", a3, "0");
}

void sub_22AD7E178()
{
  __assert_rtn("repeated_field_pack", "protobuf-c.c", 1328, "0");
}

void sub_22AD7E1A0()
{
  __assert_rtn("repeated_field_pack", "protobuf-c.c", 1334, "actual_length_size == length_size_min + 1");
}

void sub_22AD7E1C8()
{
  __assert_rtn("protobuf_c_message_pack", "protobuf-c.c", 1372, "((message)->descriptor)->magic == PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC");
}

void sub_22AD7E1F0()
{
  __assert_rtn("required_field_pack", "protobuf-c.c", 1051, "0");
}

void sub_22AD7E218()
{
  __assert_rtn("get_packed_payload_length", "protobuf-c.c", 1658, "0");
}

void sub_22AD7E240()
{
  __assert_rtn("pack_buffer_packed_payload", "protobuf-c.c", 1760, "0");
}

void sub_22AD7E268()
{
  __assert_rtn("repeated_field_pack_to_buffer", "protobuf-c.c", 1788, "tmp == payload_len");
}

void sub_22AD7E290()
{
  __assert_rtn("protobuf_c_message_pack_to_buffer", "protobuf-c.c", 1827, "((message)->descriptor)->magic == PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC");
}

void sub_22AD7E2B8()
{
  __assert_rtn("required_field_pack_to_buffer", "protobuf-c.c", 1525, "0");
}

void sub_22AD7E2E0()
{
  __assert_rtn("parse_member", "protobuf-c.c", 2764, "0");
}

void sub_22AD7E308()
{
  __assert_rtn("parse_packed_repeated_member", "protobuf-c.c", 2694, "0");
}

void sub_22AD7E330()
{
  __assert_rtn("protobuf_c_message_unpack", "protobuf-c.c", 3074, "rv->descriptor != NULL");
}

void sub_22AD7E358()
{
  __assert_rtn("protobuf_c_message_unpack", "protobuf-c.c", 2889, "(desc)->magic == PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC");
}

void sub_22AD7E380()
{
  __assert_rtn("protobuf_c_message_free_unpacked", "protobuf-c.c", 3161, "((message)->descriptor)->magic == PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC");
}

void sub_22AD7E3A8()
{
  __assert_rtn("protobuf_c_service_invoke_internal", "protobuf-c.c", 3339, "method_index < service->descriptor->n_methods");
}

void sub_22AD7E3D0()
{
  __assert_rtn("protobuf_c_service_generated_init", "protobuf-c.c", 3360, "(descriptor)->magic == PROTOBUF_C__SERVICE_DESCRIPTOR_MAGIC");
}

void sub_22AD7E3F8()
{
  __assert_rtn("tmlmodel__context__get_packed_size", "tmlmodel.pb-c.c", 19, "message->base.descriptor == &tmlmodel__context__descriptor");
}

void sub_22AD7E420()
{
  __assert_rtn("tmlmodel__context__pack", "tmlmodel.pb-c.c", 26, "message->base.descriptor == &tmlmodel__context__descriptor");
}

void sub_22AD7E448()
{
  __assert_rtn("tmlmodel__context__pack_to_buffer", "tmlmodel.pb-c.c", 33, "message->base.descriptor == &tmlmodel__context__descriptor");
}

void sub_22AD7E470()
{
  __assert_rtn("tmlmodel__context__free_unpacked", "tmlmodel.pb-c.c", 50, "message->base.descriptor == &tmlmodel__context__descriptor");
}

void sub_22AD7E498()
{
  __assert_rtn("tmlmodel__class_descriptor__get_packed_size", "tmlmodel.pb-c.c", 62, "message->base.descriptor == &tmlmodel__class_descriptor__descriptor");
}

void sub_22AD7E4C0()
{
  __assert_rtn("tmlmodel__class_descriptor__pack", "tmlmodel.pb-c.c", 69, "message->base.descriptor == &tmlmodel__class_descriptor__descriptor");
}

void sub_22AD7E4E8()
{
  __assert_rtn("tmlmodel__class_descriptor__pack_to_buffer", "tmlmodel.pb-c.c", 76, "message->base.descriptor == &tmlmodel__class_descriptor__descriptor");
}

void sub_22AD7E510()
{
  __assert_rtn("tmlmodel__class_descriptor__free_unpacked", "tmlmodel.pb-c.c", 93, "message->base.descriptor == &tmlmodel__class_descriptor__descriptor");
}

void sub_22AD7E538()
{
  __assert_rtn("tmlmodel__protocol_descriptor__get_packed_size", "tmlmodel.pb-c.c", 105, "message->base.descriptor == &tmlmodel__protocol_descriptor__descriptor");
}

void sub_22AD7E560()
{
  __assert_rtn("tmlmodel__protocol_descriptor__pack", "tmlmodel.pb-c.c", 112, "message->base.descriptor == &tmlmodel__protocol_descriptor__descriptor");
}

void sub_22AD7E588()
{
  __assert_rtn("tmlmodel__protocol_descriptor__pack_to_buffer", "tmlmodel.pb-c.c", 119, "message->base.descriptor == &tmlmodel__protocol_descriptor__descriptor");
}

void sub_22AD7E5B0()
{
  __assert_rtn("tmlmodel__protocol_descriptor__free_unpacked", "tmlmodel.pb-c.c", 136, "message->base.descriptor == &tmlmodel__protocol_descriptor__descriptor");
}

void sub_22AD7E5D8()
{
  __assert_rtn("tmlmodel__property_descriptor__get_packed_size", "tmlmodel.pb-c.c", 148, "message->base.descriptor == &tmlmodel__property_descriptor__descriptor");
}

void sub_22AD7E600()
{
  __assert_rtn("tmlmodel__property_descriptor__pack", "tmlmodel.pb-c.c", 155, "message->base.descriptor == &tmlmodel__property_descriptor__descriptor");
}

void sub_22AD7E628()
{
  __assert_rtn("tmlmodel__property_descriptor__pack_to_buffer", "tmlmodel.pb-c.c", 162, "message->base.descriptor == &tmlmodel__property_descriptor__descriptor");
}

void sub_22AD7E650()
{
  __assert_rtn("tmlmodel__property_descriptor__free_unpacked", "tmlmodel.pb-c.c", 179, "message->base.descriptor == &tmlmodel__property_descriptor__descriptor");
}

void sub_22AD7E678()
{
  __assert_rtn("tmlmodel__method_descriptor__get_packed_size", "tmlmodel.pb-c.c", 191, "message->base.descriptor == &tmlmodel__method_descriptor__descriptor");
}

void sub_22AD7E6A0()
{
  __assert_rtn("tmlmodel__method_descriptor__pack", "tmlmodel.pb-c.c", 198, "message->base.descriptor == &tmlmodel__method_descriptor__descriptor");
}

void sub_22AD7E6C8()
{
  __assert_rtn("tmlmodel__method_descriptor__pack_to_buffer", "tmlmodel.pb-c.c", 205, "message->base.descriptor == &tmlmodel__method_descriptor__descriptor");
}

void sub_22AD7E6F0()
{
  __assert_rtn("tmlmodel__method_descriptor__free_unpacked", "tmlmodel.pb-c.c", 222, "message->base.descriptor == &tmlmodel__method_descriptor__descriptor");
}

void sub_22AD7E718()
{
  __assert_rtn("tmlmodel__object__get_packed_size", "tmlmodel.pb-c.c", 240, "message->base.descriptor == &tmlmodel__object__descriptor");
}

void sub_22AD7E740()
{
  __assert_rtn("tmlmodel__object__pack", "tmlmodel.pb-c.c", 247, "message->base.descriptor == &tmlmodel__object__descriptor");
}

void sub_22AD7E768()
{
  __assert_rtn("tmlmodel__object__pack_to_buffer", "tmlmodel.pb-c.c", 254, "message->base.descriptor == &tmlmodel__object__descriptor");
}

void sub_22AD7E790()
{
  __assert_rtn("tmlmodel__object__free_unpacked", "tmlmodel.pb-c.c", 271, "message->base.descriptor == &tmlmodel__object__descriptor");
}

void sub_22AD7E7B8()
{
  __assert_rtn("tmlmodel__function__get_packed_size", "tmlmodel.pb-c.c", 283, "message->base.descriptor == &tmlmodel__function__descriptor");
}

void sub_22AD7E7E0()
{
  __assert_rtn("tmlmodel__function__pack", "tmlmodel.pb-c.c", 290, "message->base.descriptor == &tmlmodel__function__descriptor");
}

void sub_22AD7E808()
{
  __assert_rtn("tmlmodel__function__pack_to_buffer", "tmlmodel.pb-c.c", 297, "message->base.descriptor == &tmlmodel__function__descriptor");
}

void sub_22AD7E830()
{
  __assert_rtn("tmlmodel__function__free_unpacked", "tmlmodel.pb-c.c", 314, "message->base.descriptor == &tmlmodel__function__descriptor");
}

void sub_22AD7E858()
{
  __assert_rtn("tmlmodel__signal_function__get_packed_size", "tmlmodel.pb-c.c", 326, "message->base.descriptor == &tmlmodel__signal_function__descriptor");
}

void sub_22AD7E880()
{
  __assert_rtn("tmlmodel__signal_function__pack", "tmlmodel.pb-c.c", 333, "message->base.descriptor == &tmlmodel__signal_function__descriptor");
}

void sub_22AD7E8A8()
{
  __assert_rtn("tmlmodel__signal_function__pack_to_buffer", "tmlmodel.pb-c.c", 340, "message->base.descriptor == &tmlmodel__signal_function__descriptor");
}

void sub_22AD7E8D0()
{
  __assert_rtn("tmlmodel__signal_function__free_unpacked", "tmlmodel.pb-c.c", 357, "message->base.descriptor == &tmlmodel__signal_function__descriptor");
}

void sub_22AD7E8F8()
{
  __assert_rtn("tmlmodel__value_expression__get_packed_size", "tmlmodel.pb-c.c", 369, "message->base.descriptor == &tmlmodel__value_expression__descriptor");
}

void sub_22AD7E920()
{
  __assert_rtn("tmlmodel__value_expression__pack", "tmlmodel.pb-c.c", 376, "message->base.descriptor == &tmlmodel__value_expression__descriptor");
}

void sub_22AD7E948()
{
  __assert_rtn("tmlmodel__value_expression__pack_to_buffer", "tmlmodel.pb-c.c", 383, "message->base.descriptor == &tmlmodel__value_expression__descriptor");
}

void sub_22AD7E970()
{
  __assert_rtn("tmlmodel__value_expression__free_unpacked", "tmlmodel.pb-c.c", 400, "message->base.descriptor == &tmlmodel__value_expression__descriptor");
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x24BDE5578](retstr, a, b);
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDE5590](retstr, t);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x24BDE55A8](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x24BDE55C0](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D8](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55E8](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55F8](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE5600](retstr, t, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC398](data, *(_QWORD *)&len, md);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x24BDBC110](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x24BDBC730](string, range, transform, reverse);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x24BDBD8B0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x24BDBD8C8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x24BDBE2B0](font);
}

CGFontRef CGFontCreateWithDataProvider(CGDataProviderRef provider)
{
  return (CGFontRef)MEMORY[0x24BDBE2D8](provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x24BDBEE48](path, transform, *(_QWORD *)&lineCap, *(_QWORD *)&lineJoin, lineWidth, miterLimit);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x24BDBEFA8](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x24BDBFA08]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x24BDBFA10](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC0420](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x24BDC04F0](retstr, time, multiplier);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x24BDC0550](retstr, start, end);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x24BDC0580](retstr, start, duration);
}

BOOL CTFontManagerRegisterGraphicsFont(CGFontRef font, CFErrorRef *error)
{
  return MEMORY[0x24BDC49A0](font, error);
}

JSClassRef JSClassCreate(const JSClassDefinition *definition)
{
  return (JSClassRef)MEMORY[0x24BDDA530](definition);
}

void JSGarbageCollect(JSContextRef ctx)
{
  MEMORY[0x24BDDA558](ctx);
}

JSObjectRef JSObjectMake(JSContextRef ctx, JSClassRef jsClass, void *data)
{
  return (JSObjectRef)MEMORY[0x24BDDA5B8](ctx, jsClass, data);
}

BOOL JSStringIsEqualToUTF8CString(JSStringRef a, const char *b)
{
  return MEMORY[0x24BDDA668](a, b);
}

JSValueRef JSValueMakeBoolean(JSContextRef ctx, BOOL BOOLean)
{
  return (JSValueRef)MEMORY[0x24BDDA6C8](ctx, BOOLean);
}

JSValueRef JSValueMakeNull(JSContextRef ctx)
{
  return (JSValueRef)MEMORY[0x24BDDA6D8](ctx);
}

JSValueRef JSValueMakeNumber(JSContextRef ctx, double number)
{
  return (JSValueRef)MEMORY[0x24BDDA6E0](ctx, number);
}

JSValueRef JSValueMakeUndefined(JSContextRef ctx)
{
  return (JSValueRef)MEMORY[0x24BDDA6F0](ctx);
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  double v1;
  double v2;
  CLLocationCoordinate2D result;

  MEMORY[0x24BDDAF18]((__n128)mapPoint, *(__n128 *)&mapPoint.y);
  result.longitude = v2;
  result.latitude = v1;
  return result;
}

MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  MKCoordinateRegion result;

  MEMORY[0x24BDDAF20]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.span.longitudeDelta = v4;
  result.span.latitudeDelta = v3;
  result.center.longitude = v2;
  result.center.latitude = v1;
  return result;
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  double v3;
  double v4;
  double v5;
  double v6;
  MKCoordinateRegion result;

  MEMORY[0x24BDDAF28]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  double v1;
  double v2;
  MKMapPoint result;

  MEMORY[0x24BDDAF98]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  MKMapRect result;

  MEMORY[0x24BDDAFE8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CLLocationDistance MKMetersBetweenMapPoints(MKMapPoint a, MKMapPoint b)
{
  CLLocationDistance result;

  MEMORY[0x24BDDB000]((__n128)a, *(__n128 *)&a.y, (__n128)b, *(__n128 *)&b.y);
  return result;
}

CGFloat MKRoadWidthAtZoomScale(MKZoomScale zoomScale)
{
  CGFloat result;

  MEMORY[0x24BDDB008](zoomScale);
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x24BDD11B8](namestr);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BDF6668]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *__cdecl NSStringFromUIOffset(UIOffset offset)
{
  return (NSString *)MEMORY[0x24BDF6690]((__n128)offset, *(__n128 *)&offset.vertical);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD13D8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return MEMORY[0x24BDE8B98](key, *(_QWORD *)&padding, signedData, signedDataLen, sig, sigLen);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C28]();
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x24BDE8DC8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8DE0](trust, result);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x24BDF7228]();
}

id UIAccessibilityFocusedElement(UIAccessibilityAssistiveTechnologyIdentifier assistiveTechnologyIdentifier)
{
  return (id)MEMORY[0x24BDF7240](assistiveTechnologyIdentifier);
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x24BDF7268]();
}

BOOL UIAccessibilityIsClosedCaptioningEnabled(void)
{
  return MEMORY[0x24BDF7270]();
}

BOOL UIAccessibilityIsGuidedAccessEnabled(void)
{
  return MEMORY[0x24BDF7278]();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x24BDF7280]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BDF7288]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BDF7290]();
}

BOOL UIAccessibilityIsShakeToUndoEnabled(void)
{
  return MEMORY[0x24BDF7298]();
}

BOOL UIAccessibilityIsSpeakScreenEnabled(void)
{
  return MEMORY[0x24BDF72A0]();
}

BOOL UIAccessibilityIsSpeakSelectionEnabled(void)
{
  return MEMORY[0x24BDF72A8]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BDF72B0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BDF7698](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BDF7920](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x24BEDCE40](cls, name, imp, types);
}

BOOL class_addProperty(Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount)
{
  return MEMORY[0x24BEDCE50](cls, name, attributes, *(_QWORD *)&attributeCount);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x24BEDCE58](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x24BEDCE70](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x24BEDCE80](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCE90](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x24BEDCEA8](cls);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x24BEDCEB8](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x24BEDCEC8](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x24BEDCED0](cls);
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x24BEDCEE0](cls);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x24BEDCEE8](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x24BEDCF00](block);
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

char *__cdecl method_copyArgumentType(Method m, unsigned int index)
{
  return (char *)MEMORY[0x24BEDCF18](m, *(_QWORD *)&index);
}

char *__cdecl method_copyReturnType(Method m)
{
  return (char *)MEMORY[0x24BEDCF20](m);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x24BEDCF28](m1, m2);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x24BEDCF30](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x24BEDCF38](m);
}

unsigned int method_getNumberOfArguments(Method m)
{
  return MEMORY[0x24BEDCF40](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x24BEDCF50](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x24BEDCF90](superclass, name, extraBytes);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD0F0](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD110](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_registerClassPair(Class cls)
{
  MEMORY[0x24BEDD170](cls);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

void objc_removeAssociatedObjects(id object)
{
  MEMORY[0x24BEDD290](object);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

void *__cdecl object_getIndexedIvars(id a1)
{
  return (void *)MEMORY[0x24BEDD470](a1);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x24BEDD490](a1, a2);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x24BEDD4B0](property);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x24BEDD4E8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x24BEDD4F0](p);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

