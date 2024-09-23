void sub_2277DD370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

double _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv(uint64_t a1)
{
  double result;
  __int128 v3;

  if (!*(_BYTE *)(a1 + 72))
  {
    *(_QWORD *)&v3 = *(_QWORD *)(a1 + 16);
    *((_QWORD *)&v3 + 1) = a1 + 32;
    _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(a1, (uint64_t)&v3);
    result = *(double *)&v3;
    *(_OWORD *)(a1 + 56) = v3;
    *(_BYTE *)(a1 + 72) = 1;
  }
  return result;
}

void _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  void *v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 24);
  for (i = *(_QWORD *)a2; v2 != i; *(_QWORD *)a2 = i)
  {
    objc_msgSend(***(id ***)(a2 + 8), "objectAtIndexedSubscript:", (int)i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (*(uint64_t (**)(void))(a1 + 48))();

    if ((v7 & 1) != 0)
      break;
    i = *(_QWORD *)a2 + 1;
  }
}

void sub_2277DD688(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv(uint64_t a1)
{
  double result;
  __int128 v3;

  if (!*(_BYTE *)(a1 + 72))
  {
    *(_QWORD *)&v3 = *(_QWORD *)(a1 + 16);
    *((_QWORD *)&v3 + 1) = a1 + 32;
    _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(a1, (uint64_t)&v3);
    result = *(double *)&v3;
    *(_OWORD *)(a1 + 56) = v3;
    *(_BYTE *)(a1 + 72) = 1;
  }
  return result;
}

void _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  void *v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 24);
  for (i = *(_QWORD *)a2; v2 != i; *(_QWORD *)a2 = i)
  {
    objc_msgSend(***(id ***)(a2 + 8), "objectAtIndexedSubscript:", (int)i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (*(uint64_t (**)(void))(a1 + 48))();

    if ((v7 & 1) != 0)
      break;
    i = *(_QWORD *)a2 + 1;
  }
}

void sub_2277DD76C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ53__RFARSessionObserver_processUpdatedExternalAnchors__EUb2_E3__7EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv(uint64_t a1)
{
  double result;
  __int128 v3;

  if (!*(_BYTE *)(a1 + 72))
  {
    *(_QWORD *)&v3 = *(_QWORD *)(a1 + 16);
    *((_QWORD *)&v3 + 1) = a1 + 32;
    _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ53__RFARSessionObserver_processUpdatedExternalAnchors__EUb2_E3__7EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(a1, (uint64_t)&v3);
    result = *(double *)&v3;
    *(_OWORD *)(a1 + 56) = v3;
    *(_BYTE *)(a1 + 72) = 1;
  }
  return result;
}

void _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ53__RFARSessionObserver_processUpdatedExternalAnchors__EUb2_E3__7EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  void *v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 24);
  for (i = *(_QWORD *)a2; v2 != i; *(_QWORD *)a2 = i)
  {
    objc_msgSend(***(id ***)(a2 + 8), "objectAtIndexedSubscript:", (int)i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (*(uint64_t (**)(void))(a1 + 48))();

    if ((v7 & 1) != 0)
      break;
    i = *(_QWORD *)a2 + 1;
  }
}

void sub_2277DD850(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void *rf::AnchorDefinitionComponent::instance(rf::AnchorDefinitionComponent *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0
  {
    rf::AnchorDefinitionComponent::AnchorDefinitionComponent((rf::AnchorDefinitionComponent *)&rf::AnchorDefinitionComponent::instance(void)::instance);
  }
  return &rf::AnchorDefinitionComponent::instance(void)::instance;
}

void sub_2277DD8BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

rf::AnchorDefinitionComponent *rf::AnchorDefinitionComponent::AnchorDefinitionComponent(rf::AnchorDefinitionComponent *this)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 17) = 0;
  *((_QWORD *)this + 18) = 0;
  *((_DWORD *)this + 38) = 0;
  rf::AnchorDefinitionComponent::buildIntrospectionInfo((uint64_t)this);
  rf::AnchorDefinitionComponent::registerAnchorDefinitionComponent(this);
  return this;
}

void sub_2277DD940(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  v7 = v3;
  if ((_QWORD *)*v6 == v7)
  {
    v9 = v7;
    v10 = 4;
  }
  else
  {
    if (!*v6)
      goto LABEL_6;
    v10 = 5;
    v9 = (_QWORD *)*v6;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_6:
  v11 = (_QWORD *)v2[12];
  if (v11 == v5)
  {
    v12 = 4;
  }
  else
  {
    if (!v11)
      goto LABEL_11;
    v12 = 5;
    v5 = (_QWORD *)v2[12];
  }
  (*(void (**)(_QWORD *))(*v5 + 8 * v12))(v5);
LABEL_11:
  v13 = (_QWORD *)v2[8];
  if (v13 == v4)
  {
    v14 = 4;
  }
  else
  {
    if (!v13)
      goto LABEL_16;
    v14 = 5;
    v4 = (_QWORD *)v2[8];
  }
  (*(void (**)(_QWORD *))(*v4 + 8 * v14))(v4);
LABEL_16:
  v15 = (_QWORD *)v2[4];
  if (v15 == v1)
  {
    v16 = 4;
  }
  else
  {
    if (!v15)
      goto LABEL_21;
    v16 = 5;
    v1 = (_QWORD *)v2[4];
  }
  (*(void (**)(_QWORD *))(*v1 + 8 * v16))(v1);
LABEL_21:
  _Unwind_Resume(exception_object);
}

rf::AnchorDefinitionComponent *rf::AnchorDefinitionComponent::deinit(rf::AnchorDefinitionComponent *this)
{
  rf::AnchorDefinitionComponent *v2;
  uint64_t v3;
  rf::AnchorDefinitionComponent *v4;
  uint64_t v5;
  rf::AnchorDefinitionComponent *v6;
  uint64_t v7;
  rf::AnchorDefinitionComponent *result;
  uint64_t v9;

  *((_DWORD *)this + 38) = 0;
  if (*(_QWORD *)this)
  {
    RECustomComponentTypeDestroy();
    *(_QWORD *)this = 0;
  }
  if (*((_QWORD *)this + 17))
  {
    RECIntrospectionStructUnregister();
    *((_QWORD *)this + 17) = 0;
  }
  if (*((_QWORD *)this + 18))
  {
    RECIntrospectionEnumUnregister();
    *((_QWORD *)this + 18) = 0;
  }
  v2 = (rf::AnchorDefinitionComponent *)*((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v2 == (rf::AnchorDefinitionComponent *)((char *)this + 8))
  {
    v3 = 4;
    v2 = (rf::AnchorDefinitionComponent *)((char *)this + 8);
  }
  else
  {
    if (!v2)
      goto LABEL_12;
    v3 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v2 + 8 * v3))();
LABEL_12:
  v4 = (rf::AnchorDefinitionComponent *)*((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v4 == (rf::AnchorDefinitionComponent *)((char *)this + 40))
  {
    v5 = 4;
    v4 = (rf::AnchorDefinitionComponent *)((char *)this + 40);
  }
  else
  {
    if (!v4)
      goto LABEL_17;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_17:
  v6 = (rf::AnchorDefinitionComponent *)*((_QWORD *)this + 12);
  *((_QWORD *)this + 12) = 0;
  if (v6 == (rf::AnchorDefinitionComponent *)((char *)this + 72))
  {
    v7 = 4;
    v6 = (rf::AnchorDefinitionComponent *)((char *)this + 72);
  }
  else
  {
    if (!v6)
      goto LABEL_22;
    v7 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
LABEL_22:
  result = (rf::AnchorDefinitionComponent *)*((_QWORD *)this + 16);
  *((_QWORD *)this + 16) = 0;
  if (result == (rf::AnchorDefinitionComponent *)((char *)this + 104))
  {
    v9 = 4;
    result = (rf::AnchorDefinitionComponent *)((char *)this + 104);
  }
  else
  {
    if (!result)
      return result;
    v9 = 5;
  }
  return (rf::AnchorDefinitionComponent *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v9))();
}

uint64_t rf::AnchorDefinitionComponent::buildIntrospectionInfo(uint64_t this)
{
  uint64_t v1;

  v1 = this;
  if (!*(_QWORD *)(this + 144))
  {
    this = REEnumBuilderCreate();
    if (this)
    {
      if (REEnumBuilderInit())
      {
        REEnumBuilderAddCase();
        REEnumBuilderAddCase();
        REEnumBuilderAddCase();
        REEnumBuilderAddCase();
        REEnumBuilderAddCase();
        REEnumBuilderAddCase();
        REEnumBuilderAddCase();
        *(_QWORD *)(v1 + 144) = RECIntrospectionEnumRegister();
      }
      this = REEnumBuilderDestroy();
    }
  }
  if (!*(_QWORD *)(v1 + 136))
  {
    this = REStructBuilderCreate();
    if (this)
    {
      if (REStructBuilderInit())
      {
        REStructBuilderAddMemberCStyleArrayDataTypeWithTag();
        REStructBuilderAddMemberEnumWithTag();
        REStructBuilderAddMemberDataTypeWithTag();
        REStructBuilderAddMemberDataTypeWithTag();
        REStructBuilderAddMemberDataTypeWithTag();
        REStructBuilderAddMemberDataTypeWithTag();
        REStructBuilderAddMemberDataTypeWithTag();
        *(_QWORD *)(v1 + 136) = RECIntrospectionStructRegister();
      }
      return REStructBuilderDestroy();
    }
  }
  return this;
}

_QWORD *rf::AnchorDefinitionComponent::registerAnchorDefinitionComponent(_QWORD *this)
{
  _QWORD *v1;

  if (!*this)
  {
    v1 = this;
    this = (_QWORD *)RECustomComponentTypeCreate();
    *v1 = this;
  }
  return this;
}

double rf::AnchorDefinitionComponent::registerAnchorDefinitionComponent(void)::$_0::__invoke()
{
  uint64_t v0;
  double result;

  v0 = operator new();
  *(_DWORD *)(v0 + 16) = 0;
  *(_WORD *)(v0 + 20) = 0;
  result = 0.0;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)(v0 + 64) = 0;
  *(_BYTE *)(v0 + 72) = 1;
  return result;
}

void rf::AnchorDefinitionComponent::registerAnchorDefinitionComponent(void)::$_1::__invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    JUMPOUT(0x22E29DD50);
}

uint64_t rf::AnchorDefinitionComponent::registerAnchorDefinitionComponent(void)::$_2::__invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  RECustomComponentGetType();
  result = *(_QWORD *)(RECustomComponentTypeGetContext() + 32);
  if (result)
  {
    v3 = a1;
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)result + 48))(result, &v3);
  }
  return result;
}

uint64_t rf::AnchorDefinitionComponent::registerAnchorDefinitionComponent(void)::$_3::__invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  RECustomComponentGetType();
  result = *(_QWORD *)(RECustomComponentTypeGetContext() + 64);
  if (result)
  {
    v3 = a1;
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)result + 48))(result, &v3);
  }
  return result;
}

uint64_t rf::AnchorDefinitionComponent::registerAnchorDefinitionComponent(void)::$_4::__invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  RECustomComponentGetType();
  result = *(_QWORD *)(RECustomComponentTypeGetContext() + 96);
  if (result)
  {
    v3 = a1;
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)result + 48))(result, &v3);
  }
  return result;
}

uint64_t rf::AnchorDefinitionComponent::registerAnchorDefinitionComponent(void)::$_5::__invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  RECustomComponentGetType();
  result = *(_QWORD *)(RECustomComponentTypeGetContext() + 128);
  if (result)
  {
    v3 = a1;
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)result + 48))(result, &v3);
  }
  return result;
}

_DWORD *rf::data_flow::consumer::EnvironmentProbeVisualizer::drawEnvironmentProbe(_DWORD *result, float32x4_t *a2)
{
  _DWORD *v3;
  int v4;

  v3 = result;
  v4 = *result;
  if ((*result & 1) != 0)
  {
    result = (_DWORD *)rf::helpers::drawAxis();
    v4 = *v3;
  }
  if ((v4 & 2) != 0)
  {
    __asm { FMOV            V0.4S, #1.0 }
    return (_DWORD *)rf::helpers::drawBoundingBox(*((_QWORD *)v3 + 2), *((_QWORD *)v3 + 1), a2 + 2, a2[6].f32);
  }
  return result;
}

void RFPlacementComponentSetUp(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  rf::PlacementComponentTypeInfo *v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD *v23;
  _QWORD v24[3];
  _QWORD *v25;
  _QWORD v26[3];
  _QWORD *v27;
  _QWORD v28[3];
  _QWORD *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = rf::PlacementComponentTypeInfo::instance(v12);
  v28[0] = &off_24EFDA0A0;
  v28[1] = MEMORY[0x22E29E0BC](v9);
  v29 = v28;
  v26[0] = &off_24EFDA130;
  v26[1] = MEMORY[0x22E29E0BC](v10);
  v27 = v26;
  v24[0] = &off_24EFDA1C0;
  v24[1] = MEMORY[0x22E29E0BC](v11);
  v25 = v24;
  v22[0] = &off_24EFDA240;
  v22[1] = MEMORY[0x22E29E0BC](v12);
  v23 = v22;
  rf::PlacementComponentTypeInfo::initWithType(v13, a1, (uint64_t)v28, (uint64_t)v26, (uint64_t)v24, (uint64_t)v22);
  v14 = v23;
  if (v23 == v22)
  {
    v15 = 4;
    v14 = v22;
  }
  else
  {
    if (!v23)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_6:
  v16 = v25;
  if (v25 == v24)
  {
    v17 = 4;
    v16 = v24;
  }
  else
  {
    if (!v25)
      goto LABEL_11;
    v17 = 5;
  }
  (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_11:
  v18 = v27;
  if (v27 == v26)
  {
    v19 = 4;
    v18 = v26;
  }
  else
  {
    if (!v27)
      goto LABEL_16;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_16:
  v20 = v29;
  if (v29 == v28)
  {
    v21 = 4;
    v20 = v28;
    goto LABEL_20;
  }
  if (v29)
  {
    v21 = 5;
LABEL_20:
    (*(void (**)(void))(*v20 + 8 * v21))();
  }

}

void sub_2277DE198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20,char *a21,char a22,uint64_t a23,uint64_t a24,char *a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char *v29;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;

  v31 = a13;
  if (a13 == v29)
  {
    v32 = 4;
    v31 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v32 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v31 + 8 * v32))();
LABEL_6:
  v33 = a17;
  if (a17 == &a14)
  {
    v34 = 4;
    v33 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v34 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v33 + 8 * v34))();
LABEL_11:
  v35 = a21;
  if (a21 == &a18)
  {
    v36 = 4;
    v35 = &a18;
  }
  else
  {
    if (!a21)
      goto LABEL_16;
    v36 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v35 + 8 * v36))();
LABEL_16:
  v37 = a25;
  if (a25 == &a22)
  {
    v38 = 4;
    v37 = &a22;
  }
  else
  {
    if (!a25)
      goto LABEL_21;
    v38 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v37 + 8 * v38))();
LABEL_21:

  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_0,std::allocator<RFPlacementComponentSetUp::$_0>,unsigned char const* ()(REComponent *)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<RFPlacementComponentSetUp::$_0,std::allocator<RFPlacementComponentSetUp::$_0>,unsigned char const* ()(REComponent *)>::~__func(uint64_t a1)
{

  JUMPOUT(0x22E29DD50);
}

_QWORD *std::__function::__func<RFPlacementComponentSetUp::$_0,std::allocator<RFPlacementComponentSetUp::$_0>,unsigned char const* ()(REComponent *)>::__clone(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_24EFDA0A0;
  v2[1] = MEMORY[0x22E29E0BC](*(_QWORD *)(a1 + 8));
  return v2;
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_0,std::allocator<RFPlacementComponentSetUp::$_0>,unsigned char const* ()(REComponent *)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  *a2 = &off_24EFDA0A0;
  result = MEMORY[0x22E29E0BC](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

void std::__function::__func<RFPlacementComponentSetUp::$_0,std::allocator<RFPlacementComponentSetUp::$_0>,unsigned char const* ()(REComponent *)>::destroy(uint64_t a1)
{

}

void std::__function::__func<RFPlacementComponentSetUp::$_0,std::allocator<RFPlacementComponentSetUp::$_0>,unsigned char const* ()(REComponent *)>::destroy_deallocate(id *a1)
{

  operator delete(a1);
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_0,std::allocator<RFPlacementComponentSetUp::$_0>,unsigned char const* ()(REComponent *)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_0,std::allocator<RFPlacementComponentSetUp::$_0>,unsigned char const* ()(REComponent *)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<RFPlacementComponentSetUp::$_0,std::allocator<RFPlacementComponentSetUp::$_0>,unsigned char const* ()(REComponent *)>::target_type()
{
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_1,std::allocator<RFPlacementComponentSetUp::$_1>,BOOL ()(REComponent *)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<RFPlacementComponentSetUp::$_1,std::allocator<RFPlacementComponentSetUp::$_1>,BOOL ()(REComponent *)>::~__func(uint64_t a1)
{

  JUMPOUT(0x22E29DD50);
}

_QWORD *std::__function::__func<RFPlacementComponentSetUp::$_1,std::allocator<RFPlacementComponentSetUp::$_1>,BOOL ()(REComponent *)>::__clone(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_24EFDA130;
  v2[1] = MEMORY[0x22E29E0BC](*(_QWORD *)(a1 + 8));
  return v2;
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_1,std::allocator<RFPlacementComponentSetUp::$_1>,BOOL ()(REComponent *)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  *a2 = &off_24EFDA130;
  result = MEMORY[0x22E29E0BC](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

void std::__function::__func<RFPlacementComponentSetUp::$_1,std::allocator<RFPlacementComponentSetUp::$_1>,BOOL ()(REComponent *)>::destroy(uint64_t a1)
{

}

void std::__function::__func<RFPlacementComponentSetUp::$_1,std::allocator<RFPlacementComponentSetUp::$_1>,BOOL ()(REComponent *)>::destroy_deallocate(id *a1)
{

  operator delete(a1);
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_1,std::allocator<RFPlacementComponentSetUp::$_1>,BOOL ()(REComponent *)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_1,std::allocator<RFPlacementComponentSetUp::$_1>,BOOL ()(REComponent *)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<RFPlacementComponentSetUp::$_1,std::allocator<RFPlacementComponentSetUp::$_1>,BOOL ()(REComponent *)>::target_type()
{
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_2,std::allocator<RFPlacementComponentSetUp::$_2>,void ()(REComponent *)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<RFPlacementComponentSetUp::$_2,std::allocator<RFPlacementComponentSetUp::$_2>,void ()(REComponent *)>::~__func(uint64_t a1)
{

  JUMPOUT(0x22E29DD50);
}

_QWORD *std::__function::__func<RFPlacementComponentSetUp::$_2,std::allocator<RFPlacementComponentSetUp::$_2>,void ()(REComponent *)>::__clone(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_24EFDA1C0;
  v2[1] = MEMORY[0x22E29E0BC](*(_QWORD *)(a1 + 8));
  return v2;
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_2,std::allocator<RFPlacementComponentSetUp::$_2>,void ()(REComponent *)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  *a2 = &off_24EFDA1C0;
  result = MEMORY[0x22E29E0BC](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

void std::__function::__func<RFPlacementComponentSetUp::$_2,std::allocator<RFPlacementComponentSetUp::$_2>,void ()(REComponent *)>::destroy(uint64_t a1)
{

}

void std::__function::__func<RFPlacementComponentSetUp::$_2,std::allocator<RFPlacementComponentSetUp::$_2>,void ()(REComponent *)>::destroy_deallocate(id *a1)
{

  operator delete(a1);
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_2,std::allocator<RFPlacementComponentSetUp::$_2>,void ()(REComponent *)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_2,std::allocator<RFPlacementComponentSetUp::$_2>,void ()(REComponent *)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<RFPlacementComponentSetUp::$_2,std::allocator<RFPlacementComponentSetUp::$_2>,void ()(REComponent *)>::target_type()
{
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_3,std::allocator<RFPlacementComponentSetUp::$_3>,RESRT ()(REComponent *)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<RFPlacementComponentSetUp::$_3,std::allocator<RFPlacementComponentSetUp::$_3>,RESRT ()(REComponent *)>::~__func(uint64_t a1)
{

  JUMPOUT(0x22E29DD50);
}

_QWORD *std::__function::__func<RFPlacementComponentSetUp::$_3,std::allocator<RFPlacementComponentSetUp::$_3>,RESRT ()(REComponent *)>::__clone(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_24EFDA240;
  v2[1] = MEMORY[0x22E29E0BC](*(_QWORD *)(a1 + 8));
  return v2;
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_3,std::allocator<RFPlacementComponentSetUp::$_3>,RESRT ()(REComponent *)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  *a2 = &off_24EFDA240;
  result = MEMORY[0x22E29E0BC](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

void std::__function::__func<RFPlacementComponentSetUp::$_3,std::allocator<RFPlacementComponentSetUp::$_3>,RESRT ()(REComponent *)>::destroy(uint64_t a1)
{

}

void std::__function::__func<RFPlacementComponentSetUp::$_3,std::allocator<RFPlacementComponentSetUp::$_3>,RESRT ()(REComponent *)>::destroy_deallocate(id *a1)
{

  operator delete(a1);
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_3,std::allocator<RFPlacementComponentSetUp::$_3>,RESRT ()(REComponent *)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

uint64_t std::__function::__func<RFPlacementComponentSetUp::$_3,std::allocator<RFPlacementComponentSetUp::$_3>,RESRT ()(REComponent *)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<RFPlacementComponentSetUp::$_3,std::allocator<RFPlacementComponentSetUp::$_3>,RESRT ()(REComponent *)>::target_type()
{
}

void rf::detail::insertRoomBoundaryAnchorsInto(uint64_t *a1@<X0>, uint64_t *a2@<X1>, char **a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  rf *v7;
  NSObject *v8;
  _BOOL4 v9;
  void **v10;
  NSObject *v11;
  const char *v12;
  void **v13;
  unint64_t v14;
  char *v15;
  __int128 v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  __int128 v24;
  char *v25;
  char *v26;
  __int128 v27;
  char *v28;
  uint64_t v29;
  _OWORD *v30;
  int v31;
  __int128 v32;
  uint64_t v33;
  _QWORD *v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *__p[2];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char v49;
  id v50[52];
  char v51;
  id v52[52];
  char v53;
  id v54[52];
  char v55;
  _BYTE buf[24];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = *a2;
  v5 = a2[1];
  if (*a2 != v5)
  {
    do
    {
      v7 = (rf *)std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>((_QWORD *)(*a1 + 208), v4);
      rf::realityFusionLogObject(v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v4, __p);
          v10 = __p;
          if (SBYTE7(v42) < 0)
            v10 = (void **)__p[0];
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v10;
          v11 = v8;
          v12 = "ARState: Adding Room Anchor Again %s";
LABEL_11:
          _os_log_impl(&dword_227777000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
          if (SBYTE7(v42) < 0)
            operator delete(__p[0]);
        }
      }
      else if (v9)
      {
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v4, __p);
        v13 = __p;
        if (SBYTE7(v42) < 0)
          v13 = (void **)__p[0];
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v13;
        v11 = v8;
        v12 = "ARState: Adding Room Anchor %s";
        goto LABEL_11;
      }

      v15 = a3[1];
      v14 = (unint64_t)a3[2];
      if ((unint64_t)v15 >= v14)
      {
        v18 = *a3;
        v19 = (v15 - *a3) >> 5;
        v20 = v19 + 1;
        if ((unint64_t)(v19 + 1) >> 59)
          std::vector<int>::__throw_length_error[abi:ne180100]();
        v21 = v14 - (_QWORD)v18;
        if (v21 >> 4 > v20)
          v20 = v21 >> 4;
        if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFE0)
          v22 = 0x7FFFFFFFFFFFFFFLL;
        else
          v22 = v20;
        if (v22)
        {
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::RFUUID>>((uint64_t)(a3 + 2), v22);
          v18 = *a3;
          v15 = a3[1];
        }
        else
        {
          v23 = 0;
        }
        v24 = *(_OWORD *)(v4 + 16);
        v25 = &v23[32 * v19];
        *(_OWORD *)v25 = *(_OWORD *)v4;
        *((_OWORD *)v25 + 1) = v24;
        if (v15 == v18)
        {
          v28 = &v23[32 * v19];
        }
        else
        {
          v26 = &v23[32 * v19];
          do
          {
            v27 = *((_OWORD *)v15 - 1);
            v28 = v26 - 32;
            *((_OWORD *)v26 - 2) = *((_OWORD *)v15 - 2);
            *((_OWORD *)v26 - 1) = v27;
            v15 -= 32;
            v26 -= 32;
          }
          while (v15 != v18);
        }
        v17 = v25 + 32;
        *a3 = v28;
        a3[1] = v25 + 32;
        a3[2] = &v23[32 * v22];
        if (v18)
          operator delete(v18);
      }
      else
      {
        v16 = *(_OWORD *)(v4 + 16);
        *(_OWORD *)v15 = *(_OWORD *)v4;
        *((_OWORD *)v15 + 1) = v16;
        v17 = v15 + 32;
      }
      a3[1] = v17;
      if (*(_BYTE *)(v4 + 128))
      {
        v29 = *a1;
        v30 = (_OWORD *)(*a1 + 248);
        v31 = *(unsigned __int8 *)(*a1 + 280);
        v32 = *(_OWORD *)(v4 + 16);
        *v30 = *(_OWORD *)v4;
        v30[1] = v32;
        if (!v31)
          *(_BYTE *)(v29 + 280) = 1;
      }
      rf::detail::createRoomBoundary((uint64_t)__p, v4);
      v33 = *a1 + 208;
      *(_QWORD *)buf = v4;
      v34 = std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>>>::__emplace_unique_key_args<rf::data_flow::RFUUID,std::piecewise_construct_t const&,std::tuple<rf::data_flow::RFUUID const&>,std::tuple<>>(v33, v4, (int32x4_t **)buf);
      v35 = v49;
      v36 = v48;
      *((_OWORD *)v34 + 9) = v47;
      *((_OWORD *)v34 + 10) = v36;
      v38 = v45;
      v37 = v46;
      v39 = v44;
      *((_OWORD *)v34 + 5) = v43;
      *((_OWORD *)v34 + 6) = v39;
      *((_BYTE *)v34 + 176) = v35;
      *((_OWORD *)v34 + 7) = v38;
      *((_OWORD *)v34 + 8) = v37;
      v40 = v42;
      *((_OWORD *)v34 + 3) = *(_OWORD *)__p;
      *((_OWORD *)v34 + 4) = v40;
      std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(v34 + 24), (uint64_t)v50);
      std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(v34 + 78), (uint64_t)v52);
      std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(v34 + 132), (uint64_t)v54);
      if (v55)
        rf::data_flow::consumer::Mesh::~Mesh(v54);
      if (v53)
        rf::data_flow::consumer::Mesh::~Mesh(v52);
      if (v51)
        rf::data_flow::consumer::Mesh::~Mesh(v50);
      v4 += 1200;
    }
    while (v4 != v5);
  }
}

void sub_2277DEB40(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  void *v4;

  v4 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(a1);
}

void rf::detail::createRoomBoundary(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id v9[52];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  uuid_clear((unsigned __int8 *)a1);
  *(_BYTE *)(a1 + 144) = 0;
  *(_BYTE *)(a1 + 560) = 0;
  *(_BYTE *)(a1 + 576) = 0;
  *(_BYTE *)(a1 + 992) = 0;
  *(_BYTE *)(a1 + 1008) = 0;
  *(_BYTE *)(a1 + 1424) = 0;
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  v7 = *(_OWORD *)(a2 + 96);
  v8 = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v7;
  *(_OWORD *)(a1 + 112) = v8;
  rf::detail::createMeshFromInput(v9, a2 + 144);
  std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(a1 + 144), (uint64_t)v9);
  if (v10)
    rf::data_flow::consumer::Mesh::~Mesh(v9);
  rf::detail::createMeshFromInput(v9, a2 + 496);
  std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(a1 + 576), (uint64_t)v9);
  if (v10)
    rf::data_flow::consumer::Mesh::~Mesh(v9);
  rf::detail::createMeshFromInput(v9, a2 + 848);
  std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(a1 + 1008), (uint64_t)v9);
  if (v10)
    rf::data_flow::consumer::Mesh::~Mesh(v9);
}

void sub_2277DECB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  id *v61;

  if (a61)
    rf::data_flow::consumer::Mesh::~Mesh((id *)&a9);
  rf::data_flow::consumer::RoomBoundary::~RoomBoundary(v61);
  _Unwind_Resume(a1);
}

void rf::data_flow::consumer::RoomBoundary::~RoomBoundary(id *this)
{
  if (*((_BYTE *)this + 1424))
    rf::data_flow::consumer::Mesh::~Mesh(this + 126);
  if (*((_BYTE *)this + 992))
    rf::data_flow::consumer::Mesh::~Mesh(this + 72);
  if (*((_BYTE *)this + 560))
    rf::data_flow::consumer::Mesh::~Mesh(this + 18);
}

void rf::detail::updateRoomBoundarysAt(uint64_t *a1@<X0>, uint64_t *a2@<X1>, char **a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  char *v8;
  __int128 v9;
  char *v10;
  NSObject *v11;
  void **v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  __int128 v19;
  char *v20;
  char *v21;
  __int128 v22;
  char *v23;
  uint64_t v24;
  _OWORD *v25;
  int v26;
  __int128 v27;
  uint64_t v28;
  _QWORD *v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *__p[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  char v44;
  id v45[52];
  char v46;
  id v47[52];
  char v48;
  id v49[52];
  char v50;
  _BYTE buf[12];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = *a2;
  v5 = a2[1];
  if (*a2 != v5)
  {
    do
    {
      if (std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>((_QWORD *)(*a1 + 208), v4))
      {
        v8 = a3[1];
        v7 = (unint64_t)a3[2];
        if ((unint64_t)v8 >= v7)
        {
          v13 = *a3;
          v14 = (v8 - *a3) >> 5;
          v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 59)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v16 = v7 - (_QWORD)v13;
          if (v16 >> 4 > v15)
            v15 = v16 >> 4;
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFE0)
            v17 = 0x7FFFFFFFFFFFFFFLL;
          else
            v17 = v15;
          if (v17)
          {
            v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::RFUUID>>((uint64_t)(a3 + 2), v17);
            v13 = *a3;
            v8 = a3[1];
          }
          else
          {
            v18 = 0;
          }
          v19 = *(_OWORD *)(v4 + 16);
          v20 = &v18[32 * v14];
          *(_OWORD *)v20 = *(_OWORD *)v4;
          *((_OWORD *)v20 + 1) = v19;
          if (v8 == v13)
          {
            v23 = &v18[32 * v14];
          }
          else
          {
            v21 = &v18[32 * v14];
            do
            {
              v22 = *((_OWORD *)v8 - 1);
              v23 = v21 - 32;
              *((_OWORD *)v21 - 2) = *((_OWORD *)v8 - 2);
              *((_OWORD *)v21 - 1) = v22;
              v8 -= 32;
              v21 -= 32;
            }
            while (v8 != v13);
          }
          v10 = v20 + 32;
          *a3 = v23;
          a3[1] = v20 + 32;
          a3[2] = &v18[32 * v17];
          if (v13)
            operator delete(v13);
        }
        else
        {
          v9 = *(_OWORD *)(v4 + 16);
          *(_OWORD *)v8 = *(_OWORD *)v4;
          *((_OWORD *)v8 + 1) = v9;
          v10 = v8 + 32;
        }
        a3[1] = v10;
        if (*(_BYTE *)(v4 + 128))
        {
          v24 = *a1;
          v25 = (_OWORD *)(*a1 + 248);
          v26 = *(unsigned __int8 *)(*a1 + 280);
          v27 = *(_OWORD *)(v4 + 16);
          *v25 = *(_OWORD *)v4;
          v25[1] = v27;
          if (!v26)
            *(_BYTE *)(v24 + 280) = 1;
        }
        rf::detail::createRoomBoundary((uint64_t)__p, v4);
        v28 = *a1 + 208;
        *(_QWORD *)buf = v4;
        v29 = std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>>>::__emplace_unique_key_args<rf::data_flow::RFUUID,std::piecewise_construct_t const&,std::tuple<rf::data_flow::RFUUID const&>,std::tuple<>>(v28, v4, (int32x4_t **)buf);
        v30 = v44;
        v31 = v43;
        *((_OWORD *)v29 + 9) = v42;
        *((_OWORD *)v29 + 10) = v31;
        v33 = v40;
        v32 = v41;
        v34 = v39;
        *((_OWORD *)v29 + 5) = v38;
        *((_OWORD *)v29 + 6) = v34;
        *((_BYTE *)v29 + 176) = v30;
        *((_OWORD *)v29 + 7) = v33;
        *((_OWORD *)v29 + 8) = v32;
        v35 = v37;
        *((_OWORD *)v29 + 3) = *(_OWORD *)__p;
        *((_OWORD *)v29 + 4) = v35;
        std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(v29 + 24), (uint64_t)v45);
        std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(v29 + 78), (uint64_t)v47);
        std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(v29 + 132), (uint64_t)v49);
        if (v50)
          rf::data_flow::consumer::Mesh::~Mesh(v49);
        if (v48)
          rf::data_flow::consumer::Mesh::~Mesh(v47);
        if (v46)
          rf::data_flow::consumer::Mesh::~Mesh(v45);
      }
      else
      {
        rf::realityFusionLogObject(0);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v4, __p);
          v12 = __p;
          if (SBYTE7(v37) < 0)
            v12 = (void **)__p[0];
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v12;
          _os_log_impl(&dword_227777000, v11, OS_LOG_TYPE_DEFAULT, "ARState: Updating Room Anchor %s that doesn't exist in ARState.", buf, 0xCu);
          if (SBYTE7(v37) < 0)
            operator delete(__p[0]);
        }

      }
      v4 += 1200;
    }
    while (v4 != v5);
  }
}

void sub_2277DF034(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  void *v4;

  v4 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(a1);
}

void rf::detail::removeRoomBoundaryAnchorsFrom(int8x8_t **a1@<X0>, rf::data_flow::RFUUID **a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3;
  uint64_t v4;
  rf::data_flow::RFUUID *v5;
  int8x8_t **v6;
  rf *v7;
  rf *v8;
  NSObject *v9;
  void *p_p;
  unint64_t v11;
  _OWORD *v12;
  unint64_t v13;
  uint8x8_t v14;
  unint64_t v15;
  uint64_t **v16;
  uint64_t *v17;
  unint64_t v18;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  float v27;
  float v28;
  _BOOL8 v29;
  unint64_t v30;
  unint64_t v31;
  size_t v32;
  void **v33;
  unint64_t v34;
  int8x8_t *v35;
  const unsigned __int8 *v36;
  const unsigned __int8 *v37;
  int v38;
  int8x8_t v39;
  unint64_t v40;
  uint8x8_t v41;
  int8x8_t v42;
  rf *v43;
  rf *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD *v55;
  uint64_t v58;
  rf::data_flow::RFUUID *v59;
  uint64_t v60;
  void *__p;
  int8x8_t *v62;
  char v63;
  char v64;
  uint8_t buf[4];
  void *v66;
  uint64_t v67;

  v4 = a3;
  v67 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(a3 + 32) = 1065353216;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v5 = *a2;
  v59 = a2[1];
  v60 = a3 + 32;
  if (*a2 != v59)
  {
    v6 = a1;
    v58 = a3 + 16;
    do
    {
      v7 = (rf *)std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>>>::find<rf::data_flow::RFUUID>(&(*v6)[26], (uint64_t)v5);
      v8 = v7;
      if (v7)
      {
        rf::realityFusionLogObject(v7);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          rf::data_flow::RFUUID::string(v5, &__p);
          p_p = &__p;
          if (v64 < 0)
            p_p = __p;
          *(_DWORD *)buf = 136315138;
          v66 = p_p;
          _os_log_impl(&dword_227777000, v9, OS_LOG_TYPE_DEFAULT, "ARState: Removing Room Anchors %s", buf, 0xCu);
          if (v64 < 0)
            operator delete(__p);
        }

        v11 = *((_QWORD *)v8 + 5);
        if (!v11)
        {
          if (*((_BYTE *)v8 + 32))
            v55 = (_QWORD *)*((_QWORD *)v8 + 2);
          else
            v55 = (_QWORD *)((char *)v8 + 16);
          v11 = ((*v55 >> 2) + (*v55 << 6) + v55[1] + 2654435769) ^ *v55;
          *((_QWORD *)v8 + 5) = v11;
        }
        v12 = (_OWORD *)((char *)v8 + 48);
        v13 = *(_QWORD *)(v4 + 8);
        if (v13)
        {
          v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
          v14.i16[0] = vaddlv_u8(v14);
          v15 = v14.u32[0];
          if (v14.u32[0] > 1uLL)
          {
            v3 = v11;
            if (v11 >= v13)
              v3 = v11 % v13;
          }
          else
          {
            v3 = (v13 - 1) & v11;
          }
          v16 = *(uint64_t ***)(*(_QWORD *)v4 + 8 * v3);
          if (v16)
          {
            v17 = *v16;
            if (*v16)
            {
              while (1)
              {
                v18 = v17[1];
                if (v18 == v11)
                {
                  if (rf::data_flow::RFUUID::Equality::operator()(v60, (uint64_t)(v17 + 2), (uint64_t)v8 + 16))
                  {
                    *((_OWORD *)v17 + 3) = *v12;
                    v49 = *((_OWORD *)v8 + 4);
                    v50 = *((_OWORD *)v8 + 5);
                    v51 = *((_OWORD *)v8 + 7);
                    *((_OWORD *)v17 + 6) = *((_OWORD *)v8 + 6);
                    *((_OWORD *)v17 + 7) = v51;
                    *((_OWORD *)v17 + 4) = v49;
                    *((_OWORD *)v17 + 5) = v50;
                    v52 = *((_OWORD *)v8 + 8);
                    v53 = *((_OWORD *)v8 + 9);
                    v54 = *((_OWORD *)v8 + 10);
                    *((_BYTE *)v17 + 176) = *((_BYTE *)v8 + 176);
                    *((_OWORD *)v17 + 9) = v53;
                    *((_OWORD *)v17 + 10) = v54;
                    *((_OWORD *)v17 + 8) = v52;
                    v4 = a3;
                    std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(v17 + 24), (uint64_t)v8 + 192);
                    v6 = a1;
                    std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(v17 + 78), (uint64_t)v8 + 624);
                    std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>((rf::data_flow::consumer::Mesh *)(v17 + 132), (uint64_t)v8 + 1056);
                    goto LABEL_50;
                  }
                }
                else
                {
                  if (v15 > 1)
                  {
                    if (v18 >= v13)
                      v18 %= v13;
                  }
                  else
                  {
                    v18 &= v13 - 1;
                  }
                  if (v18 != v3)
                  {
LABEL_26:
                    v4 = a3;
                    break;
                  }
                }
                v17 = (uint64_t *)*v17;
                if (!v17)
                  goto LABEL_26;
              }
            }
          }
          v6 = a1;
        }
        v19 = operator new(0x5D0uLL);
        __p = v19;
        v62 = (int8x8_t *)v58;
        v63 = 0;
        *v19 = 0;
        v19[1] = v11;
        v20 = *((_OWORD *)v8 + 2);
        *((_OWORD *)v19 + 1) = *((_OWORD *)v8 + 1);
        *((_OWORD *)v19 + 2) = v20;
        *((_OWORD *)v19 + 3) = *v12;
        v21 = *((_OWORD *)v8 + 7);
        v23 = *((_OWORD *)v8 + 4);
        v22 = *((_OWORD *)v8 + 5);
        *((_OWORD *)v19 + 6) = *((_OWORD *)v8 + 6);
        *((_OWORD *)v19 + 7) = v21;
        *((_OWORD *)v19 + 4) = v23;
        *((_OWORD *)v19 + 5) = v22;
        v25 = *((_OWORD *)v8 + 9);
        v24 = *((_OWORD *)v8 + 10);
        v26 = *((_OWORD *)v8 + 8);
        *((_BYTE *)v19 + 176) = *((_BYTE *)v8 + 176);
        *((_OWORD *)v19 + 9) = v25;
        *((_OWORD *)v19 + 10) = v24;
        *((_OWORD *)v19 + 8) = v26;
        std::__optional_move_base<rf::data_flow::consumer::Mesh,false>::__optional_move_base[abi:ne180100]((_BYTE *)v19 + 192, (uint64_t)v8 + 192);
        std::__optional_move_base<rf::data_flow::consumer::Mesh,false>::__optional_move_base[abi:ne180100]((_BYTE *)v19 + 624, (uint64_t)v8 + 624);
        std::__optional_move_base<rf::data_flow::consumer::Mesh,false>::__optional_move_base[abi:ne180100]((_BYTE *)v19 + 1056, (uint64_t)v8 + 1056);
        v63 = 1;
        v27 = (float)(unint64_t)(*(_QWORD *)(v4 + 24) + 1);
        v28 = *(float *)(v4 + 32);
        if (!v13 || (float)(v28 * (float)v13) < v27)
        {
          v29 = v13 < 3 || (v13 & (v13 - 1)) != 0;
          v30 = v29 | (2 * v13);
          v31 = vcvtps_u32_f32(v27 / v28);
          if (v30 <= v31)
            v32 = v31;
          else
            v32 = v30;
          std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>>>::__rehash<true>(v4, v32);
          v13 = *(_QWORD *)(v4 + 8);
          if ((v13 & (v13 - 1)) != 0)
          {
            if (v11 >= v13)
              v3 = v11 % v13;
            else
              v3 = v11;
          }
          else
          {
            v3 = (v13 - 1) & v11;
          }
        }
        v33 = *(void ***)(*(_QWORD *)v4 + 8 * v3);
        if (v33)
        {
          *(_QWORD *)__p = *v33;
          *v33 = __p;
        }
        else
        {
          *(_QWORD *)__p = *(_QWORD *)(v4 + 16);
          *(_QWORD *)(v4 + 16) = __p;
          *(_QWORD *)(*(_QWORD *)v4 + 8 * v3) = v58;
          if (*(_QWORD *)__p)
          {
            v34 = *(_QWORD *)(*(_QWORD *)__p + 8);
            if ((v13 & (v13 - 1)) != 0)
            {
              if (v34 >= v13)
                v34 %= v13;
            }
            else
            {
              v34 &= v13 - 1;
            }
            *(_QWORD *)(*(_QWORD *)v4 + 8 * v34) = __p;
          }
        }
        __p = 0;
        ++*(_QWORD *)(v4 + 24);
        std::unique_ptr<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,void *>>>>::reset[abi:ne180100]((uint64_t)&__p, 0);
LABEL_50:
        v35 = *v6;
        if ((*v6)[35].i8[0])
        {
          v36 = (const unsigned __int8 *)&v35[31];
          if (v35[33].i8[0])
            v36 = *(const unsigned __int8 **)v36;
          if (*((_BYTE *)v5 + 16))
            v37 = *(const unsigned __int8 **)v5;
          else
            v37 = (const unsigned __int8 *)v5;
          v38 = uuid_compare(v36, v37);
          v35 = *v6;
          if (!v38 && v35[35].i8[0])
            v35[35].i8[0] = 0;
        }
        v39 = v35[27];
        v40 = *((_QWORD *)v8 + 1);
        v41 = (uint8x8_t)vcnt_s8(v39);
        v41.i16[0] = vaddlv_u8(v41);
        if (v41.u32[0] > 1uLL)
        {
          if (v40 >= *(_QWORD *)&v39)
            v40 %= *(_QWORD *)&v39;
        }
        else
        {
          v40 &= *(_QWORD *)&v39 - 1;
        }
        v42 = v35[26];
        v43 = *(rf **)(*(_QWORD *)&v42 + 8 * v40);
        do
        {
          v44 = v43;
          v43 = *(rf **)v43;
        }
        while (v43 != v8);
        if (v44 == (rf *)&v35[28])
          goto LABEL_76;
        v45 = *((_QWORD *)v44 + 1);
        if (v41.u32[0] > 1uLL)
        {
          if (v45 >= *(_QWORD *)&v39)
            v45 %= *(_QWORD *)&v39;
        }
        else
        {
          v45 &= *(_QWORD *)&v39 - 1;
        }
        if (v45 != v40)
        {
LABEL_76:
          if (!*(_QWORD *)v8)
            goto LABEL_77;
          v46 = *(_QWORD *)(*(_QWORD *)v8 + 8);
          if (v41.u32[0] > 1uLL)
          {
            if (v46 >= *(_QWORD *)&v39)
              v46 %= *(_QWORD *)&v39;
          }
          else
          {
            v46 &= *(_QWORD *)&v39 - 1;
          }
          if (v46 != v40)
LABEL_77:
            *(_QWORD *)(*(_QWORD *)&v42 + 8 * v40) = 0;
        }
        v47 = *(_QWORD *)v8;
        if (*(_QWORD *)v8)
        {
          v48 = *(_QWORD *)(v47 + 8);
          if (v41.u32[0] > 1uLL)
          {
            if (v48 >= *(_QWORD *)&v39)
              v48 %= *(_QWORD *)&v39;
          }
          else
          {
            v48 &= *(_QWORD *)&v39 - 1;
          }
          if (v48 != v40)
          {
            *(_QWORD *)(*(_QWORD *)&v35[26] + 8 * v48) = v44;
            v47 = *(_QWORD *)v8;
          }
        }
        *(_QWORD *)v44 = v47;
        *(_QWORD *)v8 = 0;
        --*(_QWORD *)&v35[29];
        __p = v8;
        v62 = v35 + 28;
        v63 = 1;
        std::unique_ptr<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,void *>>>>::reset[abi:ne180100]((uint64_t)&__p, 0);
      }
      v5 = (rf::data_flow::RFUUID *)((char *)v5 + 32);
    }
    while (v5 != v59);
  }
}

void sub_2277DF664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>>>::~__hash_table(v10);
  _Unwind_Resume(a1);
}

void rf::detail::createMeshFromInput(_BYTE *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12[2];
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  char v23;
  uint64_t v24;
  __int128 v25;
  char v26;
  uint64_t v27;
  __int128 v28;
  char v29;
  uint64_t v30;
  __int128 v31;
  char v32;
  uint64_t v33;
  __int128 v34;
  char v35;
  uint64_t v36;
  __int128 v37;
  char v38;
  uint64_t v39;
  __int128 v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a2 + 336))
  {
    v2 = *(_OWORD *)(a2 + 16);
    v12[0] = *(_OWORD *)a2;
    v12[1] = v2;
    v13 = 1;
    v3 = *(_OWORD *)(a2 + 48);
    v14 = *(_OWORD *)(a2 + 32);
    v15 = v3;
    v4 = *(_OWORD *)(a2 + 80);
    v16 = *(_OWORD *)(a2 + 64);
    v17 = v4;
    v18 = *(_BYTE *)(a2 + 96);
    v19 = *(_DWORD *)(a2 + 100);
    v20 = *(_QWORD *)(a2 + 104);
    LOBYTE(v21) = 0;
    v23 = 0;
    if (*(_BYTE *)(a2 + 136))
    {
      v5 = *(_QWORD *)(a2 + 112);
      *(_QWORD *)(a2 + 112) = 0;
      v21 = v5;
      v22 = *(_OWORD *)(a2 + 120);
      v23 = 1;
    }
    LOBYTE(v24) = 0;
    v26 = 0;
    if (*(_BYTE *)(a2 + 168))
    {
      v6 = *(_QWORD *)(a2 + 144);
      *(_QWORD *)(a2 + 144) = 0;
      v24 = v6;
      v25 = *(_OWORD *)(a2 + 152);
      v26 = 1;
    }
    LOBYTE(v27) = 0;
    v29 = 0;
    if (*(_BYTE *)(a2 + 200))
    {
      v7 = *(_QWORD *)(a2 + 176);
      *(_QWORD *)(a2 + 176) = 0;
      v27 = v7;
      v28 = *(_OWORD *)(a2 + 184);
      v29 = 1;
    }
    LOBYTE(v30) = 0;
    v32 = 0;
    if (*(_BYTE *)(a2 + 232))
    {
      v8 = *(_QWORD *)(a2 + 208);
      *(_QWORD *)(a2 + 208) = 0;
      v30 = v8;
      v31 = *(_OWORD *)(a2 + 216);
      v32 = 1;
    }
    LOBYTE(v33) = 0;
    v35 = 0;
    if (*(_BYTE *)(a2 + 264))
    {
      v9 = *(_QWORD *)(a2 + 240);
      *(_QWORD *)(a2 + 240) = 0;
      v33 = v9;
      v34 = *(_OWORD *)(a2 + 248);
      v35 = 1;
    }
    LOBYTE(v36) = 0;
    v38 = 0;
    if (*(_BYTE *)(a2 + 296))
    {
      v10 = *(_QWORD *)(a2 + 272);
      *(_QWORD *)(a2 + 272) = 0;
      v36 = v10;
      v37 = *(_OWORD *)(a2 + 280);
      v38 = 1;
    }
    LOBYTE(v39) = 0;
    v41 = 0;
    if (*(_BYTE *)(a2 + 328))
    {
      v11 = *(_QWORD *)(a2 + 304);
      *(_QWORD *)(a2 + 304) = 0;
      v39 = v11;
      v40 = *(_OWORD *)(a2 + 312);
      v41 = 1;
    }
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    *(_BYTE *)(rf::data_flow::consumer::Mesh::Mesh((uint64_t)a1, v12) + 416) = 1;
    rf::data_flow::consumer::Mesh::~Mesh((id *)v12);
  }
  else
  {
    *a1 = 0;
    a1[416] = 0;
  }
}

void sub_2277DF90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  rf::data_flow::consumer::Mesh::~Mesh(&a9);
  _Unwind_Resume(a1);
}

void std::__optional_storage_base<rf::data_flow::consumer::Mesh,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::consumer::Mesh,false>>(rf::data_flow::consumer::Mesh *this, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  if (*((unsigned __int8 *)this + 416) == *(unsigned __int8 *)(a2 + 416))
  {
    if (*((_BYTE *)this + 416))
    {
      v4 = *(_OWORD *)a2;
      v5 = *(_OWORD *)(a2 + 16);
      v6 = *(_OWORD *)(a2 + 48);
      *((_OWORD *)this + 2) = *(_OWORD *)(a2 + 32);
      *((_OWORD *)this + 3) = v6;
      *(_OWORD *)this = v4;
      *((_OWORD *)this + 1) = v5;
      v7 = *(_OWORD *)(a2 + 64);
      v8 = *(_OWORD *)(a2 + 80);
      v9 = *(_OWORD *)(a2 + 112);
      *((_OWORD *)this + 6) = *(_OWORD *)(a2 + 96);
      *((_OWORD *)this + 7) = v9;
      *((_OWORD *)this + 4) = v7;
      *((_OWORD *)this + 5) = v8;
      std::__optional_storage_base<rf::data_flow::MeshBuffer,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::MeshBuffer,false>>((uint64_t)this + 128, (uint64_t *)(a2 + 128));
      std::__optional_storage_base<rf::data_flow::MeshBuffer,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::MeshBuffer,false>>((uint64_t)this + 160, (uint64_t *)(a2 + 160));
      std::__optional_storage_base<rf::data_flow::MeshBuffer,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::MeshBuffer,false>>((uint64_t)this + 192, (uint64_t *)(a2 + 192));
      std::__optional_storage_base<rf::data_flow::MeshBuffer,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::MeshBuffer,false>>((uint64_t)this + 224, (uint64_t *)(a2 + 224));
      std::__optional_storage_base<rf::data_flow::MeshBuffer,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::MeshBuffer,false>>((uint64_t)this + 256, (uint64_t *)(a2 + 256));
      std::__optional_storage_base<rf::data_flow::MeshBuffer,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::MeshBuffer,false>>((uint64_t)this + 288, (uint64_t *)(a2 + 288));
      std::__optional_storage_base<rf::data_flow::MeshBuffer,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::MeshBuffer,false>>((uint64_t)this + 320, (uint64_t *)(a2 + 320));
      v10 = (uint64_t *)((char *)this + 352);
      if (*((unsigned __int8 *)this + 360) == *(unsigned __int8 *)(a2 + 360))
      {
        if (*((_BYTE *)this + 360))
        {
          v11 = *v10;
          *v10 = *(_QWORD *)(a2 + 352);
          if (v11)
            RERelease();
          *(_QWORD *)(a2 + 352) = 0;
        }
      }
      else if (*((_BYTE *)this + 360))
      {
        RESharedPtr<REGeomModelDescriptor>::~RESharedPtr(v10);
        *((_BYTE *)this + 360) = 0;
      }
      else
      {
        *((_QWORD *)this + 44) = *(_QWORD *)(a2 + 352);
        *(_QWORD *)(a2 + 352) = 0;
        *((_BYTE *)this + 360) = 1;
      }
      std::__optional_storage_base<RESharedPtr<REAsset>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<RESharedPtr<REAsset>,false>>((uint64_t)this + 368, a2 + 368);
      std::__optional_storage_base<RESharedPtr<REAsset>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<RESharedPtr<REAsset>,false>>((uint64_t)this + 384, a2 + 384);
      if (*((unsigned __int8 *)this + 408) == *(unsigned __int8 *)(a2 + 408))
      {
        if (*((_BYTE *)this + 408))
        {
          v12 = *(_QWORD *)(a2 + 400);
          *(_QWORD *)(a2 + 400) = 0;
          v13 = (void *)*((_QWORD *)this + 50);
          *((_QWORD *)this + 50) = v12;

        }
      }
      else if (*((_BYTE *)this + 408))
      {

        *((_BYTE *)this + 408) = 0;
      }
      else
      {
        v14 = *(_QWORD *)(a2 + 400);
        *(_QWORD *)(a2 + 400) = 0;
        *((_QWORD *)this + 50) = v14;
        *((_BYTE *)this + 408) = 1;
      }
    }
  }
  else if (*((_BYTE *)this + 416))
  {
    rf::data_flow::consumer::Mesh::~Mesh((id *)this);
    *((_BYTE *)this + 416) = 0;
  }
  else
  {
    rf::data_flow::consumer::Mesh::Mesh((uint64_t)this, (__int128 *)a2);
    *((_BYTE *)this + 416) = 1;
  }
}

__n128 std::__optional_storage_base<rf::data_flow::MeshBuffer,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<rf::data_flow::MeshBuffer,false>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  id v5;
  __n128 result;
  uint64_t v7;

  if (*(unsigned __int8 *)(a1 + 24) == *((unsigned __int8 *)a2 + 24))
  {
    if (*(_BYTE *)(a1 + 24))
    {
      v4 = *a2;
      *a2 = 0;
      v5 = *(id *)a1;
      *(_QWORD *)a1 = v4;

      result = *(__n128 *)(a2 + 1);
      *(__n128 *)(a1 + 8) = result;
    }
  }
  else if (*(_BYTE *)(a1 + 24))
  {

    *(_BYTE *)(a1 + 24) = 0;
  }
  else
  {
    v7 = *a2;
    *a2 = 0;
    *(_QWORD *)a1 = v7;
    result = *(__n128 *)(a2 + 1);
    *(__n128 *)(a1 + 8) = result;
    *(_BYTE *)(a1 + 24) = 1;
  }
  return result;
}

uint64_t std::__optional_storage_base<RESharedPtr<REAsset>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<RESharedPtr<REAsset>,false>>(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (*(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(_BYTE *)(result + 8))
    {
      v3 = *(_QWORD *)result;
      *(_QWORD *)result = *(_QWORD *)a2;
      if (v3)
        result = RERelease();
      *(_QWORD *)a2 = 0;
    }
  }
  else if (*(_BYTE *)(result + 8))
  {
    result = (uint64_t)RESharedPtr<REAsset>::~RESharedPtr((_QWORD *)result);
    *(_BYTE *)(result + 8) = 0;
  }
  else
  {
    *(_QWORD *)result = *(_QWORD *)a2;
    *(_QWORD *)a2 = 0;
    *(_BYTE *)(result + 8) = 1;
  }
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>>>::__emplace_unique_key_args<rf::data_flow::RFUUID,std::piecewise_construct_t const&,std::tuple<rf::data_flow::RFUUID const&>,std::tuple<>>(uint64_t a1, uint64_t a2, int32x4_t **a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  int32x4_t *v14;
  int32x4_t *v15;
  int32x4_t v16;
  int32x4_t v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD *v27;
  _QWORD v28[2];
  char v29;

  v7 = *(_QWORD *)(a2 + 24);
  if (!v7)
  {
    if (*(_BYTE *)(a2 + 16))
      v27 = *(_QWORD **)a2;
    else
      v27 = (_QWORD *)a2;
    v7 = ((*v27 >> 2) + (*v27 << 6) + v27[1] + 2654435769) ^ *v27;
    *(_QWORD *)(a2 + 24) = v7;
  }
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    v10 = v9.u32[0];
    if (v9.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v8)
        v3 = v7 % v8;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
    v11 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v11)
    {
      v12 = (_QWORD *)*v11;
      if (*v11)
      {
        do
        {
          v13 = v12[1];
          if (v13 == v7)
          {
            if (rf::data_flow::RFUUID::Equality::operator()(a1 + 32, (uint64_t)(v12 + 2), a2))
              return v12;
          }
          else
          {
            if (v10 > 1)
            {
              if (v13 >= v8)
                v13 %= v8;
            }
            else
            {
              v13 &= v8 - 1;
            }
            if (v13 != v3)
              break;
          }
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
    }
  }
  v14 = *a3;
  v15 = (int32x4_t *)operator new(0x5D0uLL);
  v28[0] = v15;
  v28[1] = a1 + 16;
  v29 = 0;
  v15->i64[0] = 0;
  v15->i64[1] = v7;
  v16 = v14[1];
  v15[1] = *v14;
  v15[2] = v16;
  bzero(&v15[3], 0x5A0uLL);
  uuid_clear((unsigned __int8 *)&v15[3]);
  v15[5] = (int32x4_t)xmmword_2277EE440;
  v15[6] = (int32x4_t)xmmword_2277EE450;
  v15[7] = (int32x4_t)xmmword_2277EE460;
  v15[8] = (int32x4_t)xmmword_2277EE900;
  v17.i64[0] = 0x7F0000007FLL;
  v17.i64[1] = 0x7F0000007FLL;
  v15[9] = vdupq_n_s32(0x7F800000u);
  v15[10] = v17;
  v15[11].i8[0] = 0;
  v15[12].i8[0] = 0;
  v15[38].i8[0] = 0;
  v15[39].i8[0] = 0;
  v15[65].i8[0] = 0;
  v15[66].i8[0] = 0;
  v15[92].i8[0] = 0;
  v29 = 1;
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v8 || (float)(v19 * (float)v8) < v18)
  {
    v20 = 1;
    if (v8 >= 3)
      v20 = (v8 & (v8 - 1)) != 0;
    v21 = v20 | (2 * v8);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::EnvironmentProbe>>>::__rehash<true>(a1, v23);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v3 = v7 % v8;
      else
        v3 = v7;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
  }
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v24)
  {
    *(_QWORD *)v28[0] = *v24;
    *v24 = v28[0];
  }
  else
  {
    *(_QWORD *)v28[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v28[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v28[0])
    {
      v25 = *(_QWORD *)(*(_QWORD *)v28[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v25 >= v8)
          v25 %= v8;
      }
      else
      {
        v25 &= v8 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v25) = v28[0];
    }
  }
  v12 = (_QWORD *)v28[0];
  v28[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,void *>>>>::reset[abi:ne180100]((uint64_t)v28, 0);
  return v12;
}

void sub_2277DFEB8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,rf::data_flow::consumer::RoomBoundary>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

_BYTE *std::__optional_move_base<rf::data_flow::consumer::Mesh,false>::__optional_move_base[abi:ne180100](_BYTE *a1, uint64_t a2)
{
  *a1 = 0;
  a1[416] = 0;
  if (*(_BYTE *)(a2 + 416))
  {
    rf::data_flow::consumer::Mesh::Mesh((uint64_t)a1, (__int128 *)a2);
    a1[416] = 1;
  }
  return a1;
}

void sub_2277DFF14(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + 416))
    rf::data_flow::consumer::Mesh::~Mesh((id *)v1);
  _Unwind_Resume(exception_object);
}

rf::data_flow::consumer::AnchorManagementConsumer *rf::data_flow::consumer::AnchorManagementConsumer::AnchorManagementConsumer(rf::data_flow::consumer::AnchorManagementConsumer *this, const rf::data_flow::consumer::AnchorManagementConfig *a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  float v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  CFStringRef *v12;
  __int128 *v13;
  rf::helpers *v14;
  __int128 *v15;
  rf::helpers *v16;
  __int128 *v17;
  uint64_t v18;
  void *v19;
  void *__p[2];
  char v22;
  void *v23[2];
  char v24;
  const void *v25;

  *(_QWORD *)this = &off_24EFDA2D0;
  *((_QWORD *)this + 1) = 0;
  *((_BYTE *)this + 16) = 0;
  std::__function::__value_func<void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__value_func[abi:ne180100]((uint64_t)this + 24, (uint64_t)a2);
  v4 = *((_DWORD *)a2 + 8);
  *(_DWORD *)((char *)this + 59) = *(_DWORD *)((char *)a2 + 35);
  *((_DWORD *)this + 14) = v4;
  std::__function::__value_func<void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__value_func[abi:ne180100]((uint64_t)this + 64, (uint64_t)a2 + 40);
  std::__function::__value_func<void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__value_func[abi:ne180100]((uint64_t)this + 96, (uint64_t)a2 + 72);
  std::__function::__value_func<void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__value_func[abi:ne180100]((uint64_t)this + 128, (uint64_t)a2 + 104);
  v5 = *((_DWORD *)a2 + 34);
  v6 = *(_DWORD *)((char *)a2 + 139);
  *((_OWORD *)this + 15) = 0u;
  *(_DWORD *)((char *)this + 163) = v6;
  *((_DWORD *)this + 40) = v5;
  *((_QWORD *)this + 23) = 0;
  *((_WORD *)this + 96) = 0;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_DWORD *)this + 58) = 1065353216;
  *((_OWORD *)this + 16) = 0u;
  *((_DWORD *)this + 68) = 1065353216;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  *((_DWORD *)this + 78) = 1065353216;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_DWORD *)this + 88) = 1065353216;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *((_DWORD *)this + 98) = 1065353216;
  *((_QWORD *)this + 50) = 0;
  *((_WORD *)this + 204) = 0;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *((_DWORD *)this + 112) = 1065353216;
  std::string::basic_string[abi:ne180100]<0>(v23, "");
  rf::UserDefaults::UserDefaults((CFStringRef *)&v25, (const UInt8 *)v23);
  std::string::basic_string[abi:ne180100]<0>(__p, "anchorDirtyThreshold");
  v7 = rf::UserDefaults::floatValue((CFStringRef *)&v25, (const UInt8 *)__p);
  if ((v7 & 0xFF00000000) != 0)
    v8 = *(float *)&v7;
  else
    v8 = 0.001;
  if (v22 < 0)
    operator delete(__p[0]);
  rf::UserDefaults::~UserDefaults(&v25);
  if (v24 < 0)
    operator delete(v23[0]);
  *((float *)this + 114) = v8;
  std::string::basic_string[abi:ne180100]<0>(v23, "");
  rf::UserDefaults::UserDefaults((CFStringRef *)&v25, (const UInt8 *)v23);
  std::string::basic_string[abi:ne180100]<0>(__p, "anchoringUpdateCountThreshold");
  v9 = rf::UserDefaults::uintValue((CFStringRef *)&v25, (const UInt8 *)__p);
  if (v10)
    v11 = v9;
  else
    v11 = 50;
  if (v22 < 0)
    operator delete(__p[0]);
  rf::UserDefaults::~UserDefaults(&v25);
  if (v24 < 0)
    operator delete(v23[0]);
  *((_QWORD *)this + 58) = v11;
  *(_OWORD *)((char *)this + 472) = 0u;
  *(_OWORD *)((char *)this + 488) = 0u;
  *((_DWORD *)this + 126) = 1065353216;
  std::string::basic_string[abi:ne180100]<0>(v23, "");
  v12 = rf::UserDefaults::UserDefaults((CFStringRef *)__p, (const UInt8 *)v23);
  if (v24 < 0)
    operator delete(v23[0]);
  v13 = rf::helpers::kCameraIdentifier((rf::helpers *)v12);
  v14 = (rf::helpers *)std::__hash_table<rf::data_flow::RFUUID,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<rf::data_flow::RFUUID>>::__emplace_unique_key_args<rf::data_flow::RFUUID,rf::data_flow::RFUUID const&>((uint64_t)this + 360, (uint64_t)v13, v13);
  v15 = rf::helpers::kHeadIdentifier(v14);
  v16 = (rf::helpers *)std::__hash_table<rf::data_flow::RFUUID,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<rf::data_flow::RFUUID>>::__emplace_unique_key_args<rf::data_flow::RFUUID,rf::data_flow::RFUUID const&>((uint64_t)this + 360, (uint64_t)v15, v15);
  v17 = rf::helpers::kBodyIdentifier(v16);
  std::__hash_table<rf::data_flow::RFUUID,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<rf::data_flow::RFUUID>>::__emplace_unique_key_args<rf::data_flow::RFUUID,rf::data_flow::RFUUID const&>((uint64_t)this + 360, (uint64_t)v17, v17);
  objc_msgSend(MEMORY[0x24BDBF648], "context");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)*((_QWORD *)this + 50);
  *((_QWORD *)this + 50) = v18;

  rf::UserDefaults::~UserDefaults((const void **)__p);
  return this;
}

void sub_2277E01DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  rf::data_flow::consumer::AnchorManagementConfig *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (a21 < 0)
    operator delete(__p);
  std::__hash_table<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>>>::~__hash_table(v28);
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>>>::~__hash_table(v25 + 176);

  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table(v27);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table(v25 + 80);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table(v25 + 40);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table(v25);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table(v26);
  RESharedPtr<REAsset>::~RESharedPtr(v24);
  rf::data_flow::consumer::AnchorManagementConfig::~AnchorManagementConfig(v22);
  _Unwind_Resume(a1);
}

uint64_t ___ZN2rf9data_flow8consumer24AnchorManagementConsumer34registerShadowClusterUpdateHandlerERKNS_15ConsumerRequestE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float v7;
  float32x4_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  float32x4_t v16[2];
  char v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[256];
  int v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  REComponentGetEntity();
  v2 = v1 + 144;
  v3 = v1 + 496;
  if (*(_DWORD *)(v1 + 752) != 1)
    v3 = 0;
  if (*(_BYTE *)(v1 + 768))
    v4 = v3;
  else
    v4 = 0;
  REAnchorShadowMarkerComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REShadowClusterRootComponentGetClusterBound();
  v7 = fmaxf(vmuls_lane_f32(0.5, (float32x2_t)*(_OWORD *)&vsubq_f32(v6, v5), 1), 0.03);
  v8 = vaddq_f32(v6, v5);
  v6.i64[0] = 0x3F0000003F000000;
  v6.i64[1] = 0x3F0000003F000000;
  v16[0] = vmlaq_n_f32(vmulq_f32(v8, v6), (float32x4_t)xmmword_2277F3770, v7);
  v16[1] = (float32x4_t)xmmword_2277F0030;
  v17 = 1;
  v18 = -1;
  v19 = 0;
  rf::helpers::getNearestPlaneAnchor((unint64_t)v16, v2, v9, v10, v11, v12, v13, v14, (uint64_t)v20, v16[0]);
  if (!v22)
  {
    if (v4)
      goto LABEL_10;
LABEL_12:
    result = REAnchorShadowMarkerSetPlaneExists();
    goto LABEL_13;
  }
  if (v21 != 1)
    goto LABEL_12;
LABEL_10:
  result = REAnchorShadowMarkerSetPointAndNormal();
  if (v4)
    result = REAnchorShadowMarkerSetFloorPlane();
LABEL_13:
  if (v22)
    return std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v20);
  return result;
}

void sub_2277E0514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  if (a53)
    std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&a17);
  _Unwind_Resume(exception_object);
}

uint64_t rf::data_flow::consumer::AnchorManagementConsumer::consumeLatestUpdate(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  int8x8_t EventBus;
  std::string::size_type v5;
  uint64_t updated;
  BOOL v7;
  char *UniqueName;
  unint64_t v9;
  int8x8_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  std::string::size_type size;
  char v23;
  unint64_t v24;
  unint64_t v25;
  uint8x8_t v26;
  unint64_t v27;
  unint64_t v28;
  unsigned __int8 **v29;
  unsigned __int8 *j;
  unint64_t v31;
  float v32;
  float v33;
  int8x8_t v34;
  unint64_t v35;
  uint8x8_t v36;
  _BOOL8 v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  int8x8_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  uint8x8_t v49;
  unint64_t prime;
  uint8x8_t v51;
  uint64_t v52;
  rf::AnchorDefinitionComponent *v53;
  uint64_t v54;
  char *v55;
  void *v56;
  _QWORD *v57;
  std::string::size_type v58;
  _QWORD *v59;
  uint64_t SelfEnabled;
  NSObject *v61;
  uint64_t Name;
  rf *v63;
  NSObject *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  _QWORD *v68;
  unint64_t v69;
  int8x8_t v70;
  unint64_t v71;
  uint8x8_t v72;
  unsigned __int8 **v73;
  unsigned __int8 *k;
  unint64_t v75;
  size_t v76;
  int v77;
  size_t m;
  unint64_t v79;
  std::string::size_type v80;
  uint8x8_t v81;
  unint64_t v82;
  unsigned __int8 **v83;
  unsigned __int8 *n;
  unint64_t v85;
  _QWORD *v86;
  std::string *v87;
  __int128 v88;
  float v89;
  _BOOL8 v90;
  unint64_t v91;
  unint64_t v92;
  size_t v93;
  std::string::size_type v94;
  _QWORD *v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint8x8_t v100;
  unint64_t v101;
  unsigned __int8 **v102;
  unsigned __int8 *ii;
  unint64_t v104;
  char *v105;
  _QWORD *v106;
  std::string *v107;
  __int128 v108;
  __int128 v109;
  unint64_t v110;
  float v111;
  float v112;
  _BOOL8 v113;
  unint64_t v114;
  unint64_t v115;
  size_t v116;
  uint64_t v117;
  _QWORD *v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t ComponentByClass;
  void *v124;
  char *DescriptorResourceGroup;
  size_t v126;
  char *DescriptorResourceName;
  size_t v128;
  char *v129;
  unint64_t v130;
  int8x8_t v131;
  unint64_t v132;
  uint8x8_t v133;
  unint64_t v134;
  unint64_t v135;
  unsigned __int8 **v136;
  unsigned __int8 *v137;
  uint64_t v138;
  unint64_t v139;
  float v140;
  float v141;
  void *v142;
  void *v143;
  uint64_t v144;
  char *v145;
  void *v146;
  std::string *v147;
  void *v148;
  rf *v149;
  uint64_t v150;
  std::string *v151;
  _QWORD *v152;
  unint64_t v153;
  unint64_t v154;
  unint64_t v155;
  uint8x8_t v156;
  unint64_t v157;
  unsigned __int8 **v158;
  unsigned __int8 *jj;
  unint64_t v160;
  _QWORD *v161;
  _QWORD *v162;
  std::string *v163;
  std::string::size_type v164;
  float v165;
  float v166;
  _BOOL8 v167;
  unint64_t v168;
  unint64_t v169;
  size_t v170;
  uint64_t v171;
  _QWORD *v172;
  unint64_t v173;
  char *v174;
  unsigned __int8 *v175;
  unsigned __int8 *v176;
  size_t v177;
  size_t v178;
  size_t v179;
  uint8x8_t v180;
  unint64_t v181;
  size_t v182;
  unsigned __int8 **v183;
  unsigned __int8 *kk;
  size_t v185;
  NSObject *v186;
  void *v187;
  int8x8_t v188;
  unint64_t v189;
  uint8x8_t v190;
  uint64_t v191;
  unsigned __int8 *v192;
  unsigned __int8 *v193;
  unint64_t v194;
  uint64_t *v195;
  unint64_t v196;
  unint64_t v197;
  uint64_t *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t isRemotelyOwned;
  NSObject *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  int v207;
  uint64_t ComponentsOfClass;
  uint64_t v209;
  uint64_t *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  int v226;
  int v227;
  uint64_t v228;
  int v229;
  int isAnchoringTypeAuthorizedForPeer;
  float32x4_t v231;
  float32x4_t v232;
  float32x4_t v233;
  float32x4_t v234;
  uint64_t v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  uint64_t v240;
  uint64_t v241;
  int IsAnchorExternal;
  int IsExternal;
  uint64_t v244;
  int v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  int DescriptorType;
  uint64_t v252;
  uint64_t v253;
  int v254;
  float32x4_t v256;
  float32x4_t v257;
  float32x4_t v258;
  float32x4_t v259;
  float32x4_t v260;
  float32x4_t v261;
  float32x4_t v262;
  float32x4_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  rf *ShadowEnabled;
  NSObject *v269;
  _QWORD *v270;
  unint64_t v271;
  uint64_t v272;
  void *v273;
  rf::internal *v274;
  std::string *v275;
  id v276;
  id v277;
  float32x4_t v278;
  float32x4_t v279;
  void *v280;
  float32x4_t v281;
  float32x4_t v282;
  uint64_t v283;
  uint64_t *v284;
  float32x4_t v285;
  float32x4_t v286;
  char v287;
  uint64_t *v288;
  float32x4_t v289;
  float32x4_t v290;
  uint64_t v291;
  unint64_t *v292;
  _QWORD *v293;
  void *v294;
  float32x4_t v295;
  uint64_t v296;
  uint64_t Entity;
  void *v298[2];
  std::string::size_type v299;
  uint64_t Object;
  size_t __n[4];
  _OWORD v302[2];
  uint8_t buf[16];
  std::string v304[2];
  __int128 v305;
  int v306;
  std::string uu;
  uint64_t v308;
  std::string v309;
  _QWORD v310[6];

  v310[3] = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a2 + 32))
    return result;
  v5 = result;
  updated = *(_QWORD *)(a2 + 24);
  v296 = v5;
  if (*(_BYTE *)(a2 + 16))
  {
    v2 = *(_QWORD *)(a2 + 8);
    if (updated)
      v7 = v2 == 0;
    else
      v7 = 1;
    if (v7)
    {
LABEL_98:
      v291 = *(_QWORD *)(a2 + 24);
      goto LABEL_99;
    }
    UniqueName = (char *)RESceneGetUniqueName();
    std::string::basic_string[abi:ne180100]<0>(&uu, UniqueName);
    v293 = (_QWORD *)(v5 + 496);
    v9 = std::__string_hash<char>::operator()[abi:ne180100](v5 + 496, (uint64_t)&uu);
    v10 = *(int8x8_t *)(v5 + 480);
    if (v10)
    {
      EventBus = (int8x8_t)v9;
      v11 = (uint8x8_t)vcnt_s8(v10);
      v11.i16[0] = vaddlv_u8(v11);
      v12 = v11.u32[0];
      if (v11.u32[0] > 1uLL)
      {
        v13 = v9;
        v14 = v296;
        if (v9 >= *(_QWORD *)&v10)
          v13 = v9 % *(_QWORD *)&v10;
      }
      else
      {
        v13 = (*(_QWORD *)&v10 - 1) & v9;
        v14 = v296;
      }
      v15 = *(unsigned __int8 ***)(*(_QWORD *)(v14 + 472) + 8 * v13);
      if (v15)
      {
        for (i = *v15; i; i = *(unsigned __int8 **)i)
        {
          v17 = *((_QWORD *)i + 1);
          if (*(_QWORD *)&EventBus == v17)
          {
            updated = std::equal_to<std::string>::operator()[abi:ne180100](v296 + 504, i + 16, (unsigned __int8 *)&uu);
            if ((updated & 1) != 0)
              goto LABEL_95;
          }
          else
          {
            if (v12 > 1)
            {
              if (v17 >= *(_QWORD *)&v10)
                v17 %= *(_QWORD *)&v10;
            }
            else
            {
              v17 &= *(_QWORD *)&v10 - 1;
            }
            if (v17 != v13)
              break;
          }
        }
      }
    }
    MEMORY[0x22E29DA2C](v2);
    EventBus = (int8x8_t)REEngineGetEventBus();
    __n[0] = v296;
    if (SHIBYTE(uu.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external((std::string *)&__n[1], uu.__r_.__value_.__l.__data_, uu.__r_.__value_.__l.__size_);
    else
      *(std::string *)&__n[1] = uu;
    MEMORY[0x22E29D4F8]("RESceneWillRemoveEvent");
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3321888768;
    v304[0].__r_.__value_.__r.__words[0] = (std::string::size_type)___ZZN2rf9data_flow8consumer24AnchorManagementConsumer37listenToSceneRemovalForReferenceAssetEP7RESceneP16REServiceLocatorENK3__0cvU13block_pointerF20REEventHandlerResultPvPKvEEv_block_invoke;
    v304[0].__r_.__value_.__l.__size_ = (std::string::size_type)&__block_descriptor_64_ea8_32c128_ZTSKZN2rf9data_flow8consumer24AnchorManagementConsumer37listenToSceneRemovalForReferenceAssetEP7RESceneP16REServiceLocatorE3__0_e14_I24__0_v8r_v16l;
    v304[0].__r_.__value_.__r.__words[2] = __n[0];
    if (SHIBYTE(__n[3]) < 0)
      std::string::__init_copy_ctor_external(&v304[1], (const std::string::value_type *)__n[1], __n[2]);
    else
      v304[1] = *(std::string *)&__n[1];
    v18 = (void *)MEMORY[0x22E29E0BC](buf);
    if (SHIBYTE(v304[1].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v304[1].__r_.__value_.__l.__data_);
    v19 = REEventBusSubscribeBlock();
    v21 = v20;

    if (SHIBYTE(uu.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v309, uu.__r_.__value_.__l.__data_, uu.__r_.__value_.__l.__size_);
    else
      v309 = uu;
    v2 = (unint64_t)operator new(0x40uLL);
    size = v309.__r_.__value_.__l.__size_;
    *(_QWORD *)(v2 + 16) = v309.__r_.__value_.__r.__words[0];
    *(_QWORD *)buf = v2;
    *(_QWORD *)&buf[8] = v296 + 488;
    v292 = (unint64_t *)(v296 + 488);
    *(_QWORD *)v2 = 0;
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 24) = size;
    *(_QWORD *)(v2 + 31) = *(std::string::size_type *)((char *)&v309.__r_.__value_.__r.__words[1] + 7);
    v23 = HIBYTE(v309.__r_.__value_.__r.__words[2]);
    memset(&v309, 0, sizeof(v309));
    *(_QWORD *)(v2 + 48) = v19;
    *(_QWORD *)(v2 + 56) = v21;
    *(_BYTE *)(v2 + 39) = v23;
    *(int8x8_t *)(v2 + 40) = EventBus;
    v304[0].__r_.__value_.__s.__data_[0] = 1;
    *(_QWORD *)(v2 + 8) = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v293, v2 + 16);
    v24 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v293, v2 + 16);
    *(_QWORD *)(v2 + 8) = v24;
    v25 = *(_QWORD *)(v296 + 480);
    if (v25)
    {
      EventBus = (int8x8_t)v24;
      v26 = (uint8x8_t)vcnt_s8((int8x8_t)v25);
      v26.i16[0] = vaddlv_u8(v26);
      v27 = v26.u32[0];
      if (v26.u32[0] > 1uLL)
      {
        v28 = v24;
        if (v25 <= v24)
          v28 = v24 % v25;
      }
      else
      {
        v28 = (v25 - 1) & v24;
      }
      v29 = *(unsigned __int8 ***)(*(_QWORD *)(v296 + 472) + 8 * v28);
      if (v29)
      {
        for (j = *v29; j; j = *(unsigned __int8 **)j)
        {
          v31 = *((_QWORD *)j + 1);
          if (v31 == *(_QWORD *)&EventBus)
          {
            if ((std::equal_to<std::string>::operator()[abi:ne180100](v296 + 504, j + 16, (unsigned __int8 *)(v2 + 16)) & 1) != 0)
              goto LABEL_91;
          }
          else
          {
            if (v27 > 1)
            {
              if (v31 >= v25)
                v31 %= v25;
            }
            else
            {
              v31 &= v25 - 1;
            }
            if (v31 != v28)
              break;
          }
        }
      }
    }
    v32 = (float)(unint64_t)(*(_QWORD *)(v296 + 496) + 1);
    v33 = *(float *)(v296 + 504);
    if (v25 && (float)(v33 * (float)v25) >= v32)
    {
LABEL_53:
      v34 = *(int8x8_t *)(v296 + 480);
      v35 = *(_QWORD *)(v2 + 8);
      v36 = (uint8x8_t)vcnt_s8(v34);
      v36.i16[0] = vaddlv_u8(v36);
      if (v36.u32[0] > 1uLL)
      {
        if (v35 >= *(_QWORD *)&v34)
          v35 %= *(_QWORD *)&v34;
      }
      else
      {
        v35 &= *(_QWORD *)&v34 - 1;
      }
      v40 = *(_QWORD *)(v296 + 472);
      v41 = *(unint64_t **)(v40 + 8 * v35);
      if (v41)
      {
        *(_QWORD *)v2 = *v41;
      }
      else
      {
        *(_QWORD *)v2 = *v292;
        *v292 = v2;
        *(_QWORD *)(v40 + 8 * v35) = v292;
        if (!*(_QWORD *)v2)
        {
LABEL_90:
          ++*v293;
          *(_QWORD *)buf = 0;
LABEL_91:
          std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,void *>>>>::reset[abi:ne180100]((uint64_t)buf);
          if (SHIBYTE(v309.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v309.__r_.__value_.__l.__data_);
          if (SHIBYTE(__n[3]) < 0)
            operator delete((void *)__n[1]);
LABEL_95:
          if (SHIBYTE(uu.__r_.__value_.__r.__words[2]) < 0)
            operator delete(uu.__r_.__value_.__l.__data_);
          v5 = v296;
          if (!*(_BYTE *)(a2 + 32))
            std::__throw_bad_optional_access[abi:ne180100]();
          goto LABEL_98;
        }
        v42 = *(_QWORD *)(*(_QWORD *)v2 + 8);
        if (v36.u32[0] > 1uLL)
        {
          if (v42 >= *(_QWORD *)&v34)
            v42 %= *(_QWORD *)&v34;
        }
        else
        {
          v42 &= *(_QWORD *)&v34 - 1;
        }
        v41 = (unint64_t *)(*(_QWORD *)(v296 + 472) + 8 * v42);
      }
      *v41 = v2;
      goto LABEL_90;
    }
    v37 = 1;
    if (v25 >= 3)
      v37 = (v25 & (v25 - 1)) != 0;
    v38 = v37 | (2 * v25);
    v39 = vcvtps_u32_f32(v32 / v33);
    if (v38 <= v39)
      EventBus = (int8x8_t)v39;
    else
      EventBus = (int8x8_t)v38;
    if (*(_QWORD *)&EventBus == 1)
    {
      EventBus = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&EventBus & (*(_QWORD *)&EventBus - 1)) != 0)
    {
      EventBus = (int8x8_t)std::__next_prime(*(_QWORD *)&EventBus);
    }
    v43 = *(int8x8_t *)(v296 + 480);
    if (*(_QWORD *)&EventBus <= *(_QWORD *)&v43)
    {
      if (*(_QWORD *)&EventBus >= *(_QWORD *)&v43)
        goto LABEL_53;
      prime = vcvtps_u32_f32((float)*(unint64_t *)(v296 + 496) / *(float *)(v296 + 504));
      if (*(_QWORD *)&v43 < 3uLL || (v51 = (uint8x8_t)vcnt_s8(v43), v51.i16[0] = vaddlv_u8(v51), v51.u32[0] > 1uLL))
      {
        prime = std::__next_prime(prime);
      }
      else
      {
        v52 = 1 << -(char)__clz(prime - 1);
        if (prime >= 2)
          prime = v52;
      }
      if (*(_QWORD *)&EventBus <= prime)
        EventBus = (int8x8_t)prime;
      if (*(_QWORD *)&EventBus >= *(_QWORD *)&v43)
        goto LABEL_53;
      if (!*(_QWORD *)&EventBus)
      {
        v273 = *(void **)(v296 + 472);
        *(_QWORD *)(v296 + 472) = 0;
        if (v273)
          operator delete(v273);
        *(_QWORD *)(v296 + 480) = 0;
        goto LABEL_53;
      }
    }
    if (*(_QWORD *)&EventBus >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v44 = operator new(8 * *(_QWORD *)&EventBus);
    v45 = *(void **)(v296 + 472);
    *(_QWORD *)(v296 + 472) = v44;
    if (v45)
      operator delete(v45);
    v46 = 0;
    *(int8x8_t *)(v296 + 480) = EventBus;
    do
      *(_QWORD *)(*(_QWORD *)(v296 + 472) + 8 * v46++) = 0;
    while (*(_QWORD *)&EventBus != v46);
    v47 = (_QWORD *)*v292;
    if (!*v292)
      goto LABEL_53;
    v48 = v47[1];
    v49 = (uint8x8_t)vcnt_s8(EventBus);
    v49.i16[0] = vaddlv_u8(v49);
    if (v49.u32[0] > 1uLL)
    {
      if (v48 >= *(_QWORD *)&EventBus)
        v48 %= *(_QWORD *)&EventBus;
    }
    else
    {
      v48 &= *(_QWORD *)&EventBus - 1;
    }
    *(_QWORD *)(*(_QWORD *)(v296 + 472) + 8 * v48) = v292;
    v270 = (_QWORD *)*v47;
    if (!*v47)
      goto LABEL_53;
    while (1)
    {
      v271 = v270[1];
      if (v49.u32[0] > 1uLL)
      {
        if (v271 >= *(_QWORD *)&EventBus)
          v271 %= *(_QWORD *)&EventBus;
      }
      else
      {
        v271 &= *(_QWORD *)&EventBus - 1;
      }
      if (v271 != v48)
      {
        v272 = *(_QWORD *)(v296 + 472);
        if (!*(_QWORD *)(v272 + 8 * v271))
        {
          *(_QWORD *)(v272 + 8 * v271) = v47;
          goto LABEL_488;
        }
        *v47 = *v270;
        *v270 = **(_QWORD **)(*(_QWORD *)(v296 + 472) + 8 * v271);
        **(_QWORD **)(*(_QWORD *)(v296 + 472) + 8 * v271) = v270;
        v270 = v47;
      }
      v271 = v48;
LABEL_488:
      v47 = v270;
      v270 = (_QWORD *)*v270;
      v48 = v271;
      if (!v270)
        goto LABEL_53;
    }
  }
  v291 = *(_QWORD *)(a2 + 24);
LABEL_99:
  v283 = *(_QWORD *)(v5 + 8);
  if (!*(_BYTE *)(v5 + 160))
  {
    if (!*(_BYTE *)(v5 + 192))
    {
      if (*(_BYTE *)(a2 + 16))
      {
        updated = MEMORY[0x22E29DA50](*(_QWORD *)(a2 + 8));
        if (updated)
        {
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          v304[0].__r_.__value_.__r.__words[0] = (std::string::size_type)___ZN2rf9data_flow8consumer24AnchorManagementConsumer34registerShadowClusterUpdateHandlerERKNS_15ConsumerRequestE_block_invoke;
          v304[0].__r_.__value_.__l.__size_ = (std::string::size_type)&__block_descriptor_40_e35_v24__0__REScene__8__REComponent__16l;
          v304[0].__r_.__value_.__r.__words[2] = v5;
          updated = REShadowManagerSetShadowClusterRootUpdateHandler();
          v5 = v296;
          *(_BYTE *)(v296 + 192) = 1;
        }
      }
    }
    v53 = (rf::AnchorDefinitionComponent *)rf::AnchorDefinitionComponent::instance((rf::AnchorDefinitionComponent *)updated);
    if (*(_QWORD *)v53)
    {
      rf::AnchorDefinitionComponent::instance(v53);
      __n[0] = RESceneGetComponentsOfCustomType();
      __n[1] = v54;
      *(_QWORD *)buf = __n[0];
      ranges::remove_if_view<std::span<REComponent *,18446744073709551615ul>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>>::satisfy_forward(__n[0], v54, (uint64_t *)buf);
      v55 = *(char **)buf;
      __n[2] = *(_QWORD *)buf;
      LOBYTE(__n[3]) = 1;
      v298[0] = *(void **)buf;
      v298[1] = __n;
      v56 = (void *)(__n[0] + 8 * __n[1]);
      if (v56 != *(void **)buf)
      {
        v57 = (_QWORD *)(v283 + 144);
        EventBus = (int8x8_t)&v309;
        v2 = (unint64_t)off_24EFDA358;
        do
        {
          Object = 0;
          Object = RECustomComponentGetObject();
          Entity = 0;
          Entity = REComponentGetEntity();
          v58 = Object;
          uu.__r_.__value_.__s.__data_[16] = 0;
          v308 = 0;
          uuid_clear((unsigned __int8 *)&uu);
          uu.__r_.__value_.__r.__words[0] = v58;
          uu.__r_.__value_.__s.__data_[16] = 1;
          if (std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>(v57, (uint64_t)&uu))
          {
            v59 = std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>(v57, (uint64_t)&uu);
            if (!v59)
              goto LABEL_507;
            std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)buf, (uint64_t)(v59 + 6));
            SelfEnabled = REEntityGetSelfEnabled();
            if ((SelfEnabled & 1) == 0)
            {
              rf::realityFusionLogObject((rf *)SelfEnabled);
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                Name = REEntityGetName();
                LODWORD(v309.__r_.__value_.__l.__data_) = 136315138;
                *(std::string::size_type *)((char *)v309.__r_.__value_.__r.__words + 4) = Name;
                _os_log_impl(&dword_227777000, v61, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Enabling %s (a redefined anchor found).", (uint8_t *)&v309, 0xCu);
              }

              MEMORY[0x22E29D4B0](Entity, 1);
              RENetworkMarkEntityMetadataDirty();
            }
            v309.__r_.__value_.__r.__words[0] = (std::string::size_type)&Object;
            v309.__r_.__value_.__l.__size_ = (std::string::size_type)&Entity;
            v309.__r_.__value_.__r.__words[2] = (std::string::size_type)v55;
            if (v306 == -1)
              std::__throw_bad_variant_access[abi:ne180100]();
            v310[0] = &v309;
            ((void (*)(_QWORD *, uint8_t *))off_24EFDA358[v306])(v310, buf);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
          }
          else
          {
            MEMORY[0x22E29D4B0](Entity, 0);
            v63 = (rf *)RENetworkMarkEntityMetadataDirty();
            rf::realityFusionLogObject(v63);
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              v65 = REEntityGetName();
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v65;
              _os_log_impl(&dword_227777000, v64, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Disabling %s because it needs redifinition and there's no matching anchor in the state.", buf, 0xCu);
            }

          }
          v298[0] = v55 + 8;
          ranges::remove_if_view<std::span<REComponent *,18446744073709551615ul>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>>::satisfy_forward(*(_QWORD *)v298[1], *((_QWORD *)v298[1] + 1), (uint64_t *)v298);
          v55 = (char *)v298[0];
        }
        while (v298[0] != v56);
      }
      v5 = v296;
    }
  }
  if (!*(_QWORD *)(v5 + 152) || !*(_QWORD *)(v5 + 400))
    goto LABEL_376;
  v66 = (char *)RESceneGetUniqueName();
  std::string::basic_string[abi:ne180100]<0>(v298, v66);
  v67 = v296;
  v284 = (uint64_t *)(v296 + 416);
  v68 = (_QWORD *)(v296 + 440);
  v69 = std::__string_hash<char>::operator()[abi:ne180100](v296 + 440, (uint64_t)v298);
  v70 = *(int8x8_t *)(v296 + 424);
  if (v70)
  {
    v71 = v69;
    v72 = (uint8x8_t)vcnt_s8(v70);
    v72.i16[0] = vaddlv_u8(v72);
    v2 = v72.u32[0];
    if (v72.u32[0] > 1uLL)
    {
      EventBus = (int8x8_t)v69;
      if (v69 >= *(_QWORD *)&v70)
        EventBus = (int8x8_t)(v69 % *(_QWORD *)&v70);
    }
    else
    {
      EventBus = (int8x8_t)((*(_QWORD *)&v70 - 1) & v69);
    }
    v73 = *(unsigned __int8 ***)(*v284 + 8 * *(_QWORD *)&EventBus);
    if (v73)
    {
      for (k = *v73; k; k = *(unsigned __int8 **)k)
      {
        v75 = *((_QWORD *)k + 1);
        if (v71 == v75)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](v296 + 448, k + 16, (unsigned __int8 *)v298) & 1) != 0)
            goto LABEL_235;
        }
        else
        {
          if (v2 > 1)
          {
            if (v75 >= *(_QWORD *)&v70)
              v75 %= *(_QWORD *)&v70;
          }
          else
          {
            v75 &= *(_QWORD *)&v70 - 1;
          }
          if (v75 != *(_QWORD *)&EventBus)
            break;
        }
      }
    }
  }
  memset(__n, 0, sizeof(__n));
  LODWORD(v302[0]) = 1065353216;
  if (SHIBYTE(v299) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v298[0], (std::string::size_type)v298[1]);
    v77 = v302[0];
    v76 = __n[1];
  }
  else
  {
    v76 = 0;
    *(_OWORD *)buf = *(_OWORD *)v298;
    v304[0].__r_.__value_.__r.__words[0] = v299;
    v77 = 1065353216;
  }
  memset(&v304[0].__r_.__value_.__r.__words[1], 0, 32);
  LODWORD(v304[1].__r_.__value_.__r.__words[2]) = v77;
  std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,long long>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,long long>>>::__rehash<true>((uint64_t)&v304[0].__r_.__value_.__l.__size_, v76);
  for (m = __n[2]; m; m = *(_QWORD *)m)
  {
    v79 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v304[1].__r_.__value_.__l.__size_, m + 16);
    v80 = v79;
    v2 = v304[0].__r_.__value_.__r.__words[2];
    if (v304[0].__r_.__value_.__r.__words[2])
    {
      v81 = (uint8x8_t)vcnt_s8((int8x8_t)v304[0].__r_.__value_.__r.__words[2]);
      v81.i16[0] = vaddlv_u8(v81);
      v82 = v81.u32[0];
      if (v81.u32[0] > 1uLL)
      {
        EventBus = (int8x8_t)v79;
        if (v79 >= v304[0].__r_.__value_.__r.__words[2])
          EventBus = (int8x8_t)(v79 % v304[0].__r_.__value_.__r.__words[2]);
      }
      else
      {
        EventBus = (int8x8_t)((v304[0].__r_.__value_.__r.__words[2] - 1) & v79);
      }
      v83 = *(unsigned __int8 ***)(v304[0].__r_.__value_.__l.__size_ + 8 * *(_QWORD *)&EventBus);
      if (v83)
      {
        for (n = *v83; n; n = *(unsigned __int8 **)n)
        {
          v85 = *((_QWORD *)n + 1);
          if (v85 == v80)
          {
            if ((std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)&v304[1].__r_.__value_.__r.__words[2], n + 16, (unsigned __int8 *)(m + 16)) & 1) != 0)goto LABEL_183;
          }
          else
          {
            if (v82 > 1)
            {
              if (v85 >= v2)
                v85 %= v2;
            }
            else
            {
              v85 &= v2 - 1;
            }
            if (v85 != *(_QWORD *)&EventBus)
              break;
          }
        }
      }
    }
    v86 = operator new(0x30uLL);
    uu.__r_.__value_.__r.__words[0] = (std::string::size_type)v86;
    uu.__r_.__value_.__l.__size_ = (std::string::size_type)&v304[1];
    uu.__r_.__value_.__s.__data_[16] = 0;
    *v86 = 0;
    v86[1] = v80;
    v87 = (std::string *)(v86 + 2);
    if (*(char *)(m + 39) < 0)
    {
      std::string::__init_copy_ctor_external(v87, *(const std::string::value_type **)(m + 16), *(_QWORD *)(m + 24));
    }
    else
    {
      v88 = *(_OWORD *)(m + 16);
      v86[4] = *(_QWORD *)(m + 32);
      *(_OWORD *)&v87->__r_.__value_.__l.__data_ = v88;
    }
    v86[5] = *(id *)(m + 40);
    uu.__r_.__value_.__s.__data_[16] = 1;
    v89 = (float)(v304[1].__r_.__value_.__l.__size_ + 1);
    if (!v2 || (float)(*(float *)&v304[1].__r_.__value_.__r.__words[2] * (float)v2) < v89)
    {
      v90 = (v2 & (v2 - 1)) != 0;
      if (v2 < 3)
        v90 = 1;
      v91 = v90 | (2 * v2);
      v92 = vcvtps_u32_f32(v89 / *(float *)&v304[1].__r_.__value_.__r.__words[2]);
      if (v91 <= v92)
        v93 = v92;
      else
        v93 = v91;
      std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,long long>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,long long>>>::__rehash<true>((uint64_t)&v304[0].__r_.__value_.__l.__size_, v93);
      v2 = v304[0].__r_.__value_.__r.__words[2];
      if ((v304[0].__r_.__value_.__r.__words[2] & (v304[0].__r_.__value_.__r.__words[2] - 1)) != 0)
      {
        if (v80 >= v304[0].__r_.__value_.__r.__words[2])
          EventBus = (int8x8_t)(v80 % v304[0].__r_.__value_.__r.__words[2]);
        else
          EventBus = (int8x8_t)v80;
      }
      else
      {
        EventBus = (int8x8_t)((v304[0].__r_.__value_.__r.__words[2] - 1) & v80);
      }
    }
    v94 = v304[0].__r_.__value_.__l.__size_;
    v95 = *(_QWORD **)(v304[0].__r_.__value_.__l.__size_ + 8 * *(_QWORD *)&EventBus);
    if (v95)
    {
      *v86 = *v95;
    }
    else
    {
      *v86 = v304[1].__r_.__value_.__l.__data_;
      v304[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v86;
      *(_QWORD *)(v94 + 8 * *(_QWORD *)&EventBus) = &v304[1];
      if (!*v86)
        goto LABEL_182;
      v96 = *(_QWORD *)(*v86 + 8);
      if ((v2 & (v2 - 1)) != 0)
      {
        if (v96 >= v2)
          v96 %= v2;
      }
      else
      {
        v96 &= v2 - 1;
      }
      v95 = (_QWORD *)(v304[0].__r_.__value_.__l.__size_ + 8 * v96);
    }
    *v95 = v86;
LABEL_182:
    uu.__r_.__value_.__r.__words[0] = 0;
    ++v304[1].__r_.__value_.__l.__size_;
    std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,void *>>>>::reset[abi:ne180100]((uint64_t)&uu);
LABEL_183:
    ;
  }
  v97 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v68, (uint64_t)buf);
  v98 = v97;
  v67 = v296;
  v99 = *(_QWORD *)(v296 + 424);
  if (v99)
  {
    v100 = (uint8x8_t)vcnt_s8((int8x8_t)v99);
    v100.i16[0] = vaddlv_u8(v100);
    v101 = v100.u32[0];
    if (v100.u32[0] > 1uLL)
    {
      v2 = v97;
      if (v97 >= v99)
        v2 = v97 % v99;
    }
    else
    {
      v2 = (v99 - 1) & v97;
    }
    v102 = *(unsigned __int8 ***)(*v284 + 8 * v2);
    if (v102)
    {
      for (ii = *v102; ii; ii = *(unsigned __int8 **)ii)
      {
        v104 = *((_QWORD *)ii + 1);
        if (v104 == v98)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](v296 + 448, ii + 16, buf) & 1) != 0)
            goto LABEL_232;
        }
        else
        {
          if (v101 > 1)
          {
            if (v104 >= v99)
              v104 %= v99;
          }
          else
          {
            v104 &= v99 - 1;
          }
          if (v104 != v2)
            break;
        }
      }
    }
  }
  v105 = (char *)operator new(0x50uLL);
  v106 = (_QWORD *)(v296 + 432);
  uu.__r_.__value_.__r.__words[0] = (std::string::size_type)v105;
  uu.__r_.__value_.__l.__size_ = v296 + 432;
  uu.__r_.__value_.__s.__data_[16] = 0;
  *(_QWORD *)v105 = 0;
  *((_QWORD *)v105 + 1) = v98;
  v107 = (std::string *)(v105 + 16);
  if (v304[0].__r_.__value_.__s.__data_[7] < 0)
  {
    std::string::__init_copy_ctor_external(v107, *(const std::string::value_type **)buf, *(std::string::size_type *)&buf[8]);
  }
  else
  {
    *(_OWORD *)&v107->__r_.__value_.__l.__data_ = *(_OWORD *)buf;
    *((_QWORD *)v105 + 4) = v304[0].__r_.__value_.__r.__words[0];
  }
  v108 = *(_OWORD *)&v304[0].__r_.__value_.__r.__words[1];
  v109 = *(_OWORD *)&v304[1].__r_.__value_.__l.__data_;
  *((_QWORD *)v105 + 7) = v304[1].__r_.__value_.__l.__data_;
  *(_OWORD *)&v304[0].__r_.__value_.__r.__words[1] = 0uLL;
  *(_OWORD *)(v105 + 40) = v108;
  *((_QWORD *)v105 + 8) = *((_QWORD *)&v109 + 1);
  *((_DWORD *)v105 + 18) = v304[1].__r_.__value_.__r.__words[2];
  if (*((_QWORD *)&v109 + 1))
  {
    v110 = *(_QWORD *)(v109 + 8);
    if ((*((_QWORD *)&v108 + 1) & (*((_QWORD *)&v108 + 1) - 1)) != 0)
    {
      if (v110 >= *((_QWORD *)&v108 + 1))
        v110 %= *((_QWORD *)&v108 + 1);
    }
    else
    {
      v110 &= *((_QWORD *)&v108 + 1) - 1;
    }
    *(_QWORD *)(v108 + 8 * v110) = v105 + 56;
    *(_OWORD *)&v304[1].__r_.__value_.__l.__data_ = 0uLL;
  }
  uu.__r_.__value_.__s.__data_[16] = 1;
  v111 = (float)(unint64_t)(*(_QWORD *)(v296 + 440) + 1);
  v112 = *(float *)(v296 + 448);
  if (!v99 || (float)(v112 * (float)v99) < v111)
  {
    v113 = 1;
    if (v99 >= 3)
      v113 = (v99 & (v99 - 1)) != 0;
    v114 = v113 | (2 * v99);
    v115 = vcvtps_u32_f32(v111 / v112);
    if (v114 <= v115)
      v116 = v115;
    else
      v116 = v114;
    std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,long long>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,long long>>>::__rehash<true>((uint64_t)v284, v116);
    v99 = *(_QWORD *)(v296 + 424);
    if ((v99 & (v99 - 1)) != 0)
    {
      if (v98 >= v99)
        v2 = v98 % v99;
      else
        v2 = v98;
    }
    else
    {
      v2 = (v99 - 1) & v98;
    }
  }
  v117 = *v284;
  v118 = *(_QWORD **)(*v284 + 8 * v2);
  if (v118)
  {
    *(_QWORD *)v105 = *v118;
LABEL_230:
    *v118 = v105;
    goto LABEL_231;
  }
  *(_QWORD *)v105 = *v106;
  *v106 = v105;
  *(_QWORD *)(v117 + 8 * v2) = v106;
  if (*(_QWORD *)v105)
  {
    v119 = *(_QWORD *)(*(_QWORD *)v105 + 8);
    if ((v99 & (v99 - 1)) != 0)
    {
      if (v119 >= v99)
        v119 %= v99;
    }
    else
    {
      v119 &= v99 - 1;
    }
    v118 = (_QWORD *)(*v284 + 8 * v119);
    goto LABEL_230;
  }
LABEL_231:
  uu.__r_.__value_.__r.__words[0] = 0;
  ++*v68;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>>>>::reset[abi:ne180100]((uint64_t)&uu);
LABEL_232:
  std::__hash_table<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>>>::~__hash_table((uint64_t)&v304[0].__r_.__value_.__l.__size_);
  if (v304[0].__r_.__value_.__s.__data_[7] < 0)
    operator delete(*(void **)buf);
  std::__hash_table<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>>>::~__hash_table((uint64_t)__n);
LABEL_235:
  memset(__n, 0, sizeof(__n));
  LODWORD(v302[0]) = 1065353216;
  REAnchoringComponentGetComponentType();
  RESceneGetComponentsOfClass();
  v121 = v120;
  if (v120)
  {
    v287 = 0;
    v122 = 0;
    while (1)
    {
      if (REAnchoringComponentGetDescriptorType() != 4)
        goto LABEL_317;
      REComponentGetEntity();
      REClientAnchorSyncComponentGetComponentType();
      ComponentByClass = REEntityGetComponentByClass();
      if (!*(_BYTE *)(v67 + 160))
      {
        if (ComponentByClass)
          goto LABEL_317;
      }
      if (!REEntityIsEnabledInHierarchy())
        goto LABEL_317;
      REAnchoringComponentGetTrackingImageMTLTexture();
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      if (v124)
        break;
LABEL_316:

      v67 = v296;
LABEL_317:
      if (++v122 == v121)
        goto LABEL_320;
    }
    v294 = v124;
    if (!REAnchoringComponentGetDescriptorResourceStyle())
    {
      rf::getMessage((rf *)"AnchorManagementConsumer: Image anchoring target should not have kREAnchoringResourceNone", &uu);
      rf::internal::logAssert((const char *)&uu);
      if (SHIBYTE(uu.__r_.__value_.__r.__words[2]) < 0)
        operator delete(uu.__r_.__value_.__l.__data_);
      rf::internal::debugBreakHandler(v274);
      Object = 0;
      v305 = 0u;
      *(_OWORD *)buf = 0u;
      memset(v304, 0, sizeof(v304));
      os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      rf::getMessage((rf *)"AnchorManagementConsumer: Image anchoring target should not have kREAnchoringResourceNone", &v309);
      if ((v309.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v275 = &v309;
      else
        v275 = (std::string *)v309.__r_.__value_.__r.__words[0];
      LODWORD(v310[0]) = 136315138;
      *(_QWORD *)((char *)v310 + 4) = v275;
      _os_log_send_and_compose_impl();
      if (SHIBYTE(v309.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v309.__r_.__value_.__l.__data_);
      _os_crash_msg();
      __break(1u);
LABEL_507:
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    DescriptorResourceGroup = (char *)REAnchoringComponentGetDescriptorResourceGroup();
    v126 = strlen(DescriptorResourceGroup);
    DescriptorResourceName = (char *)REAnchoringComponentGetDescriptorResourceName();
    v128 = strlen(DescriptorResourceName);
    rf::helpers::getFullPath(DescriptorResourceGroup, v126, DescriptorResourceName, v128, &v309);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)__n, (unsigned __int8 *)&v309, (uint64_t)&v309);
    *(_QWORD *)buf = v298;
    v129 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v284, (unsigned __int8 *)v298, (__int128 **)buf);
    v130 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(v129 + 64), (uint64_t)&v309);
    v131 = *(int8x8_t *)(v129 + 48);
    if (v131)
    {
      v132 = v130;
      v133 = (uint8x8_t)vcnt_s8(v131);
      v133.i16[0] = vaddlv_u8(v133);
      v134 = v133.u32[0];
      if (v133.u32[0] > 1uLL)
      {
        v135 = v130;
        if (v130 >= *(_QWORD *)&v131)
          v135 = v130 % *(_QWORD *)&v131;
      }
      else
      {
        v135 = (*(_QWORD *)&v131 - 1) & v130;
      }
      v136 = *(unsigned __int8 ***)(*((_QWORD *)v129 + 5) + 8 * v135);
      if (v136)
      {
        v137 = *v136;
        if (*v136)
        {
          v138 = (uint64_t)(v129 + 72);
          do
          {
            v139 = *((_QWORD *)v137 + 1);
            if (v132 == v139)
            {
              if ((std::equal_to<std::string>::operator()[abi:ne180100](v138, v137 + 16, (unsigned __int8 *)&v309) & 1) != 0)
              {
                v124 = v294;
                goto LABEL_314;
              }
            }
            else
            {
              if (v134 > 1)
              {
                if (v139 >= *(_QWORD *)&v131)
                  v139 %= *(_QWORD *)&v131;
              }
              else
              {
                v139 &= *(_QWORD *)&v131 - 1;
              }
              if (v139 != v135)
                break;
            }
            v137 = *(unsigned __int8 **)v137;
          }
          while (v137);
        }
      }
    }
    REAnchoringComponentGetTrackingImageWidth();
    v141 = v140;
    objc_msgSend(MEMORY[0x24BDBF660], "imageWithMTLTexture:options:", v294, 0);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = *(void **)(v296 + 400);
    v280 = v142;
    objc_msgSend(v142, "extent");
    v144 = objc_msgSend(v143, "createCGImage:fromRect:", v142);
    *(_QWORD *)buf = v298;
    v145 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v284, (unsigned __int8 *)v298, (__int128 **)buf);
    v146 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFD998]), "initWithCGImage:orientation:physicalWidth:", v144, 2, v141);
    v147 = &v309;
    if ((v309.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v147 = (std::string *)v309.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "setName:", v148);

    rf::realityFusionLogObject(v149);
    v150 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v150, OS_LOG_TYPE_DEFAULT))
    {
      v151 = &v309;
      if ((v309.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v151 = (std::string *)v309.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v151;
      _os_log_impl(&dword_227777000, (os_log_t)v150, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Adding reference image %s", buf, 0xCu);
    }

    if (SHIBYTE(v309.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)buf, v309.__r_.__value_.__l.__data_, v309.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)buf = *(_OWORD *)&v309.__r_.__value_.__l.__data_;
      v304[0].__r_.__value_.__r.__words[0] = v309.__r_.__value_.__r.__words[2];
    }
    v288 = (uint64_t *)(v145 + 40);
    v276 = v146;
    v304[0].__r_.__value_.__l.__size_ = (std::string::size_type)v276;
    v152 = v145 + 64;
    v153 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(v145 + 64), (uint64_t)buf);
    v154 = v153;
    v155 = *((_QWORD *)v145 + 6);
    if (v155)
    {
      v156 = (uint8x8_t)vcnt_s8((int8x8_t)v155);
      v156.i16[0] = vaddlv_u8(v156);
      v157 = v156.u32[0];
      if (v156.u32[0] > 1uLL)
      {
        v150 = v153;
        if (v153 >= v155)
          v150 = v153 % v155;
      }
      else
      {
        v150 = (v155 - 1) & v153;
      }
      v158 = *(unsigned __int8 ***)(*v288 + 8 * v150);
      if (v158)
      {
        for (jj = *v158; jj; jj = *(unsigned __int8 **)jj)
        {
          v160 = *((_QWORD *)jj + 1);
          if (v160 == v154)
          {
            if ((std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)(v145 + 72), jj + 16, buf) & 1) != 0)
              goto LABEL_311;
          }
          else
          {
            if (v157 > 1)
            {
              if (v160 >= v155)
                v160 %= v155;
            }
            else
            {
              v160 &= v155 - 1;
            }
            if (v160 != v150)
              break;
          }
        }
      }
      v152 = v145 + 64;
    }
    v161 = operator new(0x30uLL);
    v162 = v145 + 56;
    uu.__r_.__value_.__r.__words[0] = (std::string::size_type)v161;
    uu.__r_.__value_.__l.__size_ = (std::string::size_type)(v145 + 56);
    uu.__r_.__value_.__s.__data_[16] = 0;
    *v161 = 0;
    v161[1] = v154;
    v163 = (std::string *)(v161 + 2);
    if (v304[0].__r_.__value_.__s.__data_[7] < 0)
    {
      std::string::__init_copy_ctor_external(v163, *(const std::string::value_type **)buf, *(std::string::size_type *)&buf[8]);
    }
    else
    {
      *(_OWORD *)&v163->__r_.__value_.__l.__data_ = *(_OWORD *)buf;
      v161[4] = v304[0].__r_.__value_.__r.__words[0];
    }
    v164 = v304[0].__r_.__value_.__l.__size_;
    v304[0].__r_.__value_.__l.__size_ = 0;
    v161[5] = v164;
    uu.__r_.__value_.__s.__data_[16] = 1;
    v165 = (float)(unint64_t)(*((_QWORD *)v145 + 8) + 1);
    v166 = *((float *)v145 + 18);
    if (!v155 || (float)(v166 * (float)v155) < v165)
    {
      v167 = (v155 & (v155 - 1)) != 0;
      if (v155 < 3)
        v167 = 1;
      v168 = v167 | (2 * v155);
      v169 = vcvtps_u32_f32(v165 / v166);
      if (v168 <= v169)
        v170 = v169;
      else
        v170 = v168;
      std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,long long>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,long long>>>::__rehash<true>((uint64_t)v288, v170);
      v155 = *((_QWORD *)v145 + 6);
      if ((v155 & (v155 - 1)) != 0)
      {
        if (v154 >= v155)
          v150 = v154 % v155;
        else
          v150 = v154;
      }
      else
      {
        v150 = (v155 - 1) & v154;
      }
    }
    v171 = *v288;
    v172 = *(_QWORD **)(*v288 + 8 * v150);
    if (v172)
    {
      *v161 = *v172;
    }
    else
    {
      *v161 = *v162;
      *v162 = v161;
      *(_QWORD *)(v171 + 8 * v150) = v162;
      if (!*v161)
      {
LABEL_310:
        uu.__r_.__value_.__r.__words[0] = 0;
        ++*v152;
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,void *>>>>::reset[abi:ne180100]((uint64_t)&uu);
LABEL_311:

        v124 = v294;
        if (v304[0].__r_.__value_.__s.__data_[7] < 0)
          operator delete(*(void **)buf);

        v287 = 1;
LABEL_314:
        if (SHIBYTE(v309.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v309.__r_.__value_.__l.__data_);
        goto LABEL_316;
      }
      v173 = *(_QWORD *)(*v161 + 8);
      if ((v155 & (v155 - 1)) != 0)
      {
        if (v173 >= v155)
          v173 %= v155;
      }
      else
      {
        v173 &= v155 - 1;
      }
      v172 = (_QWORD *)(*v288 + 8 * v173);
    }
    *v172 = v161;
    goto LABEL_310;
  }
  v287 = 0;
LABEL_320:
  *(_QWORD *)buf = v298;
  v174 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v284, (unsigned __int8 *)v298, (__int128 **)buf);
  v277 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v176 = (unsigned __int8 *)(v174 + 56);
  v175 = (unsigned __int8 *)*((_QWORD *)v174 + 7);
  if (v175)
  {
    do
    {
      v177 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__n[3], (uint64_t)(v175 + 16));
      v178 = __n[1];
      if (__n[1])
      {
        v179 = v177;
        v180 = (uint8x8_t)vcnt_s8((int8x8_t)__n[1]);
        v180.i16[0] = vaddlv_u8(v180);
        v181 = v180.u32[0];
        if (v180.u32[0] > 1uLL)
        {
          v182 = v177;
          if (v177 >= __n[1])
            v182 = v177 % __n[1];
        }
        else
        {
          v182 = (__n[1] - 1) & v177;
        }
        v183 = *(unsigned __int8 ***)(__n[0] + 8 * v182);
        if (v183)
        {
          for (kk = *v183; kk; kk = *(unsigned __int8 **)kk)
          {
            v185 = *((_QWORD *)kk + 1);
            if (v179 == v185)
            {
              v177 = std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)v302, kk + 16, v175 + 16);
              if ((v177 & 1) != 0)
              {
                v198 = *(uint64_t **)v175;
                v67 = v296;
                goto LABEL_367;
              }
            }
            else
            {
              if (v181 > 1)
              {
                if (v185 >= v178)
                  v185 %= v178;
              }
              else
              {
                v185 &= v178 - 1;
              }
              if (v185 != v182)
                break;
            }
          }
        }
      }
      rf::realityFusionLogObject((rf *)v177);
      v186 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*((id *)v175 + 5), "name");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v187;
        _os_log_impl(&dword_227777000, v186, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Removing reference image %@", buf, 0xCu);

      }
      v188 = *(int8x8_t *)(v174 + 48);
      v189 = *((_QWORD *)v175 + 1);
      v190 = (uint8x8_t)vcnt_s8(v188);
      v190.i16[0] = vaddlv_u8(v190);
      if (v190.u32[0] > 1uLL)
      {
        v67 = v296;
        if (v189 >= *(_QWORD *)&v188)
          v189 %= *(_QWORD *)&v188;
      }
      else
      {
        v189 &= *(_QWORD *)&v188 - 1;
        v67 = v296;
      }
      v198 = *(uint64_t **)v175;
      v191 = *((_QWORD *)v174 + 5);
      v192 = *(unsigned __int8 **)(v191 + 8 * v189);
      do
      {
        v193 = v192;
        v192 = *(unsigned __int8 **)v192;
      }
      while (v192 != v175);
      if (v193 == v176)
        goto LABEL_513;
      v194 = *((_QWORD *)v193 + 1);
      if (v190.u32[0] > 1uLL)
      {
        if (v194 >= *(_QWORD *)&v188)
          v194 %= *(_QWORD *)&v188;
      }
      else
      {
        v194 &= *(_QWORD *)&v188 - 1;
      }
      v195 = *(uint64_t **)v175;
      if (v194 != v189)
      {
LABEL_513:
        if (v198)
        {
          v196 = v198[1];
          if (v190.u32[0] > 1uLL)
          {
            v197 = v198[1];
            if (v196 >= *(_QWORD *)&v188)
              v197 = v196 % *(_QWORD *)&v188;
          }
          else
          {
            v197 = v196 & (*(_QWORD *)&v188 - 1);
          }
          v195 = *(uint64_t **)v175;
          if (v197 == v189)
            goto LABEL_360;
        }
        *(_QWORD *)(v191 + 8 * v189) = 0;
        v195 = *(uint64_t **)v175;
      }
      if (!v195)
        goto LABEL_366;
      v196 = v195[1];
LABEL_360:
      if (v190.u32[0] > 1uLL)
      {
        if (v196 >= *(_QWORD *)&v188)
          v196 %= *(_QWORD *)&v188;
      }
      else
      {
        v196 &= *(_QWORD *)&v188 - 1;
      }
      if (v196 != v189)
      {
        *(_QWORD *)(*((_QWORD *)v174 + 5) + 8 * v196) = v193;
        v195 = *(uint64_t **)v175;
      }
LABEL_366:
      *(_QWORD *)v193 = v195;
      *(_QWORD *)v175 = 0;
      --*((_QWORD *)v174 + 8);
      *(_QWORD *)buf = v175;
      *(_QWORD *)&buf[8] = v174 + 56;
      v287 = 1;
      v304[0].__r_.__value_.__s.__data_[0] = 1;
      std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,void *>>>>::reset[abi:ne180100]((uint64_t)buf);
LABEL_367:
      v175 = (unsigned __int8 *)v198;
    }
    while (v198);
  }
  if ((v287 & 1) != 0)
  {
    while (1)
    {
      v176 = *(unsigned __int8 **)v176;
      if (!v176)
        break;
      objc_msgSend(v277, "addObject:", *((_QWORD *)v176 + 5));
    }
    if (*(_QWORD *)(v67 + 152))
      std::function<void ()(NSSet<ARReferenceImage *> *)>::operator()(v67 + 128, v277);
  }

  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)__n);
  if (SHIBYTE(v299) < 0)
    operator delete(v298[0]);
  v5 = v296;
LABEL_376:
  if (*(_BYTE *)(v5 + 61))
  {
    if (!*(_BYTE *)(v296 + 160))
    {
      REAnchorComponentGetComponentType();
      RESceneGetComponentsOfClass();
      if (v199)
      {
        v200 = v199;
        do
        {
          if ((REAnchorComponentGetAnchoredLocally() & 1) == 0)
          {
            REComponentGetEntity();
            isRemotelyOwned = rf::helpers::isRemotelyOwned();
            if ((isRemotelyOwned & 1) == 0)
            {
              rf::realityFusionLogObject((rf *)isRemotelyOwned);
              v202 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
              {
                v203 = REEntityGetName();
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = v203;
                _os_log_impl(&dword_227777000, v202, OS_LOG_TYPE_DEFAULT, "Entity \"%s\" anchor added/modified by local peer - removing.", buf, 0xCu);
              }

              REAnchorComponentGetComponentType();
              REEntityRemoveComponentByClass();
            }
          }
          --v200;
        }
        while (v200);
      }
    }
  }
  if (*(_BYTE *)(v283 + 2880))
    *(_BYTE *)(v296 + 408) = 1;
  if (re::internal::enableSignposts(0, 0))
    kdebug_trace();
  RESceneUnderstandingRootComponentGetComponentType();
  RESceneGetComponentsOfClass();
  v205 = v204;
  if (!RESceneGetECSManagerNullable() || !REECSManagerGetServiceLocator())
  {
LABEL_394:
    v207 = 0;
    goto LABEL_395;
  }
  v206 = MEMORY[0x22E29DA50]();
  v207 = v206;
  if (v206)
  {
    if ((REShadowManagerGetShadowPatchFlatteningEnabled() & 1) == 0)
    {
      ShadowEnabled = (rf *)REShadowManagerGetShadowEnabled();
      v207 = (int)ShadowEnabled;
      if (v205)
      {
        REComponentGetEntity();
        RESceneUnderstandingRenderOptionsComponentGetComponentType();
        if (REEntityGetComponentByClass())
        {
          v207 &= ~RESceneUnderstandingRenderOptionsComponentIsShadowEnabled();
          goto LABEL_395;
        }
        rf::realityFusionLogObject(0);
        v269 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v269, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_227777000, v269, OS_LOG_TYPE_DEFAULT, "The root entity should have render option component!", buf, 2u);
        }
      }
      else
      {
        rf::realityFusionLogObject(ShadowEnabled);
        v269 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v269, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_227777000, v269, OS_LOG_TYPE_DEFAULT, "We should have a root entity!", buf, 2u);
        }
      }

      goto LABEL_395;
    }
    goto LABEL_394;
  }
LABEL_395:
  REAnchoringComponentGetComponentType();
  ComponentsOfClass = RESceneGetComponentsOfClass();
  v210 = (uint64_t *)ComponentsOfClass;
  v211 = v209;
  if (v209)
  {
    v212 = 8 * v209;
    v213 = ComponentsOfClass;
    do
    {
      REAnchoringComponentInitializeWorldTransformIfNeeded();
      v213 += 8;
      v212 -= 8;
    }
    while (v212);
  }
  v214 = v283 + 64;
  if (!*(_BYTE *)(v296 + 160))
  {
    RECoordinateSpaceDefinitionComponentGetComponentType();
    v215 = RESceneGetComponentsOfClass();
    *(_QWORD *)buf = 0;
    if (v216)
    {
      v217 = v215;
      v218 = 8 * v216;
      do
      {
        v219 = REComponentGetEntity();
        REAnchorComponentGetComponentType();
        v220 = REEntityGetComponentByClass();
        REAnchoringComponentGetComponentType();
        v221 = REEntityGetComponentByClass();
        if (v221)
          rf::data_flow::consumer::AnchorManagementConsumer::matchOrUpdateAnchorComponent(v296, v291, v219, v220, v221, v214, v207, (unint64_t *)buf);
        v217 += 8;
        v218 -= 8;
      }
      while (v218);
    }
  }
  uu.__r_.__value_.__r.__words[0] = 0;
  if (v211)
  {
    v222 = &v210[v211];
    do
    {
      v223 = REComponentGetEntity();
      RECoordinateSpaceDefinitionComponentGetComponentType();
      if (!REEntityGetComponentByClass())
      {
        REAnchorComponentGetComponentType();
        v224 = REEntityGetComponentByClass();
        REAnchorComponentGetComponentType();
        v225 = REEntityGetComponentByClass();
        rf::data_flow::consumer::AnchorManagementConsumer::updateReceiveIsAnchoredOnClientForComponent(v296, v223, v225);
        v226 = rf::helpers::needAnchoringInClientProcessForEntity((_BYTE *)(v296 + 161), v223);
        v227 = rf::helpers::needAnchoringInServerProcessForEntity(v223);
        REClientAnchorSyncComponentGetComponentType();
        v228 = REEntityGetComponentByClass();
        if (*(_BYTE *)(v296 + 160))
          v229 = v226;
        else
          v229 = v227;
        if (v229 == 1)
        {
          rf::data_flow::consumer::AnchorManagementConsumer::matchOrUpdateAnchorComponent(v296, v291, v223, v224, *v210, v214, v207, (unint64_t *)&uu);
        }
        else if (!*(_BYTE *)(v296 + 160) && v228)
        {
          isAnchoringTypeAuthorizedForPeer = rf::helpers::isAnchoringTypeAuthorizedForPeer(*v210, (_QWORD *)(v283 + 232));
          if ((REClientAnchorSyncComponentIsAnchored() & isAnchoringTypeAuthorizedForPeer) == 1)
          {
            if (rf::CoordinateSpaceTracker::findCoordinateSpaceDefinitionEntity(v223))
            {
              REAnchoringComponentGetComponentType();
              if (REEntityGetComponentByClass())
              {
                if (REAnchoringComponentGetDescriptorType() - 1 <= 4)
                {
                  REEntityCalculateWorldMatrix4x4F();
                  v285 = v232;
                  v289 = v231;
                  v278 = v234;
                  v281 = v233;
                  REClientAnchorSyncComponentGetAnchorTransform();
                  v235 = 0;
                  *(_OWORD *)__n = v236;
                  *(_OWORD *)&__n[2] = v237;
                  v302[0] = v238;
                  v302[1] = v239;
                  do
                  {
                    *(float32x4_t *)&buf[v235 * 8] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v289, COERCE_FLOAT(*(_OWORD *)&__n[v235])), v285, (float32x2_t)__n[v235], 1), v281, *(float32x4_t *)&__n[v235], 2), v278, *(float32x4_t *)&__n[v235], 3);
                    v235 += 2;
                  }
                  while (v235 != 8);
                  rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorComponentFromClientAnchorSyncComponent(REEntity *,REComponent *)::appManagedAnchorIdentifier = -1;
                  unk_2558FA0C0 = -1;
                  REAnchorComponentGetComponentType();
                  v240 = REEntityGetComponentByClass();
                  if (v240)
                  {
                    RERetain();
                    v241 = v240;
                  }
                  else
                  {
                    REAnchorComponentGetComponentType();
                    v241 = REComponentCreateByClass();
                    rf::data_flow::consumer::AnchorManagementConsumer::updateReceiveIsAnchoredOnClientForComponent(v296, v223, v241);
                  }
                  REAnchorComponentSetAnchoredLocally();
                  REAnchorComponentSetWorldTransform();
                  REAnchorComponentSetAnchorIdentifier();
                  IsAnchorExternal = REAnchorComponentGetIsAnchorExternal();
                  IsExternal = REClientAnchorSyncComponentIsExternal();
                  if (IsAnchorExternal != IsExternal)
                  {
                    REAnchorComponentSetIsAnchorExternal();
                    v244 = *(_QWORD *)(v296 + 48);
                    if (v244)
                    {
                      if (IsExternal)
                        v245 = 4;
                      else
                        v245 = 5;
                      *(_QWORD *)buf = v223;
                      LODWORD(__n[0]) = v245;
                      (*(void (**)(uint64_t, uint8_t *, size_t *))(*(_QWORD *)v244 + 48))(v244, buf, __n);
                    }
                  }
                  if (!v240)
                  {
                    RENetworkComponentGetComponentType();
                    v246 = REEntityGetComponentByClass();
                    if (v246)
                      MEMORY[0x22E29D678](v246, v241);
                    REEntityAddExistingComponent();
                  }
                  RERelease();
                }
              }
            }
          }
          else
          {
            REAnchorComponentGetComponentType();
            if (REEntityGetComponentByClass())
              rf::data_flow::consumer::AnchorManagementConsumer::unanchorEntity(v296, v223);
          }
        }
      }
      ++v210;
    }
    while (v210 != v222);
  }
  if (*(_BYTE *)(v296 + 160))
  {
    REAnchoringComponentGetComponentType();
    v247 = RESceneGetComponentsOfClass();
    if (v248)
    {
      v249 = v247;
      v250 = 8 * v248;
      v279 = (float32x4_t)vdupq_n_s32(0x3727C5ACu);
      do
      {
        DescriptorType = REAnchoringComponentGetDescriptorType();
        v252 = REComponentGetEntity();
        if (!rf::helpers::needAnchoringInClientProcessForEntity((_BYTE *)(v296 + 161), v252))
          goto LABEL_442;
        RECoordinateSpaceDefinitionComponentGetComponentType();
        if (REEntityGetComponentByClass())
          goto LABEL_442;
        REClientAnchorSyncComponentGetComponentType();
        REEntityGetOrAddComponentByClass();
        REAnchorComponentGetComponentType();
        v253 = REEntityGetComponentByClass();
        if ((v253 != 0) != REClientAnchorSyncComponentIsAnchored())
        {
          REClientAnchorSyncComponentSetIsAnchored();
          RENetworkMarkComponentDirty();
        }
        v254 = REClientAnchorSyncComponentIsExternal();
        if (v253)
        {
          if (v254 == REAnchorComponentGetIsAnchorExternal())
          {
            if ((DescriptorType - 1) <= 4)
              goto LABEL_455;
            goto LABEL_442;
          }
        }
        else if ((v254 & 1) == 0)
        {
          goto LABEL_442;
        }
        REClientAnchorSyncComponentSetIsExternal();
        RENetworkMarkComponentDirty();
        if ((DescriptorType - 1) < 5 && v253 != 0)
        {
LABEL_455:
          REAnchorComponentGetWorldTransform();
          v295 = v256;
          v286 = v258;
          v290 = v257;
          v282 = v259;
          REClientAnchorSyncComponentGetAnchorTransform();
          if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v279, vabdq_f32(v295, v260)), (int8x16_t)vcgeq_f32(v279, vabdq_f32(v290, v261))), vandq_s8((int8x16_t)vcgeq_f32(v279, vabdq_f32(v286, v262)), (int8x16_t)vcgeq_f32(v279, vabdq_f32(v282, v263))))) & 0x80000000) == 0)
          {
            REClientAnchorSyncComponentSetAnchorTransform();
            RENetworkMarkComponentDirty();
          }
        }
LABEL_442:
        v249 += 8;
        v250 -= 8;
      }
      while (v250);
    }
  }
  result = re::internal::enableSignposts(0, 0);
  if ((_DWORD)result)
    result = kdebug_trace();
  if (*(_BYTE *)(v296 + 409))
    *(_WORD *)(v296 + 408) = 0;
  if (*(_BYTE *)(v296 + 160))
  {
    REClientAnchorSyncComponentGetComponentType();
    result = RESceneGetComponentsOfClass();
    if (v264)
    {
      v265 = result;
      v266 = 8 * v264;
      do
      {
        v267 = REComponentGetEntity();
        result = rf::helpers::needAnchoringInClientProcessForEntity((_BYTE *)(v296 + 161), v267);
        if ((result & 1) == 0)
        {
          REClientAnchorSyncComponentGetComponentType();
          result = REEntityRemoveComponentByClass();
        }
        v265 += 8;
        v266 -= 8;
      }
      while (v266);
    }
  }
  return result;
}

void sub_2277E2820(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,char a40,void *__p,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,int a53,__int16 a54,char a55,char a56)
{
  uint64_t v56;

  if (a46 < 0)
    operator delete(__p);
  if (*(char *)(v56 - 185) < 0)
    operator delete(*(void **)(v56 - 208));
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::unordered_map<std::string,ARReferenceImage * {__strong}>>::~pair(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::pair<std::string const,ARReferenceImage * {__strong}>::~pair(uint64_t a1)
{

  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void std::function<void ()(NSSet<ARReferenceImage *> *)>::operator()(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, id *))(*(_QWORD *)v3 + 48))(v3, &v4);

}

void sub_2277E2B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void rf::data_flow::consumer::AnchorManagementConsumer::matchOrUpdateAnchorComponent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, unint64_t *a8)
{
  uint64_t ComponentByClass;
  int v13;
  int v14;
  BOOL v15;
  BOOL v16;
  const unsigned __int8 *DescriptorCachedAnchorIdentifier;
  _QWORD *AnchorFromAllAnchors;
  char v19;
  uint64_t v20;
  rf *v21;
  NSObject *v22;
  int v23;
  void **v24;
  uint64_t Name;
  void **p_p;
  uint64_t v27;
  int v28;
  int isRemotelyOwned;
  int AnchoredLocally;
  uint64_t AnchorIdentifier;
  rf::PlacementComponentTypeInfo *v32;
  uint64_t *v33;
  uint64_t CustomComponent;
  uint64_t v35;
  uint64_t IsAnchorExternal;
  int v37;
  int v38;
  __int128 *v39;
  unsigned __int8 *v40;
  const unsigned __int8 *v41;
  unint64_t v42;
  int8x8_t v43;
  uint8x8_t v44;
  unint64_t v45;
  unint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t LocalId;
  rf::helpers *InternalActiveCamera;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD *v55;
  _QWORD *v56;
  unint64_t v57;
  _QWORD *v58;
  rf::PlacementComponentTypeInfo *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  _QWORD *v67;
  __int128 *v68;
  __int128 v69;
  rf *v70;
  unint64_t v71;
  NSObject *v72;
  rf *updated;
  unint64_t v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  int v80;
  const char *v81;
  _BOOL4 v82;
  int DescriptorType;
  rf *v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int IsAnchored;
  int v90;
  int v91;
  int v92;
  uint64_t v93;
  _QWORD *v94;
  unint64_t v95;
  unint64_t v96;
  uint8x8_t v97;
  _QWORD *v98;
  _QWORD *i;
  unint64_t v100;
  _QWORD *v101;
  float v102;
  _BOOL8 v103;
  unint64_t v104;
  unint64_t v105;
  size_t v106;
  uint64_t v107;
  _QWORD *v108;
  unint64_t v109;
  char shouldAnchorEntityRequiringClientAnchoring;
  uint64_t Parent;
  _BOOL4 v112;
  unint64_t v113;
  unint64_t v114;
  _BOOL4 v115;
  uint64_t v116;
  int v117;
  uint64_t v118;
  uint64_t SceneNullable;
  rf *v120;
  rf *v121;
  NSObject *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  unint64_t v126;
  NSObject *v127;
  unint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  unsigned __int8 *v134;
  rf::internal *v135;
  int v136;
  __int128 v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  int v141;
  __int128 v142;
  rf::helpers *v143;
  unint64_t *v145[2];
  void *__p;
  uint64_t v147;
  char v148;
  _BYTE v149[12];
  __int16 v150;
  uint64_t v151;
  char v152;
  uint8_t buf[4];
  void **v154;
  __int16 v155;
  uint64_t v156;
  uuid_t uu;
  char v158;
  unint64_t v159;
  uint8_t v160[32];
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  int v165;
  int v166;
  char v167;
  uint64_t v168;
  int v169;
  char v170;
  uint64_t v171;

  LODWORD(v140) = a7;
  ComponentByClass = a4;
  v171 = *MEMORY[0x24BDAC8D0];
  v13 = *(unsigned __int8 *)(a1 + 408);
  v14 = *(_DWORD *)(a6 + 2824);
  if (*(_BYTE *)(a1 + 408))
    v15 = v14 == 2;
  else
    v15 = 0;
  if (v15)
  {
    *(_BYTE *)(a1 + 409) = 1;
    rf::helpers::cacheAnchorBeforeTravelMode(a4);
    v13 = *(unsigned __int8 *)(a1 + 408);
    v14 = *(_DWORD *)(a6 + 2824);
  }
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 0;
  if (v16)
  {
    *(_BYTE *)(a1 + 409) = 1;
    if (!ComponentByClass || REAnchoringComponentGetDescriptorType() != 1)
      goto LABEL_30;
    DescriptorCachedAnchorIdentifier = (const unsigned __int8 *)REAnchoringComponentGetDescriptorCachedAnchorIdentifier();
    if (uuid_compare(UUID_NULL, DescriptorCachedAnchorIdentifier)
      && (v158 = 0,
          v159 = 0,
          uuid_clear(uu),
          *(_QWORD *)uu = DescriptorCachedAnchorIdentifier,
          v158 = 1,
          AnchorFromAllAnchors = rf::helpers::tryGetAnchorFromAllAnchors(a6, (uint64_t)uu),
          v19))
    {
      v20 = (uint64_t)AnchorFromAllAnchors;
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v160, (uint64_t)AnchorFromAllAnchors);
      rf::data_flow::consumer::AnchorManagementConsumer::anchorEntity(a1, a3, (uint64_t)v160, a5, (rf::helpers *)(a6 + 80), 1);
      v21 = (rf *)std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v160);
      rf::realityFusionLogObject(v21);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        rf::helpers::getRFUUIDFromAnchor(v20, (uint64_t)v149);
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v149, &__p);
        v23 = v148;
        v24 = (void **)__p;
        Name = REEntityGetName();
        p_p = &__p;
        if (v23 < 0)
          p_p = v24;
        *(_DWORD *)buf = 136315394;
        v154 = p_p;
        v155 = 2080;
        v156 = Name;
        _os_log_impl(&dword_227777000, v22, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Restoring cached anchor %s for entity %s.", buf, 0x16u);
        if (v148 < 0)
          operator delete(__p);
      }

      if (std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>((_QWORD *)(a6 + 120), (uint64_t)uu))
      {
        REAnchorComponentSetIsAnchorExternal();
        if (REAnchorComponentGetSendIsAnchoredToClient())
          RENetworkMarkComponentDirty();
        v27 = *(_QWORD *)(a1 + 48);
        if (!v27)
          goto LABEL_30;
        v28 = 4;
        goto LABEL_29;
      }
      v27 = *(_QWORD *)(a1 + 48);
      if (v27)
      {
        v28 = 1;
LABEL_29:
        *(_QWORD *)v149 = a3;
        LODWORD(__p) = v28;
        (*(void (**)(uint64_t, _BYTE *, void **))(*(_QWORD *)v27 + 48))(v27, v149, &__p);
      }
    }
    else
    {
      rf::data_flow::consumer::AnchorManagementConsumer::unanchorEntity(a1, a3);
      REAnchoringComponentSetDescriptorCachedAnchorIdentifier();
    }
LABEL_30:
    REAnchorComponentGetComponentType();
    ComponentByClass = REEntityGetComponentByClass();
  }
  v143 = (rf::helpers *)(a6 + 80);
  isRemotelyOwned = rf::helpers::isRemotelyOwned();
  AnchoredLocally = 0;
  if ((isRemotelyOwned & 1) == 0 && ComponentByClass)
    AnchoredLocally = REAnchorComponentGetAnchoredLocally();
  REAnchoringComponentGetDescriptorType();
  v145[0] = a8;
  v145[1] = (unint64_t *)a1;
  REEntityIsEnabledInHierarchy();
  if (isRemotelyOwned)
  {
    if (REAnchoringComponentGetDescriptorType() < 2)
      return;
    LODWORD(v139) = rf::helpers::needAnchoringInClientProcessForEntity((_BYTE *)(a1 + 161), a3);
    if (!ComponentByClass)
      return;
    v141 = isRemotelyOwned;
  }
  else
  {
    v141 = 0;
    LODWORD(v139) = rf::helpers::needAnchoringInClientProcessForEntity((_BYTE *)(a1 + 161), a3);
    if (!ComponentByClass)
      goto LABEL_145;
  }
  AnchorIdentifier = REAnchorComponentGetAnchorIdentifier();
  v158 = 0;
  v159 = 0;
  uuid_clear(uu);
  *(_QWORD *)uu = AnchorIdentifier;
  v158 = 1;
  v33 = rf::PlacementComponentTypeInfo::instance(v32);
  if (*v33)
    CustomComponent = REEntityGetCustomComponent();
  else
    CustomComponent = 0;
  __p = v33;
  v147 = CustomComponent;
  REClientAnchorSyncComponentGetComponentType();
  v35 = REEntityGetComponentByClass();
  IsAnchorExternal = (uint64_t)std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>((_QWORD *)(a6 + 120), (uint64_t)uu);
  if (IsAnchorExternal)
  {
    IsAnchorExternal = REAnchorComponentGetIsAnchorExternal();
    v37 = IsAnchorExternal ^ 1;
  }
  else
  {
    v37 = 0;
  }
  if (v141)
  {
    IsAnchorExternal = REAnchorComponentGetRequiresLocalAnchoring();
    if ((IsAnchorExternal & 1) == 0)
      IsAnchorExternal = REAnchorComponentSetRequiresLocalAnchoring();
  }
  else if ((AnchoredLocally | v139 ^ 1) == 1)
  {
    IsAnchorExternal = rf::helpers::validateAnchorState(a5, ComponentByClass, a6);
    if ((IsAnchorExternal & 1) == 0)
    {
      rf::realityFusionLogObject((rf *)IsAnchorExternal);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v160 = 0;
        _os_log_impl(&dword_227777000, v47, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Failed to validate anchor state.", v160, 2u);
      }
      goto LABEL_68;
    }
  }
  v38 = *(unsigned __int8 *)(a1 + 160);
  if (*(_BYTE *)(a1 + 160))
  {
    IsAnchorExternal = rf::helpers::isAnchoringTypeAuthorizedForSelf(a5, *(_QWORD *)(a6 + 160));
    if (!(_DWORD)IsAnchorExternal)
      goto LABEL_66;
    v38 = *(unsigned __int8 *)(a1 + 160);
  }
  if (!v38)
  {
    if (v35)
    {
      IsAnchorExternal = rf::helpers::isAnchoringTypeAuthorizedForPeer(a5, (_QWORD *)(a6 + 168));
      if ((IsAnchorExternal & 1) == 0)
      {
LABEL_66:
        rf::realityFusionLogObject((rf *)IsAnchorExternal);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = REEntityGetName();
          LocalId = REEntityGetLocalId();
          *(_DWORD *)v160 = 136315394;
          *(_QWORD *)&v160[4] = v48;
          *(_WORD *)&v160[12] = 2048;
          *(_QWORD *)&v160[14] = LocalId;
          _os_log_impl(&dword_227777000, v47, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Entity %s(%llu) is no longer authorized to be anchored.", v160, 0x16u);
        }
LABEL_68:

        rf::data_flow::consumer::AnchorManagementConsumer::unanchorEntity(a1, a3);
        goto LABEL_131;
      }
    }
  }
  v39 = rf::helpers::kCameraIdentifier((rf::helpers *)IsAnchorExternal);
  v40 = uu;
  if (v158)
    v40 = *(unsigned __int8 **)uu;
  if (*((_BYTE *)v39 + 16))
    v41 = *(const unsigned __int8 **)v39;
  else
    v41 = (const unsigned __int8 *)v39;
  if (uuid_compare(v40, v41) || !rf::helpers::getInternalActiveCamera())
  {
    v136 = v37;
    v138 = a5;
    v42 = v159;
    if (!v159)
    {
      v134 = uu;
      if (v158)
        v134 = *(unsigned __int8 **)uu;
      v42 = ((*(_QWORD *)v134 >> 2) + (*(_QWORD *)v134 << 6) + *((_QWORD *)v134 + 1) + 2654435769) ^ *(_QWORD *)v134;
      v159 = v42;
    }
    v43 = *(int8x8_t *)(a6 + 2264);
    if (v43)
    {
      v44 = (uint8x8_t)vcnt_s8(v43);
      v44.i16[0] = vaddlv_u8(v44);
      v45 = v44.u32[0];
      if (v44.u32[0] > 1uLL)
      {
        v46 = v42;
        if (v42 >= *(_QWORD *)&v43)
          v46 = v42 % *(_QWORD *)&v43;
      }
      else
      {
        v46 = (*(_QWORD *)&v43 - 1) & v42;
      }
      v55 = *(_QWORD **)(*(_QWORD *)(a6 + 2256) + 8 * v46);
      if (v55)
      {
        v56 = (_QWORD *)*v55;
        if (*v55)
        {
          do
          {
            v57 = v56[1];
            if (v42 == v57)
            {
              if (rf::data_flow::RFUUID::Equality::operator()(a6 + 2288, (uint64_t)(v56 + 2), (uint64_t)uu))
              {
                std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v160, v56[6]);
                a5 = v138;
                updated = rf::data_flow::consumer::AnchorManagementConsumer::updateEntityWithAnchor(a1, a3, (uint64_t)v160, v143);
                v74 = *a8 + 1;
                *a8 = v74;
                if (v74 >= *(_QWORD *)(a1 + 464))
                {
                  rf::realityFusionLogObject(updated);
                  v75 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                  {
                    v132 = *a8;
                    v133 = *(_QWORD *)(a1 + 464);
                    *(_DWORD *)v149 = 134218240;
                    *(_QWORD *)&v149[4] = v132;
                    v150 = 2048;
                    v151 = v133;
                    _os_log_error_impl(&dword_227777000, v75, OS_LOG_TYPE_ERROR, "AnchorManagementConsumer: %llu anchoring updated this frame, which more than %llu, this could cause backboardd hang", v149, 0x16u);
                  }

                }
                if (v147)
                {
                  *(_QWORD *)v149 = v147;
                  v76 = *((_QWORD *)__p + 8);
                  if (!v76)
                    std::__throw_bad_function_call[abi:ne180100]();
                  if ((*(unsigned int (**)(uint64_t, _BYTE *))(*(_QWORD *)v76 + 48))(v76, v149))
                  {
                    rf::PlacementComponent::setDirty((rf::PlacementComponent *)&__p);
                    v77 = *(_QWORD *)(a1 + 48);
                    if (v77)
                      std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()(v77, a3, 3);
                  }
                }
                if ((_DWORD)v140)
                  rf::helpers::updateShadowMarker(a3, (uint64_t)v143);
                std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v160);
                goto LABEL_131;
              }
            }
            else
            {
              if (v45 > 1)
              {
                if (v57 >= *(_QWORD *)&v43)
                  v57 %= *(_QWORD *)&v43;
              }
              else
              {
                v57 &= *(_QWORD *)&v43 - 1;
              }
              if (v57 != v46)
                break;
            }
            v56 = (_QWORD *)*v56;
          }
          while (v56);
        }
      }
    }
    v58 = std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>((_QWORD *)(a6 + 2296), (uint64_t)uu);
    a5 = v138;
    if (v58)
    {
      if ((v141 & 1) != 0
        || (rf::data_flow::consumer::AnchorManagementConsumer::matchAndReanchorEntity((rf::PlacementComponentTypeInfo *)a1, a3, (uint64_t)(v58 + 6), v143) & 1) == 0)
      {
        v59 = (rf::PlacementComponentTypeInfo *)rf::data_flow::consumer::AnchorManagementConsumer::unanchorEntity(a1, a3);
        if (v147)
        {
          rf::PlacementComponentTypeInfo::instance(v59);
          REEntityRemoveComponentByClass();
        }
      }
    }
    else if (v136)
    {
      rf::realityFusionLogObject(0);
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = REEntityGetName();
        v62 = REEntityGetLocalId();
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)uu, v149);
        v63 = v152 >= 0 ? v149 : *(_BYTE **)v149;
        *(_DWORD *)v160 = 136315650;
        *(_QWORD *)&v160[4] = v61;
        *(_WORD *)&v160[12] = 2048;
        *(_QWORD *)&v160[14] = v62;
        *(_WORD *)&v160[22] = 2080;
        *(_QWORD *)&v160[24] = v63;
        _os_log_impl(&dword_227777000, v60, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Marking entity external %s, %llu, holding anchor with identifier %s", v160, 0x20u);
        if (v152 < 0)
          operator delete(*(void **)v149);
      }

      REAnchorComponentSetIsAnchorExternal();
      if (REAnchorComponentGetSendIsAnchoredToClient())
        RENetworkMarkComponentDirty();
      v64 = *(_QWORD *)(a1 + 48);
      if (v64)
        std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()(v64, a3, 4);
    }
    else if (v147 && rf::PlacementComponent::needsUpdate((rf::PlacementComponent *)&__p))
    {
      v65 = std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>(v143, (uint64_t)uu);
      if (v65)
      {
        rf::data_flow::consumer::AnchorManagementConsumer::updateEntityWithAnchor(a1, a3, (uint64_t)(v65 + 6), v143);
        rf::data_flow::consumer::AnchorManagementConsumer::matchOrUpdateAnchorComponent(REScene *,REEntity *,REComponent *,REComponent *,rf::ARStateData const&,BOOL,unsigned long long &)::$_0::operator()(v145);
        rf::PlacementComponent::setDirty((rf::PlacementComponent *)&__p);
        v66 = *(_QWORD *)(a1 + 48);
        if (v66)
          std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()(v66, a3, 3);
      }
    }
    else if (v141)
    {
      if ((REAnchorComponentGetAnchoredLocally() & 1) == 0)
      {
        v67 = std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>(v143, (uint64_t)uu);
        if (v67)
        {
          rf::data_flow::consumer::AnchorManagementConsumer::updateEntityWithAnchor(a1, a3, (uint64_t)(v67 + 6), v143);
          rf::data_flow::consumer::AnchorManagementConsumer::matchOrUpdateAnchorComponent(REScene *,REEntity *,REComponent *,REComponent *,rf::ARStateData const&,BOOL,unsigned long long &)::$_0::operator()(v145);
        }
      }
    }
LABEL_131:
    REAnchorComponentGetComponentType();
    v78 = REEntityGetComponentByClass();
    v79 = (const char *)REEntityGetName();
    if (!strcmp(v79, "Reality Simulation System Portal"))
      v80 = _os_feature_enabled_impl() ^ 1;
    else
      v80 = 0;
    v81 = (const char *)REEntityGetName();
    if (a5)
    {
      v82 = strcmp(v81, "AccessibilityMRServer-main-world-anchor") == 0;
      DescriptorType = REAnchoringComponentGetDescriptorType();
      if ((v80 | v82) == 1 && DescriptorType == 1)
      {
        if (v78)
        {
          if ((*(_DWORD *)(a6 + 2824) | 2) == 2)
          {
            v84 = (rf *)REAnchorComponentGetIsAnchorExternal();
            if ((_DWORD)v84)
            {
              rf::realityFusionLogObject(v84);
              v85 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
              {
                v86 = REEntityGetName();
                v87 = REEntityGetLocalId();
                *(_DWORD *)v160 = 136315394;
                *(_QWORD *)&v160[4] = v86;
                *(_WORD *)&v160[12] = 2048;
                *(_QWORD *)&v160[14] = v87;
                _os_log_impl(&dword_227777000, v85, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Relocalizing entity %s, %llu, because tracking is regained", v160, 0x16u);
              }

              REAnchorComponentSetIsAnchorExternal();
              if (REAnchorComponentGetSendIsAnchoredToClient())
                RENetworkMarkComponentDirty();
              rf::data_flow::consumer::AnchorManagementConsumer::unanchorEntity(a1, a3);
            }
          }
        }
      }
    }
LABEL_145:
    REAnchorComponentGetComponentType();
    v88 = REEntityGetComponentByClass();
    IsAnchored = REEntityIsAnchored();
    if (v88)
    {
      v90 = REAnchorComponentGetIsAnchorExternal();
      if ((v141 & 1) != 0)
        LODWORD(v88) = 0;
      else
        LODWORD(v88) = REAnchorComponentGetAnchoredLocally();
    }
    else
    {
      v90 = 0;
    }
    v91 = v139;
    if (!*(_BYTE *)(a1 + 160))
      v91 = 0;
    if (v91 == 1)
    {
      v92 = rf::helpers::isAnchoringTypeAuthorizedForSelf(a5, *(_QWORD *)(a6 + 160)) ^ 1;
      if (!IsAnchored)
        goto LABEL_154;
    }
    else
    {
      v92 = 1;
      if (!IsAnchored)
      {
LABEL_154:
        if ((v90 & 1) != 0)
          goto LABEL_243;
LABEL_158:
        if (*(_BYTE *)(a1 + 160))
        {
          if ((rf::helpers::shouldAnchorEntityInClientProcess(a3, (_BYTE *)(a1 + 161), *(_QWORD *)(*(_QWORD *)(a1 + 8) + 224)) & 1) == 0)
          {
LABEL_243:
            if ((_DWORD)v140)
              rf::helpers::updateShadowMarker(a3, (uint64_t)v143);
            return;
          }
LABEL_226:
          REAnchoringComponentGetComponentType();
          v118 = REEntityGetComponentByClass();
          if (!v118)
          {
            rf::getMessage((rf *)"Anchoring component should not be null.", v160);
            rf::internal::logAssert((const char *)v160);
            if ((char)v160[23] < 0)
              operator delete(*(void **)v160);
            rf::internal::debugBreakHandler(v135);
          }
          SceneNullable = REEntityGetSceneNullable();
          v120 = (rf *)rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor((uint64_t)v160, a1, SceneNullable, v118, (unint64_t)v143);
          if (v170)
          {
            std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)uu, (uint64_t)v160);
            rf::data_flow::consumer::AnchorManagementConsumer::anchorEntity(a1, a3, (uint64_t)uu, v118, v143, 1);
            v121 = (rf *)std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)uu);
            rf::realityFusionLogObject(v121);
            v122 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
            {
              v123 = REEntityGetName();
              if (!v170)
                std::__throw_bad_optional_access[abi:ne180100]();
              v124 = v123;
              rf::helpers::getRFUUIDFromAnchor((uint64_t)v160, (uint64_t)v149);
              rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v149, &__p);
              if (v148 >= 0)
                v125 = &__p;
              else
                v125 = __p;
              *(_DWORD *)buf = 136315394;
              v154 = (void **)v124;
              v155 = 2080;
              v156 = (uint64_t)v125;
              _os_log_impl(&dword_227777000, v122, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Anchoring entity %s to anchor %s.", buf, 0x16u);
              if (v148 < 0)
                operator delete(__p);
            }

            v120 = *(rf **)(a1 + 48);
            if (v120)
            {
              *(_QWORD *)v149 = a3;
              LODWORD(__p) = 1;
              v120 = (rf *)(*(uint64_t (**)(rf *, _BYTE *, void **))(*(_QWORD *)v120 + 48))(v120, v149, &__p);
            }
            if (v170)
              v120 = (rf *)std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v160);
          }
          v126 = *a8 + 1;
          *a8 = v126;
          if (v126 >= *(_QWORD *)(a1 + 464))
          {
            rf::realityFusionLogObject(v120);
            v127 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
            {
              v128 = *a8;
              v129 = *(_QWORD *)(a1 + 464);
              *(_DWORD *)v160 = 134218240;
              *(_QWORD *)&v160[4] = v128;
              *(_WORD *)&v160[12] = 2048;
              *(_QWORD *)&v160[14] = v129;
              _os_log_error_impl(&dword_227777000, v127, OS_LOG_TYPE_ERROR, "AnchorManagementConsumer: %llu anchoring updated this frame, which more than %llu, this could cause backboardd hang", v160, 0x16u);
            }

          }
          goto LABEL_243;
        }
        REClientAnchorSyncComponentGetComponentType();
        if (REEntityGetComponentByClass())
        {
          v93 = *(_QWORD *)(a1 + 8);
          memset(v160, 0, sizeof(v160));
          LODWORD(v161) = *(_DWORD *)(v93 + 264);
          std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,long long>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,long long>>>::__rehash<true>((uint64_t)v160, *(_QWORD *)(v93 + 240));
          v94 = *(_QWORD **)(v93 + 248);
          if (v94)
          {
            v95 = *(_QWORD *)&v160[8];
            do
            {
              v96 = v94[2];
              if (v95)
              {
                v97 = (uint8x8_t)vcnt_s8((int8x8_t)v95);
                v97.i16[0] = vaddlv_u8(v97);
                if (v97.u32[0] > 1uLL)
                {
                  a5 = v94[2];
                  if (v95 <= v96)
                    a5 = v96 % v95;
                }
                else
                {
                  a5 = v96 & (v95 - 1);
                }
                v98 = *(_QWORD **)(*(_QWORD *)v160 + 8 * a5);
                if (v98)
                {
                  for (i = (_QWORD *)*v98; i; i = (_QWORD *)*i)
                  {
                    v100 = i[1];
                    if (v100 == v96)
                    {
                      if (i[2] == v96)
                        goto LABEL_202;
                    }
                    else
                    {
                      if (v97.u32[0] > 1uLL)
                      {
                        if (v100 >= v95)
                          v100 %= v95;
                      }
                      else
                      {
                        v100 &= v95 - 1;
                      }
                      if (v100 != a5)
                        break;
                    }
                  }
                }
              }
              v101 = operator new(0x20uLL);
              *v101 = 0;
              v101[1] = v96;
              *((_OWORD *)v101 + 1) = *((_OWORD *)v94 + 1);
              v102 = (float)(unint64_t)(*(_QWORD *)&v160[24] + 1);
              if (!v95 || (float)(*(float *)&v161 * (float)v95) < v102)
              {
                v103 = (v95 & (v95 - 1)) != 0;
                if (v95 < 3)
                  v103 = 1;
                v104 = v103 | (2 * v95);
                v105 = vcvtps_u32_f32(v102 / *(float *)&v161);
                if (v104 <= v105)
                  v106 = v105;
                else
                  v106 = v104;
                std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,long long>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,long long>>>::__rehash<true>((uint64_t)v160, v106);
                v95 = *(_QWORD *)&v160[8];
                if ((*(_QWORD *)&v160[8] & (*(_QWORD *)&v160[8] - 1)) != 0)
                {
                  if (*(_QWORD *)&v160[8] <= v96)
                    a5 = v96 % *(_QWORD *)&v160[8];
                  else
                    a5 = v96;
                }
                else
                {
                  a5 = (*(_QWORD *)&v160[8] - 1) & v96;
                }
              }
              v107 = *(_QWORD *)v160;
              v108 = *(_QWORD **)(*(_QWORD *)v160 + 8 * a5);
              if (v108)
              {
                *v101 = *v108;
              }
              else
              {
                *v101 = *(_QWORD *)&v160[16];
                *(_QWORD *)&v160[16] = v101;
                *(_QWORD *)(v107 + 8 * a5) = &v160[16];
                if (!*v101)
                  goto LABEL_201;
                v109 = *(_QWORD *)(*v101 + 8);
                if ((v95 & (v95 - 1)) != 0)
                {
                  if (v109 >= v95)
                    v109 %= v95;
                }
                else
                {
                  v109 &= v95 - 1;
                }
                v108 = (_QWORD *)(*(_QWORD *)v160 + 8 * v109);
              }
              *v108 = v101;
LABEL_201:
              ++*(_QWORD *)&v160[24];
LABEL_202:
              v94 = (_QWORD *)*v94;
            }
            while (v94);
          }
          shouldAnchorEntityRequiringClientAnchoring = rf::helpers::shouldAnchorEntityRequiringClientAnchoring(a3, v160);
          std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)v160);
          if ((shouldAnchorEntityRequiringClientAnchoring & 1) == 0)
            goto LABEL_243;
        }
        if (*(_BYTE *)(a1 + 60) || *(_BYTE *)(a1 + 58) || *(_BYTE *)(a1 + 59))
        {
          RENetworkComponentGetComponentType();
          if (REEntityGetComponentByClass())
          {
            if (*(_BYTE *)(a1 + 60))
            {
              Parent = a3;
              do
              {
                v112 = Parent != 0;
                if (!Parent)
                  break;
                v113 = REEntityGetLocalId();
                Parent = REEntityGetParent();
              }
              while (!std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((_QWORD *)(a1 + 280), v113));
            }
            else
            {
              v112 = 0;
            }
            v115 = 0;
            if (*(_BYTE *)(a1 + 58) || *(_BYTE *)(a1 + 59))
            {
              v114 = RENetworkComponentOwnerPeerID();
              if (std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((_QWORD *)(a1 + 200), v114)|| std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((_QWORD *)(a1 + 240), v114))
              {
                v115 = 1;
              }
            }
            v116 = REEntityGetParent();
            v117 = v115;
            if (!v116)
            {
              if (*(_BYTE *)(a1 + 58))
                v117 = 1;
              else
                v117 = v115;
            }
            if (!v112 && (v115 | v117) != 1)
              goto LABEL_243;
          }
        }
        goto LABEL_226;
      }
    }
    if (((v92 | v88 | v90) & 1) != 0)
      goto LABEL_243;
    goto LABEL_158;
  }
  REEntityGetComponent();
  RETransformComponentGetWorldMatrix4x4F();
  InternalActiveCamera = (rf::helpers *)rf::helpers::getInternalActiveCamera();
  if (InternalActiveCamera)
  {
    REEntityGetComponent();
    InternalActiveCamera = (rf::helpers *)RETransformComponentGetWorldMatrix4x4F();
    v140 = v52;
    v142 = v51;
    v137 = v53;
    v139 = v54;
  }
  else
  {
    v142 = 0u;
  }
  v68 = rf::helpers::kCameraIdentifier(InternalActiveCamera);
  v69 = v68[1];
  *(_OWORD *)v160 = *v68;
  *(_OWORD *)&v160[16] = v69;
  v161 = v142;
  v162 = v137;
  v163 = v139;
  v164 = v140;
  v165 = 16842752;
  v166 = 0;
  v167 = 0;
  v168 = 0;
  v169 = 0;
  v70 = rf::data_flow::consumer::AnchorManagementConsumer::updateEntityWithAnchor(a1, a3, (uint64_t)v160, v143);
  v71 = *a8 + 1;
  *a8 = v71;
  if (v71 >= *(_QWORD *)(a1 + 464))
  {
    rf::realityFusionLogObject(v70);
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      v130 = *a8;
      v131 = *(_QWORD *)(a1 + 464);
      *(_DWORD *)v149 = 134218240;
      *(_QWORD *)&v149[4] = v130;
      v150 = 2048;
      v151 = v131;
      _os_log_error_impl(&dword_227777000, v72, OS_LOG_TYPE_ERROR, "AnchorManagementConsumer: %llu anchoring updated this frame, which more than %llu, this could cause backboardd hang", v149, 0x16u);
    }

  }
  std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v160);
}

void sub_2277E3CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *__p;
  char a72;

  if (a72 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t rf::data_flow::consumer::AnchorManagementConsumer::unanchorEntity(uint64_t a1, uint64_t a2)
{
  rf *ComponentByClass;
  NSObject *v5;
  uint64_t Name;
  uint64_t AnchorIdentifier;
  void **v8;
  rf::AnchorMetadataComponent *v9;
  rf::AnchorMetadataComponent *v10;
  rf::AnchorMetadataComponent *CustomComponent;
  uint64_t result;
  rf::internal *v13;
  void *__p[2];
  char v15;
  uuid_t uu;
  char v17;
  char v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void **v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  REAnchorComponentGetComponentType();
  ComponentByClass = (rf *)REEntityGetComponentByClass();
  if (!ComponentByClass)
  {
    rf::getMessage((rf *)"Anchor component should not be null.", uu);
    rf::internal::logAssert((const char *)uu);
    if (v18 < 0)
      operator delete(*(void **)uu);
    ComponentByClass = (rf *)rf::internal::debugBreakHandler(v13);
  }
  rf::realityFusionLogObject(ComponentByClass);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    Name = REEntityGetName();
    AnchorIdentifier = REAnchorComponentGetAnchorIdentifier();
    v17 = 0;
    v19 = 0;
    uuid_clear(uu);
    *(_QWORD *)uu = AnchorIdentifier;
    v17 = 1;
    rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)uu, __p);
    v8 = v15 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315394;
    v21 = Name;
    v22 = 2080;
    v23 = v8;
    _os_log_impl(&dword_227777000, v5, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Unanchoring entity %s from anchor %s", buf, 0x16u);
    if (v15 < 0)
      operator delete(__p[0]);
  }

  if (rf::helpers::isRemotelyOwned())
  {
    v9 = (rf::AnchorMetadataComponent *)REAnchorComponentSetAnchoredLocally();
  }
  else
  {
    REAnchorComponentGetComponentType();
    v9 = (rf::AnchorMetadataComponent *)REEntityRemoveComponentByClass();
  }
  v10 = (rf::AnchorMetadataComponent *)rf::AnchorMetadataComponent::instance(v9);
  if (*(_QWORD *)v10)
  {
    rf::AnchorMetadataComponent::instance(v10);
    CustomComponent = (rf::AnchorMetadataComponent *)REEntityGetCustomComponent();
    if (CustomComponent)
    {
      rf::AnchorMetadataComponent::instance(CustomComponent);
      REEntityRemoveComponentByClass();
    }
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    *(_QWORD *)uu = a2;
    LODWORD(__p[0]) = 2;
    return (*(uint64_t (**)(uint64_t, unsigned __int8 *, void **))(*(_QWORD *)result + 48))(result, uu, __p);
  }
  return result;
}

void sub_2277E3FC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t rf::data_flow::consumer::AnchorManagementConsumer::updateReceiveIsAnchoredOnClientForComponent(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (*(_BYTE *)(result + 160))
      rf::helpers::needAnchoringInClientProcessForEntity((_BYTE *)(result + 161), a2);
    return REAnchorComponentSetReceiveIsAnchoredOnClient();
  }
  return result;
}

uint64_t rf::data_flow::consumer::AnchorManagementConsumer::anchorEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, rf::helpers *a5, int a6)
{
  uint64_t ComponentByClass;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int DescriptorType;
  _QWORD *CameraAnchor;
  rf::PlacementComponentTypeInfo *v16;
  uint64_t *v17;
  uint64_t CustomComponent;
  float32x4_t *PreviousWorldTransform;
  uint64_t v20;
  NSObject *v21;
  uint64_t Name;
  uint8_t *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  simd_float4 v27;
  simd_float4 v28;
  simd_float4 v29;
  const void *v30;
  uint64_t v31;
  float32x2_t v32;
  float v33;
  uint64_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t *v39;
  float32x4_t v40;
  int32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  int32x4_t v45;
  float32x4_t v46;
  float v47;
  float32x4_t v48;
  float32x4_t v49;
  int32x4_t v50;
  float32x2_t v51;
  float32x2_t v52;
  float32x4_t v53;
  float v54;
  float v55;
  float v56;
  float32x4_t *v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float v62;
  uint64_t v63;
  float32x4_t v64;
  const float *v65;
  float32x2_t v66;
  int8x16_t v67;
  int32x4_t v68;
  float32x2_t v69;
  float32x4_t v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  __float2 v76;
  uint64_t v77;
  float v78;
  float v79;
  float v80;
  simd_float4 v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  uint64_t v86;
  simd_float4 v87;
  simd_float4 v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  NSObject *v93;
  rf *v94;
  NSObject *v95;
  simd_float4 v96;
  simd_float4 v97;
  simd_float4 v98;
  simd_float4 v99;
  simd_float4 v100;
  float32x4_t v101;
  float v102;
  float v103;
  float v104;
  uint64_t v105;
  uint64_t v106;
  __float2 v107;
  __float2 v108;
  __float2 v109;
  float32x4_t v110;
  float32x4_t v111;
  float32x4_t v112;
  uint64_t v113;
  uint64_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  uint64_t v119;
  char v120;
  char v121;
  uint64_t v122;
  rf *v123;
  NSObject *v124;
  uint64_t v125;
  uint64_t LocalId;
  simd_float4x4 *p_buf;
  simd_float4 v129;
  simd_float4 v130;
  simd_float4 v131;
  float32x4_t v132;
  simd_float4 v133;
  float32x4_t v134;
  float32x4_t v135;
  simd_float4 v136;
  float32x4_t v137;
  float32x4_t v138;
  simd_float4 v139;
  float32x4_t v140;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  simd_float4 v144;
  float32x4_t v145;
  float32x4_t v146;
  float32x4_t v147;
  float v148;
  float v149;
  simd_float4 v150;
  simd_float4 v151;
  float32x4_t v152;
  float32x4_t v153;
  float32x4_t v154;
  float32x4_t v155;
  simd_float4 v156;
  float32x4_t v157;
  float32x4_t v158;
  float v159;
  float32x4_t v160;
  float32x4_t v161;
  simd_float4 v162;
  float32x2_t v163;
  float32x4_t v164;
  unint64_t v165;
  float v166;
  simd_float4 v167;
  float32x2_t v168;
  int32x4_t v169;
  simd_float4 v172;
  simd_float4 v173;
  simd_float4 v174;
  simd_float4 v175;
  uint64_t v176;
  __int128 v177;
  __int128 v178;
  simd_float4 v179;
  simd_float4 v180;
  simd_float4 v181;
  float32x4_t v182[2];
  id v183;
  simd_float4x4 v184;
  __int128 v185;
  uint64_t v186;
  void *__p;
  void *v188;
  uint64_t v189;
  __int128 v190;
  float32x4_t v191;
  simd_float4 v192;
  simd_float4 v193;
  simd_float4 v194;
  simd_float4 v195[2];
  uint64_t v196;
  int v197;
  _BYTE uu[32];
  simd_float4 v199;
  simd_float4 v200;
  simd_float4 v201;
  _BYTE v202[25];
  id v203;
  simd_float4x4 v204;
  __int128 v205;
  uint64_t v206;
  void *v207;
  _BYTE *v208;
  uint64_t v209;
  simd_float4x4 buf;
  uint8_t v211[16];
  simd_float4 v212;
  simd_float4 v213;
  float32x4_t v214;
  uint64_t v215;
  simd_float4x4 v216;
  simd_float4x4 v217;
  simd_float4x4 v218;
  simd_float4x4 v219;

  v215 = *MEMORY[0x24BDAC8D0];
  v176 = a4;
  REAnchorComponentGetComponentType();
  ComponentByClass = REEntityGetComponentByClass();
  if (ComponentByClass)
  {
    RERetain();
    v10 = ComponentByClass;
    v11 = a1;
  }
  else
  {
    REAnchorComponentGetComponentType();
    v10 = REComponentCreateByClass();
    REAnchoringComponentGetComponentType();
    v12 = REEntityGetComponentByClass();
    if (v10)
    {
      if (v12)
      {
        REClientAnchorSyncComponentGetComponentType();
        v13 = REEntityGetComponentByClass();
        if (!*(_BYTE *)(a1 + 160) && !v13)
        {
          DescriptorType = REAnchoringComponentGetDescriptorType();
          if (DescriptorType <= 4 && ((1 << DescriptorType) & 0x16) != 0)
            REAnchorComponentSetSendIsAnchoredToClient();
        }
      }
    }
    v11 = a1;
    rf::data_flow::consumer::AnchorManagementConsumer::updateReceiveIsAnchoredOnClientForComponent(a1, a2, v10);
  }
  REAnchorComponentSetAnchoredLocally();
  CameraAnchor = rf::helpers::getCameraAnchor(a5);
  rf::helpers::getTransformFromAnchor(a3, (uint64_t)&v176, (uint64_t)(CameraAnchor + 4), v11 + 168, &v172);
  v162 = v173;
  v167 = v172;
  v151 = v175;
  v156 = v174;
  REAnchorComponentSetWorldTransform();
  if (REAnchoringComponentGetMode() || REAnchoringComponentGetDescriptorType() == 1)
  {
    std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&v190, a3);
  }
  else
  {
    uu[16] = 0;
    *(_QWORD *)&uu[24] = 0;
    uuid_clear(uu);
    uuid_generate_random(uu);
    v199 = v172;
    v200 = v173;
    v201 = v174;
    *(simd_float4 *)v202 = v175;
    *(_DWORD *)&v202[16] = 16842752;
    *(_DWORD *)&v202[20] = 0;
    v202[24] = 0;
    v194 = v174;
    v195[0] = v175;
    v190 = *(_OWORD *)uu;
    v191 = *(float32x4_t *)&uu[16];
    v192 = v172;
    v193 = v173;
    *(simd_float4 *)((char *)v195 + 9) = *(simd_float4 *)&v202[9];
    v196 = 0;
    v197 = 0;
    if (*(_QWORD *)(a1 + 88))
    {
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)uu, (uint64_t)&v190);
      v105 = *(_QWORD *)(a1 + 88);
      if (!v105)
        std::__throw_bad_function_call[abi:ne180100]();
      (*(void (**)(uint8_t *__return_ptr, uint64_t, _BYTE *))(*(_QWORD *)v105 + 48))(v211, v105, uu);
      if (v197)
        std::__throw_bad_variant_access[abi:ne180100]();
      v190 = *(_OWORD *)v211;
      v191 = (float32x4_t)v212;
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)uu);
    }
    v106 = *(_QWORD *)(a1 + 120);
    if (v106)
    {
      *(_QWORD *)v211 = &v190;
      (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)v106 + 48))(v106, v211);
    }
    REAnchoringComponentSetDescriptorTransform();
  }
  rf::helpers::getRFUUIDFromAnchor((uint64_t)&v190, (uint64_t)uu);
  v16 = (rf::PlacementComponentTypeInfo *)REAnchorComponentSetAnchorIdentifier();
  v17 = rf::PlacementComponentTypeInfo::instance(v16);
  if (*v17)
    CustomComponent = REEntityGetCustomComponent();
  else
    CustomComponent = 0;
  PreviousWorldTransform = (float32x4_t *)REAnchoringComponentGetPreviousWorldTransform();
  if (PreviousWorldTransform)
  {
    v134 = PreviousWorldTransform[1];
    v137 = *PreviousWorldTransform;
    v140 = PreviousWorldTransform[3];
    v145 = PreviousWorldTransform[2];
    v216.columns[1] = v162;
    v216.columns[0] = v167;
    v216.columns[3] = v151;
    v216.columns[2] = v156;
    v217 = __invert_f4(v216);
    v20 = 0;
    *(float32x4_t *)v211 = v137;
    v212 = (simd_float4)v134;
    v213 = (simd_float4)v145;
    v214 = v140;
    do
    {
      *(float32x4_t *)&uu[v20] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v217.columns[0], COERCE_FLOAT(*(_OWORD *)&v211[v20])), (float32x4_t)v217.columns[1], *(float32x2_t *)&v211[v20], 1), (float32x4_t)v217.columns[2], *(float32x4_t *)&v211[v20], 2), (float32x4_t)v217.columns[3], *(float32x4_t *)&v211[v20], 3);
      v20 += 16;
    }
    while (v20 != 64);
    RETransformComponentGetComponentType();
    if (!REEntityGetComponentByClass())
    {
      rf::realityFusionLogObject(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        Name = REEntityGetName();
        rf::helpers::getBaseAnchorProperties(a3);
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)uu, v211);
        if (v212.i8[7] >= 0)
          v23 = v211;
        else
          v23 = *(uint8_t **)v211;
        buf.columns[0].i32[0] = 136315394;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = Name;
        buf.columns[0].i16[6] = 2080;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v23;
        _os_log_impl(&dword_227777000, v21, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer::anchorEntity(): Transform component not found when attempting to anchor entity %s to anchor %s, adding one now", (uint8_t *)&buf, 0x16u);
        if (v212.i8[7] < 0)
          operator delete(*(void **)v211);

      }
      RETransformComponentGetComponentType();
      REEntityAddComponentByClass();
    }
    REMakeSRTFromMatrix();
    RETransformComponentSetLocalSRT();
    RENetworkMarkComponentDirty();
    goto LABEL_30;
  }
  if (*(_DWORD *)(a3 + 256) != 1 || CustomComponent || !a6)
  {
LABEL_30:
    if (CustomComponent)
    {
      *(_QWORD *)uu = CustomComponent;
      v24 = v17[12];
      if (!v24)
        std::__throw_bad_function_call[abi:ne180100]();
      (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v24 + 48))(v24, uu);
    }
    goto LABEL_83;
  }
  v25 = *(_OWORD *)(a3 + 80);
  v201 = *(simd_float4 *)(a3 + 64);
  *(_OWORD *)v202 = v25;
  *(_OWORD *)&v202[9] = *(_OWORD *)(a3 + 89);
  v26 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)uu = *(_OWORD *)a3;
  *(_OWORD *)&uu[16] = v26;
  v27 = *(simd_float4 *)(a3 + 48);
  v199 = *(simd_float4 *)(a3 + 32);
  v200 = v27;
  v203 = *(id *)(a3 + 112);
  v28 = *(simd_float4 *)(a3 + 176);
  v204.columns[2] = *(simd_float4 *)(a3 + 160);
  v204.columns[3] = v28;
  v205 = *(_OWORD *)(a3 + 192);
  v29 = *(simd_float4 *)(a3 + 144);
  v204.columns[0] = *(simd_float4 *)(a3 + 128);
  v204.columns[1] = v29;
  v30 = *(const void **)(a3 + 216);
  v206 = *(_QWORD *)(a3 + 208);
  v207 = 0;
  v31 = *(_QWORD *)(a3 + 224);
  v209 = 0;
  v208 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v207, v30, v31, (v31 - (uint64_t)v30) >> 4);
  REAnchoringComponentGetDescriptorBounds();
  v168 = v32;
  v181 = v201;
  v182[0] = *(float32x4_t *)v202;
  *(float32x4_t *)((char *)v182 + 9) = *(float32x4_t *)&v202[9];
  v177 = *(_OWORD *)uu;
  v178 = *(_OWORD *)&uu[16];
  v179 = v199;
  v180 = v200;
  v183 = v203;
  v184 = v204;
  v185 = v205;
  v186 = v206;
  __p = 0;
  v189 = 0;
  v188 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&__p, v207, (uint64_t)v208, (v208 - (_BYTE *)v207) >> 4);
  v163 = (float32x2_t)__PAIR64__(DWORD2(v185), v185);
  v33 = 0.0;
  if (!(_DWORD)v186)
  {
    v34 = 0;
    v35 = (float32x4_t)v179;
    v36 = (float32x4_t)v180;
    v37 = (float32x4_t)v181;
    v38 = v182[0];
    buf = v184;
    do
    {
      *(float32x4_t *)&v211[v34 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v35, COERCE_FLOAT(*(_OWORD *)&buf.columns[v34])), v36, *(float32x2_t *)buf.columns[v34].f32, 1), v37, (float32x4_t)buf.columns[v34], 2), v38, (float32x4_t)buf.columns[v34], 3);
      ++v34;
    }
    while (v34 != 4);
    v141 = *(float32x4_t *)v211;
    v146 = (float32x4_t)v213;
    v152 = (float32x4_t)v212;
    v157 = v214;
    v39 = (float32x4_t *)rf::helpers::getCameraAnchor(a5);
    v147 = vmlaq_f32(vaddq_f32(v146, vmlaq_f32(vmulq_f32(v141, (float32x4_t)0), (float32x4_t)0, v152)), (float32x4_t)0, v157);
    v158 = (float32x4_t)v180;
    v40 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v158, (int32x4_t)v158), (int8x16_t)v180, 0xCuLL);
    v41 = (int32x4_t)vmlaq_f32(vmulq_f32(v40, vnegq_f32(v39[4])), (float32x4_t)v180, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v39[4], (int32x4_t)v39[4]), (int8x16_t)v39[4], 0xCuLL));
    v42 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v41, v41), (int8x16_t)v41, 0xCuLL);
    v43 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v42, (int32x4_t)v42), (int8x16_t)v42, 0xCuLL), vnegq_f32((float32x4_t)v180)), v42, v40);
    v44 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v43, (int32x4_t)v43), (int8x16_t)v43, 0xCuLL);
    v45 = (int32x4_t)vmulq_f32(v43, v43);
    v45.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v45.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v45, 2), *(float32x2_t *)v45.i8)).u32[0];
    *(float32x2_t *)v40.f32 = vrsqrte_f32((float32x2_t)v45.u32[0]);
    *(float32x2_t *)v40.f32 = vmul_f32(*(float32x2_t *)v40.f32, vrsqrts_f32((float32x2_t)v45.u32[0], vmul_f32(*(float32x2_t *)v40.f32, *(float32x2_t *)v40.f32)));
    v153 = vmulq_n_f32(v44, vmul_f32(*(float32x2_t *)v40.f32, vrsqrts_f32((float32x2_t)v45.u32[0], vmul_f32(*(float32x2_t *)v40.f32, *(float32x2_t *)v40.f32))).f32[0]);
    v46 = vmulq_f32(v147, v153);
    v47 = acosf(fminf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v46, 2), vaddq_f32(v46, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v46.f32, 1))).f32[0], -1.0), 1.0));
    v48 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v153, (int32x4_t)v153), (int8x16_t)v153, 0xCuLL), vnegq_f32(v147)), v153, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v147, (int32x4_t)v147), (int8x16_t)v147, 0xCuLL));
    v49 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v48, (int32x4_t)v48), (int8x16_t)v48, 0xCuLL);
    v50 = (int32x4_t)vmulq_f32(v48, v48);
    v50.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v50.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v50, 2), *(float32x2_t *)v50.i8)).u32[0];
    v51 = vrsqrte_f32((float32x2_t)v50.u32[0]);
    v52 = vmul_f32(v51, vrsqrts_f32((float32x2_t)v50.u32[0], vmul_f32(v51, v51)));
    v53 = vmulq_f32(v158, vmulq_n_f32(v49, vmul_f32(v52, vrsqrts_f32((float32x2_t)v50.u32[0], vmul_f32(v52, v52))).f32[0]));
    if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v53, 2), vaddq_f32(v53, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 1))).f32[0] <= 0.0)v47 = -v47;
    v33 = rf::helpers::rotationThatFitsRect(v47, *(double *)&v168, *(double *)&v163);
    v54 = sqrtf(vaddv_f32(vmul_f32(v168, v168)));
    if (v54 >= 0.00000011921)
    {
      v55 = acosf(v168.f32[0] / v54);
      v159 = fabsf(v54 * cosf(v33 + v55));
      v56 = acosf(v168.f32[1] / v54);
      v168 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(fabsf(v54 * cosf(v33 + v56))), LODWORD(v159));
    }
  }
  v57 = (float32x4_t *)rf::helpers::getCameraAnchor(a5);
  v58 = vnegq_f32(v57[4]);
  v59 = vmulq_f32((float32x4_t)v180, v58);
  v60 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v59, 2), vaddq_f32(v59, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v59.f32, 1)));
  if (v60.f32[0] <= -0.00000011921)
  {
    v61 = vmulq_f32((float32x4_t)v180, vsubq_f32(v182[0], v57[5]));
    v62 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v61, 2), vaddq_f32(v61, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v61.f32, 1))), v60).f32[0];
    if (v62 >= 0.0)
    {
      v148 = v62;
      v154 = v57[5];
      v160 = v58;
      v218 = __invert_f4(v184);
      v138 = (float32x4_t)v218.columns[0];
      v142 = (float32x4_t)v218.columns[1];
      v132 = (float32x4_t)v218.columns[3];
      v135 = (float32x4_t)v218.columns[2];
      v218.columns[0] = v179;
      v218.columns[1] = v180;
      v218.columns[2] = v181;
      v218.columns[3] = (simd_float4)v182[0];
      v219 = __invert_f4(v218);
      v63 = 0;
      buf = v219;
      do
      {
        *(float32x4_t *)&v211[v63 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v138, COERCE_FLOAT(*(_OWORD *)&buf.columns[v63])), v142, *(float32x2_t *)buf.columns[v63].f32, 1), v135, (float32x4_t)buf.columns[v63], 2), v132, (float32x4_t)buf.columns[v63], 3);
        ++v63;
      }
      while (v63 != 4);
      v64 = vaddq_f32(v154, vmulq_n_f32(v160, v148));
      v65 = (const float *)&v214;
      v66 = (float32x2_t)*(_OWORD *)vld2_f32(v65).val;
      v67 = (int8x16_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)v211, v64.f32[0]), (float32x4_t)v212, *(float32x2_t *)v64.f32, 1), (float32x4_t)v213, v64, 2);
      v68 = (int32x4_t)vextq_s8(v67, v67, 8uLL);
      *(float32x2_t *)v68.i8 = vadd_f32(v66, (float32x2_t)vzip1_s32(*(int32x2_t *)v67.i8, *(int32x2_t *)v68.i8));
      v69 = vmul_f32(v168, (float32x2_t)0x3F0000003F000000);
      *(float32x2_t *)v67.i8 = vmul_f32(v163, (float32x2_t)0x3F0000003F000000);
      *(float32x2_t *)v68.i8 = vminnm_f32(vmaxnm_f32(*(float32x2_t *)v68.i8, vsub_f32(v69, *(float32x2_t *)v67.i8)), vsub_f32(*(float32x2_t *)v67.i8, v69));
      v169 = vtrn2q_s32(vzip1q_s32((int32x4_t)xmmword_2277EE900, v68), (int32x4_t)xmmword_2277EE900);
      *(float32x2_t *)v67.i8 = vrsqrte_f32((float32x2_t)1065353216);
      *(float32x2_t *)v67.i8 = vmul_f32(*(float32x2_t *)v67.i8, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(*(float32x2_t *)v67.i8, *(float32x2_t *)v67.i8)));
      v70 = vmulq_n_f32((float32x4_t)xmmword_2277EE450, vmul_f32(*(float32x2_t *)v67.i8, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(*(float32x2_t *)v67.i8, *(float32x2_t *)v67.i8))).f32[0]);
      v71 = v70.f32[1];
      v72 = v70.f32[2];
      v143 = v70;
      v149 = vmulq_f32(v70, v70).f32[0];
      v73 = vmuls_lane_f32(v70.f32[1], *(float32x2_t *)v70.f32, 1);
      v74 = vmuls_lane_f32(v70.f32[0], *(float32x2_t *)v70.f32, 1);
      v75 = vmuls_lane_f32(v70.f32[0], v70, 2);
      v76 = __sincosf_stret(v33);
      v77 = 0;
      v78 = vmuls_lane_f32(v76.__sinval, *(float32x2_t *)v143.f32, 1);
      v79 = vmuls_lane_f32(v76.__sinval, v143, 2);
      v80 = 1.0 - v76.__cosval;
      v81.i32[3] = 0;
      v82 = (float32x4_t)v184.columns[0];
      v83 = (float32x4_t)v184.columns[1];
      v84 = (float32x4_t)v184.columns[2];
      v85 = (float32x4_t)v184.columns[3];
      v164 = (float32x4_t)xmmword_2277EE440;
      buf.columns[0] = (simd_float4)xmmword_2277EE440;
      v155 = (float32x4_t)xmmword_2277EE450;
      buf.columns[1] = (simd_float4)xmmword_2277EE450;
      v161 = (float32x4_t)xmmword_2277EE460;
      buf.columns[2] = (simd_float4)xmmword_2277EE460;
      buf.columns[3] = (simd_float4)v169;
      do
      {
        *(float32x4_t *)&v211[v77 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v82, COERCE_FLOAT(*(_OWORD *)&buf.columns[v77])), v83, *(float32x2_t *)buf.columns[v77].f32, 1), v84, (float32x4_t)buf.columns[v77], 2), v85, (float32x4_t)buf.columns[v77], 3);
        ++v77;
      }
      while (v77 != 4);
      v86 = 0;
      v81.f32[1] = v73 + (float)(v76.__cosval * (float)(1.0 - v73));
      v87.i32[3] = 0;
      v88.i32[3] = 0;
      v88.f32[0] = v149 + (float)(v76.__cosval * (float)(1.0 - v149));
      v88.f32[1] = v79 + (float)(v74 * v80);
      v88.f32[2] = -(float)(v78 - (float)(v75 * (float)(1.0 - v76.__cosval)));
      v81.f32[2] = (float)(v76.__sinval * v143.f32[0]) + (float)((float)(v71 * v72) * v80);
      v87.f32[0] = v78 + (float)(v75 * v80);
      v87.f32[1] = -(float)((float)(v76.__sinval * v143.f32[0]) - (float)((float)(v71 * v72) * v80));
      v87.f32[2] = (float)(v72 * v72) + (float)(v76.__cosval * (float)(1.0 - (float)(v72 * v72)));
      v89 = *(float32x4_t *)v211;
      v90 = (float32x4_t)v212;
      v91 = (float32x4_t)v213;
      v92 = v214;
      buf.columns[0] = v88;
      v81.f32[0] = -(float)(v79 - (float)(v74 * (float)(1.0 - v76.__cosval)));
      buf.columns[1] = v81;
      buf.columns[2] = v87;
      buf.columns[3] = (simd_float4)xmmword_2277EE900;
      do
      {
        *(float32x4_t *)&v211[v86 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v89, COERCE_FLOAT(*(_OWORD *)&buf.columns[v86])), v90, *(float32x2_t *)buf.columns[v86].f32, 1), v91, (float32x4_t)buf.columns[v86], 2), v92, (float32x4_t)buf.columns[v86], 3);
        ++v86;
      }
      while (v86 != 4);
      v136 = v212;
      v139 = *(simd_float4 *)v211;
      v144 = (simd_float4)v214;
      v150 = v213;
      RETransformComponentGetComponentType();
      if (!REEntityGetComponentByClass())
      {
        rf::realityFusionLogObject(0);
        v93 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v211 = 0;
          _os_log_impl(&dword_227777000, v93, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Plane Anchor entity require Transform component to function", v211, 2u);
        }

        rf::realityFusionLogObject(v94);
        v95 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v211 = 0;
          _os_log_impl(&dword_227777000, v95, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Adding Transform component", v211, 2u);
        }

        RETransformComponentGetComponentType();
        REEntityAddComponentByClass();
      }
      RETransformComponentGetLocalSRT();
      RESRTMatrix();
      v100 = v96;
      v101 = (float32x4_t)xmmword_2277EE900;
      if (!(_DWORD)v186)
      {
        v129 = v97;
        v130 = v96;
        v131 = v99;
        v133 = v98;
        v102 = v181.f32[0];
        v103 = 1.0;
        if (v181.f32[0] <= 1.0)
          v103 = v181.f32[0];
        if (v103 < -1.0)
          v103 = -1.0;
        v166 = asinf(v103);
        if (fabsf(v102) >= 0.9999)
        {
          v165 = __PAIR64__(LODWORD(v166), COERCE_UNSIGNED_INT(atan2f(v180.f32[2], v180.f32[1])));
          v104 = 0.0;
        }
        else
        {
          v165 = __PAIR64__(LODWORD(v166), COERCE_UNSIGNED_INT(atan2f(-v181.f32[1], v181.f32[2])));
          v104 = atan2f(-v180.f32[0], v179.f32[0]);
        }
        v107 = __sincosf_stret(*(float *)&v165);
        v108 = __sincosf_stret(*((float *)&v165 + 1));
        v109 = __sincosf_stret(v104);
        v110.i32[3] = 0;
        v110.f32[0] = v108.__cosval * v109.__cosval;
        v110.f32[1] = (float)(v107.__cosval * v109.__sinval)
                    + (float)((float)(v107.__sinval * v109.__cosval) * v108.__sinval);
        v111.i32[3] = 0;
        v110.f32[2] = (float)(v107.__sinval * v109.__sinval)
                    - (float)((float)(v107.__cosval * v109.__cosval) * v108.__sinval);
        v112.i32[3] = 0;
        v112.f32[0] = -(float)(v108.__cosval * v109.__sinval);
        v112.f32[1] = (float)(v107.__cosval * v109.__cosval)
                    - (float)((float)(v107.__sinval * v109.__sinval) * v108.__sinval);
        v112.f32[2] = (float)(v107.__sinval * v109.__cosval)
                    + (float)((float)(v107.__cosval * v109.__sinval) * v108.__sinval);
        v155 = v112;
        v111.i32[0] = LODWORD(v108.__sinval);
        v111.f32[1] = -(float)(v107.__sinval * v108.__cosval);
        v111.f32[2] = v107.__cosval * v108.__cosval;
        v161 = v111;
        v164 = v110;
        v101 = (float32x4_t)xmmword_2277EE900;
        v99 = v131;
        v98 = v133;
        v97 = v129;
        v100 = v130;
      }
      v113 = 0;
      buf.columns[0] = v139;
      buf.columns[1] = v136;
      buf.columns[2] = v150;
      buf.columns[3] = v144;
      do
      {
        *(float32x4_t *)&v211[v113 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v164, COERCE_FLOAT(*(_OWORD *)&buf.columns[v113])), v155, *(float32x2_t *)buf.columns[v113].f32, 1), v161, (float32x4_t)buf.columns[v113], 2), v101, (float32x4_t)buf.columns[v113], 3);
        ++v113;
      }
      while (v113 != 4);
      v114 = 0;
      v115 = *(float32x4_t *)v211;
      v116 = (float32x4_t)v212;
      v117 = (float32x4_t)v213;
      v118 = v214;
      buf.columns[0] = v100;
      buf.columns[1] = v97;
      buf.columns[2] = v98;
      buf.columns[3] = v99;
      do
      {
        *(float32x4_t *)&v211[v114 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v115, COERCE_FLOAT(*(_OWORD *)&buf.columns[v114])), v116, *(float32x2_t *)buf.columns[v114].f32, 1), v117, (float32x4_t)buf.columns[v114], 2), v118, (float32x4_t)buf.columns[v114], 3);
        ++v114;
      }
      while (v114 != 4);
      REMakeSRTFromMatrix();
      RETransformComponentSetLocalSRT();
      RENetworkMarkComponentDirty();
    }
  }
  if (__p)
  {
    v188 = __p;
    operator delete(__p);
  }

  if (v207)
  {
    v208 = v207;
    operator delete(v207);
  }

LABEL_83:
  REAnchorComponentSetEnableShadows();
  if (!ComponentByClass)
  {
    REClientAnchorSyncComponentGetComponentType();
    v119 = REEntityGetComponentByClass();
    v120 = rf::helpers::needAnchoringInClientProcessForEntity((_BYTE *)(a1 + 161), a2);
    rf::helpers::isRemotelyOwned();
    if (*(_BYTE *)(a1 + 160))
      v121 = v120 ^ 1;
    else
      v121 = v119 == 0;
    if ((v121 & 1) == 0)
    {
      RENetworkComponentGetComponentType();
      v122 = REEntityGetComponentByClass();
      if (v122)
        MEMORY[0x22E29D678](v122, v10);
    }
    REEntityAddExistingComponent();
  }
  rf::helpers::getRFUUIDFromAnchor(a3, (uint64_t)v211);
  v123 = (rf *)relocalizeEntityIfNeeded((uint64_t)v211, a5);
  if ((_DWORD)v123)
  {
    rf::realityFusionLogObject(v123);
    v124 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      v125 = REEntityGetName();
      LocalId = REEntityGetLocalId();
      rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v211, &buf);
      if (buf.columns[1].i8[7] >= 0)
        p_buf = &buf;
      else
        p_buf = (simd_float4x4 *)buf.columns[0].i64[0];
      *(_DWORD *)uu = 136315650;
      *(_QWORD *)&uu[4] = v125;
      *(_WORD *)&uu[12] = 2048;
      *(_QWORD *)&uu[14] = LocalId;
      *(_WORD *)&uu[22] = 2080;
      *(_QWORD *)&uu[24] = p_buf;
      _os_log_impl(&dword_227777000, v124, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Relocalizing entity %s, %llu for in-place re-anchoring with identifier %s", uu, 0x20u);
      if (buf.columns[1].i8[7] < 0)
        operator delete((void *)buf.columns[0].i64[0]);
    }

  }
  RERelease();
  return std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v190);
}

void sub_2277E4FA0(_Unwind_Exception *a1)
{
  void *v1;

  std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&STACK[0x210]);
  _Unwind_Resume(a1);
}

uint64_t std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()(uint64_t a1, uint64_t a2, int a3)
{
  int v4;
  uint64_t v5;

  v5 = a2;
  v4 = a3;
  if (!a1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(_QWORD *)a1 + 48))(a1, &v5, &v4);
}

_QWORD *rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  rf::helpers *WorldMatrix4x4F;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 *v13;
  __int128 v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  char v18;
  rf::PlacementComponentTypeInfo *Entity;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v23;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  __int128 v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  BOOL v36;
  int32x2_t v37;
  float32x4_t v38;
  double v39;
  float32x4_t v40;
  float32x4_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  float32x4_t v55;
  float32x4_t *v56;
  float32x4_t v57;
  float32x4_t v58;
  _QWORD *CameraAnchor;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  float32x4_t v65;
  float32x4_t v66;
  _QWORD *i;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *j;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  char v101;
  _QWORD *result;
  uint64_t v103;
  __int128 v104;
  float32x4_t v105;
  __int128 v106;
  float32x4_t v107;
  __int128 v108;
  float32x4_t v109;
  __int128 v110;
  __int128 v111;
  char *DescriptorAnchorIdentifier;
  unint64_t v113;
  unint64_t v114;
  uint64_t *v115;
  uint64_t CustomComponent;
  uint64_t v117;
  uint64_t *v118;
  char v119;
  uuid_t uu;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  _BYTE v125[32];
  id v126;
  int v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  float32x4_t v132;
  _OWORD v133[2];
  id v134;
  __int128 v135;
  uint64_t *p_DescriptorAnchorIdentifier;
  unsigned __int8 *v137;
  char v138;
  char v139;
  _BYTE v140[138];
  _QWORD v141[3];
  _QWORD *v142;
  __int128 v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  float32x4_t v147;
  _OWORD v148[2];
  uint64_t v149;
  int v150;
  uint64_t v151;
  uint64_t v152;

  v152 = *MEMORY[0x24BDAC8D0];
  v117 = a4;
  v141[0] = &off_24EFDA3F8;
  v141[1] = &v117;
  v142 = v141;
  switch(REAnchoringComponentGetDescriptorType())
  {
    case 0u:
      if (rf::helpers::getInternalActiveCamera())
      {
        REEntityGetComponent();
        WorldMatrix4x4F = (rf::helpers *)RETransformComponentGetWorldMatrix4x4F();
        v108 = v10;
        v110 = v9;
        v104 = v12;
        v106 = v11;
        v13 = rf::helpers::kCameraIdentifier(WorldMatrix4x4F);
        v14 = v13[1];
        *(_OWORD *)a1 = *v13;
        *(_OWORD *)(a1 + 16) = v14;
        *(_OWORD *)(a1 + 32) = v110;
        *(_OWORD *)(a1 + 48) = v108;
        *(_OWORD *)(a1 + 64) = v106;
        *(_OWORD *)(a1 + 80) = v104;
        *(_QWORD *)(a1 + 96) = 16842752;
        *(_BYTE *)(a1 + 104) = 0;
        *(_QWORD *)(a1 + 112) = 0;
      }
      else
      {
        CameraAnchor = rf::helpers::getCameraAnchor((rf::helpers *)a5);
        v60 = *(_OWORD *)CameraAnchor;
        v61 = *((_OWORD *)CameraAnchor + 2);
        *(_OWORD *)(a1 + 16) = *((_OWORD *)CameraAnchor + 1);
        *(_OWORD *)(a1 + 32) = v61;
        *(_OWORD *)a1 = v60;
        v62 = *((_OWORD *)CameraAnchor + 3);
        v63 = *((_OWORD *)CameraAnchor + 4);
        v64 = *((_OWORD *)CameraAnchor + 5);
        *(_OWORD *)(a1 + 89) = *(_OWORD *)((char *)CameraAnchor + 89);
        *(_OWORD *)(a1 + 64) = v63;
        *(_OWORD *)(a1 + 80) = v64;
        *(_OWORD *)(a1 + 48) = v62;
        *(_QWORD *)(a1 + 112) = (id)CameraAnchor[14];
      }
      *(_DWORD *)(a1 + 256) = 0;
      goto LABEL_56;
    case 1u:
      REAnchoringComponentGetWorldTransformOfDescriptorTransform();
      v105 = v26;
      v107 = v25;
      v109 = v27;
      v111 = v28;
      v121.i8[0] = 0;
      v121.i64[1] = 0;
      uuid_clear(uu);
      v29 = v105;
      v30 = vmulq_f32(v107, v107);
      v34 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v30, 2), vaddq_f32(v30, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v30.f32, 1)));
      v34.f32[0] = sqrtf(v34.f32[0]);
      v31 = vmulq_f32(v29, v29);
      v32 = v109;
      v33 = vmulq_f32(v32, v32);
      v34.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1))).f32[0]);
      v34.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).f32[0]);
      v35 = vmulq_f32(v107, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v32, (int8x16_t)v32, 0xCuLL), (int8x16_t)v109, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v29, (int32x4_t)v29), (int8x16_t)v105, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v32, (int32x4_t)v32), (int8x16_t)v109, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v29, (int8x16_t)v29, 0xCuLL), (int8x16_t)v105, 8uLL)));
      v37 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v35, 2), vaddq_f32(v35, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.f32, 1))).u64[0];
      v36 = *(float *)v37.i32 <= 0.0;
      v37.i32[0] = -1.0;
      if (!v36)
        *(float *)v37.i32 = 1.0;
      v38 = vmulq_n_f32(v34, *(float *)v37.i32);
      v37.i32[0] = v38.i32[2];
      v39 = fabsf(v38.f32[2]);
      if (v39 <= 0.00001)
        *(float *)v37.i32 = 1.0;
      v40 = (float32x4_t)vdupq_lane_s32(v37, 0);
      LODWORD(v39) = v38.i32[1];
      if (fabsf(v38.f32[1]) <= 0.00001)
        *(float *)&v39 = 1.0;
      v41 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v39, 0);
      if (fabsf(v38.f32[0]) <= 0.00001)
        v38.f32[0] = 1.0;
      v122 = vdivq_f32(v107, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 0));
      v123 = vdivq_f32(v105, v41);
      v124 = vdivq_f32(v109, v40);
      *(_OWORD *)v125 = v111;
      *(_DWORD *)&v125[16] = 16842752;
      *(_DWORD *)&v125[20] = 0;
      v125[24] = 0;
      v143 = *(_OWORD *)uu;
      v144 = v121;
      v147 = v124;
      v148[0] = v111;
      *(_OWORD *)((char *)v148 + 9) = *(_OWORD *)&v125[9];
      v145 = v122;
      v146 = v123;
      v149 = 0;
      v150 = 0;
      if (*(_QWORD *)(a2 + 88))
      {
        std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v140, (uint64_t)&v143);
        v42 = *(_QWORD *)(a2 + 88);
        if (!v42)
          std::__throw_bad_function_call[abi:ne180100]();
        (*(void (**)(unsigned __int8 *__return_ptr, uint64_t, _BYTE *))(*(_QWORD *)v42 + 48))(uu, v42, v140);
        if (v150)
          std::__throw_bad_variant_access[abi:ne180100]();
        v143 = *(_OWORD *)uu;
        v144 = v121;
        std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v140);
      }
      v43 = *(_QWORD *)(a2 + 120);
      if (v43)
      {
        *(_QWORD *)uu = &v143;
        (*(void (**)(uint64_t, unsigned __int8 *))(*(_QWORD *)v43 + 48))(v43, uu);
      }
      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(a1, (uint64_t)&v143);
      *(_BYTE *)(a1 + 272) = 1;
      goto LABEL_60;
    case 2u:
      DescriptorAnchorIdentifier = (char *)REAnchoringComponentGetDescriptorAnchorIdentifier();
      *((_QWORD *)&v135 + 1) = a5;
      p_DescriptorAnchorIdentifier = (uint64_t *)&DescriptorAnchorIdentifier;
      LOBYTE(v137) = 1;
      v138 = 0;
      v139 = 0;
      if (!ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>>((uint64_t)&v135))
        goto LABEL_11;
      v16 = ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>>((uint64_t)&v135);
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&v143, (uint64_t)(v16 + 6));
      if (v150 == -1)
        std::__throw_bad_variant_access[abi:ne180100]();
      *(_QWORD *)uu = &v118;
      ((void (*)(float32x4_t *__return_ptr, unsigned __int8 *, __int128 *))off_24EFDA388[v150])(&v128, uu, &v143);
      v17 = v134;
      v124 = v132;
      *(_OWORD *)v125 = v133[0];
      *(_OWORD *)&v125[9] = *(_OWORD *)((char *)v133 + 9);
      *(float32x4_t *)uu = v128;
      v121 = v129;
      v122 = v130;
      v123 = v131;
      v126 = v17;
      v127 = 0;
      if (!v142)
        std::__throw_bad_function_call[abi:ne180100]();
      if ((*(unsigned int (**)(_QWORD *, unsigned __int8 *))(*v142 + 48))(v142, uu))
      {
        std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(a1, (uint64_t)uu);
        v18 = 1;
      }
      else
      {
        v18 = 0;
        *(_BYTE *)a1 = 0;
      }
      *(_BYTE *)(a1 + 272) = v18;
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)uu);

LABEL_60:
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v143);
      goto LABEL_112;
    case 3u:
      Entity = (rf::PlacementComponentTypeInfo *)REComponentGetEntity();
      v20 = rf::PlacementComponentTypeInfo::instance(Entity);
      if (!*v20)
      {
        v115 = v20;
        CustomComponent = 0;
LABEL_52:
        if (rf::helpers::getInternalActiveCamera())
        {
          REEntityGetComponent();
          RETransformComponentGetWorldMatrix4x4F();
          v143 = v54;
          v144 = v55;
          v56 = (float32x4_t *)&v143;
          v145 = v57;
          v146 = v58;
        }
        else
        {
          LOBYTE(v143) = 0;
          v56 = (float32x4_t *)(rf::helpers::getCameraAnchor((rf::helpers *)a5) + 4);
        }
        v65 = v56[1];
        v128 = *v56;
        v129 = v65;
        v66 = v56[3];
        v130 = v56[2];
        v131 = v66;
        v121.i64[1] = a5;
        v122.i64[0] = v117;
        v122.i8[8] = 1;
        v123.i8[0] = 0;
        v123.i8[8] = 0;
        v124.i8[0] = a5;
        v124.i8[7] = HIBYTE(a5);
        *(__int16 *)((char *)&v124.i16[2] + 1) = HIDWORD(a5) >> 8;
        *(__int32 *)((char *)v124.i32 + 1) = a5 >> 8;
        v124.i64[1] = (uint64_t)&v128;
        v125[0] = 1;
        v125[8] = 0;
        LOBYTE(v126) = 0;
        for (i = *(_QWORD **)(a5 + 16); i; i = (_QWORD *)*i)
        {
          if (rf::helpers::planeAnchorMatches((uint64_t)(i + 6)))
            break;
        }
        v123.i64[0] = (uint64_t)i;
        v123.i8[8] = 1;
        *(_QWORD *)&v143 = i;
        *((_QWORD *)&v143 + 1) = &v121;
        v144.i64[0] = (uint64_t)&v124;
        ranges::remove_if_view<ranges::transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_5>>::satisfy_forward((uint64_t)&v143, v47, v48, v49, v50, v51, v52, v53);
        *(_OWORD *)&v125[8] = v143;
        *(_QWORD *)&v125[24] = v144.i64[0];
        LOBYTE(v126) = 1;
        v135 = v143;
        v113 = 0;
        v114 = 0;
        DescriptorAnchorIdentifier = 0;
        p_DescriptorAnchorIdentifier = (uint64_t *)v144.i64[0];
        v137 = uu;
        v118 = (uint64_t *)&DescriptorAnchorIdentifier;
        v119 = 0;
        while ((_QWORD)v135)
        {
          ranges::basic_iterator<ranges::adaptor_cursor<ranges::basic_iterator<ranges::adaptor_cursor<std::__hash_map_const_iterator<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>,void *> *>>,ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>>::adaptor>>,ranges::iter_transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,ranges::indirected<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>>::adaptor<false>>>::operator*((uint64_t)&v143, v135, (uint64_t)p_DescriptorAnchorIdentifier, v68, v69, v70, v71, v72);
          if (v113 >= v114)
          {
            v75 = 0x8E38E38E38E38E39 * ((uint64_t)(v113 - (_QWORD)DescriptorAnchorIdentifier) >> 5);
            v76 = v75 + 1;
            if (v75 + 1 > 0xE38E38E38E38E3)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            if (0x1C71C71C71C71C72 * ((uint64_t)(v114 - (_QWORD)DescriptorAnchorIdentifier) >> 5) > v76)
              v76 = 0x1C71C71C71C71C72 * ((uint64_t)(v114 - (_QWORD)DescriptorAnchorIdentifier) >> 5);
            if (0x8E38E38E38E38E39 * ((uint64_t)(v114 - (_QWORD)DescriptorAnchorIdentifier) >> 5) >= 0x71C71C71C71C71)
              v77 = 0xE38E38E38E38E3;
            else
              v77 = v76;
            if (v77)
            {
              if (v77 > 0xE38E38E38E38E3)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v78 = (char *)operator new(288 * v77);
            }
            else
            {
              v78 = 0;
            }
            v79 = &v78[288 * v77];
            v80 = std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&v78[288 * v75], (uint64_t)&v143);
            *(_QWORD *)(v80 + 272) = v151;
            v74 = v80 + 288;
            v82 = (uint64_t)DescriptorAnchorIdentifier;
            v81 = (char *)v113;
            if ((char *)v113 == DescriptorAnchorIdentifier)
            {
              DescriptorAnchorIdentifier = (char *)v80;
              v113 = v80 + 288;
              v114 = (unint64_t)v79;
            }
            else
            {
              do
              {
                v83 = v80;
                v80 = std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v80 - 288, (uint64_t)(v81 - 288));
                *(_QWORD *)(v83 - 16) = *((_QWORD *)v81 - 2);
                v81 -= 288;
              }
              while (v81 != (char *)v82);
              v81 = DescriptorAnchorIdentifier;
              v84 = v113;
              DescriptorAnchorIdentifier = (char *)v80;
              v113 = v74;
              v114 = (unint64_t)v79;
              while ((char *)v84 != v81)
              {
                v84 -= 288;
                std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor(v84);
              }
            }
            if (v81)
              operator delete(v81);
          }
          else
          {
            v73 = std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v113, (uint64_t)&v143);
            *(_QWORD *)(v73 + 272) = v151;
            v74 = v73 + 288;
          }
          v113 = v74;
          std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v143);
          for (j = *(_QWORD **)v135; ; j = (_QWORD *)*j)
          {
            *(_QWORD *)&v135 = j;
            if (!j || rf::helpers::planeAnchorMatches((uint64_t)(j + 6)))
              break;
          }
          ranges::remove_if_view<ranges::transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_5>>::satisfy_forward((uint64_t)&v135, v85, v86, v87, v88, v89, v90, v91);
        }
        v93 = (uint64_t)DescriptorAnchorIdentifier;
        v94 = v113;
        if (DescriptorAnchorIdentifier != (char *)v113)
        {
          v95 = v113 - (_QWORD)DescriptorAnchorIdentifier;
          if (v113 - (_QWORD)DescriptorAnchorIdentifier == 288)
          {
            ranges::detail::introsort_loop<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,long,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>((uint64_t)DescriptorAnchorIdentifier, v113, 0, (uint64_t)&v135);
          }
          else
          {
            v96 = 0;
            v97 = 0x8E38E38E38E38E39 * (v95 >> 5);
            do
            {
              v97 >>= 1;
              v96 += 2;
            }
            while (v97 != 1);
            ranges::detail::introsort_loop<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,long,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>((uint64_t)DescriptorAnchorIdentifier, v113, v96, (uint64_t)&v135);
            if (v95 >= 4609)
            {
              v98 = v93 + 4608;
              ranges::detail::insertion_sort<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>(v93, v93 + 4608);
              if (v93 + 4608 != v94)
              {
                do
                {
                  std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&v143, v98);
                  v151 = *(_QWORD *)(v98 + 272);
                  if ((v151 & 0xFF00000000) == 0)
LABEL_118:
                    std::__throw_bad_optional_access[abi:ne180100]();
                  v99 = v93;
                  while (1)
                  {
                    if (!*(_BYTE *)(v99 + 4596))
                      goto LABEL_118;
                    if (*(float *)&v151 >= *(float *)(v99 + 4592))
                      break;
                    std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v99 + 4608, v99 + 4320);
                    *(_DWORD *)(v99 + 4880) = *(_DWORD *)(v99 + 4592);
                    *(_BYTE *)(v99 + 4884) = *(_BYTE *)(v99 + 4596);
                    v99 -= 288;
                    if (!BYTE4(v151))
                      goto LABEL_118;
                  }
                  std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v99 + 4608, (uint64_t)&v143);
                  v100 = BYTE4(v151);
                  *(_DWORD *)(v99 + 4880) = v151;
                  *(_BYTE *)(v99 + 4884) = v100;
                  std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v143);
                  v98 += 288;
                  v93 += 288;
                }
                while (v98 != v94);
              }
              goto LABEL_108;
            }
          }
          ranges::detail::insertion_sort<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>(v93, v94);
        }
LABEL_108:
        if ((char *)v113 == DescriptorAnchorIdentifier)
        {
          v101 = 0;
          *(_BYTE *)a1 = 0;
        }
        else
        {
          std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, (uint64_t)DescriptorAnchorIdentifier);
          v101 = 1;
        }
        *(_BYTE *)(a1 + 272) = v101;
        *(_QWORD *)&v143 = &DescriptorAnchorIdentifier;
        std::vector<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v143);
        goto LABEL_112;
      }
      v115 = v20;
      CustomComponent = REEntityGetCustomComponent();
      if (!CustomComponent)
        goto LABEL_52;
      rf::PlacementComponent::identifier((rf::PlacementComponent *)&v115, (uint64_t)&v143);
      v21 = std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>((_QWORD *)a5, (uint64_t)&v143);
      if (v21)
      {
        if (!v142)
          std::__throw_bad_function_call[abi:ne180100]();
        v22 = (uint64_t)(v21 + 6);
        if ((*(unsigned int (**)(_QWORD *, _QWORD *))(*v142 + 48))(v142, v21 + 6))
        {
          std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, v22);
          goto LABEL_56;
        }
      }
LABEL_50:
      v46 = 0;
      *(_BYTE *)a1 = 0;
LABEL_57:
      *(_BYTE *)(a1 + 272) = v46;
LABEL_112:
      result = v142;
      if (v142 == v141)
      {
        v103 = 4;
        result = v141;
      }
      else
      {
        if (!v142)
          return result;
        v103 = 5;
      }
      return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v103))();
    case 4u:
      *((_QWORD *)&v143 + 1) = a5;
      v144.i64[0] = (uint64_t)&v117;
      v144.i8[8] = 1;
      v145.i8[0] = 0;
      v145.i8[8] = 0;
      if (!ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>>((uint64_t)&v143))
        goto LABEL_50;
      v15 = ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>>((uint64_t)&v143);
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, (uint64_t)(v15 + 6));
      goto LABEL_56;
    case 5u:
      *((_QWORD *)&v143 + 1) = a5;
      v144.i64[0] = (uint64_t)&v117;
      v144.i8[8] = 1;
      v145.i8[0] = 0;
      v145.i8[8] = 0;
      if (!ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>>((uint64_t)&v143))
        goto LABEL_50;
      v44 = ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>>((uint64_t)&v143);
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, (uint64_t)(v44 + 6));
      goto LABEL_56;
    case 6u:
      v23 = *(uint64_t **)(a5 + 16);
      if (!v23)
        goto LABEL_50;
      while (*((_DWORD *)v23 + 76) != 4 || *((_BYTE *)v23 + 147) == 0)
      {
        v23 = (uint64_t *)*v23;
        if (!v23)
          goto LABEL_50;
      }
      goto LABEL_23;
    case 7u:
      v23 = *(uint64_t **)(a5 + 16);
      if (!v23)
        goto LABEL_50;
      while (*((_DWORD *)v23 + 76) != 5 || *((_BYTE *)v23 + 147) == 0)
      {
        v23 = (uint64_t *)*v23;
        if (!v23)
          goto LABEL_50;
      }
LABEL_23:
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, (uint64_t)(v23 + 6));
LABEL_56:
      v46 = 1;
      goto LABEL_57;
    default:
LABEL_11:
      *(_BYTE *)a1 = 0;
      *(_BYTE *)(a1 + 272) = 0;
      goto LABEL_112;
  }
}

void sub_2277E5B58(_Unwind_Exception *a1)
{
  unint64_t *v2;
  uint64_t v3;

  v2 = (unint64_t *)STACK[0x368];
  if ((unint64_t *)STACK[0x368] == &STACK[0x350])
  {
    v3 = 4;
    v2 = &STACK[0x350];
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  _Unwind_Resume(a1);
}

rf *rf::data_flow::consumer::AnchorManagementConsumer::updateEntityWithAnchor(uint64_t a1, uint64_t a2, uint64_t a3, rf::helpers *a4)
{
  rf *v8;
  NSObject *v9;
  uint64_t Name;
  uint64_t LocalId;
  _BYTE *v12;
  uint64_t v13;
  _QWORD *CameraAnchor;
  rf *result;
  NSObject *v16;
  uint64_t v17;
  void **v18;
  uint64_t ComponentByClass;
  _BYTE buf[22];
  __int16 v21;
  _BYTE *v22;
  void *v23[2];
  char v24;
  _BYTE __p[12];
  __int16 v26;
  void **v27;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  REAnchorComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REAnchoringComponentGetComponentType();
  ComponentByClass = REEntityGetComponentByClass();
  rf::helpers::getRFUUIDFromAnchor(a3, (uint64_t)v23);
  v8 = (rf *)relocalizeEntityIfNeeded((uint64_t)v23, a4);
  if ((_DWORD)v8)
  {
    rf::realityFusionLogObject(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      Name = REEntityGetName();
      LocalId = REEntityGetLocalId();
      rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v23, __p);
      v12 = v28 >= 0 ? __p : *(_BYTE **)__p;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = Name;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = LocalId;
      v21 = 2080;
      v22 = v12;
      _os_log_impl(&dword_227777000, v9, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Relocalizing entity %s, %llu, holding anchor with identifier %s", buf, 0x20u);
      if (v28 < 0)
        operator delete(*(void **)__p);
    }

    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
    {
      *(_QWORD *)buf = a2;
      *(_DWORD *)__p = 5;
      (*(void (**)(uint64_t, _BYTE *, _BYTE *))(*(_QWORD *)v13 + 48))(v13, buf, __p);
    }
  }
  CameraAnchor = rf::helpers::getCameraAnchor(a4);
  rf::helpers::getTransformFromAnchor(a3, (uint64_t)&ComponentByClass, (uint64_t)(CameraAnchor + 4), a1 + 168, buf);
  REAnchorComponentSetWorldTransform();
  if (REAnchorComponentGetAnchoredLocally())
    return (rf *)rf::helpers::isRemotelyOwned();
  REAnchorComponentSetAnchoredLocally();
  result = (rf *)rf::helpers::isRemotelyOwned();
  if ((_DWORD)result)
  {
    rf::realityFusionLogObject(result);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = REEntityGetName();
      rf::helpers::getRFUUIDFromAnchor(a3, (uint64_t)buf);
      rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)buf, v23);
      if (v24 >= 0)
        v18 = v23;
      else
        v18 = (void **)v23[0];
      *(_DWORD *)__p = 136315394;
      *(_QWORD *)&__p[4] = v17;
      v26 = 2080;
      v27 = v18;
      _os_log_impl(&dword_227777000, v16, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Anchoring remote entity %s to anchor %s.", __p, 0x16u);
      if (v24 < 0)
        operator delete(v23[0]);
    }

    result = *(rf **)(a1 + 48);
    if (result)
    {
      *(_QWORD *)buf = a2;
      LODWORD(v23[0]) = 1;
      return (rf *)(*(uint64_t (**)(rf *, _BYTE *, void **))(*(_QWORD *)result + 48))(result, buf, v23);
    }
  }
  return result;
}

void sub_2277E5F5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void rf::data_flow::consumer::AnchorManagementConsumer::matchOrUpdateAnchorComponent(REScene *,REEntity *,REComponent *,REComponent *,rf::ARStateData const&,BOOL,unsigned long long &)::$_0::operator()(unint64_t **a1)
{
  unint64_t *v1;
  unint64_t v2;
  NSObject *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = a1[1];
  v2 = **a1 + 1;
  **a1 = v2;
  if (v2 >= v1[58])
  {
    rf::realityFusionLogObject((rf *)a1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = **a1;
      v6 = v1[58];
      v7 = 134218240;
      v8 = v5;
      v9 = 2048;
      v10 = v6;
      _os_log_error_impl(&dword_227777000, v4, OS_LOG_TYPE_ERROR, "AnchorManagementConsumer: %llu anchoring updated this frame, which more than %llu, this could cause backboardd hang", (uint8_t *)&v7, 0x16u);
    }

  }
}

uint64_t rf::data_flow::consumer::AnchorManagementConsumer::matchAndReanchorEntity(rf::PlacementComponentTypeInfo *a1, uint64_t a2, uint64_t a3, rf::helpers *a4)
{
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const void *v14;
  uint64_t v15;
  int DescriptorAlignment;
  uint64_t v17;
  NSObject *v18;
  float32x4_t v19;
  _QWORD *CameraAnchor;
  _QWORD *v21;
  float32x4_t v22;
  float32x2_t v23;
  const unsigned __int8 *v24;
  const unsigned __int8 *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v36;
  uint64_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  int8x16_t v43;
  float32x4_t v44;
  uint64_t v45;
  uint64_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  unint64_t DescriptorClassification;
  uint64_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  uint64_t ComponentByClass;
  _OWORD v60[8];
  _BYTE v61[272];
  __int128 v62;
  __int128 v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67[2];
  id v68;
  simd_float4 v69;
  simd_float4 v70;
  simd_float4 v71;
  simd_float4 v72;
  __int128 v73;
  uint64_t v74;
  void *__p;
  void *v76;
  uint64_t v77;
  uint8_t buf[16];
  __int128 v79;
  simd_float4 v80;
  float32x4_t v81;
  simd_float4 v82;
  _BYTE v83[25];
  id v84;
  simd_float4 v85;
  simd_float4 v86;
  simd_float4 v87;
  simd_float4 v88;
  __int128 v89;
  uint64_t v90;
  const void *v91;
  uint64_t v92;
  int v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _OWORD v99[2];
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a3 + 256) != 1 || *rf::PlacementComponentTypeInfo::instance(a1) && REEntityGetCustomComponent())
    return 0;
  if (*(_DWORD *)(a3 + 256) != 1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v9 = *(_OWORD *)(a3 + 80);
  v98 = *(_OWORD *)(a3 + 64);
  v99[0] = v9;
  *(_OWORD *)((char *)v99 + 9) = *(_OWORD *)(a3 + 89);
  v10 = *(_OWORD *)(a3 + 16);
  v94 = *(_OWORD *)a3;
  v95 = v10;
  v11 = *(_OWORD *)(a3 + 32);
  v97 = *(_OWORD *)(a3 + 48);
  v96 = v11;
  v100 = *(id *)(a3 + 112);
  v12 = *(_OWORD *)(a3 + 176);
  v103 = *(_OWORD *)(a3 + 160);
  v104 = v12;
  v105 = *(_OWORD *)(a3 + 192);
  v13 = *(_OWORD *)(a3 + 144);
  v101 = *(_OWORD *)(a3 + 128);
  v102 = v13;
  v14 = *(const void **)(a3 + 216);
  v106 = *(_QWORD *)(a3 + 208);
  v107 = 0;
  v15 = *(_QWORD *)(a3 + 224);
  v109 = 0;
  v108 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v107, v14, v15, (v15 - (uint64_t)v14) >> 4);
  REAnchoringComponentGetComponentType();
  ComponentByClass = REEntityGetComponentByClass();
  if (REAnchoringComponentGetDescriptorType() == 3)
  {
    DescriptorAlignment = REAnchoringComponentGetDescriptorAlignment();
    DescriptorClassification = REAnchoringComponentGetDescriptorClassification();
    REAnchoringComponentGetDescriptorBounds();
    v54 = v17;
    RETransformComponentGetComponentType();
    if (!REEntityGetComponentByClass())
    {
      rf::realityFusionLogObject(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = REEntityGetName();
        _os_log_impl(&dword_227777000, v18, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer::matchAndReanchorEntity(): Transform component not found when attempting to match & reanchor entity %s, adding one", buf, 0xCu);
      }

      RETransformComponentGetComponentType();
      REEntityAddComponentByClass();
    }
    RETransformComponentGetLocalSRT();
    v50 = v19;
    CameraAnchor = rf::helpers::getCameraAnchor(a4);
    rf::helpers::getTransformFromAnchor(a3, (uint64_t)&ComponentByClass, (uint64_t)(CameraAnchor + 4), (uint64_t)a1 + 168, &v55);
    v21 = (_QWORD *)*((_QWORD *)a4 + 2);
    if (v21)
    {
      v47 = (uint64_t)a1;
      v22 = vaddq_f32(v58, vmlaq_laneq_f32(vmlaq_f32(vmulq_n_f32(v55, v50.f32[0]), (float32x4_t)0, v56), v57, v50, 2));
      v48 = vdivq_f32(v22, (float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 3));
      v49 = vmlaq_f32(vaddq_f32(vmulq_f32(v55, (float32x4_t)0), v56), (float32x4_t)0, v57);
      v51 = vnegq_f32(v49);
      v52 = vaddq_f32(v48, vmulq_f32(v49, (float32x4_t)vdupq_n_s32(0x3D4CCCCDu)));
      v23 = (float32x2_t)vdup_n_s32(0x3DCCCCCDu);
      while (1)
      {
        std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)buf, (uint64_t)(v21 + 6));
        if (v93 != 1)
        {
          std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
          goto LABEL_31;
        }
        v66 = (float32x4_t)v82;
        v67[0] = *(float32x4_t *)v83;
        *(float32x4_t *)((char *)v67 + 9) = *(float32x4_t *)&v83[9];
        v62 = *(_OWORD *)buf;
        v63 = v79;
        v64 = (float32x4_t)v80;
        v65 = v81;
        v68 = v84;
        v71 = v87;
        v72 = v88;
        v73 = v89;
        v74 = v90;
        v69 = v85;
        v70 = v86;
        v76 = 0;
        v77 = 0;
        __p = 0;
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&__p, v91, v92, (v92 - (uint64_t)v91) >> 4);
        v24 = (_BYTE)v63 ? (const unsigned __int8 *)v62 : (const unsigned __int8 *)&v62;
        v25 = (_BYTE)v95 ? (const unsigned __int8 *)v94 : (const unsigned __int8 *)&v94;
        if (!uuid_compare(v24, v25))
          break;
        if (DescriptorAlignment != 255)
        {
          if ((_DWORD)v74)
          {
            if ((_DWORD)v74 != 1 || (DescriptorAlignment & 2) == 0)
              break;
          }
          else if ((DescriptorAlignment & 1) == 0)
          {
            break;
          }
        }
        v27 = rf::helpers::classificationMatches(SHIDWORD(v74), DescriptorClassification);
        v26 = 1;
        if ((_DWORD)v27 && *(float *)&v73 >= *(float *)&v54 && *((float *)&v73 + 2) >= *((float *)&v54 + 1))
        {
          v35 = rf::helpers::rayPlaneHitTestInBounds(v52, v51, (simd_float4)v64, v65, (simd_float4)v66, v67[0], v27, v28, v29, v30, v31, v32, v33, v34, v71, v72, v69, v70, (float32x4_t)v71);
          if ((v35 & 0xFF00000000) != 0)
          {
            if (*(float *)&v35 == 0.0)
              v36 = 0;
            else
              v36 = -127;
            if (*(float *)&v35 > 0.0)
              v36 = 1;
            if (*(float *)&v35 < 0.0)
              v36 = -1;
          }
          else
          {
            v36 = -1;
          }
          if (v36 == 129 || (v36 & 0x80) == 0)
          {
            v37 = 0;
            v38 = v64;
            v39 = v65;
            v40 = v66;
            v41 = v67[0];
            v60[0] = v69;
            v60[1] = v70;
            v60[2] = v71;
            v60[3] = v72;
            do
            {
              v60[v37 + 4] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v38, COERCE_FLOAT(v60[v37])), v39, *(float32x2_t *)&v60[v37], 1), v40, (float32x4_t)v60[v37], 2), v41, (float32x4_t)v60[v37], 3);
              ++v37;
            }
            while (v37 != 4);
            v42 = vmlaq_f32(vaddq_f32(vmulq_f32(v38, (float32x4_t)0), v39), (float32x4_t)0, v40);
            v43 = (int8x16_t)vabdq_f32(v49, v42);
            v26 = 1;
            if (*(float *)v43.i32 <= 0.1)
            {
              v43.i32[0] = vextq_s8(v43, v43, 8uLL).u32[0];
              *(int32x2_t *)v43.i8 = vcgt_f32(*(float32x2_t *)v43.i8, v23);
              if ((v43.i8[4] & 1) == 0 && (v43.i8[0] & 1) == 0)
              {
                v44 = vmulq_f32(v42, vsubq_f32(v48, (float32x4_t)v60[7]));
                if (fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v44, 2), vaddq_f32(v44, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v44.f32, 1))).f32[0]) <= 0.05)
                {
                  std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v61, (uint64_t)buf);
                  rf::data_flow::consumer::AnchorManagementConsumer::anchorEntity(v47, a2, (uint64_t)v61, ComponentByClass, a4, 0);
                  std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v61);
                  v45 = *(_QWORD *)(v47 + 48);
                  if (v45)
                    std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()(v45, a2, 1);
                  RETransformComponentGetLocalSRT();
                  RETransformComponentSetLocalSRT();
                  v26 = 0;
                }
              }
            }
          }
        }
LABEL_26:
        if (__p)
        {
          v76 = __p;
          operator delete(__p);
        }

        std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
        if ((v26 & 1) == 0)
        {
          v8 = 1;
          goto LABEL_58;
        }
LABEL_31:
        v21 = (_QWORD *)*v21;
        if (!v21)
          goto LABEL_57;
      }
      v26 = 1;
      goto LABEL_26;
    }
  }
LABEL_57:
  v8 = 0;
LABEL_58:
  if (v107)
  {
    v108 = v107;
    operator delete(v107);
  }

  return v8;
}

void sub_2277E6644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&a61);
  rf::data_flow::PlaneAnchor::~PlaneAnchor((rf::data_flow::PlaneAnchor *)&STACK[0x2B0]);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&STACK[0x3A0]);
  rf::data_flow::PlaneAnchor::~PlaneAnchor((rf::data_flow::PlaneAnchor *)&STACK[0x4B0]);
  _Unwind_Resume(a1);
}

_QWORD *std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator=(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  std::__function::__value_func<void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__value_func[abi:ne180100]((uint64_t)v6, a2);
  std::__function::__value_func<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::swap[abi:ne180100](v6, a1);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

_QWORD *std::function<rf::data_flow::RFUUID ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>)>::operator=(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  std::__function::__value_func<void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__value_func[abi:ne180100]((uint64_t)v6, a2);
  std::__function::__value_func<rf::data_flow::RFUUID ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>)>::swap[abi:ne180100](v6, a1);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

_QWORD *std::function<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::operator=(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  std::__function::__value_func<void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__value_func[abi:ne180100]((uint64_t)v6, a2);
  std::__function::__value_func<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::swap[abi:ne180100](v6, a1);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

_QWORD *std::function<void ()(NSSet<ARReferenceImage *> *)>::operator=(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  std::__function::__value_func<void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__value_func[abi:ne180100]((uint64_t)v6, a2);
  std::__function::__value_func<void ()(NSSet<ARReferenceImage *> *)>::swap[abi:ne180100](v6, a1);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

uint64_t relocalizeEntityIfNeeded(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = REAnchorComponentGetIsAnchorExternal();
  if ((_DWORD)result)
  {
    result = (uint64_t)std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>(a2, a1);
    if (result)
    {
      REAnchorComponentSetIsAnchorExternal();
      if (REAnchorComponentGetSendIsAnchoredToClient())
        RENetworkMarkComponentDirty();
      return 1;
    }
  }
  return result;
}

uint64_t ranges::remove_if_view<std::span<REComponent *,18446744073709551615ul>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>>::satisfy_forward(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t Object;
  uint64_t v6;

  v3 = result + 8 * a2;
  if (*a3 != v3)
  {
    do
    {
      Object = RECustomComponentGetObject();
      result = REComponentGetEntity();
      if (*(_BYTE *)(Object + 21))
      {
        result = rf::helpers::isRemotelyOwned();
        if (!(_DWORD)result)
          break;
      }
      v6 = *a3 + 8;
      *a3 = v6;
    }
    while (v6 != v3);
  }
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  result = RENetworkMarkComponentDirty();
  *(_BYTE *)(**(_QWORD **)v1 + 72) = 0;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t ***a1, uint64_t a2)
{
  uint64_t **v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v8;
  __int128 v9;

  v3 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  RENetworkMarkComponentDirty();
  v4 = **v3;
  *(_BYTE *)(v4 + 72) = 0;
  v8 = *(_OWORD *)(a2 + 192);
  v9 = 0u;
  v5 = *(_OWORD *)(a2 + 176);
  v6 = v8;
  DWORD1(v6) = DWORD1(v9);
  *(_DWORD *)(v4 + 16) = 1;
  *(_OWORD *)(v4 + 32) = v5;
  *(_OWORD *)(**v3 + 48) = v6;
  return RENetworkMarkComponentDirty();
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  result = RENetworkMarkComponentDirty();
  *(_BYTE *)(**(_QWORD **)v1 + 72) = 0;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  result = RENetworkMarkComponentDirty();
  *(_BYTE *)(**(_QWORD **)v1 + 72) = 0;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  result = RENetworkMarkComponentDirty();
  *(_BYTE *)(**(_QWORD **)v1 + 72) = 0;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<5ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  result = RENetworkMarkComponentDirty();
  *(_BYTE *)(**(_QWORD **)v1 + 72) = 0;
  return result;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ARReferenceImage * {__strong}>,0>((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

_QWORD *ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>>(uint64_t a1)
{
  _QWORD *i;
  const unsigned __int8 *v3;
  _QWORD v5[2];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 40))
    return *(_QWORD **)(a1 + 32);
  for (i = *(_QWORD **)(*(_QWORD *)(a1 + 8) + 16); i; i = (_QWORD *)*i)
  {
    rf::helpers::getRFUUIDFromAnchor((uint64_t)(i + 6), (uint64_t)v5);
    if (v6)
      v3 = (const unsigned __int8 *)v5[0];
    else
      v3 = (const unsigned __int8 *)v5;
    if (!uuid_compare(v3, **(const unsigned __int8 ***)(a1 + 16)))
      break;
  }
  *(_QWORD *)(a1 + 32) = i;
  *(_BYTE *)(a1 + 40) = 1;
  return i;
}

id std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  id result;

  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  result = *(id *)(a1 + 112);
  *(_QWORD *)(a2 + 112) = result;
  return result;
}

id std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  id result;

  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  result = *(id *)(a1 + 112);
  *(_QWORD *)(a2 + 112) = result;
  return result;
}

id std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  id result;

  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  result = *(id *)(a1 + 112);
  *(_QWORD *)(a2 + 112) = result;
  return result;
}

id std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  id result;

  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  result = *(id *)(a1 + 112);
  *(_QWORD *)(a2 + 112) = result;
  return result;
}

id std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  id result;

  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  result = *(id *)(a1 + 112);
  *(_QWORD *)(a2 + 112) = result;
  return result;
}

id std::__variant_detail::__visitation::__base::__dispatcher<5ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  id result;

  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  result = *(id *)(a1 + 112);
  *(_QWORD *)(a2 + 112) = result;
  return result;
}

void std::vector<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor(v4 - 288);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>>(uint64_t a1)
{
  _QWORD *i;

  if (*(_BYTE *)(a1 + 40))
    return *(_QWORD **)(a1 + 32);
  for (i = *(_QWORD **)(*(_QWORD *)(a1 + 8) + 16); i; i = (_QWORD *)*i)
  {
    if ((rf::helpers::imageAnchorMatches((uint64_t)(i + 6), **(_QWORD **)(a1 + 16), 1) & 1) != 0)
      break;
  }
  *(_QWORD *)(a1 + 32) = i;
  *(_BYTE *)(a1 + 40) = 1;
  return i;
}

_QWORD *ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>>(uint64_t a1)
{
  _QWORD *i;

  if (*(_BYTE *)(a1 + 40))
    return *(_QWORD **)(a1 + 32);
  for (i = *(_QWORD **)(*(_QWORD *)(a1 + 8) + 16); i; i = (_QWORD *)*i)
  {
    if (rf::helpers::objectAnchorMatches((uint64_t)(i + 6)))
      break;
  }
  *(_QWORD *)(a1 + 32) = i;
  *(_BYTE *)(a1 + 40) = 1;
  return i;
}

uint64_t ___ZZN2rf9data_flow8consumer24AnchorManagementConsumer37listenToSceneRemovalForReferenceAssetEP7RESceneP16REServiceLocatorENK3__0cvU13block_pointerF20REEventHandlerResultPvPKvEEv_block_invoke(uint64_t a1)
{
  int8x8_t *v1;
  int8x8_t *v2;
  unsigned __int8 *v3;
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  int8x8_t **v10;
  int8x8_t *i;
  unint64_t v12;
  int8x8_t v13;
  unint64_t v14;
  uint8x8_t v15;
  int8x8_t *v16;
  int8x8_t *v17;
  int8x8_t *v18;
  unint64_t v19;
  unint64_t v20;
  int8x8_t v21;
  unint64_t v22;
  id v23;
  __int128 *v25[2];
  char v26;

  v1 = *(int8x8_t **)(a1 + 32);
  v2 = v1 + 52;
  v3 = (unsigned __int8 *)(a1 + 40);
  v25[0] = (__int128 *)(a1 + 40);
  if (*((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v1[52], (unsigned __int8 *)(a1 + 40), v25)+ 8))
  {
    v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v1[55], (uint64_t)v3);
    v5 = v1[53];
    if (v5)
    {
      v6 = v4;
      v7 = (uint8x8_t)vcnt_s8(v5);
      v7.i16[0] = vaddlv_u8(v7);
      v8 = v7.u32[0];
      if (v7.u32[0] > 1uLL)
      {
        v9 = v4;
        if (v4 >= *(_QWORD *)&v5)
          v9 = v4 % *(_QWORD *)&v5;
      }
      else
      {
        v9 = (*(_QWORD *)&v5 - 1) & v4;
      }
      v10 = *(int8x8_t ***)(*(_QWORD *)v2 + 8 * v9);
      if (v10)
      {
        for (i = *v10; i; i = (int8x8_t *)*i)
        {
          v12 = (unint64_t)i[1];
          if (v12 == v6)
          {
            if ((std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)&v1[56], (unsigned __int8 *)&i[2], v3) & 1) != 0)
            {
              v13 = v1[53];
              v14 = (unint64_t)i[1];
              v15 = (uint8x8_t)vcnt_s8(v13);
              v15.i16[0] = vaddlv_u8(v15);
              if (v15.u32[0] > 1uLL)
              {
                v16 = v1 + 55;
                if (v14 >= *(_QWORD *)&v13)
                  v14 %= *(_QWORD *)&v13;
              }
              else
              {
                v14 &= *(_QWORD *)&v13 - 1;
                v16 = v1 + 55;
              }
              v17 = *(int8x8_t **)(*(_QWORD *)v2 + 8 * v14);
              do
              {
                v18 = v17;
                v17 = (int8x8_t *)*v17;
              }
              while (v17 != i);
              if (v18 == &v1[54])
                goto LABEL_36;
              v19 = (unint64_t)v18[1];
              if (v15.u32[0] > 1uLL)
              {
                if (v19 >= *(_QWORD *)&v13)
                  v19 %= *(_QWORD *)&v13;
              }
              else
              {
                v19 &= *(_QWORD *)&v13 - 1;
              }
              if (v19 != v14)
              {
LABEL_36:
                if (!*(_QWORD *)i)
                  goto LABEL_37;
                v20 = *(_QWORD *)(*(_QWORD *)i + 8);
                if (v15.u32[0] > 1uLL)
                {
                  if (v20 >= *(_QWORD *)&v13)
                    v20 %= *(_QWORD *)&v13;
                }
                else
                {
                  v20 &= *(_QWORD *)&v13 - 1;
                }
                if (v20 != v14)
LABEL_37:
                  *(_QWORD *)(*(_QWORD *)v2 + 8 * v14) = 0;
              }
              v21 = *i;
              if (*i)
              {
                v22 = *(_QWORD *)(*(_QWORD *)&v21 + 8);
                if (v15.u32[0] > 1uLL)
                {
                  if (v22 >= *(_QWORD *)&v13)
                    v22 %= *(_QWORD *)&v13;
                }
                else
                {
                  v22 &= *(_QWORD *)&v13 - 1;
                }
                if (v22 != v14)
                {
                  *(_QWORD *)(*(_QWORD *)v2 + 8 * v22) = v18;
                  v21 = *i;
                }
              }
              *v18 = v21;
              *i = 0;
              --*(_QWORD *)v16;
              v25[0] = (__int128 *)i;
              v25[1] = (__int128 *)&v1[54];
              v26 = 1;
              std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>>>>::reset[abi:ne180100]((uint64_t)v25);
              break;
            }
          }
          else
          {
            if (v8 > 1)
            {
              if (v12 >= *(_QWORD *)&v5)
                v12 %= *(_QWORD *)&v5;
            }
            else
            {
              v12 &= *(_QWORD *)&v5 - 1;
            }
            if (v12 != v9)
              break;
          }
        }
      }
    }
    if (v1[19])
    {
      v23 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      std::function<void ()(NSSet<ARReferenceImage *> *)>::operator()((uint64_t)&v1[16], v23);

    }
  }
  return 1;
}

void sub_2277E73A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c128_ZTSKZN2rf9data_flow8consumer24AnchorManagementConsumer37listenToSceneRemovalForReferenceAssetEP7RESceneP16REServiceLocatorE3__0(uint64_t a1, uint64_t a2)
{
  std::string *v2;
  __int128 v3;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v2 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 40), *(_QWORD *)(a2 + 48));
  }
  else
  {
    v3 = *(_OWORD *)(a2 + 40);
    v2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 56);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_ea8_32c128_ZTSKZN2rf9data_flow8consumer24AnchorManagementConsumer37listenToSceneRemovalForReferenceAssetEP7RESceneP16REServiceLocatorE3__0(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,0>((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

char *std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, __int128 **a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  void **v13;
  char *v14;
  unint64_t v15;
  __int128 *v16;
  _QWORD *v17;
  std::string *v18;
  __int128 v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD v30[2];
  char v31;

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      v14 = (char *)*v13;
      if (*v13)
      {
        do
        {
          v15 = *((_QWORD *)v14 + 1);
          if (v15 == v9)
          {
            if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, (unsigned __int8 *)v14 + 16, a2) & 1) != 0)
              return v14;
          }
          else
          {
            if (v12 > 1)
            {
              if (v15 >= v10)
                v15 %= v10;
            }
            else
            {
              v15 &= v10 - 1;
            }
            if (v15 != v3)
              break;
          }
          v14 = *(char **)v14;
        }
        while (v14);
      }
    }
  }
  v16 = *a3;
  v17 = (_QWORD *)(a1 + 16);
  v14 = (char *)operator new(0x50uLL);
  v30[0] = v14;
  v30[1] = a1 + 16;
  v31 = 0;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = v9;
  v18 = (std::string *)(v14 + 16);
  if (*((char *)v16 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v18, *(const std::string::value_type **)v16, *((_QWORD *)v16 + 1));
  }
  else
  {
    v19 = *v16;
    *((_QWORD *)v14 + 4) = *((_QWORD *)v16 + 2);
    *(_OWORD *)&v18->__r_.__value_.__l.__data_ = v19;
  }
  *(_OWORD *)(v14 + 56) = 0u;
  *(_OWORD *)(v14 + 40) = 0u;
  *((_DWORD *)v14 + 18) = 1065353216;
  v31 = 1;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v10 || (float)(v21 * (float)v10) < v20)
  {
    v22 = 1;
    if (v10 >= 3)
      v22 = (v10 & (v10 - 1)) != 0;
    v23 = v22 | (2 * v10);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,long long>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,long long>>>::__rehash<true>(a1, v25);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v26 = *(_QWORD *)a1;
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v27)
  {
    *(_QWORD *)v14 = *v27;
LABEL_41:
    *v27 = v14;
    goto LABEL_42;
  }
  *(_QWORD *)v14 = *v17;
  *v17 = v14;
  *(_QWORD *)(v26 + 8 * v3) = v17;
  if (*(_QWORD *)v14)
  {
    v28 = *(_QWORD *)(*(_QWORD *)v14 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v28 >= v10)
        v28 %= v10;
    }
    else
    {
      v28 &= v10 - 1;
    }
    v27 = (_QWORD *)(*(_QWORD *)a1 + 8 * v28);
    goto LABEL_41;
  }
LABEL_42:
  v30[0] = 0;
  ++*v7;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>>>>::reset[abi:ne180100]((uint64_t)v30);
  return v14;
}

void sub_2277E76C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::~__func()
{
  JUMPOUT(0x22E29DD50);
}

_QWORD *std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24EFDA3F8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24EFDA3F8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;

  v4 = *(_QWORD *)(a1 + 8);
  v2 = *(unsigned int *)(a2 + 256);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = &v4;
  return ((uint64_t (*)(uint64_t **))off_24EFDA468[v2])(&v5);
}

uint64_t std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::target_type()
{
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

uint64_t ranges::remove_if_view<ranges::transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_5>>::satisfy_forward(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t i;
  _BYTE v12[296];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = *(uint64_t **)result;
  if (*(_QWORD *)result)
  {
    v9 = result;
LABEL_3:
    ranges::basic_iterator<ranges::adaptor_cursor<ranges::basic_iterator<ranges::adaptor_cursor<std::__hash_map_const_iterator<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>,void *> *>>,ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>>::adaptor>>,ranges::iter_transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,ranges::indirected<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>>::adaptor<false>>>::operator*((uint64_t)v12, (uint64_t)v8, *(_QWORD *)(v9 + 16), a4, a5, a6, a7, a8);
    v10 = v12[276];
    result = std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v12);
    if (!v10)
    {
      for (i = **(_QWORD **)v9; ; i = *v8)
      {
        *(_QWORD *)v9 = i;
        if (!i)
          break;
        result = rf::helpers::planeAnchorMatches(i + 48);
        v8 = *(uint64_t **)v9;
        if ((result & 1) != 0)
        {
          if (v8)
            goto LABEL_3;
          return result;
        }
      }
    }
  }
  return result;
}

uint64_t ranges::basic_iterator<ranges::adaptor_cursor<ranges::basic_iterator<ranges::adaptor_cursor<std::__hash_map_const_iterator<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>,void *> *>>,ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>>::adaptor>>,ranges::iter_transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,ranges::indirected<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>>::adaptor<false>>>::operator*(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  if (*(_DWORD *)(a2 + 304) != 1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v9 = a2 + 48;
  v10 = rf::helpers::rayPlaneHitTestInBounds(*(float32x4_t *)(*(_QWORD *)(a3 + 8) + 48), vnegq_f32(*(float32x4_t *)(*(_QWORD *)(a3 + 8) + 32)), *(simd_float4 *)(a2 + 80), *(float32x4_t *)(a2 + 96), *(simd_float4 *)(a2 + 112), *(float32x4_t *)(a2 + 128), a1, a2, a3, a4, a5, a6, a7, a8, *(simd_float4 *)(a2 + 176), *(simd_float4 *)(a2 + 192), *(simd_float4 *)(a2 + 176), *(simd_float4 *)(a2 + 192), *(float32x4_t *)(a2 + 208));
  result = std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, v9);
  *(_QWORD *)(a1 + 272) = v10;
  return result;
}

uint64_t ranges::detail::introsort_loop<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,long,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  float v10;
  float v11;
  float v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t i;
  uint64_t v17;
  float v18;
  float v19;
  uint64_t v20;
  int *v21;
  unint64_t v22;
  unint64_t v23;
  float v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v4 = a2 - result;
  if (a2 - result >= 4609)
  {
    v7 = a2;
    v8 = result;
    v34 = -288 - result;
    v35 = (int *)(result + 272);
    do
    {
      if (!a3)
      {
        v28 = v4 / 0x120;
        v29 = (v4 / 0x120 - 2) >> 1;
        v30 = v29 + 1;
        v31 = v8 + 288 * v29;
        do
        {
          ranges::detail::sift_down_n_fn::operator()<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,std::reference_wrapper<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6>,std::reference_wrapper<ranges::identity>>(v8, v28, v31);
          v31 -= 288;
          --v30;
        }
        while (v30);
        v32 = v28 + 1;
        v33 = (int *)(v8 + 288 * v28 - 16);
        do
        {
          std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>::swap[abi:ne180100]<true,0>(v8, (uint64_t)(v33 - 68));
          std::optional<float>::swap[abi:ne180100](v35, v33);
          result = ranges::detail::sift_down_n_fn::operator()<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,std::reference_wrapper<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6>,std::reference_wrapper<ranges::identity>>(v8, v32 - 2, v8);
          --v32;
          v33 -= 72;
        }
        while (v32 > 2);
        return result;
      }
      v9 = v8 + 288 * (v4 / 0x240);
      v37 = v9;
      v38 = v8;
      v36 = v7 - 288;
      if (!*(_BYTE *)(v8 + 276) || !*(_BYTE *)(v9 + 276))
LABEL_40:
        std::__throw_bad_optional_access[abi:ne180100]();
      v10 = *(float *)(v8 + 272);
      v11 = *(float *)(v9 + 272);
      if (v10 >= v11)
      {
        if (!*(_BYTE *)(v7 - 12))
          goto LABEL_40;
        v12 = *(float *)(v7 - 16);
        if (v10 < v12)
        {
          v13 = &v38;
          goto LABEL_17;
        }
        v13 = (uint64_t *)&v37;
        v10 = v11;
      }
      else
      {
        if (!*(_BYTE *)(v7 - 12))
          goto LABEL_40;
        v12 = *(float *)(v7 - 16);
        if (v11 < v12)
        {
          v13 = (uint64_t *)&v37;
          goto LABEL_17;
        }
        v13 = &v38;
      }
      if (v10 < v12)
        v13 = &v36;
LABEL_17:
      v14 = *v13;
      v15 = v8;
      for (i = v7; ; i = v23)
      {
        v17 = 0;
        v18 = *(float *)(v14 + 272);
        do
        {
          if (!*(_BYTE *)(v15 + v17 + 276) || !*(_BYTE *)(v14 + 276))
            goto LABEL_40;
          v19 = *(float *)(v15 + v17 + 272);
          v17 += 288;
        }
        while (v19 < v18);
        v20 = v15 + v17;
        v21 = (int *)(v15 + v17 - 16);
        v22 = v15 + v17 - 288;
        do
        {
          if (!*(_BYTE *)(i - 12))
            goto LABEL_40;
          v23 = i - 288;
          v24 = *(float *)(i - 16);
          i -= 288;
        }
        while (v18 < v24);
        if (v22 >= v23)
          break;
        std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>::swap[abi:ne180100]<true,0>(v15 + v17 - 288, v23);
        std::optional<float>::swap[abi:ne180100](v21, (int *)(v23 + 272));
        if (v23 == v14)
          v25 = v22;
        else
          v25 = v14;
        if (v22 == v14)
          v14 = v23;
        else
          v14 = v25;
        v15 = v20;
      }
      v26 = v15 + v17;
      v27 = v15 + v17 - 288;
      result = ranges::detail::introsort_loop<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,long,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>(v27, v7, --a3, a4);
      v4 = v26 + v34;
      v7 = v27;
    }
    while (v26 + v34 > 4608);
  }
  return result;
}

uint64_t ranges::detail::sift_down_n_fn::operator()<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,std::reference_wrapper<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6>,std::reference_wrapper<ranges::identity>>(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  float v10;
  float v11;
  uint64_t v12;
  int v13;
  float v14;
  float v15;
  int v17;
  _BYTE v18[272];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2 - 2;
  if (a2 < 2)
    return result;
  v4 = a3;
  v5 = result;
  v6 = v3 >> 1;
  if ((uint64_t)(v3 >> 1) < (uint64_t)(0x8E38E38E38E38E39 * ((a3 - result) >> 5)))
    return result;
  v8 = (0x1C71C71C71C71C72 * ((a3 - result) >> 5)) | 1;
  v9 = result + 288 * v8;
  if (0x1C71C71C71C71C72 * ((a3 - result) >> 5) + 2 < a2)
  {
    if (!*(_BYTE *)(v9 + 276) || !*(_BYTE *)(v9 + 564))
LABEL_29:
      std::__throw_bad_optional_access[abi:ne180100]();
    v10 = *(float *)(v9 + 272);
    v11 = *(float *)(v9 + 560);
    v9 += 288 * (v10 < v11);
    if (v10 < v11)
      v8 = 0x1C71C71C71C71C72 * ((a3 - result) >> 5) + 2;
  }
  if (!*(_BYTE *)(v9 + 276) || !*(_BYTE *)(a3 + 276))
    goto LABEL_29;
  if (*(float *)(v9 + 272) >= *(float *)(a3 + 272))
  {
    std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v18, a3);
    v19 = *(_QWORD *)(v4 + 272);
    do
    {
      v12 = v9;
      std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v4, v9);
      v13 = *(_DWORD *)(v9 + 272);
      *(_BYTE *)(v4 + 276) = *(_BYTE *)(v9 + 276);
      *(_DWORD *)(v4 + 272) = v13;
      if (v6 < v8)
        break;
      v9 = v5 + 288 * ((2 * v8) | 1);
      if (2 * v8 + 2 >= a2)
      {
        v8 = (2 * v8) | 1;
      }
      else
      {
        if (!*(_BYTE *)(v9 + 276) || !*(_BYTE *)(v9 + 564))
          std::__throw_bad_optional_access[abi:ne180100]();
        v14 = *(float *)(v9 + 272);
        v15 = *(float *)(v9 + 560);
        v9 += 288 * (v14 < v15);
        v8 = v14 >= v15 ? (2 * v8) | 1 : 2 * v8 + 2;
      }
      if (!*(_BYTE *)(v9 + 276) || BYTE4(v19) == 0)
        std::__throw_bad_optional_access[abi:ne180100]();
      v4 = v12;
    }
    while (*(float *)(v9 + 272) >= *(float *)&v19);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v12, (uint64_t)v18);
    v17 = v19;
    *(_BYTE *)(v12 + 276) = BYTE4(v19);
    *(_DWORD *)(v12 + 272) = v17;
    return std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v18);
  }
  return result;
}

void sub_2277E7DD0(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>::swap[abi:ne180100]<true,0>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _QWORD v9[36];

  v9[35] = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned int *)(result + 256);
  v3 = *(unsigned int *)(a2 + 256);
  if ((_DWORD)v2 != -1 || (_DWORD)v3 != -1)
  {
    v6 = result;
    v7 = v2 == -1;
    if ((_DWORD)v2 == -1)
      v2 = -1;
    if ((_DWORD)v3 == -1)
      v8 = v7;
    else
      v8 = v2 == v3;
    if (v8)
    {
      return ((uint64_t (*)(_QWORD *, uint64_t, uint64_t))off_24EFDA4A8[v2])(v9, result, a2);
    }
    else
    {
      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v9, a2);
      std::__variant_detail::__ctor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_construct[abi:ne180100]<std::__variant_detail::__impl<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>(a2, v6);
      std::__variant_detail::__ctor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_construct[abi:ne180100]<std::__variant_detail::__impl<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>(v6, (uint64_t)v9);
      return std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v9);
    }
  }
  return result;
}

void sub_2277E7EE0(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t std::__variant_detail::__ctor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_construct[abi:ne180100]<std::__variant_detail::__impl<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v3 = result;
  v4 = *(unsigned int *)(result + 256);
  if ((_DWORD)v4 != -1)
    result = ((uint64_t (*)(char *, uint64_t))off_24EFDA328[v4])(&v7, result);
  *(_DWORD *)(v3 + 256) = -1;
  v5 = *(unsigned int *)(a2 + 256);
  if ((_DWORD)v5 != -1)
  {
    result = ((uint64_t (*)(char *, uint64_t, uint64_t))off_24EFDA4D8[v5])(&v6, v3, a2);
    *(_DWORD *)(v3 + 256) = v5;
  }
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, __int128 *a2, __int128 *a3)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[25];

  v17 = a2[4];
  *(_OWORD *)v18 = a2[5];
  *(_OWORD *)&v18[9] = *(__int128 *)((char *)a2 + 89);
  v13 = *a2;
  v14 = a2[1];
  v15 = a2[2];
  v16 = a2[3];
  v4 = *((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = 0;
  v6 = a3[1];
  v5 = a3[2];
  *a2 = *a3;
  a2[1] = v6;
  a2[2] = v5;
  v7 = a3[3];
  v8 = a3[4];
  v9 = a3[5];
  *(__int128 *)((char *)a2 + 89) = *(__int128 *)((char *)a3 + 89);
  a2[4] = v8;
  a2[5] = v9;
  a2[3] = v7;
  v10 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  v11 = (void *)*((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = v10;

  a3[4] = v17;
  a3[5] = *(_OWORD *)v18;
  *(__int128 *)((char *)a3 + 89) = *(_OWORD *)&v18[9];
  *a3 = v13;
  a3[1] = v14;
  a3[2] = v15;
  a3[3] = v16;
  v12 = (void *)*((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = v4;

}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, __int128 *a2, __int128 *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  void *v20;
  __n128 result;
  __n128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[25];

  v33 = a2[4];
  *(_OWORD *)v34 = a2[5];
  *(_OWORD *)&v34[9] = *(__int128 *)((char *)a2 + 89);
  v29 = *a2;
  v30 = a2[1];
  v31 = a2[2];
  v32 = a2[3];
  v5 = *((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = 0;
  v24 = a2[9];
  v23 = a2[8];
  v28 = *((_QWORD *)a2 + 26);
  v27 = a2[12];
  v26 = a2[11];
  v25 = a2[10];
  v6 = (uint64_t)a2 + 216;
  v22 = *(__n128 *)((char *)a2 + 216);
  v7 = *((_QWORD *)a2 + 29);
  *((_QWORD *)a2 + 27) = 0;
  *((_QWORD *)a2 + 28) = 0;
  *((_QWORD *)a2 + 29) = 0;
  v8 = *a3;
  v9 = a3[2];
  a2[1] = a3[1];
  a2[2] = v9;
  *a2 = v8;
  v10 = a3[3];
  v11 = a3[4];
  v12 = a3[5];
  *(__int128 *)((char *)a2 + 89) = *(__int128 *)((char *)a3 + 89);
  a2[4] = v11;
  a2[5] = v12;
  a2[3] = v10;
  v13 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  v14 = (void *)*((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = v13;

  v15 = a3[9];
  a2[8] = a3[8];
  a2[9] = v15;
  v16 = a3[10];
  v17 = a3[11];
  v18 = a3[12];
  *((_QWORD *)a2 + 26) = *((_QWORD *)a3 + 26);
  a2[11] = v17;
  a2[12] = v18;
  a2[10] = v16;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE(v6, (__n128 *)((char *)a3 + 216));
  a3[4] = v33;
  a3[5] = *(_OWORD *)v34;
  *(__int128 *)((char *)a3 + 89) = *(_OWORD *)&v34[9];
  *a3 = v29;
  a3[1] = v30;
  a3[2] = v31;
  a3[3] = v32;
  v19 = (void *)*((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = v5;

  a3[10] = v25;
  a3[11] = v26;
  a3[12] = v27;
  *((_QWORD *)a3 + 26) = v28;
  a3[8] = v23;
  a3[9] = v24;
  v20 = (void *)*((_QWORD *)a3 + 27);
  if (v20)
  {
    *((_QWORD *)a3 + 28) = v20;
    operator delete(v20);
  }
  result = v22;
  *(__int128 *)((char *)a3 + 216) = (__int128)v22;
  *((_QWORD *)a3 + 29) = v7;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, __int128 *a2, __int128 *a3)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  void **v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  __n128 result;
  uint64_t v22;
  char v23;
  uint64_t v24;
  __n128 v25;
  _BYTE v26[15];
  _BYTE v27[15];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[25];

  *(_OWORD *)v33 = a2[5];
  *(_OWORD *)&v33[9] = *(__int128 *)((char *)a2 + 89);
  v28 = *a2;
  v29 = a2[1];
  v31 = a2[3];
  v32 = a2[4];
  v30 = a2[2];
  v5 = *((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = 0;
  v6 = *((_BYTE *)a2 + 128);
  v7 = (uint64_t)a2 + 136;
  v22 = *((_QWORD *)a2 + 17);
  *(_QWORD *)v27 = *((_QWORD *)a2 + 18);
  *(_QWORD *)&v27[7] = *(_QWORD *)((char *)a2 + 151);
  v8 = *((_BYTE *)a2 + 159);
  *((_QWORD *)a2 + 17) = 0;
  *((_QWORD *)a2 + 18) = 0;
  *((_QWORD *)a2 + 19) = 0;
  v9 = a2 + 10;
  v24 = *((_QWORD *)a2 + 20);
  *(_QWORD *)v26 = *((_QWORD *)a2 + 21);
  *(_QWORD *)&v26[7] = *(_QWORD *)((char *)a2 + 175);
  v23 = *((_BYTE *)a2 + 183);
  *((_QWORD *)a2 + 21) = 0;
  *((_QWORD *)a2 + 22) = 0;
  *((_QWORD *)a2 + 20) = 0;
  v25 = (__n128)a2[12];
  v10 = *a3;
  v11 = a3[2];
  a2[1] = a3[1];
  a2[2] = v11;
  *a2 = v10;
  v12 = a3[3];
  v13 = a3[4];
  v14 = a3[5];
  *(__int128 *)((char *)a2 + 89) = *(__int128 *)((char *)a3 + 89);
  a2[4] = v13;
  a2[5] = v14;
  a2[3] = v12;
  v15 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  v16 = (void *)*((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = v15;

  *((_BYTE *)a2 + 128) = *((_BYTE *)a3 + 128);
  v17 = (void **)a3 + 17;
  if (*((char *)a2 + 159) < 0)
    operator delete(*(void **)v7);
  v18 = *(_OWORD *)v17;
  *(_QWORD *)(v7 + 16) = *((_QWORD *)a3 + 19);
  *(_OWORD *)v7 = v18;
  *((_BYTE *)a3 + 159) = 0;
  *((_BYTE *)a3 + 136) = 0;
  if (*((char *)a2 + 183) < 0)
    operator delete(*(void **)v9);
  v19 = a3[10];
  *((_QWORD *)v9 + 2) = *((_QWORD *)a3 + 22);
  *v9 = v19;
  *((_BYTE *)a3 + 183) = 0;
  *((_BYTE *)a3 + 160) = 0;
  a2[12] = a3[12];
  a3[4] = v32;
  a3[5] = *(_OWORD *)v33;
  *(__int128 *)((char *)a3 + 89) = *(_OWORD *)&v33[9];
  *a3 = v28;
  a3[1] = v29;
  a3[2] = v30;
  a3[3] = v31;
  v20 = (void *)*((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = v5;

  *((_BYTE *)a3 + 128) = v6;
  if (*((char *)a3 + 159) < 0)
    operator delete(*v17);
  *((_QWORD *)a3 + 17) = v22;
  *((_QWORD *)a3 + 18) = *(_QWORD *)v27;
  *(_QWORD *)((char *)a3 + 151) = *(_QWORD *)&v27[7];
  *((_BYTE *)a3 + 159) = v8;
  if (*((char *)a3 + 183) < 0)
    operator delete(*((void **)a3 + 20));
  *((_QWORD *)a3 + 20) = v24;
  *((_QWORD *)a3 + 21) = *(_QWORD *)v26;
  *(_QWORD *)((char *)a3 + 175) = *(_QWORD *)&v26[7];
  *((_BYTE *)a3 + 183) = v23;
  result = v25;
  a3[12] = (__int128)v25;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, __int128 *a2, __int128 *a3)
{
  uint64_t v5;
  uint64_t v6;
  __int128 *v7;
  char v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  void **v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  __n128 result;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  _BYTE v31[15];
  _BYTE v32[15];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[25];

  v37 = a2[4];
  *(_OWORD *)v38 = a2[5];
  *(_OWORD *)&v38[9] = *(__int128 *)((char *)a2 + 89);
  v33 = *a2;
  v34 = a2[1];
  v35 = a2[2];
  v36 = a2[3];
  v5 = *((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = 0;
  v7 = a2 + 8;
  v6 = *((_QWORD *)a2 + 16);
  *(_QWORD *)&v32[7] = *(_QWORD *)((char *)a2 + 143);
  *(_QWORD *)v32 = *((_QWORD *)a2 + 17);
  v8 = *((_BYTE *)a2 + 151);
  *((_QWORD *)a2 + 16) = 0;
  *((_QWORD *)a2 + 17) = 0;
  *((_QWORD *)a2 + 18) = 0;
  v9 = (uint64_t)a2 + 152;
  v26 = *((_QWORD *)a2 + 19);
  *(_QWORD *)v31 = *((_QWORD *)a2 + 20);
  *(_QWORD *)&v31[7] = *(_QWORD *)((char *)a2 + 167);
  v10 = *((_BYTE *)a2 + 175);
  *((_QWORD *)a2 + 20) = 0;
  *((_QWORD *)a2 + 21) = 0;
  *((_QWORD *)a2 + 19) = 0;
  v29 = (__n128)a2[13];
  v30 = a2[14];
  v27 = a2[11];
  v28 = a2[12];
  v11 = *a3;
  v12 = a3[2];
  a2[1] = a3[1];
  a2[2] = v12;
  *a2 = v11;
  v13 = a3[3];
  v14 = a3[4];
  v15 = a3[5];
  *(__int128 *)((char *)a2 + 89) = *(__int128 *)((char *)a3 + 89);
  a2[4] = v14;
  a2[5] = v15;
  a2[3] = v13;
  v16 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  v17 = (void *)*((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = v16;

  v18 = (void **)(a3 + 8);
  if (*((char *)a2 + 151) < 0)
    operator delete(*(void **)v7);
  v19 = *(_OWORD *)v18;
  *((_QWORD *)v7 + 2) = *((_QWORD *)a3 + 18);
  *v7 = v19;
  *((_BYTE *)a3 + 151) = 0;
  *((_BYTE *)a3 + 128) = 0;
  if (*((char *)a2 + 175) < 0)
    operator delete(*(void **)v9);
  v20 = *(__int128 *)((char *)a3 + 152);
  *(_QWORD *)(v9 + 16) = *((_QWORD *)a3 + 21);
  *(_OWORD *)v9 = v20;
  *((_BYTE *)a3 + 175) = 0;
  *((_BYTE *)a3 + 152) = 0;
  v21 = a3[11];
  v22 = a3[12];
  v23 = a3[14];
  a2[13] = a3[13];
  a2[14] = v23;
  a2[11] = v21;
  a2[12] = v22;
  a3[4] = v37;
  a3[5] = *(_OWORD *)v38;
  *(__int128 *)((char *)a3 + 89) = *(_OWORD *)&v38[9];
  *a3 = v33;
  a3[1] = v34;
  a3[2] = v35;
  a3[3] = v36;
  v24 = (void *)*((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = v5;

  if (*((char *)a3 + 151) < 0)
    operator delete(*v18);
  *((_QWORD *)a3 + 16) = v6;
  *((_QWORD *)a3 + 17) = *(_QWORD *)v32;
  *(_QWORD *)((char *)a3 + 143) = *(_QWORD *)&v32[7];
  *((_BYTE *)a3 + 151) = v8;
  if (*((char *)a3 + 175) < 0)
    operator delete(*((void **)a3 + 19));
  *((_QWORD *)a3 + 19) = v26;
  *((_QWORD *)a3 + 20) = *(_QWORD *)v31;
  *(_QWORD *)((char *)a3 + 167) = *(_QWORD *)&v31[7];
  *((_BYTE *)a3 + 175) = v10;
  a3[11] = v27;
  a3[12] = v28;
  result = v29;
  a3[13] = (__int128)v29;
  a3[14] = v30;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, __int128 *a2, __int128 *a3)
{
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  __n128 result;
  __int128 v21;
  __int128 v22;
  __n128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[25];

  v33 = a2[4];
  *(_OWORD *)v34 = a2[5];
  *(_OWORD *)&v34[9] = *(__int128 *)((char *)a2 + 89);
  v29 = *a2;
  v30 = a2[1];
  v31 = a2[2];
  v32 = a2[3];
  v5 = *((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = 0;
  v23 = (__n128)a2[10];
  v24 = a2[11];
  v21 = a2[8];
  v22 = a2[9];
  v27 = a2[14];
  v28 = a2[15];
  v25 = a2[12];
  v26 = a2[13];
  v6 = *a3;
  v7 = a3[2];
  a2[1] = a3[1];
  a2[2] = v7;
  *a2 = v6;
  v8 = a3[3];
  v9 = a3[4];
  v10 = a3[5];
  *(__int128 *)((char *)a2 + 89) = *(__int128 *)((char *)a3 + 89);
  a2[4] = v9;
  a2[5] = v10;
  a2[3] = v8;
  v11 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  v12 = (void *)*((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = v11;

  v13 = a3[8];
  v14 = a3[9];
  v15 = a3[11];
  a2[10] = a3[10];
  a2[11] = v15;
  a2[8] = v13;
  a2[9] = v14;
  v16 = a3[12];
  v17 = a3[13];
  v18 = a3[15];
  a2[14] = a3[14];
  a2[15] = v18;
  a2[12] = v16;
  a2[13] = v17;
  a3[4] = v33;
  a3[5] = *(_OWORD *)v34;
  *(__int128 *)((char *)a3 + 89) = *(_OWORD *)&v34[9];
  *a3 = v29;
  a3[1] = v30;
  a3[2] = v31;
  a3[3] = v32;
  v19 = (void *)*((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = v5;

  a3[12] = v25;
  a3[13] = v26;
  a3[14] = v27;
  a3[15] = v28;
  a3[8] = v21;
  a3[9] = v22;
  result = v23;
  a3[10] = (__int128)v23;
  a3[11] = v24;
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5ELm5EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, __int128 *a2, __int128 *a3)
{
  uint64_t v5;
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[25];

  v19 = a2[4];
  *(_OWORD *)v20 = a2[5];
  *(_OWORD *)&v20[9] = *(__int128 *)((char *)a2 + 89);
  v15 = *a2;
  v16 = a2[1];
  v17 = a2[2];
  v18 = a2[3];
  v5 = *((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = 0;
  v6 = *((_DWORD *)a2 + 32);
  v7 = *a3;
  v8 = a3[2];
  a2[1] = a3[1];
  a2[2] = v8;
  *a2 = v7;
  v9 = a3[3];
  v10 = a3[4];
  v11 = a3[5];
  *(__int128 *)((char *)a2 + 89) = *(__int128 *)((char *)a3 + 89);
  a2[4] = v10;
  a2[5] = v11;
  a2[3] = v9;
  v12 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  v13 = (void *)*((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = v12;

  *((_DWORD *)a2 + 32) = *((_DWORD *)a3 + 32);
  a3[4] = v19;
  a3[5] = *(_OWORD *)v20;
  *(__int128 *)((char *)a3 + 89) = *(_OWORD *)&v20[9];
  *a3 = v15;
  a3[1] = v16;
  a3[2] = v17;
  a3[3] = v18;
  v14 = (void *)*((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = v5;

  *((_DWORD *)a3 + 32) = v6;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v3 = *a3;
  v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  result = (__n128)a3[3];
  v6 = a3[4];
  v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(__int128 *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(__n128 *)(a2 + 48) = result;
  v8 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  *(_QWORD *)(a2 + 112) = v8;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __n128 result;

  v3 = *a3;
  v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  v5 = a3[3];
  v6 = a3[4];
  v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(__int128 *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  v8 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  *(_QWORD *)(a2 + 112) = v8;
  v9 = a3[9];
  *(_OWORD *)(a2 + 128) = a3[8];
  *(_OWORD *)(a2 + 144) = v9;
  v10 = a3[10];
  v11 = a3[12];
  v12 = *((_QWORD *)a3 + 26);
  *(_OWORD *)(a2 + 176) = a3[11];
  *(_OWORD *)(a2 + 192) = v11;
  *(_OWORD *)(a2 + 160) = v10;
  *(_QWORD *)(a2 + 208) = v12;
  *(_QWORD *)(a2 + 216) = 0;
  *(_QWORD *)(a2 + 224) = 0;
  *(_QWORD *)(a2 + 232) = 0;
  result = *(__n128 *)((char *)a3 + 216);
  *(__n128 *)(a2 + 216) = result;
  *(_QWORD *)(a2 + 232) = *((_QWORD *)a3 + 29);
  *((_QWORD *)a3 + 27) = 0;
  *((_QWORD *)a3 + 28) = 0;
  *((_QWORD *)a3 + 29) = 0;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __n128 result;

  v3 = *a3;
  v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  v5 = a3[3];
  v6 = a3[4];
  v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(__int128 *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  v8 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  *(_QWORD *)(a2 + 112) = v8;
  *(_BYTE *)(a2 + 128) = *((_BYTE *)a3 + 128);
  v9 = *(__int128 *)((char *)a3 + 136);
  *(_QWORD *)(a2 + 152) = *((_QWORD *)a3 + 19);
  *(_OWORD *)(a2 + 136) = v9;
  *((_QWORD *)a3 + 18) = 0;
  *((_QWORD *)a3 + 19) = 0;
  *((_QWORD *)a3 + 17) = 0;
  v10 = *((_QWORD *)a3 + 22);
  *(_OWORD *)(a2 + 160) = a3[10];
  *(_QWORD *)(a2 + 176) = v10;
  *((_QWORD *)a3 + 21) = 0;
  *((_QWORD *)a3 + 22) = 0;
  *((_QWORD *)a3 + 20) = 0;
  result = (__n128)a3[12];
  *(__n128 *)(a2 + 192) = result;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __n128 result;
  __int128 v12;
  __int128 v13;

  v3 = *a3;
  v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  v5 = a3[3];
  v6 = a3[4];
  v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(__int128 *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  v8 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  *(_QWORD *)(a2 + 112) = v8;
  v9 = *((_QWORD *)a3 + 18);
  *(_OWORD *)(a2 + 128) = a3[8];
  *(_QWORD *)(a2 + 144) = v9;
  *((_QWORD *)a3 + 17) = 0;
  *((_QWORD *)a3 + 18) = 0;
  *((_QWORD *)a3 + 16) = 0;
  v10 = *(__int128 *)((char *)a3 + 152);
  *(_QWORD *)(a2 + 168) = *((_QWORD *)a3 + 21);
  *(_OWORD *)(a2 + 152) = v10;
  *((_QWORD *)a3 + 20) = 0;
  *((_QWORD *)a3 + 21) = 0;
  *((_QWORD *)a3 + 19) = 0;
  result = (__n128)a3[11];
  v12 = a3[12];
  v13 = a3[14];
  *(_OWORD *)(a2 + 208) = a3[13];
  *(_OWORD *)(a2 + 224) = v13;
  *(__n128 *)(a2 + 176) = result;
  *(_OWORD *)(a2 + 192) = v12;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __n128 result;
  __int128 v13;
  __int128 v14;

  v3 = *a3;
  v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  v5 = a3[3];
  v6 = a3[4];
  v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(__int128 *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  v8 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  *(_QWORD *)(a2 + 112) = v8;
  v9 = a3[8];
  v10 = a3[9];
  v11 = a3[11];
  *(_OWORD *)(a2 + 160) = a3[10];
  *(_OWORD *)(a2 + 176) = v11;
  *(_OWORD *)(a2 + 128) = v9;
  *(_OWORD *)(a2 + 144) = v10;
  result = (__n128)a3[12];
  v13 = a3[13];
  v14 = a3[15];
  *(_OWORD *)(a2 + 224) = a3[14];
  *(_OWORD *)(a2 + 240) = v14;
  *(__n128 *)(a2 + 192) = result;
  *(_OWORD *)(a2 + 208) = v13;
  return result;
}

float _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5ELm5EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  float result;

  v3 = *a3;
  v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  v5 = a3[3];
  v6 = a3[4];
  v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(__int128 *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  v8 = *((_QWORD *)a3 + 14);
  *((_QWORD *)a3 + 14) = 0;
  *(_QWORD *)(a2 + 112) = v8;
  result = *((float *)a3 + 32);
  *(float *)(a2 + 128) = result;
  return result;
}

int *std::optional<float>::swap[abi:ne180100](int *result, int *a2)
{
  int v2;

  if ((*((_BYTE *)result + 4) != 0) != (*((_BYTE *)a2 + 4) != 0))
  {
    if (*((_BYTE *)result + 4))
    {
      *a2 = *result;
      *((_BYTE *)a2 + 4) = 1;
      if (*((_BYTE *)result + 4))
        *((_BYTE *)result + 4) = 0;
    }
    else
    {
      *result = *a2;
      *((_BYTE *)result + 4) = 1;
      if (*((_BYTE *)a2 + 4))
        *((_BYTE *)a2 + 4) = 0;
    }
  }
  else if (*((_BYTE *)result + 4))
  {
    v2 = *result;
    *result = *a2;
    *a2 = v2;
  }
  return result;
}

uint64_t ranges::detail::insertion_sort<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  float *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  _BYTE v14[272];
  uint64_t v15;
  _BYTE v16[272];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (result != a2)
  {
    v3 = result;
    v4 = result + 288;
    if (result + 288 != a2)
    {
      v5 = (float *)(result + 272);
      v6 = result;
      do
      {
        v7 = v6;
        v6 = v4;
        std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v16, v4);
        v8 = *(_QWORD *)(v7 + 560);
        v17 = v8;
        if ((v8 & 0xFF00000000) == 0 || !*(_BYTE *)(v3 + 276))
          std::__throw_bad_optional_access[abi:ne180100]();
        if (*v5 <= *(float *)&v8)
        {
          std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v14, (uint64_t)v16);
          v15 = v17;
          if ((v17 & 0xFF00000000) == 0)
LABEL_20:
            std::__throw_bad_optional_access[abi:ne180100]();
          v12 = v6;
          while (1)
          {
            if (!*(_BYTE *)(v12 - 12))
              goto LABEL_20;
            if (*(float *)&v15 >= *(float *)(v12 - 16))
              break;
            std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v12, v12 - 288);
            *(_DWORD *)(v12 + 272) = *(_DWORD *)(v12 - 16);
            *(_BYTE *)(v12 + 276) = *(_BYTE *)(v12 - 12);
            v12 -= 288;
            if (!BYTE4(v15))
              goto LABEL_20;
          }
          std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v12, (uint64_t)v14);
          v13 = v15;
          *(_BYTE *)(v12 + 276) = BYTE4(v15);
          *(_DWORD *)(v12 + 272) = v13;
          std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v14);
        }
        else
        {
          if (v6 != v3)
          {
            v9 = v6;
            do
            {
              v10 = v9 - 288;
              std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v9, v9 - 288);
              *(_DWORD *)(v10 + 560) = *(_DWORD *)(v10 + 272);
              *(_BYTE *)(v10 + 564) = *(_BYTE *)(v10 + 276);
              v9 = v10;
            }
            while (v10 != v3);
          }
          std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v3, (uint64_t)v16);
          v11 = v17;
          *(_BYTE *)(v3 + 276) = BYTE4(v17);
          *(_DWORD *)v5 = v11;
        }
        result = std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v16);
        v4 = v6 + 288;
      }
      while (v6 + 288 != a2);
    }
  }
  return result;
}

void sub_2277E8D90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>(_QWORD *a1, unint64_t a2)
{
  int8x8_t v2;
  uint8x8_t v3;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *result;
  unint64_t v7;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = (uint8x8_t)vcnt_s8(v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    v4 = a2;
    if (*(_QWORD *)&v2 <= a2)
      v4 = a2 % *(_QWORD *)&v2;
  }
  else
  {
    v4 = (*(_QWORD *)&v2 - 1) & a2;
  }
  v5 = *(_QWORD **)(*a1 + 8 * v4);
  if (!v5)
    return 0;
  result = (_QWORD *)*v5;
  if (*v5)
  {
    do
    {
      v7 = result[1];
      if (v7 == a2)
      {
        if (result[2] == a2)
          return result;
      }
      else
      {
        if (v3.u32[0] > 1uLL)
        {
          if (v7 >= *(_QWORD *)&v2)
            v7 %= *(_QWORD *)&v2;
        }
        else
        {
          v7 &= *(_QWORD *)&v2 - 1;
        }
        if (v7 != v4)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

_QWORD *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(float *a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  int8x8_t prime;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  uint8x8_t v23;
  unint64_t v24;
  uint8x8_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD *v33;

  v6 = *a2;
  v7 = *((_QWORD *)a1 + 1);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v6;
  i[2] = *a3;
  v12 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v13 = a1[8];
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      prime = (int8x8_t)v16;
    else
      prime = (int8x8_t)v15;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v7 = *((_QWORD *)a1 + 1);
    }
    if (*(_QWORD *)&prime > v7)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v7)
    {
      v24 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v7 < 3 || (v25 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v25.i16[0] = vaddlv_u8(v25), v25.u32[0] > 1uLL))
      {
        v24 = std::__next_prime(v24);
      }
      else
      {
        v26 = 1 << -(char)__clz(v24 - 1);
        if (v24 >= 2)
          v24 = v26;
      }
      if (*(_QWORD *)&prime <= v24)
        prime = (int8x8_t)v24;
      if (*(_QWORD *)&prime >= v7)
      {
        v7 = *((_QWORD *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v18 = operator new(8 * *(_QWORD *)&prime);
          v19 = *(_QWORD **)a1;
          *(_QWORD *)a1 = v18;
          if (v19)
            operator delete(v19);
          v20 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v20++) = 0;
          while (*(_QWORD *)&prime != v20);
          v21 = (_QWORD *)*((_QWORD *)a1 + 2);
          if (v21)
          {
            v22 = v21[1];
            v23 = (uint8x8_t)vcnt_s8(prime);
            v23.i16[0] = vaddlv_u8(v23);
            if (v23.u32[0] > 1uLL)
            {
              if (v22 >= *(_QWORD *)&prime)
                v22 %= *(_QWORD *)&prime;
            }
            else
            {
              v22 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = a1 + 4;
            v27 = (_QWORD *)*v21;
            if (*v21)
            {
              do
              {
                v28 = v27[1];
                if (v23.u32[0] > 1uLL)
                {
                  if (v28 >= *(_QWORD *)&prime)
                    v28 %= *(_QWORD *)&prime;
                }
                else
                {
                  v28 &= *(_QWORD *)&prime - 1;
                }
                if (v28 != v22)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v28))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v28) = v21;
                    goto LABEL_55;
                  }
                  *v21 = *v27;
                  *v27 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v28);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v28) = v27;
                  v27 = v21;
                }
                v28 = v22;
LABEL_55:
                v21 = v27;
                v27 = (_QWORD *)*v27;
                v22 = v28;
              }
              while (v27);
            }
          }
          v7 = (unint64_t)prime;
          goto LABEL_59;
        }
        v33 = *(_QWORD **)a1;
        *(_QWORD *)a1 = 0;
        if (v33)
          operator delete(v33);
        v7 = 0;
        *((_QWORD *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v29 = *(_QWORD **)a1;
  v30 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v30)
  {
    *i = *v30;
LABEL_72:
    *v30 = i;
    goto LABEL_73;
  }
  *i = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = i;
  v29[v3] = a1 + 4;
  if (*i)
  {
    v31 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v31 >= v7)
        v31 %= v7;
    }
    else
    {
      v31 &= v7 - 1;
    }
    v30 = (_QWORD *)(*(_QWORD *)a1 + 8 * v31);
    goto LABEL_72;
  }
LABEL_73:
  ++*((_QWORD *)a1 + 3);
  return i;
}

void sub_2277E9260(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__erase_unique<unsigned long long>(_QWORD *a1, unint64_t *a2)
{
  uint64_t *result;

  result = std::__hash_table<std::__hash_value_type<unsigned long,rf::data_flow::provider::SyntheticARData>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,rf::data_flow::provider::SyntheticARData>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,rf::data_flow::provider::SyntheticARData>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,rf::data_flow::provider::SyntheticARData>>>::find<unsigned long>(a1, a2);
  if (result)
  {
    std::__hash_table<rf::data_flow::RFUUID,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<rf::data_flow::RFUUID>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

_QWORD *std::__function::__value_func<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_2277E9410(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

_QWORD *std::__function::__value_func<rf::data_flow::RFUUID ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_2277E9584(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

_QWORD *std::__function::__value_func<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_2277E96F8(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

_QWORD *std::__function::__value_func<void ()(NSSet<ARReferenceImage *> *)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_2277E986C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,0>((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

uint64_t rf::data_flow::consumer::SyntheticEnvironmentConsumer::SyntheticEnvironmentConsumer(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;

  *(_QWORD *)a1 = &off_24EFDA518;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  v2 = *MEMORY[0x24BE26260];
  *(_QWORD *)(a1 + 40) = *MEMORY[0x24BE26260];
  *(_QWORD *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 1065353216;
  *(_QWORD *)(a1 + 192) = 0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_BYTE *)(a1 + 160) = 0;
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a1 + 200) = dispatch_queue_create("RealityFusionSyntheticEnvironmentConsumer", v4);

  *(_QWORD *)(a1 + 208) = dispatch_group_create();
  return a1;
}

void rf::data_flow::consumer::SyntheticEnvironmentConsumer::~SyntheticEnvironmentConsumer(rf::data_flow::consumer::SyntheticEnvironmentConsumer *this)
{
  NSObject *v2;
  void *v3;
  void *v4;
  rf::data_flow::consumer::SyntheticEnvironmentConsumer *v5;
  uint64_t v6;

  *(_QWORD *)this = &off_24EFDA518;
  v2 = *((_QWORD *)this + 26);
  if (v2)
  {
    dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    v3 = (void *)*((_QWORD *)this + 26);
    *((_QWORD *)this + 26) = 0;

  }
  v4 = (void *)*((_QWORD *)this + 25);
  *((_QWORD *)this + 25) = 0;

  rf::data_flow::consumer::SyntheticEnvironmentConsumer::removeAllSyntheticAssets(this);
  v5 = (rf::data_flow::consumer::SyntheticEnvironmentConsumer *)*((_QWORD *)this + 24);
  if (v5 == (rf::data_flow::consumer::SyntheticEnvironmentConsumer *)((char *)this + 168))
  {
    v6 = 4;
    v5 = (rf::data_flow::consumer::SyntheticEnvironmentConsumer *)((char *)this + 168);
    goto LABEL_7;
  }
  if (v5)
  {
    v6 = 5;
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
  }
  std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::~deque[abi:ne180100]((uint64_t)this + 112);
  std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::~__hash_table((uint64_t)this + 72);
  RESharedPtr<REEntity>::~RESharedPtr((_QWORD *)this + 8);
  RESharedPtr<REAsset>::~RESharedPtr((_QWORD *)this + 7);
  RESharedPtr<REAsset>::~RESharedPtr((_QWORD *)this + 4);
  RESharedPtr<REAsset>::~RESharedPtr((_QWORD *)this + 3);
}

{
  rf::data_flow::consumer::SyntheticEnvironmentConsumer::~SyntheticEnvironmentConsumer(this);
  JUMPOUT(0x22E29DD50);
}

uint64_t rf::data_flow::consumer::SyntheticEnvironmentConsumer::removeAllSyntheticAssets(rf::data_flow::consumer::SyntheticEnvironmentConsumer *this)
{
  uint64_t result;
  rf::internal *v3;
  void *__p[2];
  char v5;

  result = *((_QWORD *)this + 8);
  if (result)
  {
    if (!REEntityGetSceneNullable())
    {
      rf::getMessage((rf *)"Synthetic environments root entity has been removed from the scene!", __p);
      rf::internal::logAssert((const char *)__p);
      if (v5 < 0)
        operator delete(__p[0]);
      rf::internal::debugBreakHandler(v3);
    }
    std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::clear((uint64_t)this + 72);
    REEntitySetParent();
    if (*((_QWORD *)this + 8))
      RERelease();
    *((_QWORD *)this + 8) = 0;
    return rf::data_flow::consumer::SyntheticEnvironmentConsumer::removeRenderGraphProviders((uint64_t)this);
  }
  return result;
}

void sub_2277E9AE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t rf::data_flow::consumer::SyntheticEnvironmentConsumer::removeRenderGraphProviders(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *MEMORY[0x24BE26260];
  if (*(_QWORD *)(result + 48) != *MEMORY[0x24BE26260])
  {
    result = RESceneRenderGraphFileProviderArrayRemove();
    *(_QWORD *)(v1 + 48) = v2;
  }
  if (*(_QWORD *)(v1 + 40) != v2)
  {
    result = RESceneRenderGraphFileProviderArrayRemove();
    *(_QWORD *)(v1 + 40) = v2;
  }
  return result;
}

void std::function<void ()(NSURL *,NSError *)>::operator()(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  v5 = *(_QWORD *)(a1 + 24);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, id *, id *))(*(_QWORD *)v5 + 48))(v5, &v7, &v6);

}

void sub_2277E9BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t ___ZN2rf9data_flow8consumer28SyntheticEnvironmentConsumer24addSyntheticAssetToSceneERKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEP7RESceneP16REServiceLocator_block_invoke()
{
  return RESceneImportOperationRun();
}

void ___ZN2rf9data_flow8consumer28SyntheticEnvironmentConsumer24addSyntheticAssetToSceneERKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEP7RESceneP16REServiceLocator_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  rf *v4;
  NSObject *v5;
  int ChildCount;
  unint64_t v7;
  uint64_t Child;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  rf::internal *v18;
  uint64_t v19;
  uint8_t buf[16];
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    rf::realityFusionLogObject((rf *)a1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = REEntityGetName();
      _os_log_impl(&dword_227777000, v3, OS_LOG_TYPE_DEFAULT, "SyntheticEnvironmentConsumer failed importing asset at path %s", buf, 0xCu);
    }

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_227777000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    RERelease();
    if (*(_QWORD *)(v2 + 192))
      std::function<void ()(NSURL *,NSError *)>::operator()(v2 + 168, *(void **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
LABEL_8:
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    return;
  }
  v4 = (rf *)RESceneImportOperationPublishToEngine();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    rf::realityFusionLogObject(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = REEntityGetName();
      _os_log_impl(&dword_227777000, v5, OS_LOG_TYPE_DEFAULT, "SyntheticEnvironmentConsumer failed to publish imported asset at path %s", buf, 0xCu);
    }

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v17;
      _os_log_error_impl(&dword_227777000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    RERelease();
    if (*(_QWORD *)(v2 + 192))
      std::function<void ()(NSURL *,NSError *)>::operator()(v2 + 168, *(void **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    goto LABEL_8;
  }
  if (RESceneImportOperationGetSceneAsset())
  {
    ChildCount = REEntityGetChildCount();
    if (ChildCount >= 1)
    {
      v7 = ChildCount + 1;
      do
      {
        Child = REEntityGetChild();
        MEMORY[0x22E29D48C](Child);
        --v7;
      }
      while (v7 > 1);
    }
    REEntitySubtreeLoadFromAsset();
    v9 = *(_QWORD *)(a1 + 56);
    v21 = 0u;
    v22 = 0u;
    *(_OWORD *)buf = 0u;
    std::deque<REEntity *>::__add_back_capacity(buf);
    v10 = *((_QWORD *)&v22 + 1);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&buf[8] + (((*((_QWORD *)&v22 + 1) + (_QWORD)v22) >> 6) & 0x3FFFFFFFFFFFFF8))
              + 8 * ((*((_QWORD *)&v22 + 1) + v22) & 0x1FF)) = v9;
    v11 = __CFADD__(v10, 1);
    v12 = v10 + 1;
    *((_QWORD *)&v22 + 1) = v12;
    if (!v11)
    {
      do
      {
        v13 = (((_QWORD)v21 - *(_QWORD *)&buf[8]) << 6) - 1;
        if ((_QWORD)v21 == *(_QWORD *)&buf[8])
          v13 = 0;
        *((_QWORD *)&v22 + 1) = v12 - 1;
        if ((unint64_t)(v13 - (v22 + v12 - 1)) >= 0x400)
        {
          operator delete(*(void **)(v21 - 8));
          *(_QWORD *)&v21 = v21 - 8;
        }
        REMeshComponentGetComponentType();
        if (REEntityGetComponentByClass())
        {
          if (REMeshComponentGetMaterialCount())
          {
            REMeshComponentGetMaterialAtIndex();
            if (REMaterialAssetGetTextureAsset())
            {
              REMeshComponentRemoveAllMaterials();
              REMeshComponentAddMaterial();
              REMaterialParameterBlockArrayComponentGetComponentType();
              REEntityGetOrAddComponentByClass();
              if (!REMaterialParameterBlockArrayComponentGetBlockAtIndex())
              {
                RERenderManagerMaterialParameterBlockCreateWithAsset();
                REMaterialParameterBlockArrayComponentSetBlockAtIndex();
                RERelease();
              }
              REMaterialParameterBlockSetTextureFromAsset();
            }
          }
        }
        v14 = REEntityGetChildCount();
        if (v14)
        {
          for (i = 0; i != v14; ++i)
          {
            v19 = REEntityGetChild();
            std::deque<REEntity *>::push_back(buf, &v19);
          }
        }
        v12 = *((_QWORD *)&v22 + 1);
      }
      while (*((_QWORD *)&v22 + 1));
    }
    std::deque<REEntity *>::~deque[abi:ne180100](buf);
  }
  else
  {
    rf::getMessage((rf *)"Couldn't get scene asset from import operation", buf);
    rf::internal::logAssert((const char *)buf);
    if (SBYTE7(v21) < 0)
      operator delete(*(void **)buf);
    rf::internal::debugBreakHandler(v18);
  }
  RERelease();
  if (*(_QWORD *)(v2 + 192))
    std::function<void ()(NSURL *,NSError *)>::operator()(v2 + 168, *(void **)(a1 + 32), 0);
  *(_BYTE *)(v2 + 160) = 0;
}

void sub_2277EA0F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void rf::data_flow::consumer::SyntheticEnvironmentConsumer::consumeLatestUpdate(uint64_t a1, uint64_t a2)
{
  std::mutex *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *i;
  _QWORD *j;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  std::string *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int v24;
  __int128 v25;
  __int128 v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  unsigned __int8 *v34;
  uint64_t *v35;
  uint64_t *v36;
  void *v37;
  void *v38;
  unsigned __int8 *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 *v42;
  int8x8_t v43;
  unint64_t v44;
  uint8x8_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int8 *v52;
  unsigned __int8 *v53;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  _QWORD *v57;
  unsigned __int8 *v58;
  __int128 v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint8x8_t v63;
  unint64_t v64;
  unint64_t v65;
  unsigned __int8 **v66;
  unsigned __int8 *v67;
  unint64_t v68;
  float v69;
  float v70;
  int8x8_t v71;
  unint64_t v72;
  uint8x8_t v73;
  _BOOL8 v74;
  unint64_t v75;
  unint64_t v76;
  int8x8_t prime;
  _QWORD *v78;
  _QWORD *v79;
  unint64_t v80;
  int8x8_t v81;
  void *v82;
  _QWORD *v83;
  uint64_t v84;
  _QWORD *v85;
  unint64_t v86;
  uint8x8_t v87;
  unint64_t v88;
  uint8x8_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  rf *ComponentByClass;
  NSObject *v94;
  const std::string::value_type *v95;
  CFErrorRef v96;
  uint64_t v97;
  NSObject *v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  NSObject *v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  _QWORD *v108;
  unint64_t v109;
  _QWORD *v110;
  rf::internal *v111;
  rf::internal *v112;
  rf::internal *v113;
  rf::internal *v114;
  rf::internal *v115;
  unint64_t v116;
  uint64_t v117;
  const __CFString *domain;
  _QWORD *v119;
  float *v120;
  void *v121;
  void *v122;
  void *v123;
  unsigned __int8 *v124;
  std::mutex *v125;
  unint64_t *v126;
  uint64_t v127;
  std::string block;
  void *v129;
  _QWORD *v130;
  uint64_t v131;
  _QWORD v132[4];
  uint8_t buf[16];
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;

  v140 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a2 + 32) && *(_BYTE *)(a2 + 16))
  {
    v4 = *(std::mutex **)(a1 + 8);
    std::mutex::lock(v4);
    v125 = v4;
    if (*(_QWORD *)&v4[41].__m_.__opaque[32])
    {
      if (!*(_BYTE *)(a2 + 32) || !*(_BYTE *)(a2 + 16))
        goto LABEL_217;
      v5 = MEMORY[0x22E29DA08](*(_QWORD *)(a2 + 8));
      if (v5 && REAssetGetAssetManager() != v5)
      {
        *(_QWORD *)buf = REAssetManagerCreateAssetHandle();
        v6 = *(_QWORD *)(a1 + 24);
        *(_QWORD *)(a1 + 24) = *(_QWORD *)buf;
        if (v6)
          RERelease();
        *(_QWORD *)buf = 0;
        RESharedPtr<REAsset>::~RESharedPtr(buf);
        REAssetHandleLoadNow();
        if ((REAssetHandleIsLoaded() & 1) == 0)
        {
          rf::getMessage((rf *)"Loading renderSyntheticEnvironment provider failed!", buf);
          rf::internal::logAssert((const char *)buf);
          if (SBYTE7(v134) < 0)
            operator delete(*(void **)buf);
          rf::internal::debugBreakHandler(v113);
        }
        *(_QWORD *)buf = REAssetManagerCreateAssetHandle();
        v7 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 32) = *(_QWORD *)buf;
        if (v7)
          RERelease();
        *(_QWORD *)buf = 0;
        RESharedPtr<REAsset>::~RESharedPtr(buf);
        REAssetHandleLoadNow();
        if ((REAssetHandleIsLoaded() & 1) == 0)
        {
          rf::getMessage((rf *)"Loading composeSyntheticEnvironment provider failed!", buf);
          rf::internal::logAssert((const char *)buf);
          if (SBYTE7(v134) < 0)
            operator delete(*(void **)buf);
          rf::internal::debugBreakHandler(v114);
        }
        RESceneAddRenderGraphFileProviderArray();
        *(_QWORD *)(a1 + 40) = RESceneRenderGraphFileProviderArrayAdd();
        *(_QWORD *)(a1 + 48) = RESceneRenderGraphFileProviderArrayAdd();
        *(_QWORD *)buf = REAssetManagerCreateAssetHandle();
        v8 = *(_QWORD *)(a1 + 56);
        *(_QWORD *)(a1 + 56) = *(_QWORD *)buf;
        if (v8)
          RERelease();
        *(_QWORD *)buf = 0;
        RESharedPtr<REAsset>::~RESharedPtr(buf);
        REAssetHandleLoadNow();
        if ((REAssetHandleIsLoaded() & 1) == 0)
        {
          rf::getMessage((rf *)"Loading syntheticEnvironmentUnlit material failed!", buf);
          rf::internal::logAssert((const char *)buf);
          if (SBYTE7(v134) < 0)
            operator delete(*(void **)buf);
          rf::internal::debugBreakHandler(v115);
        }
      }
    }
    for (i = *(_QWORD **)v4[42].__m_.__opaque; i; i = (_QWORD *)*i)
    {
      *(_DWORD *)buf = 1;
      std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::emplace_back<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation::Type,std::string const&>((_QWORD *)(a1 + 112), (int *)buf, (uint64_t)(i + 2));
    }
    for (j = *(_QWORD **)&v4[41].__m_.__opaque[24]; j; j = (_QWORD *)*j)
    {
      *(_DWORD *)buf = 0;
      std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::emplace_back<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation::Type,std::string const&>((_QWORD *)(a1 + 112), (int *)buf, (uint64_t)(j + 2));
    }
    v11 = *(uint64_t **)&v4[42].__m_.__opaque[40];
    if (v11)
    {
      v12 = *(_QWORD *)(a1 + 152);
      do
      {
        v13 = *(_QWORD *)(a1 + 120);
        v14 = *(_QWORD *)(a1 + 128);
        v15 = 42 * ((v14 - v13) >> 3) - 1;
        if (v14 == v13)
          v15 = 0;
        if (v15 == v12 + *(_QWORD *)(a1 + 144))
        {
          std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::__add_back_capacity((_QWORD *)(a1 + 112));
          v13 = *(_QWORD *)(a1 + 120);
          v14 = *(_QWORD *)(a1 + 128);
        }
        if (v14 == v13)
        {
          v17 = 0;
        }
        else
        {
          v16 = *(_QWORD *)(a1 + 152) + *(_QWORD *)(a1 + 144);
          v17 = *(_QWORD *)(v13 + 8 * (v16 / 0x2A)) + 96 * (v16 % 0x2A);
        }
        if (*((char *)v11 + 39) < 0)
          std::string::__init_copy_ctor_external(&block, (const std::string::value_type *)v11[2], v11[3]);
        else
          block = *(std::string *)(v11 + 2);
        v18 = *((_OWORD *)v11 + 4);
        *(_OWORD *)buf = *((_OWORD *)v11 + 3);
        v134 = v18;
        v19 = *((_OWORD *)v11 + 6);
        v135 = *((_OWORD *)v11 + 5);
        v136 = v19;
        *(_DWORD *)v17 = 2;
        v20 = (std::string *)(v17 + 8);
        if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(v20, block.__r_.__value_.__l.__data_, block.__r_.__value_.__l.__size_);
          v24 = SHIBYTE(block.__r_.__value_.__r.__words[2]);
          v25 = v134;
          *(_OWORD *)(v17 + 32) = *(_OWORD *)buf;
          *(_OWORD *)(v17 + 48) = v25;
          v26 = v136;
          *(_OWORD *)(v17 + 64) = v135;
          *(_OWORD *)(v17 + 80) = v26;
          if (v24 < 0)
            operator delete(block.__r_.__value_.__l.__data_);
        }
        else
        {
          v21 = *(_OWORD *)&block.__r_.__value_.__l.__data_;
          *(_QWORD *)(v17 + 24) = *((_QWORD *)&block.__r_.__value_.__l + 2);
          *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
          v22 = v134;
          *(_OWORD *)(v17 + 32) = *(_OWORD *)buf;
          *(_OWORD *)(v17 + 48) = v22;
          v23 = v136;
          *(_OWORD *)(v17 + 64) = v135;
          *(_OWORD *)(v17 + 80) = v23;
        }
        v12 = *(_QWORD *)(a1 + 152) + 1;
        *(_QWORD *)(a1 + 152) = v12;
        v11 = (uint64_t *)*v11;
      }
      while (v11);
    }
    if (*(_BYTE *)(a2 + 32) && *(_BYTE *)(a2 + 16))
    {
      if (*(_BYTE *)(a1 + 160))
      {
LABEL_41:
        std::mutex::unlock(v4);
        return;
      }
      v124 = (unsigned __int8 *)(a1 + 88);
      v126 = (unint64_t *)(a1 + 96);
      v127 = *(_QWORD *)(a2 + 24);
      v120 = (float *)(a1 + 104);
      v117 = *(_QWORD *)(a2 + 8);
      v27 = (_QWORD *)(a1 + 72);
      domain = (const __CFString *)*MEMORY[0x24BE26348];
      v119 = (_QWORD *)(a1 + 72);
      while (1)
      {
        if (!*(_QWORD *)(a1 + 152))
          goto LABEL_41;
        v28 = *(_QWORD *)(a1 + 144);
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8 * (v28 / 0x2A));
        v30 = v28 % 0x2A;
        v31 = *(_DWORD *)(v29 + 96 * v30);
        if (v31 == 2)
        {
          v46 = v29 + 96 * v30;
          if (std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::find<std::string>(v27, (unsigned __int8 *)(v46 + 8)))
          {
            if (REEntityGetSceneNullable() != v127)
            {
              rf::getMessage((rf *)"Asset entity doesn't belong to the right scene", buf);
              rf::internal::logAssert((const char *)buf);
              if (SBYTE7(v134) < 0)
                operator delete(*(void **)buf);
              rf::internal::debugBreakHandler(v112);
            }
            RETransformComponentGetComponentType();
            REEntityGetComponentByClass();
            RETransformComponentSetWorldMatrix4x4F();
          }
          else
          {
            rf::realityFusionLogObject(0);
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              if (*(char *)(v46 + 31) >= 0)
                v50 = v46 + 8;
              else
                v50 = *(_QWORD *)(v46 + 8);
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v50;
              _os_log_impl(&dword_227777000, v49, OS_LOG_TYPE_DEFAULT, "Trying to update unknown synthetic asset %s", buf, 0xCu);
            }

          }
          goto LABEL_174;
        }
        if (v31 == 1)
        {
          v41 = v29 + 96 * v30 + 8;
          if (std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::find<std::string>(v27, (unsigned __int8 *)v41))
          {
            if (REEntityGetSceneNullable() != v127)
            {
              rf::getMessage((rf *)"Asset entity doesn't belong to the right scene", buf);
              rf::internal::logAssert((const char *)buf);
              if (SBYTE7(v134) < 0)
                operator delete(*(void **)buf);
              rf::internal::debugBreakHandler(v111);
            }
            REEntitySetParent();
            v42 = std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::find<std::string>(v27, (unsigned __int8 *)v41);
            if (v42)
            {
              v43 = *(int8x8_t *)(a1 + 80);
              v44 = *((_QWORD *)v42 + 1);
              v45 = (uint8x8_t)vcnt_s8(v43);
              v45.i16[0] = vaddlv_u8(v45);
              if (v45.u32[0] > 1uLL)
              {
                if (v44 >= *(_QWORD *)&v43)
                  v44 %= *(_QWORD *)&v43;
              }
              else
              {
                v44 &= *(_QWORD *)&v43 - 1;
              }
              v52 = *(unsigned __int8 **)(*v27 + 8 * v44);
              do
              {
                v53 = v52;
                v52 = *(unsigned __int8 **)v52;
              }
              while (v52 != v42);
              if (v53 == v124)
                goto LABEL_148;
              v54 = *((_QWORD *)v53 + 1);
              if (v45.u32[0] > 1uLL)
              {
                if (v54 >= *(_QWORD *)&v43)
                  v54 %= *(_QWORD *)&v43;
              }
              else
              {
                v54 &= *(_QWORD *)&v43 - 1;
              }
              if (v54 != v44)
              {
LABEL_148:
                if (!*(_QWORD *)v42)
                  goto LABEL_149;
                v55 = *(_QWORD *)(*(_QWORD *)v42 + 8);
                if (v45.u32[0] > 1uLL)
                {
                  if (v55 >= *(_QWORD *)&v43)
                    v55 %= *(_QWORD *)&v43;
                }
                else
                {
                  v55 &= *(_QWORD *)&v43 - 1;
                }
                if (v55 != v44)
LABEL_149:
                  *(_QWORD *)(*v27 + 8 * v44) = 0;
              }
              v91 = *(_QWORD *)v42;
              if (*(_QWORD *)v42)
              {
                v92 = *(_QWORD *)(v91 + 8);
                if (v45.u32[0] > 1uLL)
                {
                  if (v92 >= *(_QWORD *)&v43)
                    v92 %= *(_QWORD *)&v43;
                }
                else
                {
                  v92 &= *(_QWORD *)&v43 - 1;
                }
                if (v92 != v44)
                {
                  *(_QWORD *)(*v27 + 8 * v92) = v53;
                  v91 = *(_QWORD *)v42;
                }
              }
              *(_QWORD *)v53 = v91;
              *(_QWORD *)v42 = 0;
              --*v126;
              *(_QWORD *)buf = v42;
              *(_QWORD *)&buf[8] = a1 + 88;
              LOBYTE(v134) = 1;
              std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>>>>::reset[abi:ne180100]((uint64_t)buf);
            }
          }
          else
          {
            rf::realityFusionLogObject(0);
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              if (*(char *)(v41 + 23) >= 0)
                v48 = v41;
              else
                v48 = *(_QWORD *)v41;
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v48;
              _os_log_impl(&dword_227777000, v47, OS_LOG_TYPE_DEFAULT, "Trying to remove unknown synthetic asset %s", buf, 0xCu);
            }

          }
          goto LABEL_174;
        }
        if (!v31)
          break;
LABEL_174:
        v104 = *(_QWORD *)(a1 + 144);
        v105 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8 * (v104 / 0x2A));
        if (*(char *)(v105 + 96 * (v104 % 0x2A) + 31) < 0)
        {
          operator delete(*(void **)(v105 + 96 * (v104 % 0x2A) + 8));
          v104 = *(_QWORD *)(a1 + 144);
        }
        v106 = *(_QWORD *)(a1 + 152) - 1;
        v107 = v104 + 1;
        *(_QWORD *)(a1 + 144) = v107;
        *(_QWORD *)(a1 + 152) = v106;
        if (v107 >= 0x54)
        {
          operator delete(**(void ***)(a1 + 120));
          *(_QWORD *)(a1 + 120) += 8;
          *(_QWORD *)(a1 + 144) -= 42;
        }
        if (*(_BYTE *)(a1 + 160))
          goto LABEL_41;
      }
      v32 = v29 + 96 * v30;
      v35 = *(uint64_t **)(v32 + 8);
      v34 = (unsigned __int8 *)(v32 + 8);
      v33 = v35;
      if ((v34[23] & 0x80u) == 0)
        v36 = (uint64_t *)v34;
      else
        v36 = v33;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v36, v116);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::find<std::string>(v27, v34);
      if (v39)
      {
        v40 = *((_QWORD *)v39 + 5);
LABEL_164:
        RESubsceneComponentGetComponentType();
        ComponentByClass = (rf *)REEntityGetComponentByClass();
        if (ComponentByClass)
        {
          rf::realityFusionLogObject(ComponentByClass);
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            if ((v34[23] & 0x80u) == 0)
              v95 = (const std::string::value_type *)v34;
            else
              v95 = *(const std::string::value_type **)v34;
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v95;
            _os_log_impl(&dword_227777000, v94, OS_LOG_TYPE_DEFAULT, "Synthetic asset at path %s is already loaded", buf, 0xCu);
          }

          if (*(_QWORD *)(a1 + 192))
          {
            v96 = CFErrorCreate(0, domain, 1, 0);
            std::function<void ()(NSURL *,NSError *)>::operator()(a1 + 168, v38, v96);
            CFRelease(v96);
          }
        }
        else
        {
          v123 = v37;
          v97 = RESceneImportOperationCreateWithURL();
          RESceneImportOperationSetUnitType();
          RESceneImportOperationSetIsolateFromEngine();
          RESceneImportOperationSetCompressTextures();
          v132[0] = 0;
          v132[1] = v132;
          v132[2] = 0x2020000000;
          v132[3] = 0;
          *(_BYTE *)(a1 + 160) = 1;
          v99 = *(NSObject **)(a1 + 200);
          v98 = *(NSObject **)(a1 + 208);
          block.__r_.__value_.__r.__words[0] = MEMORY[0x24BDAC760];
          block.__r_.__value_.__l.__size_ = 3221225472;
          block.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN2rf9data_flow8consumer28SyntheticEnvironmentConsumer24addSyntheticAssetToSceneERKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEP7RESceneP16REServiceLocator_block_invoke;
          v129 = &unk_24EFDA540;
          v130 = v132;
          v131 = v97;
          dispatch_group_async(v98, v99, &block);
          v100 = MEMORY[0x22E29DA38](v117);
          v101 = MEMORY[0x22E29DA08](v117);
          REAssetManagerGetEngineQueue();
          v102 = objc_claimAutoreleasedReturnValue();
          v103 = *(NSObject **)(a1 + 208);
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&v134 = ___ZN2rf9data_flow8consumer28SyntheticEnvironmentConsumer24addSyntheticAssetToSceneERKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEP7RESceneP16REServiceLocator_block_invoke_2;
          *((_QWORD *)&v134 + 1) = &unk_24EFDA568;
          *((_QWORD *)&v135 + 1) = v132;
          *(_QWORD *)&v136 = a1;
          *((_QWORD *)&v136 + 1) = v40;
          v137 = v97;
          *(_QWORD *)&v135 = v38;
          v138 = v101;
          v139 = v100;
          dispatch_group_notify(v103, v102, buf);

          v37 = v123;
          _Block_object_dispose(v132, 8);
        }

        goto LABEL_174;
      }
      v121 = v38;
      v122 = v37;
      if (!*(_QWORD *)(a1 + 64) || REEntityGetSceneNullable() != v127)
      {
        *(_QWORD *)buf = REEntityCreate();
        v51 = *(_QWORD *)(a1 + 64);
        *(_QWORD *)(a1 + 64) = *(_QWORD *)buf;
        if (v51)
          RERelease();
        *(_QWORD *)buf = 0;
        RESharedPtr<REEntity>::~RESharedPtr(buf);
        REEntitySetName();
        RETransformComponentGetComponentType();
        REEntityAddComponentByClass();
        REAnchorComponentGetComponentType();
        REEntityAddComponentByClass();
        REAnchorComponentSetAnchoredLocally();
        RESceneAddEntity();
        REHideEntity();
      }
      v40 = REEntityCreate();
      REEntitySetName();
      RETransformComponentGetComponentType();
      REEntityAddComponentByClass();
      REEntitySetParent();
      REHideEntity();
      RERelease();
      RESharedPtr<REEntity>::fromGet(v40, (uint64_t *)&block);
      v56 = (char *)operator new(0x30uLL);
      v57 = v56;
      *(_QWORD *)buf = v56;
      *(_QWORD *)&buf[8] = a1 + 88;
      LOBYTE(v134) = 0;
      v58 = (unsigned __int8 *)(v56 + 16);
      *(_QWORD *)v56 = 0;
      *((_QWORD *)v56 + 1) = 0;
      if ((char)v34[23] < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)(v56 + 16), *(const std::string::value_type **)v34, *((_QWORD *)v34 + 1));
      }
      else
      {
        v59 = *(_OWORD *)v34;
        *((_QWORD *)v56 + 4) = *((_QWORD *)v34 + 2);
        *(_OWORD *)v58 = v59;
      }
      v57[5] = block.__r_.__value_.__r.__words[0];
      block.__r_.__value_.__r.__words[0] = 0;
      LOBYTE(v134) = 1;
      v57[1] = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v126, (uint64_t)v58);
      v60 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v126, (uint64_t)v58);
      v57[1] = v60;
      v61 = *(_QWORD *)(a1 + 80);
      if (v61)
      {
        v62 = v60;
        v63 = (uint8x8_t)vcnt_s8((int8x8_t)v61);
        v63.i16[0] = vaddlv_u8(v63);
        v64 = v63.u32[0];
        if (v63.u32[0] > 1uLL)
        {
          v65 = v60;
          if (v61 <= v60)
            v65 = v60 % v61;
        }
        else
        {
          v65 = (v61 - 1) & v60;
        }
        v66 = *(unsigned __int8 ***)(*v119 + 8 * v65);
        if (v66)
        {
          v67 = *v66;
          if (*v66)
          {
            v116 = v61 - 1;
            do
            {
              v68 = *((_QWORD *)v67 + 1);
              if (v68 == v62)
              {
                if ((std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)v120, v67 + 16, v58) & 1) != 0)
                  goto LABEL_163;
              }
              else
              {
                if (v64 > 1)
                {
                  if (v68 >= v61)
                    v68 %= v61;
                }
                else
                {
                  v68 &= v116;
                }
                if (v68 != v65)
                  break;
              }
              v67 = *(unsigned __int8 **)v67;
            }
            while (v67);
          }
        }
      }
      v69 = (float)(*v126 + 1);
      v70 = *v120;
      if (v61 && (float)(v70 * (float)v61) >= v69)
      {
LABEL_113:
        v71 = *(int8x8_t *)(a1 + 80);
        v72 = v57[1];
        v73 = (uint8x8_t)vcnt_s8(v71);
        v73.i16[0] = vaddlv_u8(v73);
        if (v73.u32[0] > 1uLL)
        {
          if (v72 >= *(_QWORD *)&v71)
            v72 %= *(_QWORD *)&v71;
        }
        else
        {
          v72 &= *(_QWORD *)&v71 - 1;
        }
        v78 = (_QWORD *)*v119;
        v79 = *(_QWORD **)(*v119 + 8 * v72);
        if (v79)
        {
          *v57 = *v79;
        }
        else
        {
          *v57 = *(_QWORD *)v124;
          *(_QWORD *)v124 = v57;
          v78[v72] = v124;
          if (!*v57)
            goto LABEL_162;
          v80 = *(_QWORD *)(*v57 + 8);
          if (v73.u32[0] > 1uLL)
          {
            if (v80 >= *(_QWORD *)&v71)
              v80 %= *(_QWORD *)&v71;
          }
          else
          {
            v80 &= *(_QWORD *)&v71 - 1;
          }
          v79 = (_QWORD *)(*v119 + 8 * v80);
        }
        *v79 = v57;
LABEL_162:
        ++*v126;
        *(_QWORD *)buf = 0;
LABEL_163:
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>>>>::reset[abi:ne180100]((uint64_t)buf);
        RESharedPtr<REEntity>::~RESharedPtr(&block);
        v4 = v125;
        v27 = (_QWORD *)(a1 + 72);
        v38 = v121;
        v37 = v122;
        goto LABEL_164;
      }
      v74 = (v61 & (v61 - 1)) != 0;
      if (v61 < 3)
        v74 = 1;
      v75 = v74 | (2 * v61);
      v76 = vcvtps_u32_f32(v69 / v70);
      if (v75 <= v76)
        prime = (int8x8_t)v76;
      else
        prime = (int8x8_t)v75;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      }
      v81 = *(int8x8_t *)(a1 + 80);
      if (*(_QWORD *)&prime <= *(_QWORD *)&v81)
      {
        if (*(_QWORD *)&prime >= *(_QWORD *)&v81)
          goto LABEL_113;
        v88 = vcvtps_u32_f32((float)*v126 / *v120);
        if (*(_QWORD *)&v81 < 3uLL || (v89 = (uint8x8_t)vcnt_s8(v81), v89.i16[0] = vaddlv_u8(v89), v89.u32[0] > 1uLL))
        {
          v88 = std::__next_prime(v88);
        }
        else
        {
          v90 = 1 << -(char)__clz(v88 - 1);
          if (v88 >= 2)
            v88 = v90;
        }
        if (*(_QWORD *)&prime <= v88)
          prime = (int8x8_t)v88;
        if (*(_QWORD *)&prime >= *(_QWORD *)&v81)
          goto LABEL_113;
        if (!*(_QWORD *)&prime)
        {
          v110 = (_QWORD *)*v119;
          *v119 = 0;
          if (v110)
            operator delete(v110);
          *(_QWORD *)(a1 + 80) = 0;
          goto LABEL_113;
        }
      }
      if (*(_QWORD *)&prime >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v82 = operator new(8 * *(_QWORD *)&prime);
      v83 = (_QWORD *)*v119;
      *v119 = v82;
      if (v83)
        operator delete(v83);
      v84 = 0;
      *(int8x8_t *)(a1 + 80) = prime;
      do
        *(_QWORD *)(*v119 + 8 * v84++) = 0;
      while (*(_QWORD *)&prime != v84);
      v85 = *(_QWORD **)v124;
      if (!*(_QWORD *)v124)
        goto LABEL_113;
      v86 = v85[1];
      v87 = (uint8x8_t)vcnt_s8(prime);
      v87.i16[0] = vaddlv_u8(v87);
      if (v87.u32[0] > 1uLL)
      {
        if (v86 >= *(_QWORD *)&prime)
          v86 %= *(_QWORD *)&prime;
      }
      else
      {
        v86 &= *(_QWORD *)&prime - 1;
      }
      *(_QWORD *)(*v119 + 8 * v86) = v124;
      v108 = (_QWORD *)*v85;
      if (!*v85)
        goto LABEL_113;
      while (1)
      {
        v109 = v108[1];
        if (v87.u32[0] > 1uLL)
        {
          if (v109 >= *(_QWORD *)&prime)
            v109 %= *(_QWORD *)&prime;
        }
        else
        {
          v109 &= *(_QWORD *)&prime - 1;
        }
        if (v109 != v86)
        {
          if (!*(_QWORD *)(*v119 + 8 * v109))
          {
            *(_QWORD *)(*v119 + 8 * v109) = v85;
            goto LABEL_191;
          }
          *v85 = *v108;
          *v108 = **(_QWORD **)(*v119 + 8 * v109);
          **(_QWORD **)(*v119 + 8 * v109) = v108;
          v108 = v85;
        }
        v109 = v86;
LABEL_191:
        v85 = v108;
        v108 = (_QWORD *)*v108;
        v86 = v109;
        if (!v108)
          goto LABEL_113;
      }
    }
LABEL_217:
    std::__throw_bad_optional_access[abi:ne180100]();
  }
}

void sub_2277EB158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::mutex *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,void *__p,uint64_t a37,int a38,__int16 a39,char a40,char a41)
{
  if (a41 < 0)
    operator delete(__p);
  std::mutex::unlock(a20);
  _Unwind_Resume(a1);
}

void sub_2277EB24C()
{
  JUMPOUT(0x2277EB244);
}

uint64_t std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::~deque[abi:ne180100](uint64_t a1)
{
  void **v2;
  void **v3;
  _QWORD *v4;
  unint64_t v5;
  void **v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    v4 = (_QWORD *)(a1 + 40);
    v3 = *(void ***)(a1 + 8);
  }
  else
  {
    v4 = (_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = &v2[v5 / 0x2A];
    v7 = (unint64_t)*v6;
    v8 = (unint64_t)*v6 + 96 * (v5 % 0x2A);
    v9 = (unint64_t)v2[(*(_QWORD *)(a1 + 40) + v5) / 0x2A] + 96 * ((*(_QWORD *)(a1 + 40) + v5) % 0x2A);
    if (v8 != v9)
    {
      do
      {
        if (*(char *)(v8 + 31) < 0)
        {
          operator delete(*(void **)(v8 + 8));
          v7 = (unint64_t)*v6;
        }
        v8 += 96;
        if (v8 - v7 == 4032)
        {
          v10 = (unint64_t)v6[1];
          ++v6;
          v7 = v10;
          v8 = v10;
        }
      }
      while (v8 != v9);
      v2 = *(void ***)(a1 + 8);
      v3 = *(void ***)(a1 + 16);
    }
  }
  *v4 = 0;
  v11 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = *(void ***)(a1 + 16);
      v2 = (void **)(*(_QWORD *)(a1 + 8) + 8);
      *(_QWORD *)(a1 + 8) = v2;
      v11 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v12 = v11 >> 3;
  if (v12 == 1)
  {
    v13 = 21;
    goto LABEL_16;
  }
  if (v12 == 2)
  {
    v13 = 42;
LABEL_16:
    *(_QWORD *)(a1 + 32) = v13;
  }
  if (v2 != v3)
  {
    do
    {
      v14 = *v2++;
      operator delete(v14);
    }
    while (v2 != v3);
    v16 = *(_QWORD *)(a1 + 8);
    v15 = *(_QWORD *)(a1 + 16);
    if (v15 != v16)
      *(_QWORD *)(a1 + 16) = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::emplace_back<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation::Type,std::string const&>(_QWORD *a1, int *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  std::string *v12;
  __int128 v13;
  int v14;
  std::string __p;

  v6 = a1[1];
  v7 = a1[2];
  v8 = 42 * ((v7 - v6) >> 3) - 1;
  if (v7 == v6)
    v8 = 0;
  if (v8 == a1[5] + a1[4])
  {
    std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::__add_back_capacity(a1);
    v6 = a1[1];
    v7 = a1[2];
  }
  if (v7 == v6)
  {
    v10 = 0;
  }
  else
  {
    v9 = a1[5] + a1[4];
    v10 = *(_QWORD *)(v6 + 8 * (v9 / 0x2A)) + 96 * (v9 % 0x2A);
  }
  v11 = *a2;
  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  *(_DWORD *)v10 = v11;
  v12 = (std::string *)(v10 + 8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v12, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v14 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    *(_OWORD *)(v10 + 32) = xmmword_2277EE440;
    *(_OWORD *)(v10 + 48) = xmmword_2277EE450;
    *(_OWORD *)(v10 + 64) = xmmword_2277EE460;
    *(_OWORD *)(v10 + 80) = xmmword_2277EE900;
    if (v14 < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v13 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(_QWORD *)(v10 + 24) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v13;
    *(_OWORD *)(v10 + 32) = xmmword_2277EE440;
    *(_OWORD *)(v10 + 48) = xmmword_2277EE450;
    *(_OWORD *)(v10 + 64) = xmmword_2277EE460;
    *(_OWORD *)(v10 + 80) = xmmword_2277EE900;
  }
  ++a1[5];
}

void sub_2277EB554(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  _QWORD *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t i;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  BOOL v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;

  v2 = a1[4];
  v3 = v2 >= 0x2A;
  v4 = v2 - 42;
  if (v3)
  {
    a1[4] = v4;
    v5 = (_QWORD *)a1[1];
    v6 = (char *)a1[2];
    v9 = *v5;
    v7 = (char *)(v5 + 1);
    v8 = v9;
    a1[1] = v7;
    if (v6 != (char *)a1[3])
      goto LABEL_41;
    v10 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v38 = 1;
      else
        v38 = (uint64_t)&v6[-*a1] >> 2;
      v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v38);
      v40 = &v39[8 * (v38 >> 2)];
      v42 = &v39[8 * v41];
      v43 = (uint64_t *)a1[1];
      v6 = v40;
      v44 = a1[2] - (_QWORD)v43;
      if (v44)
      {
        v6 = &v40[v44 & 0xFFFFFFFFFFFFFFF8];
        v45 = 8 * (v44 >> 3);
        v46 = &v39[8 * (v38 >> 2)];
        do
        {
          v47 = *v43++;
          *(_QWORD *)v46 = v47;
          v46 += 8;
          v45 -= 8;
        }
        while (v45);
      }
      goto LABEL_29;
    }
LABEL_5:
    v11 = v10 >> 3;
    v12 = v10 >> 3 < -1;
    v13 = (v10 >> 3) + 2;
    if (v12)
      v14 = v13;
    else
      v14 = v11 + 1;
    v15 = -(v14 >> 1);
    v16 = v14 >> 1;
    v17 = &v7[-8 * v16];
    v18 = v6 - v7;
    if (v6 != v7)
    {
      memmove(&v7[-8 * v16], v7, v6 - v7);
      v7 = (char *)a1[1];
    }
    v6 = &v17[v18];
    a1[1] = &v7[8 * v15];
    a1[2] = &v17[v18];
    goto LABEL_41;
  }
  v20 = (char *)a1[2];
  v19 = (char *)a1[3];
  v21 = (char *)*a1;
  v22 = (char *)a1[1];
  v23 = (v20 - v22) >> 3;
  v24 = (uint64_t)&v19[-*a1];
  if (v23 < v24 >> 3)
  {
    v25 = operator new(0xFC0uLL);
    v26 = v25;
    if (v19 != v20)
    {
      *(_QWORD *)v20 = v25;
LABEL_42:
      a1[2] += 8;
      return;
    }
    if (v22 == v21)
    {
      if (v20 == v22)
        v49 = 1;
      else
        v49 = (v19 - v22) >> 2;
      v50 = 2 * v49;
      v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v49);
      v22 = &v51[(v50 + 6) & 0xFFFFFFFFFFFFFFF8];
      v53 = (uint64_t *)a1[1];
      v54 = v22;
      v55 = a1[2] - (_QWORD)v53;
      if (v55)
      {
        v54 = &v22[v55 & 0xFFFFFFFFFFFFFFF8];
        v56 = 8 * (v55 >> 3);
        v57 = &v51[(v50 + 6) & 0xFFFFFFFFFFFFFFF8];
        do
        {
          v58 = *v53++;
          *(_QWORD *)v57 = v58;
          v57 += 8;
          v56 -= 8;
        }
        while (v56);
      }
      v59 = (char *)*a1;
      *a1 = v51;
      a1[1] = v22;
      a1[2] = v54;
      a1[3] = &v51[8 * v52];
      if (v59)
      {
        operator delete(v59);
        v22 = (char *)a1[1];
      }
    }
    *((_QWORD *)v22 - 1) = v26;
    v7 = (char *)a1[1];
    v6 = (char *)a1[2];
    a1[1] = v7 - 8;
    v8 = *((_QWORD *)v7 - 1);
    a1[1] = v7;
    if (v6 != (char *)a1[3])
    {
LABEL_41:
      *(_QWORD *)v6 = v8;
      goto LABEL_42;
    }
    v10 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v82 = 1;
      else
        v82 = (uint64_t)&v6[-*a1] >> 2;
      v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v82);
      v40 = &v39[8 * (v82 >> 2)];
      v42 = &v39[8 * v83];
      v84 = (uint64_t *)a1[1];
      v6 = v40;
      v85 = a1[2] - (_QWORD)v84;
      if (v85)
      {
        v6 = &v40[v85 & 0xFFFFFFFFFFFFFFF8];
        v86 = 8 * (v85 >> 3);
        v87 = &v39[8 * (v82 >> 2)];
        do
        {
          v88 = *v84++;
          *(_QWORD *)v87 = v88;
          v87 += 8;
          v86 -= 8;
        }
        while (v86);
      }
LABEL_29:
      v48 = (char *)*a1;
      *a1 = v39;
      a1[1] = v40;
      a1[2] = v6;
      a1[3] = v42;
      if (v48)
      {
        operator delete(v48);
        v6 = (char *)a1[2];
      }
      goto LABEL_41;
    }
    goto LABEL_5;
  }
  v27 = v24 >> 2;
  if (v19 == v21)
    v28 = 1;
  else
    v28 = v27;
  v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v28);
  v31 = v30;
  v32 = operator new(0xFC0uLL);
  v33 = &v29[8 * v23];
  v34 = &v29[8 * v31];
  if (v23 == v31)
  {
    v35 = 8 * v23;
    if (v20 - v22 < 1)
    {
      v60 = v35 >> 2;
      if (v20 == v22)
        v61 = 1;
      else
        v61 = v60;
      v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v61);
      v33 = &v62[8 * (v61 >> 2)];
      v34 = &v62[8 * v63];
      if (v29)
        operator delete(v29);
      v29 = v62;
    }
    else
    {
      v36 = v35 >> 3;
      if (v36 >= -1)
        v37 = v36 + 1;
      else
        v37 = v36 + 2;
      v33 -= 8 * (v37 >> 1);
    }
  }
  *(_QWORD *)v33 = v32;
  v64 = v33 + 8;
  for (i = a1[2]; i != a1[1]; i -= 8)
  {
    if (v33 == v29)
    {
      if (v64 >= v34)
      {
        if (v34 == v29)
          v70 = 1;
        else
          v70 = (v34 - v29) >> 2;
        v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v70);
        v73 = v71;
        v33 = &v71[(2 * v70 + 6) & 0xFFFFFFFFFFFFFFF8];
        v75 = v64 - v29;
        v74 = v64 == v29;
        v64 = v33;
        if (!v74)
        {
          v64 = &v33[v75 & 0xFFFFFFFFFFFFFFF8];
          v76 = 8 * (v75 >> 3);
          v77 = v33;
          v78 = (uint64_t *)v29;
          do
          {
            v79 = *v78++;
            *(_QWORD *)v77 = v79;
            v77 += 8;
            v76 -= 8;
          }
          while (v76);
        }
        v34 = &v71[8 * v72];
        if (v29)
          operator delete(v29);
        v29 = v73;
      }
      else
      {
        v66 = (v34 - v64) >> 3;
        if (v66 >= -1)
          v67 = v66 + 1;
        else
          v67 = v66 + 2;
        v68 = v67 >> 1;
        v33 = &v29[8 * (v67 >> 1)];
        v69 = v29;
        if (v64 != v29)
        {
          memmove(v33, v29, v64 - v29);
          v69 = v64;
        }
        v64 = &v69[8 * v68];
      }
    }
    v80 = *(_QWORD *)(i - 8);
    *((_QWORD *)v33 - 1) = v80;
    v33 -= 8;
  }
  v81 = (char *)*a1;
  *a1 = v29;
  a1[1] = v33;
  a1[2] = v64;
  a1[3] = v34;
  if (v81)
    operator delete(v81);
}

void sub_2277EB990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  if (v1)
    operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,RESharedPtr<REEntity>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,RESharedPtr<REEntity>>,0>(uint64_t a1)
{
  RESharedPtr<REEntity>::~RESharedPtr((_QWORD *)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,RESharedPtr<REEntity>>,0>((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t *RFSyntheticARDataProviderCreate(void *a1)
{
  _QWORD *v1;
  uint64_t *Instance;
  _QWORD *v3;
  uint64_t v4;
  id v6;
  _QWORD v7[3];
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = v7;
  v6 = a1;
  v7[0] = &off_24EFDA5B0;
  v7[1] = rf::data_flow::provider::SyntheticARData::sampleDataAllAtOnce;
  v8 = v7;
  v9 = 0;
  if (qword_253DCA1A8 != -1)
    dispatch_once(&qword_253DCA1A8, &__block_literal_global_16);
  Instance = (uint64_t *)_CFRuntimeCreateInstance();
  v3 = (_QWORD *)operator new();
  *v3 = Instance;
  rf::data_flow::provider::SyntheticARDataProvider::SyntheticARDataProvider((rf::data_flow::provider::SyntheticARDataProvider *)(v3 + 1), &v6);
  std::unique_ptr<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>::BridgableObject,std::default_delete<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>::BridgableObject>>::reset[abi:ne180100](Instance + 2, (uint64_t)v3);
  if (Instance)
  {
    CFRetain(Instance);
    CFRelease(Instance);
  }
  if (v8 == v7)
  {
    v4 = 4;
    goto LABEL_9;
  }
  if (v8)
  {
    v4 = 5;
    v1 = v8;
LABEL_9:
    (*(void (**)(_QWORD *))(*v1 + 8 * v4))(v1);
  }

  return Instance;
}

void sub_2277EBD54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void RFSyntheticARDataProviderAddSourceAsset(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  char *v12;
  void *__p[2];
  char v14;
  void *v15[2];
  char v16;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 16);
    v10 = CFURLCopyFileSystemPath((CFURLRef)v5, kCFURLPOSIXPathStyle);
    v11 = v10;
    if (v10)
    {
      applesauce::CF::details::CFString_get_value<true>(v10, (uint64_t)v15);
      CFRelease(v11);
      if (v16 >= 0)
        v12 = (char *)v15;
      else
        v12 = (char *)v15[0];
      std::string::basic_string[abi:ne180100]<0>(__p, v12);
      rf::data_flow::provider::SyntheticARDataProvider::addData(v9 + 8, a2, (__int128 *)__p);
      if (v14 < 0)
        operator delete(__p[0]);
      if (v16 < 0)
        operator delete(v15[0]);
    }
  }

}

void sub_2277EBED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;

  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);

  _Unwind_Resume(a1);
}

void RFSyntheticARDataProviderSetAssetTransform(uint64_t a1, unint64_t a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6)
{
  uint64_t v6;
  __int128 v7[4];

  v6 = *(_QWORD *)(a1 + 16);
  v7[0] = (__int128)a3;
  v7[1] = (__int128)a4;
  v7[2] = (__int128)a5;
  v7[3] = (__int128)a6;
  rf::data_flow::provider::SyntheticARDataProvider::setDataTransform(v6 + 8, a2, v7);
}

void RFSyntheticARDataProviderRemoveSourceAsset(uint64_t a1, unint64_t a2)
{
  rf::data_flow::provider::SyntheticARDataProvider::removeData((rf::data_flow::provider::SyntheticARDataProvider *)(*(_QWORD *)(a1 + 16) + 8), a2);
}

void RFSyntheticARDataProviderReset(uint64_t a1)
{
  rf::data_flow::provider::SyntheticARDataProvider::reset((rf::data_flow::provider::SyntheticARDataProvider *)(*(_QWORD *)(a1 + 16) + 8));
}

void RFSyntheticARDataProviderSetFrameInputFromARSession(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 16);
  v5 = (std::__shared_weak_count *)v4[13];
  v17 = v4[12];
  v18 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v19 = v4[14];
  v8 = (std::__shared_weak_count *)operator new(0x48uLL);
  v8->__shared_owners_ = 0;
  v8->__shared_weak_owners_ = 0;
  v8->__vftable = (std::__shared_weak_count_vtbl *)&off_24EFDA680;
  v15 = rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider((uint64_t)&v8[1], v3, &v17);
  v16 = v8;
  std::shared_ptr<rf::data_flow::provider::InputFrameProvider>::operator=[abi:ne180100](v4 + 15, &v15);
  v9 = v16;
  if (v16)
  {
    v10 = (unint64_t *)&v16->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = v18;
  if (v18)
  {
    v13 = (unint64_t *)&v18->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

}

void sub_2277EC088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  void *v12;
  std::__shared_weak_count *v13;
  void *v15;

  std::__shared_weak_count::~__shared_weak_count(v13);
  operator delete(v15);
  std::shared_ptr<rf::data_flow::DataGraph>::~shared_ptr[abi:ne180100]((uint64_t)&a12);

  _Unwind_Resume(a1);
}

uint64_t RFSyntheticARDataProviderSetServiceLocator(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 16) + 72) = a2;
  return result;
}

void RFSyntheticARDataProviderProvideProbes(uint64_t a1, unint64_t a2, const unsigned __int8 *a3)
{
  rf::data_flow::provider::SyntheticARDataProvider::provideEnvironmentProbesOnRequest((rf::data_flow::provider::SyntheticARDataProvider *)(*(_QWORD *)(a1 + 16) + 8), a2, a3);
}

void std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::~__func()
{
  JUMPOUT(0x22E29DD50);
}

_QWORD *std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24EFDA5B0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24EFDA5B0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 8))(a2, a3, a4);
}

uint64_t std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::target_type()
{
}

void ___ZN2rf17ClassRegistrationINS_14CustomCFObjectINS_9data_flow8provider23SyntheticARDataProviderEEEE13registerClassEv_block_invoke()
{
  size_t v0;
  int v1;
  char i;
  int v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *__dst[2];
  int64_t v9;

  v0 = 0;
  v1 = 1;
  for (i = 114; ; i = aStdStringViewR_27[v0++ + 51])
  {
    if (i == 91)
    {
      v3 = 1;
      goto LABEL_8;
    }
    if (i == 93)
      break;
    if (!i)
    {
      v0 = 0;
      HIBYTE(v9) = 0;
      v4 = __dst;
      goto LABEL_18;
    }
LABEL_9:
    ;
  }
  v3 = -1;
LABEL_8:
  v1 += v3;
  if (v1)
    goto LABEL_9;
  if (v0 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v0 >= 0x17)
  {
    v5 = (v0 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v0 | 7) != 0x17)
      v5 = v0 | 7;
    v6 = v5 + 1;
    v4 = (void **)operator new(v5 + 1);
    __dst[1] = (void *)v0;
    v9 = v6 | 0x8000000000000000;
    __dst[0] = v4;
    goto LABEL_17;
  }
  HIBYTE(v9) = v0;
  v4 = __dst;
  if (v0)
LABEL_17:
    memcpy(v4, "rf::data_flow::provider::SyntheticARDataProvider]", v0);
LABEL_18:
  *((_BYTE *)v4 + v0) = 0;
  xmmword_253DCA1B0 = 0u;
  xmmword_253DCA1C0 = 0u;
  xmmword_253DCA1D0 = 0u;
  unk_253DCA1E0 = 0u;
  v7 = __dst;
  if (v9 < 0)
    v7 = (void **)__dst[0];
  xmmword_253DCA1F0 = 0uLL;
  unk_253DCA200 = 0uLL;
  *((_QWORD *)&xmmword_253DCA1B0 + 1) = v7;
  *(_QWORD *)&xmmword_253DCA1C0 = rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::initCallback;
  *(_QWORD *)&xmmword_253DCA1D0 = rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::finalizeCallback;
  qword_253DCA1E8 = (uint64_t)rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::copyFormattingDescriptionCallback;
  *(_QWORD *)&xmmword_253DCA1F0 = rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::copyDebugDescriptionCallback;
  _MergedGlobals_17 = _CFRuntimeRegisterClass();
  if (SHIBYTE(v9) < 0)
    operator delete(__dst[0]);
}

void sub_2277EC304(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::initCallback(uint64_t result)
{
  *(_QWORD *)(result + 16) = 0;
  return result;
}

uint64_t *rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::finalizeCallback(uint64_t a1)
{
  return std::unique_ptr<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>::BridgableObject,std::default_delete<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>::BridgableObject>>::reset[abi:ne180100]((uint64_t *)(a1 + 16), 0);
}

uint64_t rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::copyFormattingDescriptionCallback()
{
  return 0;
}

uint64_t rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::copyDebugDescriptionCallback()
{
  return 0;
}

uint64_t *std::unique_ptr<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>::BridgableObject,std::default_delete<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>::BridgableObject>>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    rf::data_flow::provider::SyntheticARDataProvider::~SyntheticARDataProvider((rf::data_flow::provider::SyntheticARDataProvider *)(v2 + 8));
    JUMPOUT(0x22E29DD50);
  }
  return result;
}

void std::__shared_ptr_emplace<rf::data_flow::provider::ARSessionInputFrameProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24EFDA680;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<rf::data_flow::provider::ARSessionInputFrameProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24EFDA680;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22E29DD50);
}

void std::__shared_ptr_emplace<rf::data_flow::provider::ARSessionInputFrameProvider>::__on_zero_shared(uint64_t a1)
{
  rf::data_flow::provider::ARSessionInputFrameProvider::~ARSessionInputFrameProvider((id *)(a1 + 24));
}

uint64_t rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  id v9;
  ARSessionFrameObserver *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v14[3];
  _QWORD *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  *(_QWORD *)a1 = &unk_24EFD9668;
  v6 = a3[1];
  *(_QWORD *)(a1 + 8) = *a3;
  *(_QWORD *)(a1 + 16) = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  *(_QWORD *)(a1 + 24) = a3[2];
  *(_QWORD *)a1 = &off_24EFDA6D0;
  v9 = v5;
  *(_QWORD *)(a1 + 32) = v9;
  v14[0] = &off_24EFDA708;
  v14[1] = a1;
  v15 = v14;
  v10 = -[ARSessionFrameObserver initWithCallback:]([ARSessionFrameObserver alloc], "initWithCallback:", v14);
  *(_QWORD *)(a1 + 40) = v10;
  v11 = v15;
  if (v15 == v14)
  {
    v12 = 4;
    v11 = v14;
    goto LABEL_8;
  }
  if (v15)
  {
    v12 = 5;
LABEL_8:
    (*(void (**)(void))(*v11 + 8 * v12))();
    v10 = *(ARSessionFrameObserver **)(a1 + 40);
  }
  objc_msgSend(*(id *)(a1 + 32), "_addObserver:", v10);

  return a1;
}

void sub_2277EC50C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  *(_QWORD *)v1 = v4 + 16;
  std::shared_ptr<rf::data_flow::DataGraph>::~shared_ptr[abi:ne180100](v2);

  _Unwind_Resume(a1);
}

void rf::data_flow::provider::ARSessionInputFrameProvider::~ARSessionInputFrameProvider(id *this)
{
  id v2;

  objc_msgSend(this[4], "_removeObserver:", this[5]);
  v2 = this[4];
  this[4] = 0;

  *this = &unk_24EFD9668;
  std::shared_ptr<rf::data_flow::DataGraph>::~shared_ptr[abi:ne180100]((uint64_t)(this + 1));
}

{
  rf::data_flow::provider::ARSessionInputFrameProvider::~ARSessionInputFrameProvider(this);
  JUMPOUT(0x22E29DD50);
}

void std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::~__func()
{
  JUMPOUT(0x22E29DD50);
}

_QWORD *std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24EFDA708;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24EFDA708;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::operator()(uint64_t a1, __int128 *a2)
{
  return rf::data_flow::provider::InputFrameProvider::provideData(*(_QWORD *)(a1 + 8), a2);
}

uint64_t std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::target_type()
{
}

uint64_t *re::foundationCoreLogObjects(re *this)
{
  unsigned __int8 v1;

  {
    re::foundationCoreLogObjects(void)::logObjects = (uint64_t)os_log_create("com.apple.re", "Foundation.Core");
  }
  return &re::foundationCoreLogObjects(void)::logObjects;
}

BOOL re::internal::enableSignposts(re::internal *this, uint64_t a2)
{
  unsigned __int8 v2;
  int v4;
  BOOL v5;
  char v6;
  unsigned int v7;
  char v8;
  _BYTE v9[4];
  int v10;

  if ((v2 & 1) == 0)
  {
    v7 = a2;
    v8 = (char)this;
    a2 = v7;
    LOBYTE(this) = v8;
    if (v4)
    {
      re::Defaults::intValue((re::Defaults *)"enableSignposts", (const char *)v7, (uint64_t)v9);
      if (v9[0])
        v5 = v10 == 0;
      else
        v5 = 0;
      v6 = !v5;
      re::internal::enableSignposts(BOOL,BOOL)::value = v6;
      a2 = v7;
      LOBYTE(this) = v8;
    }
  }
  if ((this & 1) == 0)
    return re::internal::enableSignposts(BOOL,BOOL)::value != 0;
  re::internal::enableSignposts(BOOL,BOOL)::value = a2;
  return a2;
}

void re::Defaults::intValue(re::Defaults *this@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  void *v4;
  char v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    *(_DWORD *)(a3 + 4) = objc_msgSend(v4, "intValue");
    v4 = v6;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  *(_BYTE *)a3 = v5;

}

id `anonymous namespace'::getValue(_anonymous_namespace_ *this, const char *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  re *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s.%s"), "com.apple.re", this);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", this);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v6);
    v7 = (re *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v5 = v7;
      v8 = v6;
    }
    else
    {
      v9 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("."), 4);
      objc_msgSend(v4, "substringToIndex:", v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "substringFromIndex:", v9 + 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.re.network.multipeerservice")))
      {

        v10 = CFSTR("com.apple.renetwork.multipeerservice");
      }
      objc_msgSend(v3, "dictionaryForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_9;
    }
    v12 = *re::foundationCoreLogObjects(v7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }
LABEL_9:

  }
  return v5;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC850](allocator, URLBytes, length, *(_QWORD *)&encoding, baseURL);
}

uint64_t REAABBInit()
{
  return MEMORY[0x24BE20030]();
}

uint64_t REAREnvironmentProbeComponentGetComponentType()
{
  return MEMORY[0x24BE20058]();
}

uint64_t REAREnvironmentProbeComponentSetClippingPointLux()
{
  return MEMORY[0x24BE20078]();
}

uint64_t REAREnvironmentProbeComponentSetExtents()
{
  return MEMORY[0x24BE20080]();
}

uint64_t REAREnvironmentProbeComponentSetIdentifier()
{
  return MEMORY[0x24BE20088]();
}

uint64_t REAREnvironmentProbeComponentSetTexture()
{
  return MEMORY[0x24BE20090]();
}

uint64_t REAREnvironmentProbeComponentSetUseAsBackground()
{
  return MEMORY[0x24BE20098]();
}

uint64_t REAcousticMeshComponentGetARMesh()
{
  return MEMORY[0x24BE20268]();
}

uint64_t REAcousticMeshComponentGetComponentType()
{
  return MEMORY[0x24BE20270]();
}

uint64_t REAcousticMeshComponentSetARMesh()
{
  return MEMORY[0x24BE20280]();
}

uint64_t REAcousticMeshComponentSetLastUpdateTimestamp()
{
  return MEMORY[0x24BE20288]();
}

uint64_t REAnchorComponentGetAnchorIdentifier()
{
  return MEMORY[0x24BE202F0]();
}

uint64_t REAnchorComponentGetAnchoredLocally()
{
  return MEMORY[0x24BE202F8]();
}

uint64_t REAnchorComponentGetComponentType()
{
  return MEMORY[0x24BE20300]();
}

uint64_t REAnchorComponentGetIsAnchorExternal()
{
  return MEMORY[0x24BE20308]();
}

uint64_t REAnchorComponentGetRequiresLocalAnchoring()
{
  return MEMORY[0x24BE20310]();
}

uint64_t REAnchorComponentGetSendIsAnchoredToClient()
{
  return MEMORY[0x24BE20318]();
}

uint64_t REAnchorComponentGetWorldTransform()
{
  return MEMORY[0x24BE20320]();
}

uint64_t REAnchorComponentSetAnchorIdentifier()
{
  return MEMORY[0x24BE20328]();
}

uint64_t REAnchorComponentSetAnchoredLocally()
{
  return MEMORY[0x24BE20330]();
}

uint64_t REAnchorComponentSetEnableShadows()
{
  return MEMORY[0x24BE20338]();
}

uint64_t REAnchorComponentSetIsAnchorExternal()
{
  return MEMORY[0x24BE20340]();
}

uint64_t REAnchorComponentSetReceiveIsAnchoredOnClient()
{
  return MEMORY[0x24BE20348]();
}

uint64_t REAnchorComponentSetRequiresLocalAnchoring()
{
  return MEMORY[0x24BE20350]();
}

uint64_t REAnchorComponentSetSendIsAnchoredToClient()
{
  return MEMORY[0x24BE20358]();
}

uint64_t REAnchorComponentSetWorldTransform()
{
  return MEMORY[0x24BE20360]();
}

uint64_t REAnchorShadowMarkerComponentGetComponentType()
{
  return MEMORY[0x24BE20368]();
}

uint64_t REAnchorShadowMarkerSetFloorPlane()
{
  return MEMORY[0x24BE20370]();
}

uint64_t REAnchorShadowMarkerSetPlaneExists()
{
  return MEMORY[0x24BE20378]();
}

uint64_t REAnchorShadowMarkerSetPointAndNormal()
{
  return MEMORY[0x24BE20380]();
}

uint64_t REAnchoringComponentGetComponentType()
{
  return MEMORY[0x24BE20388]();
}

uint64_t REAnchoringComponentGetCoordinateSpaceOfDescriptorTransform()
{
  return MEMORY[0x24BE20390]();
}

uint64_t REAnchoringComponentGetDescriptorAlignment()
{
  return MEMORY[0x24BE20398]();
}

uint64_t REAnchoringComponentGetDescriptorAnchorIdentifier()
{
  return MEMORY[0x24BE203A0]();
}

uint64_t REAnchoringComponentGetDescriptorBounds()
{
  return MEMORY[0x24BE203A8]();
}

uint64_t REAnchoringComponentGetDescriptorCachedAnchorIdentifier()
{
  return MEMORY[0x24BE203B0]();
}

uint64_t REAnchoringComponentGetDescriptorClassification()
{
  return MEMORY[0x24BE203B8]();
}

uint64_t REAnchoringComponentGetDescriptorResourceGroup()
{
  return MEMORY[0x24BE203C8]();
}

uint64_t REAnchoringComponentGetDescriptorResourceName()
{
  return MEMORY[0x24BE203D0]();
}

uint64_t REAnchoringComponentGetDescriptorResourceStyle()
{
  return MEMORY[0x24BE203D8]();
}

uint64_t REAnchoringComponentGetDescriptorTransform()
{
  return MEMORY[0x24BE203E0]();
}

uint64_t REAnchoringComponentGetDescriptorType()
{
  return MEMORY[0x24BE203E8]();
}

uint64_t REAnchoringComponentGetIsDescriptorWorldTransformDirty()
{
  return MEMORY[0x24BE203F0]();
}

uint64_t REAnchoringComponentGetMode()
{
  return MEMORY[0x24BE203F8]();
}

uint64_t REAnchoringComponentGetPreviousWorldTransform()
{
  return MEMORY[0x24BE20400]();
}

uint64_t REAnchoringComponentGetScaleFactor()
{
  return MEMORY[0x24BE20408]();
}

uint64_t REAnchoringComponentGetTrackingImageMTLTexture()
{
  return MEMORY[0x24BE20418]();
}

uint64_t REAnchoringComponentGetTrackingImageWidth()
{
  return MEMORY[0x24BE20420]();
}

uint64_t REAnchoringComponentGetWorldScaleOfDescriptorTransform()
{
  return MEMORY[0x24BE20428]();
}

uint64_t REAnchoringComponentGetWorldTransformOfDescriptorTransform()
{
  return MEMORY[0x24BE20430]();
}

uint64_t REAnchoringComponentInitializeWorldTransformIfNeeded()
{
  return MEMORY[0x24BE20438]();
}

uint64_t REAnchoringComponentInvalidateCachedDescriptorTransform()
{
  return MEMORY[0x24BE20440]();
}

uint64_t REAnchoringComponentSetDescriptorCachedAnchorIdentifier()
{
  return MEMORY[0x24BE20460]();
}

uint64_t REAnchoringComponentSetDescriptorTransform()
{
  return MEMORY[0x24BE20490]();
}

uint64_t REAnchoringComponentUpdateCoordinateSpaceOfDescriptorTransform()
{
  return MEMORY[0x24BE204C8]();
}

uint64_t REAssetGetAssetManager()
{
  return MEMORY[0x24BE20788]();
}

uint64_t REAssetHandleCopyAssetIdentifierString()
{
  return MEMORY[0x24BE207C0]();
}

uint64_t REAssetHandleIsLoaded()
{
  return MEMORY[0x24BE207F8]();
}

uint64_t REAssetHandleLoadAsync()
{
  return MEMORY[0x24BE20800]();
}

uint64_t REAssetHandleLoadNow()
{
  return MEMORY[0x24BE20810]();
}

uint64_t REAssetManagerCollisionMeshAssetCreateFromMesh()
{
  return MEMORY[0x24BE208B8]();
}

uint64_t REAssetManagerCollisionShapeAssetCreateCollisionMesh()
{
  return MEMORY[0x24BE208D0]();
}

uint64_t REAssetManagerCreateAssetHandle()
{
  return MEMORY[0x24BE20920]();
}

uint64_t REAssetManagerGetEngineQueue()
{
  return MEMORY[0x24BE20960]();
}

uint64_t REAssetManagerMaterialMemoryAssetCreate()
{
  return MEMORY[0x24BE209A8]();
}

uint64_t REAssetManagerMeshAssetCreateFromModelsWithOptionsAsyncWithError()
{
  return MEMORY[0x24BE209D0]();
}

uint64_t REAssetManagerTextureMemoryAssetCreateWithMTLTexture()
{
  return MEMORY[0x24BE20A68]();
}

uint64_t REAssetServiceMeshAssetCreateMutable()
{
  return MEMORY[0x24BE20AF8]();
}

uint64_t RECIntrospectionEnumRegister()
{
  return MEMORY[0x24BE21328]();
}

uint64_t RECIntrospectionEnumUnregister()
{
  return MEMORY[0x24BE21330]();
}

uint64_t RECIntrospectionStructRegister()
{
  return MEMORY[0x24BE21340]();
}

uint64_t RECIntrospectionStructUnregister()
{
  return MEMORY[0x24BE21348]();
}

uint64_t RECameraViewDescriptorsComponentGetComponentType()
{
  return MEMORY[0x24BE21390]();
}

uint64_t RECameraViewDescriptorsComponentGetRenderOrder()
{
  return MEMORY[0x24BE21398]();
}

uint64_t REClientAnchorSyncComponentGetAnchorTransform()
{
  return MEMORY[0x24BE214D8]();
}

uint64_t REClientAnchorSyncComponentGetComponentType()
{
  return MEMORY[0x24BE214E0]();
}

uint64_t REClientAnchorSyncComponentIsAnchored()
{
  return MEMORY[0x24BE214E8]();
}

uint64_t REClientAnchorSyncComponentIsExternal()
{
  return MEMORY[0x24BE214F0]();
}

uint64_t REClientAnchorSyncComponentSetAnchorTransform()
{
  return MEMORY[0x24BE214F8]();
}

uint64_t REClientAnchorSyncComponentSetIsAnchored()
{
  return MEMORY[0x24BE21500]();
}

uint64_t REClientAnchorSyncComponentSetIsExternal()
{
  return MEMORY[0x24BE21508]();
}

uint64_t REColliderComponentGetComponentType()
{
  return MEMORY[0x24BE21518]();
}

uint64_t REColliderComponentGetShape()
{
  return MEMORY[0x24BE21538]();
}

uint64_t REColliderComponentSetGroup()
{
  return MEMORY[0x24BE21540]();
}

uint64_t REColliderComponentSetShape()
{
  return MEMORY[0x24BE21558]();
}

uint64_t RECollisionMeshCreateWithFormat()
{
  return MEMORY[0x24BE21600]();
}

uint64_t RECollisionMeshDestroy()
{
  return MEMORY[0x24BE21610]();
}

uint64_t RECollisionShapeAssetGetCollisionShape()
{
  return MEMORY[0x24BE21670]();
}

uint64_t RECollisionShapeGetBoundingBox()
{
  return MEMORY[0x24BE21688]();
}

uint64_t REColorManagerSetAverageAREnvLightIntensity()
{
  return MEMORY[0x24BE216A8]();
}

uint64_t REComponentClassFromType()
{
  return MEMORY[0x24BE216B8]();
}

uint64_t REComponentCreateByClass()
{
  return MEMORY[0x24BE216D8]();
}

uint64_t REComponentGetEntity()
{
  return MEMORY[0x24BE216F8]();
}

uint64_t REComposeMatrix()
{
  return MEMORY[0x24BE21728]();
}

uint64_t RECoordinateSpaceDefinitionComponentGetComponentType()
{
  return MEMORY[0x24BE21818]();
}

uint64_t RECustomComponentGetObject()
{
  return MEMORY[0x24BE218E0]();
}

uint64_t RECustomComponentGetType()
{
  return MEMORY[0x24BE218E8]();
}

uint64_t RECustomComponentTypeCreate()
{
  return MEMORY[0x24BE218F0]();
}

uint64_t RECustomComponentTypeDestroy()
{
  return MEMORY[0x24BE21900]();
}

uint64_t RECustomComponentTypeGetContext()
{
  return MEMORY[0x24BE21908]();
}

uint64_t RECustomMatrixCameraComponentGetComponentType()
{
  return MEMORY[0x24BE21930]();
}

uint64_t REDebugRendererDrawTextAtWorldTransform()
{
  return MEMORY[0x24BE219F8]();
}

uint64_t REECSManagerAddCustomSystem()
{
  return MEMORY[0x24BE21CA8]();
}

uint64_t REECSManagerGetScene()
{
  return MEMORY[0x24BE21CD0]();
}

uint64_t REECSManagerGetServiceLocator()
{
  return MEMORY[0x24BE21CD8]();
}

uint64_t REECSManagerRemoveCustomSystem()
{
  return MEMORY[0x24BE21CE0]();
}

uint64_t REECSManagerSceneCount()
{
  return MEMORY[0x24BE21CF0]();
}

uint64_t REEngineGetEventBus()
{
  return MEMORY[0x24BE21F40]();
}

uint64_t REEntityAddComponentByClass()
{
  return MEMORY[0x24BE22000]();
}

uint64_t REEntityAddExistingComponent()
{
  return MEMORY[0x24BE22018]();
}

uint64_t REEntityCalculateWorldMatrix4x4F()
{
  return MEMORY[0x24BE22028]();
}

uint64_t REEntityComputeMeshBounds()
{
  return MEMORY[0x24BE22050]();
}

uint64_t REEntityCreate()
{
  return MEMORY[0x24BE22068]();
}

uint64_t REEntityGetChild()
{
  return MEMORY[0x24BE22080]();
}

uint64_t REEntityGetChildCount()
{
  return MEMORY[0x24BE22088]();
}

uint64_t REEntityGetComponent()
{
  return MEMORY[0x24BE22098]();
}

uint64_t REEntityGetComponentByClass()
{
  return MEMORY[0x24BE220A8]();
}

uint64_t REEntityGetCustomComponent()
{
  return MEMORY[0x24BE220B8]();
}

uint64_t REEntityGetLocalId()
{
  return MEMORY[0x24BE220C0]();
}

uint64_t REEntityGetName()
{
  return MEMORY[0x24BE220C8]();
}

uint64_t REEntityGetOrAddComponent()
{
  return MEMORY[0x24BE220D0]();
}

uint64_t REEntityGetOrAddComponentByClass()
{
  return MEMORY[0x24BE220D8]();
}

uint64_t REEntityGetParent()
{
  return MEMORY[0x24BE220E8]();
}

uint64_t REEntityGetSceneNullable()
{
  return MEMORY[0x24BE220F8]();
}

uint64_t REEntityGetSelfEnabled()
{
  return MEMORY[0x24BE22100]();
}

uint64_t REEntityIsActive()
{
  return MEMORY[0x24BE22120]();
}

uint64_t REEntityIsAnchored()
{
  return MEMORY[0x24BE22128]();
}

uint64_t REEntityIsEnabledInHierarchy()
{
  return MEMORY[0x24BE22138]();
}

uint64_t REEntityRemoveComponentByClass()
{
  return MEMORY[0x24BE22160]();
}

uint64_t REEntityRemoveCustomComponent()
{
  return MEMORY[0x24BE22168]();
}

uint64_t REEntityRemoveFromSceneOrParent()
{
  return MEMORY[0x24BE22170]();
}

uint64_t REEntitySetName()
{
  return MEMORY[0x24BE22180]();
}

uint64_t REEntitySetParent()
{
  return MEMORY[0x24BE22188]();
}

uint64_t REEntitySetSelfEnabled()
{
  return MEMORY[0x24BE22190]();
}

uint64_t REEntitySubtreeLoadFromAsset()
{
  return MEMORY[0x24BE221A0]();
}

uint64_t REEnumBuilderAddCase()
{
  return MEMORY[0x24BE221D0]();
}

uint64_t REEnumBuilderCreate()
{
  return MEMORY[0x24BE221D8]();
}

uint64_t REEnumBuilderDestroy()
{
  return MEMORY[0x24BE221E0]();
}

uint64_t REEnumBuilderInit()
{
  return MEMORY[0x24BE221E8]();
}

uint64_t REEventBusMakeID()
{
  return MEMORY[0x24BE22208]();
}

uint64_t REEventBusSubscribeBlock()
{
  return MEMORY[0x24BE22218]();
}

uint64_t REEventBusUnsubscribe()
{
  return MEMORY[0x24BE22228]();
}

uint64_t REGeomModelDescriptorAddAttributeVector3F()
{
  return MEMORY[0x24BE22468]();
}

uint64_t REGeomModelDescriptorAddAttributeVector4F()
{
  return MEMORY[0x24BE22470]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeUInt32()
{
  return MEMORY[0x24BE224A8]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeVector3F()
{
  return MEMORY[0x24BE224C0]();
}

uint64_t REGeomModelDescriptorCreate()
{
  return MEMORY[0x24BE224E0]();
}

uint64_t REHideEntity()
{
  return MEMORY[0x24BE22618]();
}

uint64_t REIsEntityHidden()
{
  return MEMORY[0x24BE22898]();
}

uint64_t REMakeSRTFromMatrix()
{
  return MEMORY[0x24BE22988]();
}

uint64_t REMaterialAssetGetTextureAsset()
{
  return MEMORY[0x24BE22B80]();
}

uint64_t REMaterialParameterBlockArrayComponentGetBlockAtIndex()
{
  return MEMORY[0x24BE22CF0]();
}

uint64_t REMaterialParameterBlockArrayComponentGetComponentType()
{
  return MEMORY[0x24BE22D00]();
}

uint64_t REMaterialParameterBlockArrayComponentSetBlockAtIndex()
{
  return MEMORY[0x24BE22D28]();
}

uint64_t REMaterialParameterBlockSetBool()
{
  return MEMORY[0x24BE22D58]();
}

uint64_t REMaterialParameterBlockSetTextureFromAsset()
{
  return MEMORY[0x24BE22D80]();
}

uint64_t REMeshAssetReplaceAllWithModel()
{
  return MEMORY[0x24BE231A8]();
}

uint64_t REMeshAttributesDescriptorCreate()
{
  return MEMORY[0x24BE23248]();
}

uint64_t REMeshComponentAddMaterial()
{
  return MEMORY[0x24BE232E0]();
}

uint64_t REMeshComponentGetComponentType()
{
  return MEMORY[0x24BE23300]();
}

uint64_t REMeshComponentGetMaterialAtIndex()
{
  return MEMORY[0x24BE23308]();
}

uint64_t REMeshComponentGetMaterialCount()
{
  return MEMORY[0x24BE23310]();
}

uint64_t REMeshComponentGetMesh()
{
  return MEMORY[0x24BE23320]();
}

uint64_t REMeshComponentRemoveAllMaterials()
{
  return MEMORY[0x24BE23328]();
}

uint64_t REMeshComponentSetMaterialAtIndex()
{
  return MEMORY[0x24BE23338]();
}

uint64_t REMeshComponentSetMesh()
{
  return MEMORY[0x24BE23348]();
}

uint64_t REMeshDefinitionCreateWithAttributes()
{
  return MEMORY[0x24BE23350]();
}

uint64_t REMeshDefinitionSetAttributeWithData()
{
  return MEMORY[0x24BE23358]();
}

uint64_t REMeshDefinitionSetIndicesWithData()
{
  return MEMORY[0x24BE23378]();
}

uint64_t REMeshModelDefinitionAppendTriangles()
{
  return MEMORY[0x24BE233B0]();
}

uint64_t REMeshModelDefinitionCreate()
{
  return MEMORY[0x24BE233C8]();
}

uint64_t RENetworkComponentDisableSyncForComponent()
{
  return MEMORY[0x24BE23488]();
}

uint64_t RENetworkComponentGetComponentType()
{
  return MEMORY[0x24BE23490]();
}

uint64_t RENetworkComponentIsAuthoritative()
{
  return MEMORY[0x24BE234A0]();
}

uint64_t RENetworkComponentOwnerPeerID()
{
  return MEMORY[0x24BE234B8]();
}

uint64_t RENetworkMarkComponentDirty()
{
  return MEMORY[0x24BE234E8]();
}

uint64_t RENetworkMarkEntityMetadataDirty()
{
  return MEMORY[0x24BE234F0]();
}

uint64_t REPerspectiveCameraComponentGetComponentType()
{
  return MEMORY[0x24BE237A0]();
}

uint64_t REPrimitiveRenderAddContext()
{
  return MEMORY[0x24BE23B18]();
}

uint64_t REPrimitiveRenderAddLine()
{
  return MEMORY[0x24BE23B20]();
}

uint64_t REPrimitiveRenderAddShape()
{
  return MEMORY[0x24BE23B28]();
}

uint64_t REPrimitiveRenderAddStaticMesh()
{
  return MEMORY[0x24BE23B30]();
}

uint64_t REPrimitiveRenderSetLineColor()
{
  return MEMORY[0x24BE23B38]();
}

uint64_t REPrimitiveRenderSetLineWidth()
{
  return MEMORY[0x24BE23B40]();
}

uint64_t REPrimitiveRenderSetMeshMaterial()
{
  return MEMORY[0x24BE23B48]();
}

uint64_t REPrimitiveRenderSetMeshMaterialTechniqueMapping()
{
  return MEMORY[0x24BE23B50]();
}

uint64_t REPrimitiveRenderSetShapeColor()
{
  return MEMORY[0x24BE23B58]();
}

uint64_t REPrimitiveRenderSetShapeMaterial()
{
  return MEMORY[0x24BE23B60]();
}

uint64_t REPrimitiveRenderSetShapeScale()
{
  return MEMORY[0x24BE23B68]();
}

uint64_t REPrimitiveRenderStaticMeshAddStandardAttribute()
{
  return MEMORY[0x24BE23B70]();
}

uint64_t REPrimitiveRenderStaticMeshAddUniformCustomAttributeFloat()
{
  return MEMORY[0x24BE23B78]();
}

uint64_t REPrimitiveRenderStaticMeshAddUniformCustomAttributeFloat3()
{
  return MEMORY[0x24BE23B80]();
}

uint64_t REPrimitiveRenderStaticMeshAddUniformCustomAttributeFloat4()
{
  return MEMORY[0x24BE23B88]();
}

uint64_t REPrimitiveRenderStaticMeshSetAABB()
{
  return MEMORY[0x24BE23B90]();
}

uint64_t REPrimitiveRenderStaticMeshSetIndexCount()
{
  return MEMORY[0x24BE23B98]();
}

uint64_t REPrimitiveRenderStaticMeshSetVertexCount()
{
  return MEMORY[0x24BE23BA0]();
}

uint64_t REProbeClusterExclusionComponentGetComponentType()
{
  return MEMORY[0x24BE23BA8]();
}

uint64_t RERelease()
{
  return MEMORY[0x24BE23EA8]();
}

uint64_t RERenderManagerGetEnableProbeLightingLegacyBlur()
{
  return MEMORY[0x24BE23FF8]();
}

uint64_t RERenderManagerGetProbeManager()
{
  return MEMORY[0x24BE24008]();
}

uint64_t RERenderManagerIsBeingUpdated()
{
  return MEMORY[0x24BE24020]();
}

uint64_t RERenderManagerMaterialParameterBlockCreateWithAsset()
{
  return MEMORY[0x24BE24028]();
}

uint64_t RERenderManagerSetEnableProbeExposureAdjustment()
{
  return MEMORY[0x24BE24038]();
}

uint64_t RERenderManagerSetEnableProbeLightingLegacyBlur()
{
  return MEMORY[0x24BE24040]();
}

uint64_t RERenderManagerSetProbeClampCeil()
{
  return MEMORY[0x24BE24050]();
}

uint64_t RERenderManagerSetProbeClampFloor()
{
  return MEMORY[0x24BE24058]();
}

uint64_t RERenderManagerSetProbeIntensityExpSmoothFactor()
{
  return MEMORY[0x24BE24060]();
}

uint64_t RERenderManagerSetProbeIntensityScale()
{
  return MEMORY[0x24BE24068]();
}

uint64_t RERetain()
{
  return MEMORY[0x24BE240A0]();
}

uint64_t RERigidBodyComponentGetComponentType()
{
  return MEMORY[0x24BE24128]();
}

uint64_t RERigidBodyComponentSetMotionType()
{
  return MEMORY[0x24BE24208]();
}

uint64_t RESRTMatrix()
{
  return MEMORY[0x24BE24250]();
}

uint64_t RESceneAddEntity()
{
  return MEMORY[0x24BE24270]();
}

uint64_t RESceneAddRenderGraphFileProviderArray()
{
  return MEMORY[0x24BE24278]();
}

uint64_t RESceneGetComponentsOfClass()
{
  return MEMORY[0x24BE242F8]();
}

uint64_t RESceneGetComponentsOfCustomType()
{
  return MEMORY[0x24BE24300]();
}

uint64_t RESceneGetECSManagerNullable()
{
  return MEMORY[0x24BE24310]();
}

uint64_t RESceneGetEntitiesArray()
{
  return MEMORY[0x24BE24318]();
}

uint64_t RESceneGetEventBus()
{
  return MEMORY[0x24BE24328]();
}

uint64_t RESceneGetUniqueName()
{
  return MEMORY[0x24BE24348]();
}

uint64_t RESceneImportOperationCreateWithURL()
{
  return MEMORY[0x24BE24378]();
}

uint64_t RESceneImportOperationGetSceneAsset()
{
  return MEMORY[0x24BE24380]();
}

uint64_t RESceneImportOperationPublishToEngine()
{
  return MEMORY[0x24BE243A8]();
}

uint64_t RESceneImportOperationRun()
{
  return MEMORY[0x24BE243B0]();
}

uint64_t RESceneImportOperationSetCompressTextures()
{
  return MEMORY[0x24BE243B8]();
}

uint64_t RESceneImportOperationSetIsolateFromEngine()
{
  return MEMORY[0x24BE243D0]();
}

uint64_t RESceneImportOperationSetUnitType()
{
  return MEMORY[0x24BE24408]();
}

uint64_t RESceneRemoveEntity()
{
  return MEMORY[0x24BE24430]();
}

uint64_t RESceneRenderGraphFileProviderArrayAdd()
{
  return MEMORY[0x24BE24438]();
}

uint64_t RESceneRenderGraphFileProviderArrayRemove()
{
  return MEMORY[0x24BE24440]();
}

uint64_t RESceneUnderstandingComponentGetComponentType()
{
  return MEMORY[0x24BE24488]();
}

uint64_t RESceneUnderstandingComponentGetIdentifierPtr()
{
  return MEMORY[0x24BE24490]();
}

uint64_t RESceneUnderstandingComponentGetSourceType()
{
  return MEMORY[0x24BE24498]();
}

uint64_t RESceneUnderstandingComponentIsEntityType()
{
  return MEMORY[0x24BE244A0]();
}

uint64_t RESceneUnderstandingComponentSetEntityType()
{
  return MEMORY[0x24BE244A8]();
}

uint64_t RESceneUnderstandingComponentSetIdentifier()
{
  return MEMORY[0x24BE244B0]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentGetComponentType()
{
  return MEMORY[0x24BE244B8]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentIsShadowEnabled()
{
  return MEMORY[0x24BE244C0]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentSetDepthFeatheringEnabled()
{
  return MEMORY[0x24BE244C8]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentSetOcclusionEnabled()
{
  return MEMORY[0x24BE244D0]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentSetPhysicsEnabled()
{
  return MEMORY[0x24BE244D8]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentSetShadowEnabled()
{
  return MEMORY[0x24BE244E0]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentSetWireframeEnabled()
{
  return MEMORY[0x24BE244E8]();
}

uint64_t RESceneUnderstandingRootComponentGetComponentType()
{
  return MEMORY[0x24BE244F0]();
}

uint64_t RESceneUnderstandingRootComponentSetUpdateId()
{
  return MEMORY[0x24BE244F8]();
}

uint64_t RESceneUnderstandingServiceIsDepthFeatheringEnabled()
{
  return MEMORY[0x24BE24500]();
}

uint64_t RESceneUnderstandingServiceSetDepthFeatheringEnabled()
{
  return MEMORY[0x24BE24508]();
}

uint64_t REServiceLocatorGetAssetManager()
{
  return MEMORY[0x24BE24530]();
}

uint64_t REServiceLocatorGetColorManager()
{
  return MEMORY[0x24BE24548]();
}

uint64_t REServiceLocatorGetECSService()
{
  return MEMORY[0x24BE24558]();
}

uint64_t REServiceLocatorGetEngine()
{
  return MEMORY[0x24BE24560]();
}

uint64_t REServiceLocatorGetRenderManager()
{
  return MEMORY[0x24BE24598]();
}

uint64_t REServiceLocatorGetSceneUnderstandingService()
{
  return MEMORY[0x24BE245A8]();
}

uint64_t REServiceLocatorGetShadowService()
{
  return MEMORY[0x24BE245B0]();
}

uint64_t REShadowClusterRootComponentGetClusterBound()
{
  return MEMORY[0x24BE245D8]();
}

uint64_t REShadowManagerClearShadowClusterRootUpdateHandler()
{
  return MEMORY[0x24BE245E0]();
}

uint64_t REShadowManagerGetShadowEnabled()
{
  return MEMORY[0x24BE245E8]();
}

uint64_t REShadowManagerGetShadowPatchFlatteningEnabled()
{
  return MEMORY[0x24BE245F0]();
}

uint64_t REShadowManagerSetShadowClusterRootUpdateHandler()
{
  return MEMORY[0x24BE245F8]();
}

uint64_t REStructBuilderAddMemberCStyleArrayDataTypeWithTag()
{
  return MEMORY[0x24BE24BF0]();
}

uint64_t REStructBuilderAddMemberDataTypeWithTag()
{
  return MEMORY[0x24BE24BF8]();
}

uint64_t REStructBuilderAddMemberEnumWithTag()
{
  return MEMORY[0x24BE24C00]();
}

uint64_t REStructBuilderCreate()
{
  return MEMORY[0x24BE24C08]();
}

uint64_t REStructBuilderDestroy()
{
  return MEMORY[0x24BE24C10]();
}

uint64_t REStructBuilderInit()
{
  return MEMORY[0x24BE24C18]();
}

uint64_t RESubsceneComponentGetComponentType()
{
  return MEMORY[0x24BE24C20]();
}

uint64_t RETextureAssetCopyToDestination()
{
  return MEMORY[0x24BE24C88]();
}

uint64_t RETextureImportOperationCopyTextureDescriptor()
{
  return MEMORY[0x24BE24DB0]();
}

uint64_t RETextureImportOperationCreateAsset()
{
  return MEMORY[0x24BE24DC0]();
}

uint64_t RETextureImportOperationCreateWithData()
{
  return MEMORY[0x24BE24DE8]();
}

uint64_t RETextureImportOperationSetMipmapMode()
{
  return MEMORY[0x24BE24E40]();
}

uint64_t RETransformComponentGetComponentType()
{
  return MEMORY[0x24BE25690]();
}

uint64_t RETransformComponentGetLocalSRT()
{
  return MEMORY[0x24BE256A0]();
}

uint64_t RETransformComponentGetWorldMatrix4x4F()
{
  return MEMORY[0x24BE256C0]();
}

uint64_t RETransformComponentGetWorldPose()
{
  return MEMORY[0x24BE256D0]();
}

uint64_t RETransformComponentGetWorldPosition()
{
  return MEMORY[0x24BE256D8]();
}

uint64_t RETransformComponentSetLocalSRT()
{
  return MEMORY[0x24BE25700]();
}

uint64_t RETransformComponentSetWorldMatrix4x4F()
{
  return MEMORY[0x24BE25720]();
}

uint64_t RETransformComponentSetWorldSRT()
{
  return MEMORY[0x24BE25730]();
}

uint64_t REVFXSceneComponentAddCollisionPlane()
{
  return MEMORY[0x24BE25E40]();
}

uint64_t REVFXSceneComponentGetComponentType()
{
  return MEMORY[0x24BE25E50]();
}

uint64_t REVFXSceneComponentNeedCollisionPlanes()
{
  return MEMORY[0x24BE25F00]();
}

uint64_t REVFXSceneComponentRemoveCollisionPlane()
{
  return MEMORY[0x24BE25F08]();
}

uint64_t REVFXSceneComponentUpdateCollisionPlane()
{
  return MEMORY[0x24BE25FF0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA00](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__extension(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA08](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA18](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__stem(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA40](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

void std::string::~string(std::string *this)
{
  MEMORY[0x24BEDACF0](this);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  return (std::bad_cast *)MEMORY[0x24BEDB648](this);
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
  MEMORY[0x24BEDB658](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24EFD6DA8(__p);
}

uint64_t operator delete()
{
  return off_24EFD6DB0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24EFD6DB8(__sz);
}

uint64_t operator new()
{
  return off_24EFD6DC0();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x24BEDB920](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x24BDAC828]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDACB58]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x24BDAD2A0](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
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

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x24BDAE950]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

int raise(int a1)
{
  return MEMORY[0x24BDAFA30](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x24BDB0300](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x24BDB0318](out);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x24BDB0320](out);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

