double SUIAExpandNormalizedRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double MinX;
  double v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  MinX = CGRectGetMinX(*(CGRect *)&a1);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  v11 = a5 * CGRectGetMaxX(v13) + (1.0 - a5) * MinX;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  CGRectGetMinY(v14);
  v15.origin.x = a1;
  v15.origin.y = a2;
  v15.size.width = a3;
  v15.size.height = a4;
  CGRectGetMaxY(v15);
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  CGRectGetWidth(v16);
  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a3;
  v17.size.height = a4;
  CGRectGetHeight(v17);
  return v11;
}

double SUIAExpandNormalizedPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double MinX;
  double v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  MinX = CGRectGetMinX(*(CGRect *)&a1);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  v11 = a5 * CGRectGetMaxX(v13) + (1.0 - a5) * MinX;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  CGRectGetMinY(v14);
  v15.origin.x = a1;
  v15.origin.y = a2;
  v15.size.width = a3;
  v15.size.height = a4;
  CGRectGetMaxY(v15);
  return v11;
}

double SUIAConvertDampingRatioAndResponseToTensionAndFriction(double *a1, double *a2, double result, double a4)
{
  double v4;
  double v5;

  v4 = 6.28318531 / a4 * (6.28318531 / a4);
  if (a1)
    *a1 = v4;
  if (a2)
  {
    v5 = sqrt(v4);
    result = (v5 + v5) * result;
    *a2 = result;
  }
  return result;
}

double SUIAConvertTensionAndFrictionToDampingRatioAndResponse(double *a1, double *a2, double a3, double a4)
{
  double result;

  result = sqrt(a3);
  if (a1)
    *a1 = a4 / (result + result);
  if (a2)
  {
    result = 6.28318531 / result;
    *a2 = result;
  }
  return result;
}

double SUIAConvertMassStiffnessAndDampingToDampingRatioAndResponse(double *a1, double *a2, double result, double a4, double a5)
{
  double v5;

  v5 = sqrt(a4 / result);
  if (a1)
  {
    result = a5 / result / (v5 + v5);
    *a1 = result;
  }
  if (a2)
  {
    result = 6.28318531 / v5;
    *a2 = 6.28318531 / v5;
  }
  return result;
}

const __CFString *SUIAStringFromShockwaveState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Initial Offscreen");
  else
    return off_251945328[a1 - 1];
}

const __CFString *SUIAStringFromShockwaveConfigurationType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Root View");
  else
    return off_251945350[a1 - 1];
}

double SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, CGFloat a13, CGFloat a14, CGFloat a15, CGFloat a16)
{
  uint64_t v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double Width;
  double v31;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v25 = SUIAScreenEdgeForNormalizedButtonRect();
  v26 = a4;
  UIRectGetCenter();
  SUIAExpandNormalizedPoint(a13, a14, a15, a16, v27);
  BSRectCenteredAboutPoint();
  v29 = v28;
  switch(v25)
  {
    case 1:
    case 4:
      v35.origin.x = a1;
      v35.origin.y = a2;
      v35.size.width = a3;
      v35.size.height = v26;
      CGRectGetHeight(v35);
      break;
    case 2:
      v34.origin.x = a1;
      v34.origin.y = a2;
      v34.size.width = a3;
      v34.size.height = v26;
      Width = CGRectGetWidth(v34);
      v31 = -0.5;
      goto LABEL_6;
    case 8:
      v36.origin.x = a1;
      v36.origin.y = a2;
      v36.size.width = a3;
      v36.size.height = v26;
      Width = CGRectGetWidth(v36);
      v31 = 0.5;
LABEL_6:
      v29 = v29 + Width * v31 * a5;
      break;
    default:
      v29 = *MEMORY[0x24BDBF090];
      break;
  }
  return v29;
}

uint64_t SUIAScreenEdgeForNormalizedButtonRect()
{
  if (BSFloatIsZero() && (BSFloatIsZero() & 1) != 0)
    return 2;
  if (BSFloatIsOne() && (BSFloatIsZero() & 1) != 0)
    return 8;
  if (BSFloatIsZero() && (BSFloatIsZero() & 1) != 0)
    return 1;
  if (!BSFloatIsOne())
    return 0;
  if (BSFloatIsZero())
    return 4;
  return 0;
}

double SUIACATransform3DFromNominalRightEdgeToEdge@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGFloat v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CATransform3D v15;

  v3 = (_OWORD *)MEMORY[0x24BDE5598];
  v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  a2[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  a2[5] = v4;
  v5 = v3[7];
  a2[6] = v3[6];
  a2[7] = v5;
  v6 = v3[1];
  *a2 = *v3;
  a2[1] = v6;
  v7 = v3[2];
  v8 = v3[3];
  a2[2] = v7;
  a2[3] = v8;
  switch(a1)
  {
    case 4:
      v9 = 1.57079633;
      goto LABEL_7;
    case 2:
      v9 = 3.14159265;
      goto LABEL_7;
    case 1:
      v9 = -1.57079633;
LABEL_7:
      CATransform3DMakeRotation(&v15, v9, 0.0, 0.0, 1.0);
      v10 = *(_OWORD *)&v15.m33;
      a2[4] = *(_OWORD *)&v15.m31;
      a2[5] = v10;
      v11 = *(_OWORD *)&v15.m43;
      a2[6] = *(_OWORD *)&v15.m41;
      a2[7] = v11;
      v12 = *(_OWORD *)&v15.m13;
      *a2 = *(_OWORD *)&v15.m11;
      a2[1] = v12;
      *(CGFloat *)&v7 = v15.m21;
      v13 = *(_OWORD *)&v15.m23;
      a2[2] = *(_OWORD *)&v15.m21;
      a2[3] = v13;
      break;
  }
  return *(double *)&v7;
}

double SUIANormalizedRectSpanningRectEdge(uint64_t a1)
{
  double result;

  result = *MEMORY[0x24BDBF090];
  if ((unint64_t)(a1 - 1) <= 7 && ((0x8Bu >> (a1 - 1)) & 1) != 0)
    return 0.0;
  return result;
}

const __CFString *SUIAStringFromAnimationUpdateMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unspecified");
  else
    return off_2519454A0[a1 - 1];
}

id _SUIAModifyFrameRateForAnimationBlockFromSettings(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  _QWORD aBlock[4];
  id v18;
  float v19;
  float v20;
  float v21;
  int v22;
  CAFrameRateRange v23;

  v3 = a1;
  v4 = a2;
  v5 = _Block_copy(v3);
  objc_msgSend(v4, "frameRateRange");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "preferredFrameRateRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "highFrameRateReason");
  v23.minimum = v7;
  v23.maximum = v9;
  v23.preferred = v11;
  if (!CAFrameRateRangeIsEqualToRange(v23, *MEMORY[0x24BDE5430]))
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = ___SUIAModifyFrameRateForAnimationBlockFromSettings_block_invoke;
    aBlock[3] = &unk_251945408;
    v19 = v7;
    v20 = v9;
    v21 = v11;
    v22 = v13;
    v18 = v3;
    v14 = _Block_copy(aBlock);

    v5 = v14;
  }
  v15 = _Block_copy(v5);

  return v15;
}

id SUIACompletionBlockC2ToBS(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _QWORD aBlock[4];
  id v6;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __SUIACompletionBlockC2ToBS_block_invoke;
    aBlock[3] = &unk_251945378;
    v6 = v1;
    v3 = _Block_copy(aBlock);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id SUIACompletionBlockBSToC2(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _QWORD aBlock[4];
  id v6;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __SUIACompletionBlockBSToC2_block_invoke;
    aBlock[3] = &unk_2519453A0;
    v6 = v1;
    v3 = _Block_copy(aBlock);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id SUIAnimationKitPrototypeSettings.shockwaveSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAnimationKitPrototypeSettings_shockwaveSettings);
  swift_beginAccess();
  return *v1;
}

void SUIAnimationKitPrototypeSettings.shockwaveSettings.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___SUIAnimationKitPrototypeSettings_shockwaveSettings);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

id sub_247C84714@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shockwaveSettings);
  *a2 = result;
  return result;
}

id sub_247C8474C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShockwaveSettings_, *a1);
}

Swift::Void __swiftcall SUIAnimationKitPrototypeSettings.setDefaultValues()()
{
  void *v0;
  id v1;
  objc_super v2;

  v2.super_class = (Class)SUIAnimationKitPrototypeSettings;
  objc_msgSendSuper2(&v2, sel_setDefaultValues);
  v1 = objc_msgSend(v0, sel_shockwaveSettings);
  objc_msgSend(v1, sel_setDefaultValues);

}

_QWORD *sub_247C84870@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_247C84880(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void _sSo32SUIAnimationKitPrototypeSettingsC017SystemUIAnimationB0E24settingsControllerModuleSo8PTModuleCSgyFZ_0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0830);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_247CA2B60;
  v1 = (void *)sub_247C9FDA8();
  v2 = (void *)sub_247C9FDA8();
  v3 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_childSettingsKeyPath_, v1, v2);

  if (v3)
  {
    v4 = (void *)objc_opt_self();
    *(_QWORD *)(v0 + 56) = sub_247C84B94(0, &qword_2576F0838);
    *(_QWORD *)(v0 + 32) = v3;
    v5 = (void *)sub_247C9FDFC();
    swift_bridgeObjectRelease();
    v6 = (void *)sub_247C9FDA8();
    v7 = objc_msgSend(v4, sel_sectionWithRows_title_, v5, v6);

    if (v7)
    {
      v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_247CA2B60;
      *(_QWORD *)(v8 + 56) = sub_247C84B94(0, &qword_2576F0840);
      *(_QWORD *)(v8 + 32) = v7;
      v9 = v7;
      v10 = (void *)sub_247C9FDA8();
      v11 = (void *)sub_247C9FDFC();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_moduleWithTitle_contents_, v10, v11);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

char *keypath_get_selector_shockwaveSettings()
{
  return sel_shockwaveSettings;
}

uint64_t type metadata accessor for SUIAnimationKitPrototypeSettings(uint64_t a1)
{
  return sub_247C84B94(a1, &qword_2576F0818);
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_247C84B10(a1, &qword_2576F0820);
}

void type metadata accessor for FluidBehaviorType(uint64_t a1)
{
  sub_247C84B10(a1, &qword_2576F0828);
}

void sub_247C84B10(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249590080]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_247C84B94(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

id static SUIAnimationKitPrototypeSettingsDomain.rootSettings()()
{
  id result;
  objc_super v1;

  v1.receiver = (id)swift_getObjCClassFromMetadata();
  v1.super_class = (Class)&OBJC_METACLASS___SUIAnimationKitPrototypeSettingsDomain;
  result = objc_msgSendSuper2(&v1, sel_rootSettings);
  if (result)
  {
    objc_opt_self();
    return (id)swift_dynamicCastObjCClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static SUIAnimationKitPrototypeSettingsDomain.domainGroupName()()
{
  return 0x55206D6574737953;
}

unint64_t static SUIAnimationKitPrototypeSettingsDomain.domainName()()
{
  return 0xD000000000000017;
}

uint64_t static SUIAnimationKitPrototypeSettingsDomain.rootSettingsClass()()
{
  return type metadata accessor for SUIAnimationKitPrototypeSettings(0);
}

unint64_t type metadata accessor for SUIAnimationKitPrototypeSettingsDomain()
{
  unint64_t result;

  result = qword_2576F0870;
  if (!qword_2576F0870)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2576F0870);
  }
  return result;
}

uint64_t SUIAFluidBehaviorSettings.behaviorType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_behaviorType;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SUIAFluidBehaviorSettings.behaviorType.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_behaviorType);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAFluidBehaviorSettings.name.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_name);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SUIAFluidBehaviorSettings.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___SUIAFluidBehaviorSettings_name);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_247C8506C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_name);
  if (v3)
  {
    v4 = v3;
    v5 = sub_247C9FDB4();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_247C850D0(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_247C9FDA8();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setName_);

}

double SUIAFluidBehaviorSettings.dampingRatio.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatio;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.dampingRatio.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatio);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAFluidBehaviorSettings.response.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_response;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.response.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_response);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAFluidBehaviorSettings.retargetImpulse.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_retargetImpulse;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.retargetImpulse.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_retargetImpulse);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAFluidBehaviorSettings.trackingDampingRatio.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatio;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.trackingDampingRatio.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatio);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAFluidBehaviorSettings.trackingResponse.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponse;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.trackingResponse.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponse);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAFluidBehaviorSettings.trackingRetargetImpulse.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingRetargetImpulse;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.trackingRetargetImpulse.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingRetargetImpulse);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAFluidBehaviorSettings.smoothingAndProjectionEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_smoothingAndProjectionEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAFluidBehaviorSettings.smoothingAndProjectionEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_smoothingAndProjectionEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAFluidBehaviorSettings.dampingRatioSmoothing.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatioSmoothing;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.dampingRatioSmoothing.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_dampingRatioSmoothing);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAFluidBehaviorSettings.responseSmoothing.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_responseSmoothing;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.responseSmoothing.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_responseSmoothing);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAFluidBehaviorSettings.trackingDampingRatioSmoothing.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatioSmoothing;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.trackingDampingRatioSmoothing.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingDampingRatioSmoothing);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAFluidBehaviorSettings.trackingResponseSmoothing.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponseSmoothing;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.trackingResponseSmoothing.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_trackingResponseSmoothing);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAFluidBehaviorSettings.inertialTargetSmoothingRatio.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialTargetSmoothingRatio;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.inertialTargetSmoothingRatio.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialTargetSmoothingRatio);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAFluidBehaviorSettings.inertialProjectionDeceleration.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialProjectionDeceleration;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAFluidBehaviorSettings.inertialProjectionDeceleration.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_inertialProjectionDeceleration);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

void *SUIAFluidBehaviorSettings.preferredFrameRateRange.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___SUIAFluidBehaviorSettings_preferredFrameRateRange);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void SUIAFluidBehaviorSettings.preferredFrameRateRange.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___SUIAFluidBehaviorSettings_preferredFrameRateRange);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

Swift::Void __swiftcall SUIAFluidBehaviorSettings.setDefaultValues()()
{
  void *v0;
  objc_super v1;

  v1.super_class = (Class)SUIAFluidBehaviorSettings;
  objc_msgSendSuper2(&v1, sel_setDefaultValues);
  objc_msgSend(v0, sel_setBehaviorType_, 0);
  objc_msgSend(v0, sel_setDampingRatio_, 0.845);
  objc_msgSend(v0, sel_setResponse_, 0.531);
  objc_msgSend(v0, sel_setTrackingDampingRatio_, 0.86);
  objc_msgSend(v0, sel_setTrackingResponse_, 0.15);
  objc_msgSend(v0, sel_setRetargetImpulse_, 0.0);
  objc_msgSend(v0, sel_setTrackingRetargetImpulse_, 0.0);
  objc_msgSend(v0, sel_setDampingRatioSmoothing_, 0.0);
  objc_msgSend(v0, sel_setResponseSmoothing_, 0.0);
  objc_msgSend(v0, sel_setTrackingDampingRatioSmoothing_, 0.0);
  objc_msgSend(v0, sel_setTrackingResponseSmoothing_, 0.0);
  objc_msgSend(v0, sel_setSmoothingAndProjectionEnabled_, 0);
}

Swift::Void __swiftcall SUIAFluidBehaviorSettings.setDefaultCriticallyDampedValues()()
{
  void *v0;

  objc_msgSend(v0, sel_setDefaultValues);
  objc_msgSend(v0, sel_setDampingRatio_, 1.0);
  objc_msgSend(v0, sel_setResponse_, 0.336);
}

double SUIAFluidBehaviorSettings.parametersForTransition(from:to:)@<D0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  void *v3;
  id v6;
  char **v7;
  double v8;
  id v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  char **v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double result;
  double v38;

  if (a2 == 1)
  {
    v6 = objc_msgSend(v3, sel_behaviorType);
    v7 = &selRef_dampingRatio;
    if (v6)
      v7 = &selRef_trackingDampingRatio;
    objc_msgSend(v3, *v7);
    v38 = v8;
    v9 = objc_msgSend(v3, sel_behaviorType);
    v10 = &selRef_response;
    if (v9)
      v10 = &selRef_trackingResponse;
    objc_msgSend(v3, *v10);
    v12 = v11;
    v13 = objc_msgSend(v3, sel_behaviorType);
    v14 = &selRef_retargetImpulse;
    if (v13)
      v14 = &selRef_trackingRetargetImpulse;
    objc_msgSend(v3, *v14);
    v16 = v15;
    v17 = 0.0;
    if (objc_msgSend(v3, sel_smoothingAndProjectionEnabled))
    {
      objc_msgSend(v3, sel_trackingDampingRatioSmoothing);
      v19 = v18;
      objc_msgSend(v3, sel_trackingResponseSmoothing);
      v21 = v20;
      if (a1)
      {
        v22 = 0;
        v23 = 0;
        v24 = 0;
      }
      else
      {
        objc_msgSend(v3, sel_dampingRatio);
        v24 = v35;
        objc_msgSend(v3, sel_response);
        v23 = v36;
        v22 = 1;
      }
    }
    else
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v19 = 0;
      v21 = 0;
    }
    goto LABEL_19;
  }
  objc_msgSend(v3, sel_dampingRatio);
  v38 = v25;
  objc_msgSend(v3, sel_response);
  v12 = v26;
  objc_msgSend(v3, sel_retargetImpulse);
  v16 = v27;
  v23 = 0;
  if (!objc_msgSend(v3, sel_smoothingAndProjectionEnabled))
  {
    v22 = 0;
    v24 = 0;
    v19 = 0;
    v21 = 0;
LABEL_17:
    v17 = 0.0;
LABEL_19:
    v31 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v3, sel_dampingRatioSmoothing);
  v19 = v28;
  objc_msgSend(v3, sel_responseSmoothing);
  v21 = v29;
  if (a1 != 1)
  {
    v22 = 0;
    v24 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v3, sel_inertialProjectionDeceleration);
  v31 = v30;
  objc_msgSend(v3, sel_inertialTargetSmoothingRatio);
  v33 = v32;
  objc_msgSend(v3, sel_trackingResponse);
  v22 = 0;
  v17 = v33 * v34;
  v24 = 0;
LABEL_20:
  result = v38;
  *(double *)a3 = v38;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = v22;
  *(_BYTE *)(a3 + 17) = v22;
  *(_QWORD *)(a3 + 24) = v24;
  *(_QWORD *)(a3 + 32) = v23;
  *(_QWORD *)(a3 + 40) = v19;
  *(_QWORD *)(a3 + 48) = v21;
  *(double *)(a3 + 56) = v17;
  *(_QWORD *)(a3 + 64) = v31;
  *(_QWORD *)(a3 + 72) = v16;
  return result;
}

id SUIAFluidBehaviorSettings.bsAnimationSettings()()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v5;
  double v6[2];

  v6[1] = *(double *)MEMORY[0x24BDAC8D0];
  v5 = 0.0;
  v6[0] = 0.0;
  objc_msgSend(v0, sel_dampingRatio);
  v2 = v1;
  objc_msgSend(v0, sel_response);
  SUIAConvertDampingRatioAndResponseToTensionAndFriction(v6, &v5, v2, v3);
  return objc_msgSend((id)objc_opt_self(), sel_settingsWithMass_stiffness_damping_, 1.0, v6[0], v5);
}

Swift::Void __swiftcall SUIAFluidBehaviorSettings.setFrameRateRange(_:highFrameRateReason:)(CAFrameRateRange _, Swift::UInt32 highFrameRateReason)
{
  void *v2;
  uint64_t v3;
  float preferred;
  float maximum;
  float minimum;
  id v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v3 = *(_QWORD *)&highFrameRateReason;
  preferred = _.preferred;
  maximum = _.maximum;
  minimum = _.minimum;
  v7 = objc_msgSend(v2, sel_preferredFrameRateRange);
  if (v7)
  {
    v11 = v7;
    *(float *)&v8 = minimum;
    *(float *)&v9 = maximum;
    *(float *)&v10 = preferred;
    objc_msgSend(v7, sel_setFrameRateRange_highFrameRateReason_, v3, v8, v9, v10);

  }
  else
  {
    __break(1u);
  }
}

CAFrameRateRange __swiftcall SUIAFluidBehaviorSettings.frameRateRange()()
{
  void *v0;
  id v1;
  float v2;
  float v3;
  float v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  CAFrameRateRange result;

  v1 = objc_msgSend(v0, sel_preferredFrameRateRange);
  if (v1)
  {
    v5 = v1;
    objc_msgSend(v1, sel_frameRateRange);
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v2 = v7;
    v3 = v9;
    v4 = v11;
  }
  else
  {
    __break(1u);
  }
  result.preferred = v4;
  result.maximum = v3;
  result.minimum = v2;
  return result;
}

id static SUIAFluidBehaviorSettings.settingsControllerModule()()
{
  void *ObjCClassFromMetadata;
  void *v1;
  id v2;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v1 = (void *)sub_247C9FDA8();
  v2 = objc_msgSend(ObjCClassFromMetadata, sel__moduleWithSectionTitle_, v1);

  return v2;
}

uint64_t SUIAFluidBehaviorSettings.description.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  objc_super v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F08F8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_247CA2C50;
  v18.receiver = v0;
  v18.super_class = (Class)SUIAFluidBehaviorSettings;
  v3 = objc_msgSendSuper2(&v18, sel_description);
  v4 = sub_247C9FDB4();
  v6 = v5;

  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = v6;
  v17[1] = 0xE000000000000000;
  sub_247C9FEA4();
  sub_247C9FDD8();
  objc_msgSend(v1, sel_behaviorType);
  type metadata accessor for FluidBehaviorType(0);
  sub_247C9FEF8();
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = v17[1];
  v17[0] = 0x203A656D616ELL;
  v17[1] = 0xE600000000000000;
  v7 = objc_msgSend(v1, sel_name);
  if (v7)
  {
    v8 = v7;
    sub_247C9FDB4();

  }
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 64) = v17[0];
  *(_QWORD *)(v2 + 72) = v17[1];
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  strcpy((char *)v17, "dampingRatio: ");
  HIBYTE(v17[1]) = -18;
  objc_msgSend(v1, sel_dampingRatio);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  v9 = v17[1];
  *(_QWORD *)(v2 + 80) = v17[0];
  *(_QWORD *)(v2 + 88) = v9;
  strcpy((char *)v17, "response: ");
  BYTE3(v17[1]) = 0;
  HIDWORD(v17[1]) = -369098752;
  objc_msgSend(v1, sel_response);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  v10 = v17[1];
  *(_QWORD *)(v2 + 96) = v17[0];
  *(_QWORD *)(v2 + 104) = v10;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_retargetImpulse);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 112) = 0xD000000000000011;
  *(_QWORD *)(v2 + 120) = 0x8000000247CA3AF0;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_trackingDampingRatio);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 128) = 0xD000000000000016;
  *(_QWORD *)(v2 + 136) = 0x8000000247CA3B10;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_trackingResponse);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 144) = 0xD000000000000012;
  *(_QWORD *)(v2 + 152) = 0x8000000247CA3B30;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_trackingRetargetImpulse);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 160) = 0xD000000000000019;
  *(_QWORD *)(v2 + 168) = 0x8000000247CA3B50;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_smoothingAndProjectionEnabled);
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 176) = 0xD00000000000001FLL;
  *(_QWORD *)(v2 + 184) = 0x8000000247CA3B70;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_dampingRatioSmoothing);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 192) = 0xD000000000000017;
  *(_QWORD *)(v2 + 200) = 0x8000000247CA3B90;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_responseSmoothing);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 208) = 0xD000000000000013;
  *(_QWORD *)(v2 + 216) = 0x8000000247CA3BB0;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_trackingDampingRatioSmoothing);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 224) = 0xD00000000000001FLL;
  *(_QWORD *)(v2 + 232) = 0x8000000247CA3BD0;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_trackingResponseSmoothing);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 240) = 0xD00000000000001BLL;
  *(_QWORD *)(v2 + 248) = 0x8000000247CA3BF0;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_inertialTargetSmoothingRatio);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 256) = 0xD00000000000001ELL;
  *(_QWORD *)(v2 + 264) = 0x8000000247CA3C10;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_inertialProjectionDeceleration);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 272) = 0xD000000000000020;
  *(_QWORD *)(v2 + 280) = 0x8000000247CA3C30;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  v17[0] = 0xD000000000000019;
  v17[1] = 0x8000000247CA3C60;
  v11 = objc_msgSend(v1, sel_preferredFrameRateRange);
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(v11, sel_description);

    sub_247C9FDB4();
  }
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  v14 = v17[1];
  *(_QWORD *)(v2 + 288) = v17[0];
  *(_QWORD *)(v2 + 296) = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0900);
  sub_247C8952C();
  v15 = sub_247C9FD9C();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t SUIAFluidBehaviorSettings.copy()@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t result;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone((Class)SUIAFluidBehaviorSettings), sel_init);
  objc_msgSend(v4, sel_setBehaviorType_, objc_msgSend(v2, sel_behaviorType));
  v5 = objc_msgSend(v2, sel_name);
  objc_msgSend(v4, sel_setName_, v5);

  objc_msgSend(v2, sel_dampingRatio);
  objc_msgSend(v4, sel_setDampingRatio_);
  objc_msgSend(v2, sel_response);
  objc_msgSend(v4, sel_setResponse_);
  objc_msgSend(v2, sel_retargetImpulse);
  objc_msgSend(v4, sel_setRetargetImpulse_);
  objc_msgSend(v2, sel_trackingDampingRatio);
  objc_msgSend(v4, sel_setTrackingDampingRatio_);
  objc_msgSend(v2, sel_trackingResponse);
  objc_msgSend(v4, sel_setTrackingResponse_);
  objc_msgSend(v2, sel_trackingRetargetImpulse);
  objc_msgSend(v4, sel_setTrackingRetargetImpulse_);
  objc_msgSend(v4, sel_setSmoothingAndProjectionEnabled_, objc_msgSend(v2, sel_smoothingAndProjectionEnabled));
  objc_msgSend(v2, sel_dampingRatioSmoothing);
  objc_msgSend(v4, sel_setDampingRatioSmoothing_);
  objc_msgSend(v2, sel_responseSmoothing);
  objc_msgSend(v4, sel_setResponseSmoothing_);
  objc_msgSend(v2, sel_trackingDampingRatioSmoothing);
  objc_msgSend(v4, sel_setTrackingDampingRatioSmoothing_);
  objc_msgSend(v2, sel_trackingResponseSmoothing);
  objc_msgSend(v4, sel_setTrackingResponseSmoothing_);
  objc_msgSend(v2, sel_inertialTargetSmoothingRatio);
  objc_msgSend(v4, sel_setInertialTargetSmoothingRatio_);
  objc_msgSend(v2, sel_inertialProjectionDeceleration);
  objc_msgSend(v4, sel_setInertialProjectionDeceleration_);
  v6 = objc_msgSend(v2, sel_preferredFrameRateRange);
  objc_msgSend(v4, sel_setPreferredFrameRateRange_, v6);

  result = type metadata accessor for SUIAFluidBehaviorSettings(v7);
  a1[3] = result;
  *a1 = v4;
  return result;
}

BOOL SUIAFluidBehaviorSettings.isEqual(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unsigned int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  void *v53;
  unsigned int v54;
  id v55;
  void *v56;
  unsigned int v57;
  id v58;
  void *v59;
  unsigned int v60;
  id v61;
  void *v62;
  unsigned int v63;
  id v64;
  void *v65;
  unsigned int v66;
  id v67;
  void *v68;
  unsigned int v69;
  id v70;
  void *v71;
  unsigned int v72;
  _BOOL8 v73;
  id v75;
  void *v76;
  unsigned int v77;
  void *v79;
  _BYTE v80[24];
  uint64_t v81;

  v2 = sub_247C895D0(a1, (uint64_t)v80);
  if (!v81)
  {
    sub_247C89618((uint64_t)v80);
    return 0;
  }
  type metadata accessor for SUIAFluidBehaviorSettings(v2);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v3 = objc_msgSend(v1, sel_behaviorType);
  if (v3 != objc_msgSend(v79, sel_behaviorType))
    goto LABEL_57;
  v4 = objc_msgSend(v1, sel_name);
  if (v4)
  {
    v5 = v4;
    v6 = sub_247C9FDB4();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = objc_msgSend(v79, sel_name);
  if (!v9)
  {
    if (!v8)
      goto LABEL_19;
    goto LABEL_17;
  }
  v10 = v9;
  v11 = sub_247C9FDB4();
  v13 = v12;

  if (!v8)
  {
    if (!v13)
      goto LABEL_19;
    goto LABEL_17;
  }
  if (!v13)
  {
LABEL_17:

    swift_bridgeObjectRelease();
    return 0;
  }
  if (v6 == v11 && v8 == v13)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = sub_247C9FF34();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
      goto LABEL_57;
  }
LABEL_19:
  objc_msgSend(v1, sel_dampingRatio);
  v16 = v15;
  objc_msgSend(v79, sel_dampingRatio);
  if (v16 != v17)
    goto LABEL_57;
  objc_msgSend(v1, sel_response);
  v19 = v18;
  objc_msgSend(v79, sel_response);
  if (v19 != v20)
    goto LABEL_57;
  objc_msgSend(v1, sel_retargetImpulse);
  v22 = v21;
  objc_msgSend(v79, sel_retargetImpulse);
  if (v22 != v23)
    goto LABEL_57;
  objc_msgSend(v1, sel_trackingDampingRatio);
  v25 = v24;
  objc_msgSend(v79, sel_trackingDampingRatio);
  if (v25 != v26)
    goto LABEL_57;
  objc_msgSend(v1, sel_trackingResponse);
  v28 = v27;
  objc_msgSend(v79, sel_trackingResponse);
  if (v28 != v29)
    goto LABEL_57;
  objc_msgSend(v1, sel_trackingRetargetImpulse);
  v31 = v30;
  objc_msgSend(v79, sel_trackingRetargetImpulse);
  if (v31 != v32)
    goto LABEL_57;
  v33 = objc_msgSend(v1, sel_smoothingAndProjectionEnabled);
  if (v33 != objc_msgSend(v79, sel_smoothingAndProjectionEnabled))
    goto LABEL_57;
  objc_msgSend(v1, sel_dampingRatioSmoothing);
  v35 = v34;
  objc_msgSend(v79, sel_dampingRatioSmoothing);
  if (v35 != v36)
    goto LABEL_57;
  objc_msgSend(v1, sel_responseSmoothing);
  v38 = v37;
  objc_msgSend(v79, sel_responseSmoothing);
  if (v38 != v39)
    goto LABEL_57;
  objc_msgSend(v1, sel_trackingDampingRatioSmoothing);
  v41 = v40;
  objc_msgSend(v79, sel_trackingDampingRatioSmoothing);
  if (v41 != v42)
    goto LABEL_57;
  objc_msgSend(v1, sel_trackingResponseSmoothing);
  v44 = v43;
  objc_msgSend(v79, sel_trackingResponseSmoothing);
  if (v44 != v45)
    goto LABEL_57;
  objc_msgSend(v1, sel_inertialTargetSmoothingRatio);
  v47 = v46;
  objc_msgSend(v79, sel_inertialTargetSmoothingRatio);
  if (v47 != v48)
    goto LABEL_57;
  objc_msgSend(v1, sel_inertialProjectionDeceleration);
  v50 = v49;
  objc_msgSend(v79, sel_inertialProjectionDeceleration);
  if (v50 != v51)
    goto LABEL_57;
  v52 = objc_msgSend(v1, sel_preferredFrameRateRange);
  v53 = v52;
  if (v52)
  {
    v54 = objc_msgSend(v52, sel_highFrameRateReason);

  }
  else
  {
    v54 = 0;
  }
  v55 = objc_msgSend(v79, sel_preferredFrameRateRange);
  if (v55)
  {
    v56 = v55;
    v57 = objc_msgSend(v55, sel_highFrameRateReason);

    if (!v53 || v54 != v57)
      goto LABEL_57;
  }
  else if (v53)
  {
    goto LABEL_57;
  }
  v58 = objc_msgSend(v1, sel_preferredFrameRateRange);
  v59 = v58;
  if (v58)
  {
    v60 = objc_msgSend(v58, sel_minimum);

  }
  else
  {
    v60 = 0;
  }
  v61 = objc_msgSend(v79, sel_preferredFrameRateRange);
  if (v61)
  {
    v62 = v61;
    v63 = objc_msgSend(v61, sel_minimum);

    if (!v59 || v60 != v63)
      goto LABEL_57;
  }
  else if (v59)
  {
    goto LABEL_57;
  }
  v64 = objc_msgSend(v1, sel_preferredFrameRateRange);
  v65 = v64;
  if (v64)
  {
    v66 = objc_msgSend(v64, sel_maximum);

  }
  else
  {
    v66 = 0;
  }
  v67 = objc_msgSend(v79, sel_preferredFrameRateRange);
  if (v67)
  {
    v68 = v67;
    v69 = objc_msgSend(v67, sel_maximum);

    if (v65 && v66 == v69)
      goto LABEL_54;
LABEL_57:

    return 0;
  }
  if (v65)
    goto LABEL_57;
LABEL_54:
  v70 = objc_msgSend(v1, sel_preferredFrameRateRange);
  v71 = v70;
  if (v70)
  {
    v72 = objc_msgSend(v70, sel_preferred);

  }
  else
  {
    v72 = 0;
  }
  v75 = objc_msgSend(v79, sel_preferredFrameRateRange);
  v76 = v75;
  v73 = v75 == 0;
  if (v75)
  {
    v77 = objc_msgSend(v75, sel_preferred);

  }
  else
  {
    v77 = 0;
  }

  if (v71)
    return v76 && v72 == v77;
  return v73;
}

void SUIAFluidBehaviorSettings.hash.getter()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE28]), sel_init);
  v2 = objc_msgSend(v1, sel_appendInteger_, objc_msgSend(v0, sel_behaviorType));

  if (!v2)
  {
    __break(1u);
    goto LABEL_22;
  }
  v3 = objc_msgSend(v0, sel_name);
  v4 = objc_msgSend(v2, sel_appendString_, v3);

  if (!v4)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  objc_msgSend(v0, sel_dampingRatio);
  v5 = objc_msgSend(v4, sel_appendCGFloat_);

  if (!v5)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  objc_msgSend(v0, sel_response);
  v6 = objc_msgSend(v5, sel_appendCGFloat_);

  if (!v6)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  objc_msgSend(v0, sel_retargetImpulse);
  v7 = objc_msgSend(v6, sel_appendCGFloat_);

  if (!v7)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  objc_msgSend(v0, sel_trackingDampingRatio);
  v8 = objc_msgSend(v7, sel_appendCGFloat_);

  if (!v8)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  objc_msgSend(v0, sel_trackingResponse);
  v9 = objc_msgSend(v8, sel_appendCGFloat_);

  if (!v9)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  objc_msgSend(v0, sel_trackingRetargetImpulse);
  v10 = objc_msgSend(v9, sel_appendCGFloat_);

  if (!v10)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v11 = objc_msgSend(v10, sel_appendBool_, objc_msgSend(v0, sel_smoothingAndProjectionEnabled));

  if (!v11)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  objc_msgSend(v0, sel_dampingRatioSmoothing);
  v12 = objc_msgSend(v11, sel_appendCGFloat_);

  if (!v12)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  objc_msgSend(v0, sel_responseSmoothing);
  v13 = objc_msgSend(v12, sel_appendCGFloat_);

  if (!v13)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  objc_msgSend(v0, sel_trackingDampingRatioSmoothing);
  v14 = objc_msgSend(v13, sel_appendCGFloat_);

  if (!v14)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  objc_msgSend(v0, sel_trackingResponseSmoothing);
  v15 = objc_msgSend(v14, sel_appendCGFloat_);

  if (!v15)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  objc_msgSend(v0, sel_inertialTargetSmoothingRatio);
  v16 = objc_msgSend(v15, sel_appendCGFloat_);

  if (!v16)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  objc_msgSend(v0, sel_inertialProjectionDeceleration);
  v17 = objc_msgSend(v16, sel_appendCGFloat_);

  if (!v17)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v18 = objc_msgSend(v0, sel_preferredFrameRateRange);
  v19 = objc_msgSend(v17, sel_appendObject_, v18);

  if (!v19)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v20 = objc_msgSend(v0, sel_preferredFrameRateRange);
  v21 = objc_msgSend(v19, sel_appendObject_, v20);

  if (!v21)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v22 = objc_msgSend(v0, sel_preferredFrameRateRange);
  v23 = objc_msgSend(v21, sel_appendObject_, v22);

  if (!v23)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v24 = objc_msgSend(v0, sel_preferredFrameRateRange);
  v25 = objc_msgSend(v23, sel_appendObject_, v24);

  if (v25)
  {
    objc_msgSend(v25, sel_hash);

    return;
  }
LABEL_39:
  __break(1u);
}

char *sub_247C88150(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0830);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void _sSo25SUIAFluidBehaviorSettingsC20SystemUIAnimationKitE7_module16withSectionTitleSo8PTModuleCSgSSSg_tFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  unint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  void *v70;
  id v71;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  unint64_t v79;
  unint64_t v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  unint64_t v86;
  unint64_t v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  unint64_t v93;
  unint64_t v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  unint64_t v100;
  unint64_t v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  unint64_t v107;
  unint64_t v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  id v113;
  unint64_t v114;
  unint64_t v115;
  void *v116;
  void *v117;
  id v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  __int128 v132;
  uint64_t v133;

  sub_247C84B94(0, &qword_2576F0980);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0988);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_247CA2C60;
  v1 = MEMORY[0x24BEE1768];
  v2 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 96) = v1;
  *(_QWORD *)(v0 + 104) = v2;
  *(_QWORD *)(v0 + 72) = 1;
  v3 = (void *)sub_247C9FE5C();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247CA2B60;
  *(_QWORD *)(v4 + 56) = v1;
  *(_QWORD *)(v4 + 64) = v2;
  *(_QWORD *)(v4 + 32) = 1;
  v130 = (void *)sub_247C9FE5C();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247CA2B60;
  *(_QWORD *)(v5 + 56) = v1;
  *(_QWORD *)(v5 + 64) = v2;
  *(_QWORD *)(v5 + 32) = 1;
  v129 = (void *)sub_247C9FE5C();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_247CA2B60;
  *(_QWORD *)(v6 + 56) = v1;
  *(_QWORD *)(v6 + 64) = v2;
  *(_QWORD *)(v6 + 32) = 1;
  v7 = sub_247C9FE5C();
  v8 = (void *)sub_247C9FDA8();
  v9 = (void *)sub_247C9FDA8();
  v10 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_valueKeyPath_, v8, v9);

  if (!v10)
  {
    __break(1u);
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  v133 = sub_247C84B94(0, &qword_2576F0990);
  *(_QWORD *)&v132 = v10;
  v11 = sub_247C88150(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v13 = *((_QWORD *)v11 + 2);
  v12 = *((_QWORD *)v11 + 3);
  if (v13 >= v12 >> 1)
    v11 = sub_247C88150((char *)(v12 > 1), v13 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v13 + 1;
  sub_247C89B68(&v132, &v11[32 * v13 + 32]);
  v14 = (void *)sub_247C9FDA8();
  v15 = (void *)sub_247C9FDA8();
  v16 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_valueKeyPath_, v14, v15);

  if (!v16)
    goto LABEL_53;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0830);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_247CA2C60;
  *(_QWORD *)(v17 + 32) = 0;
  *(_QWORD *)(v17 + 88) = v1;
  *(_QWORD *)(v17 + 56) = v1;
  *(_QWORD *)(v17 + 64) = 1;
  v18 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_247CA2C60;
  v20 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v19 + 32) = 0x676E69727053;
  *(_QWORD *)(v19 + 40) = 0xE600000000000000;
  *(_QWORD *)(v19 + 88) = v20;
  *(_QWORD *)(v19 + 56) = v20;
  *(_QWORD *)(v19 + 64) = 0xD000000000000012;
  *(_QWORD *)(v19 + 72) = 0x8000000247CA4210;
  v21 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v16, sel_possibleValues_titles_, v18, v21);

  if (!v22)
  {
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  v24 = *((_QWORD *)v11 + 2);
  v23 = *((_QWORD *)v11 + 3);
  if (v24 >= v23 >> 1)
    v11 = sub_247C88150((char *)(v23 > 1), v24 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v24 + 1;
  sub_247C89B68(&v132, &v11[32 * v24 + 32]);
  v25 = (void *)sub_247C9FDA8();
  v26 = (void *)sub_247C9FDA8();
  v27 = (void *)objc_opt_self();
  v28 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v25, v26);

  if (!v28)
    goto LABEL_55;
  v29 = v3;
  v30 = sub_247C9CA78(3, 0, v3);

  v31 = sub_247C84B94(0, (unint64_t *)&qword_2576F0998);
  v133 = v31;
  *(_QWORD *)&v132 = v30;
  v33 = *((_QWORD *)v11 + 2);
  v32 = *((_QWORD *)v11 + 3);
  v128 = (void *)v7;
  if (v33 >= v32 >> 1)
    v11 = sub_247C88150((char *)(v32 > 1), v33 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v33 + 1;
  sub_247C89B68(&v132, &v11[32 * v33 + 32]);
  v34 = (void *)sub_247C9FDA8();
  v35 = (void *)sub_247C9FDA8();
  v36 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v34, v35);

  if (!v36)
    goto LABEL_56;
  v37 = v29;
  v38 = sub_247C9CA78(3, 0, v3);

  v133 = v31;
  *(_QWORD *)&v132 = v38;
  v40 = *((_QWORD *)v11 + 2);
  v39 = *((_QWORD *)v11 + 3);
  if (v40 >= v39 >> 1)
    v11 = sub_247C88150((char *)(v39 > 1), v40 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v40 + 1;
  sub_247C89B68(&v132, &v11[32 * v40 + 32]);
  v41 = (void *)sub_247C9FDA8();
  v42 = (void *)sub_247C9FDA8();
  v43 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v41, v42);

  if (!v43)
    goto LABEL_57;
  v44 = v37;
  v45 = sub_247C9CA78(3, 0, v3);

  v133 = v31;
  *(_QWORD *)&v132 = v45;
  v47 = *((_QWORD *)v11 + 2);
  v46 = *((_QWORD *)v11 + 3);
  if (v47 >= v46 >> 1)
    v11 = sub_247C88150((char *)(v46 > 1), v47 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v47 + 1;
  sub_247C89B68(&v132, &v11[32 * v47 + 32]);
  v48 = (void *)sub_247C9FDA8();
  v49 = (void *)sub_247C9FDA8();
  v50 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v48, v49);

  if (!v50)
    goto LABEL_58;
  v51 = v130;
  v52 = sub_247C9CA78(3, 0, v130);

  v133 = v31;
  *(_QWORD *)&v132 = v52;
  v54 = *((_QWORD *)v11 + 2);
  v53 = *((_QWORD *)v11 + 3);
  if (v54 >= v53 >> 1)
    v11 = sub_247C88150((char *)(v53 > 1), v54 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v54 + 1;
  sub_247C89B68(&v132, &v11[32 * v54 + 32]);
  v55 = (void *)sub_247C9FDA8();
  v56 = (void *)sub_247C9FDA8();
  v57 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v55, v56);

  if (!v57)
    goto LABEL_59;
  v58 = v51;
  v59 = sub_247C9CA78(3, 0, v130);

  v133 = v31;
  *(_QWORD *)&v132 = v59;
  v61 = *((_QWORD *)v11 + 2);
  v60 = *((_QWORD *)v11 + 3);
  v127 = v58;
  if (v61 >= v60 >> 1)
    v11 = sub_247C88150((char *)(v60 > 1), v61 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v61 + 1;
  sub_247C89B68(&v132, &v11[32 * v61 + 32]);
  v62 = (void *)sub_247C9FDA8();
  v63 = (void *)sub_247C9FDA8();
  v64 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v62, v63);

  if (!v64)
    goto LABEL_60;
  v65 = v44;
  v66 = sub_247C9CA78(3, 0, v3);

  v133 = v31;
  *(_QWORD *)&v132 = v66;
  v68 = *((_QWORD *)v11 + 2);
  v67 = *((_QWORD *)v11 + 3);
  if (v68 >= v67 >> 1)
    v11 = sub_247C88150((char *)(v67 > 1), v68 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v68 + 1;
  sub_247C89B68(&v132, &v11[32 * v68 + 32]);
  v69 = (void *)sub_247C9FDA8();
  v70 = (void *)sub_247C9FDA8();
  v71 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_valueKeyPath_, v69, v70);

  if (!v71)
    goto LABEL_61;
  v133 = sub_247C84B94(0, &qword_2576F09A0);
  *(_QWORD *)&v132 = v71;
  v73 = *((_QWORD *)v11 + 2);
  v72 = *((_QWORD *)v11 + 3);
  if (v73 >= v72 >> 1)
    v11 = sub_247C88150((char *)(v72 > 1), v73 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v73 + 1;
  sub_247C89B68(&v132, &v11[32 * v73 + 32]);
  v74 = (void *)sub_247C9FDA8();
  v75 = (void *)sub_247C9FDA8();
  v76 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v74, v75);

  if (!v76)
    goto LABEL_62;
  v77 = v129;
  v78 = sub_247C9CA78(3, 0, v129);

  v133 = v31;
  *(_QWORD *)&v132 = v78;
  v80 = *((_QWORD *)v11 + 2);
  v79 = *((_QWORD *)v11 + 3);
  v131 = v65;
  if (v80 >= v79 >> 1)
    v11 = sub_247C88150((char *)(v79 > 1), v80 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v80 + 1;
  sub_247C89B68(&v132, &v11[32 * v80 + 32]);
  v81 = (void *)sub_247C9FDA8();
  v82 = (void *)sub_247C9FDA8();
  v83 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v81, v82);

  if (!v83)
    goto LABEL_63;
  v84 = v77;
  v85 = sub_247C9CA78(3, 0, v129);

  v133 = v31;
  *(_QWORD *)&v132 = v85;
  v87 = *((_QWORD *)v11 + 2);
  v86 = *((_QWORD *)v11 + 3);
  if (v87 >= v86 >> 1)
    v11 = sub_247C88150((char *)(v86 > 1), v87 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v87 + 1;
  sub_247C89B68(&v132, &v11[32 * v87 + 32]);
  v88 = (void *)sub_247C9FDA8();
  v89 = (void *)sub_247C9FDA8();
  v90 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v88, v89);

  if (!v90)
    goto LABEL_64;
  v91 = v128;
  v92 = sub_247C9CA78(3, 0, v128);

  v133 = v31;
  *(_QWORD *)&v132 = v92;
  v94 = *((_QWORD *)v11 + 2);
  v93 = *((_QWORD *)v11 + 3);
  if (v94 >= v93 >> 1)
    v11 = sub_247C88150((char *)(v93 > 1), v94 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v94 + 1;
  sub_247C89B68(&v132, &v11[32 * v94 + 32]);
  v95 = (void *)sub_247C9FDA8();
  v96 = (void *)sub_247C9FDA8();
  v97 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v95, v96);

  if (!v97)
    goto LABEL_65;
  v98 = v91;
  v99 = sub_247C9CA78(3, 0, v128);

  v133 = v31;
  *(_QWORD *)&v132 = v99;
  v101 = *((_QWORD *)v11 + 2);
  v100 = *((_QWORD *)v11 + 3);
  if (v101 >= v100 >> 1)
    v11 = sub_247C88150((char *)(v100 > 1), v101 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v101 + 1;
  sub_247C89B68(&v132, &v11[32 * v101 + 32]);
  v102 = (void *)sub_247C9FDA8();
  v103 = (void *)sub_247C9FDA8();
  v104 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v102, v103);

  if (!v104)
    goto LABEL_66;
  v105 = v98;
  v106 = sub_247C9CA78(3, 0, v128);

  v133 = v31;
  *(_QWORD *)&v132 = v106;
  v108 = *((_QWORD *)v11 + 2);
  v107 = *((_QWORD *)v11 + 3);
  if (v108 >= v107 >> 1)
    v11 = sub_247C88150((char *)(v107 > 1), v108 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v108 + 1;
  sub_247C89B68(&v132, &v11[32 * v108 + 32]);
  v109 = (void *)sub_247C9FDA8();
  v110 = (void *)sub_247C9FDA8();
  v111 = objc_msgSend(v27, sel_rowWithTitle_valueKeyPath_, v109, v110);

  if (!v111)
    goto LABEL_67;
  v112 = v105;
  v113 = sub_247C9CA78(7, 0, v128);

  v133 = v31;
  *(_QWORD *)&v132 = v113;
  v115 = *((_QWORD *)v11 + 2);
  v114 = *((_QWORD *)v11 + 3);
  if (v115 >= v114 >> 1)
    v11 = sub_247C88150((char *)(v114 > 1), v115 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v115 + 1;
  sub_247C89B68(&v132, &v11[32 * v115 + 32]);
  v116 = (void *)sub_247C9FDA8();
  v117 = (void *)sub_247C9FDA8();
  v118 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_childSettingsKeyPath_, v116, v117);

  if (!v118)
    goto LABEL_68;
  v133 = sub_247C84B94(0, &qword_2576F0838);
  *(_QWORD *)&v132 = v118;
  v120 = *((_QWORD *)v11 + 2);
  v119 = *((_QWORD *)v11 + 3);
  if (v120 >= v119 >> 1)
    v11 = sub_247C88150((char *)(v119 > 1), v120 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v120 + 1;
  sub_247C89B68(&v132, &v11[32 * v120 + 32]);
  v121 = swift_allocObject();
  *(_OWORD *)(v121 + 16) = xmmword_247CA2B60;
  swift_bridgeObjectRetain();
  v122 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v123 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v124 = (void *)sub_247C9FDA8();
  swift_bridgeObjectRelease();
  v125 = objc_msgSend(v123, sel_sectionWithRows_title_, v122, v124);

  if (v125)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v121 + 56) = sub_247C84B94(0, &qword_2576F0840);
    *(_QWORD *)(v121 + 32) = v125;
    v126 = (void *)sub_247C9FDFC();
    swift_bridgeObjectRelease();
    objc_msgSend(v123, sel_moduleWithTitle_contents_, 0, v126);

    return;
  }
LABEL_69:
  __break(1u);
}

unint64_t sub_247C8952C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576F0908;
  if (!qword_2576F0908)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576F0900);
    result = MEMORY[0x249590098](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2576F0908);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24959008C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for SUIAFluidBehaviorSettings(uint64_t a1)
{
  return sub_247C84B94(a1, &qword_2576F0978);
}

uint64_t sub_247C895D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247C89618(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0910);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *keypath_get_selector_behaviorType()
{
  return sel_behaviorType;
}

id sub_247C89664@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_behaviorType);
  *a2 = result;
  return result;
}

id sub_247C89694(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBehaviorType_, *a1);
}

char *keypath_get_selector_name()
{
  return sel_name;
}

char *keypath_get_selector_dampingRatio()
{
  return sel_dampingRatio;
}

id sub_247C896C8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_dampingRatio);
  *a2 = v4;
  return result;
}

id sub_247C896F8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDampingRatio_, *a1);
}

char *keypath_get_selector_response()
{
  return sel_response;
}

id sub_247C89718@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_response);
  *a2 = v4;
  return result;
}

id sub_247C89748(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setResponse_, *a1);
}

char *keypath_get_selector_retargetImpulse()
{
  return sel_retargetImpulse;
}

id sub_247C89768@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_retargetImpulse);
  *a2 = v4;
  return result;
}

id sub_247C89798(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRetargetImpulse_, *a1);
}

char *keypath_get_selector_trackingDampingRatio()
{
  return sel_trackingDampingRatio;
}

id sub_247C897B8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_trackingDampingRatio);
  *a2 = v4;
  return result;
}

id sub_247C897E8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackingDampingRatio_, *a1);
}

char *keypath_get_selector_trackingResponse()
{
  return sel_trackingResponse;
}

id sub_247C89808@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_trackingResponse);
  *a2 = v4;
  return result;
}

id sub_247C89838(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackingResponse_, *a1);
}

char *keypath_get_selector_trackingRetargetImpulse()
{
  return sel_trackingRetargetImpulse;
}

id sub_247C89858@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_trackingRetargetImpulse);
  *a2 = v4;
  return result;
}

id sub_247C89888(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackingRetargetImpulse_, *a1);
}

char *keypath_get_selector_smoothingAndProjectionEnabled()
{
  return sel_smoothingAndProjectionEnabled;
}

id sub_247C898A8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_smoothingAndProjectionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C898D8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSmoothingAndProjectionEnabled_, *a1);
}

char *keypath_get_selector_dampingRatioSmoothing()
{
  return sel_dampingRatioSmoothing;
}

id sub_247C898F8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_dampingRatioSmoothing);
  *a2 = v4;
  return result;
}

id sub_247C89928(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDampingRatioSmoothing_, *a1);
}

char *keypath_get_selector_responseSmoothing()
{
  return sel_responseSmoothing;
}

id sub_247C89948@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_responseSmoothing);
  *a2 = v4;
  return result;
}

id sub_247C89978(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setResponseSmoothing_, *a1);
}

char *keypath_get_selector_trackingDampingRatioSmoothing()
{
  return sel_trackingDampingRatioSmoothing;
}

id sub_247C89998@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_trackingDampingRatioSmoothing);
  *a2 = v4;
  return result;
}

id sub_247C899C8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackingDampingRatioSmoothing_, *a1);
}

char *keypath_get_selector_trackingResponseSmoothing()
{
  return sel_trackingResponseSmoothing;
}

id sub_247C899E8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_trackingResponseSmoothing);
  *a2 = v4;
  return result;
}

id sub_247C89A18(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackingResponseSmoothing_, *a1);
}

char *keypath_get_selector_inertialTargetSmoothingRatio()
{
  return sel_inertialTargetSmoothingRatio;
}

id sub_247C89A38@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_inertialTargetSmoothingRatio);
  *a2 = v4;
  return result;
}

id sub_247C89A68(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInertialTargetSmoothingRatio_, *a1);
}

char *keypath_get_selector_inertialProjectionDeceleration()
{
  return sel_inertialProjectionDeceleration;
}

id sub_247C89A88@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_inertialProjectionDeceleration);
  *a2 = v4;
  return result;
}

id sub_247C89AB8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInertialProjectionDeceleration_, *a1);
}

char *keypath_get_selector_preferredFrameRateRange()
{
  return sel_preferredFrameRateRange;
}

id sub_247C89AD8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_preferredFrameRateRange);
  *a2 = result;
  return result;
}

id sub_247C89B10(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPreferredFrameRateRange_, *a1);
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_OWORD *sub_247C89B68(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id sub_247C89B7C(uint64_t a1)
{
  char *v1;
  char *v3;
  id result;
  uint64_t v5;
  BOOL v6;
  char *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for ShockwaveIntelligenceSystemLightView();
  objc_msgSendSuper2(&v10, sel_didAddSubview_, a1);
  v3 = &v1[OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView];
  result = (id)swift_beginAccess();
  v5 = *(_QWORD *)v3;
  if (v5)
    v6 = v5 == a1;
  else
    v6 = 0;
  if (!v6)
  {
    v7 = &v1[OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView];
    result = (id)swift_beginAccess();
    v8 = *(_QWORD *)v7;
    if (!*(_QWORD *)v7 || v8 != a1)
    {
      if (v5)
      {
        result = objc_msgSend(v1, sel_bringSubviewToFront_, v5);
        v8 = *(_QWORD *)v7;
      }
      if (v8)
        return objc_msgSend(v1, sel_bringSubviewToFront_);
    }
  }
  return result;
}

void *sub_247C89CB0()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_247C89D10(void *a1)
{
  sub_247C8A068(a1, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView, (void (*)(void *))sub_247C89D24);
}

id sub_247C89D24(void *a1)
{
  char *v1;
  char *v2;
  void **v4;
  id result;
  void *v6;
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  char *v11;
  id v12;
  char *v13;

  v2 = v1;
  v4 = (void **)&v2[OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView];
  result = (id)swift_beginAccess();
  v6 = *v4;
  if (!a1)
  {
    if (!v6)
      return result;
LABEL_12:
    objc_msgSend(v2, sel_addSubview_);
    if (*v4)
      objc_msgSend(v2, sel_bringSubviewToFront_);
LABEL_14:
    v13 = &v2[OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView];
    result = (id)swift_beginAccess();
    if (*(_QWORD *)v13)
      return objc_msgSend(v2, sel_bringSubviewToFront_);
    return result;
  }
  if (v6)
    v7 = a1 == v6;
  else
    v7 = 0;
  if (!v7)
  {
    v8 = a1;
    v9 = objc_msgSend(v8, sel_superview);
    if (v9)
    {
      v10 = v9;
      sub_247C8A6F4();
      v11 = v2;
      v12 = v10;
      LOBYTE(v10) = sub_247C9FE8C();

      if ((v10 & 1) != 0)
        objc_msgSend(v8, sel_removeFromSuperview);
    }

    if (!*v4)
      goto LABEL_14;
    goto LABEL_12;
  }
  return result;
}

void (*sub_247C89E7C(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  void *v6;
  id v7;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (void **)(v1 + v4);
  swift_beginAccess();
  v6 = *v5;
  v3[3] = *v5;
  v7 = v6;
  return sub_247C89EF0;
}

void sub_247C89EF0(uint64_t a1, char a2)
{
  sub_247C8A32C(a1, a2, (void (*)(void *))sub_247C89D24);
}

id sub_247C89F08(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id *v3;

  v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *sub_247C89F4C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

uint64_t type metadata accessor for ShockwaveIntelligenceSystemLightView()
{
  return objc_opt_self();
}

void sub_247C89FCC(char *a1, uint64_t a2, void *a3, _QWORD *a4, void (*a5)(void *))
{
  void **v8;
  void *v9;
  id v10;
  char *v11;

  v8 = (void **)&a1[*a4];
  swift_beginAccess();
  v9 = *v8;
  *v8 = a3;
  v10 = a3;
  v11 = a1;
  a5(v9);

}

void sub_247C8A054(void *a1)
{
  sub_247C8A068(a1, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView, (void (*)(void *))sub_247C8A158);
}

void sub_247C8A068(void *a1, _QWORD *a2, void (*a3)(void *))
{
  uint64_t v3;
  void **v6;
  void *v7;
  id v8;

  v6 = (void **)(v3 + *a2);
  swift_beginAccess();
  v7 = *v6;
  *v6 = a1;
  v8 = a1;
  a3(v7);

}

void sub_247C8A0DC(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5, void (*a6)(void *))
{
  void *v7;
  void **v8;
  void *v9;
  id v10;

  v7 = *a1;
  v8 = (void **)(*a2 + *a5);
  swift_beginAccess();
  v9 = *v8;
  *v8 = v7;
  v10 = v7;
  a6(v9);

}

id sub_247C8A158(void *a1)
{
  char *v1;
  char *v2;
  void **v4;
  id result;
  void *v6;
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  char *v11;
  id v12;
  char *v13;

  v2 = v1;
  v4 = (void **)&v2[OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView];
  result = (id)swift_beginAccess();
  v6 = *v4;
  if (!a1)
  {
    if (!v6)
      return result;
LABEL_12:
    objc_msgSend(v2, sel_addSubview_);
    goto LABEL_13;
  }
  if (v6)
    v7 = a1 == v6;
  else
    v7 = 0;
  if (v7)
    return result;
  v8 = a1;
  v9 = objc_msgSend(v8, sel_superview);
  if (v9)
  {
    v10 = v9;
    sub_247C8A6F4();
    v11 = v2;
    v12 = v10;
    LOBYTE(v10) = sub_247C9FE8C();

    if ((v10 & 1) != 0)
      objc_msgSend(v8, sel_removeFromSuperview);
  }

  if (*v4)
    goto LABEL_12;
LABEL_13:
  v13 = &v2[OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView];
  result = (id)swift_beginAccess();
  if (*(_QWORD *)v13)
    result = objc_msgSend(v2, sel_bringSubviewToFront_);
  if (*v4)
    return objc_msgSend(v2, sel_bringSubviewToFront_);
  return result;
}

void (*sub_247C8A2AC(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  void *v6;
  id v7;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (void **)(v1 + v4);
  swift_beginAccess();
  v6 = *v5;
  v3[3] = *v5;
  v7 = v6;
  return sub_247C8A320;
}

void sub_247C8A320(uint64_t a1, char a2)
{
  sub_247C8A32C(a1, a2, (void (*)(void *))sub_247C8A158);
}

void sub_247C8A32C(uint64_t a1, char a2, void (*a3)(void *))
{
  void *v4;
  void *v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v4 = *(void **)a1;
  v6 = (void **)(*(_QWORD *)a1 + 24);
  v5 = *v6;
  v8 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v9 = *(void **)(v8 + v7);
  *(_QWORD *)(v8 + v7) = *v6;
  if ((a2 & 1) != 0)
  {
    v10 = v5;
    a3(v9);

    v9 = *v6;
  }
  else
  {
    v11 = v5;
    a3(v9);

  }
  free(v4);
}

id ShockwaveIntelligenceSystemLightView.__allocating_init(frame:preferringAudioReactivity:)(char a1, double a2, double a3, double a4, double a5)
{
  objc_class *v5;

  return objc_msgSend(objc_allocWithZone(v5), sel_initWithFrame_preferringAudioReactivity_, a1 & 1, a2, a3, a4, a5);
}

id ShockwaveIntelligenceSystemLightView.init(frame:preferringAudioReactivity:)(char a1, double a2, double a3, double a4, double a5)
{
  char *v5;
  objc_super v12;

  *(_QWORD *)&v5[OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView] = 0;
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for ShockwaveIntelligenceSystemLightView();
  return objc_msgSendSuper2(&v12, sel_initWithFrame_preferringAudioReactivity_, a1 & 1, a2, a3, a4, a5);
}

id ShockwaveIntelligenceSystemLightView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShockwaveIntelligenceSystemLightView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_247C8A55C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView, a2);
}

void sub_247C8A568(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_247C8A0DC(a1, a2, a3, a4, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView, (void (*)(void *))sub_247C89D24);
}

id sub_247C8A58C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView, a2);
}

id keypath_getTm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, void **a3@<X8>)
{
  void **v4;
  void *v5;

  v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_247C8A5E4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_247C8A0DC(a1, a2, a3, a4, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView, (void (*)(void *))sub_247C8A158);
}

uint64_t method lookup function for ShockwaveIntelligenceSystemLightView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ShockwaveIntelligenceSystemLightView.circleMaskView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of ShockwaveIntelligenceSystemLightView.circleMaskView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ShockwaveIntelligenceSystemLightView.circleMaskView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ShockwaveIntelligenceSystemLightView.sideLightMaskView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ShockwaveIntelligenceSystemLightView.sideLightMaskView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ShockwaveIntelligenceSystemLightView.sideLightMaskView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

unint64_t sub_247C8A6F4()
{
  unint64_t result;

  result = qword_2576F09E0;
  if (!qword_2576F09E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2576F09E0);
  }
  return result;
}

double SUIAShockwavePrototypeSettings.maximumHintDuration.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_maximumHintDuration;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.maximumHintDuration.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_maximumHintDuration);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.totalDuration.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_totalDuration;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.totalDuration.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_totalDuration);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.visualizeEffectMasks.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_visualizeEffectMasks);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.visualizeEffectMasks.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_visualizeEffectMasks);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.donutMaskInitialEdgeOutsetProportion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskInitialEdgeOutsetProportion;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.donutMaskInitialEdgeOutsetProportion.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskInitialEdgeOutsetProportion);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.finalFitVsDiameterRatioShortEdgeSmallScreen.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeSmallScreen;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.finalFitVsDiameterRatioShortEdgeSmallScreen.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeSmallScreen);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.finalFitVsDiameterRatioLongEdgeSmallScreen.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeSmallScreen;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.finalFitVsDiameterRatioLongEdgeSmallScreen.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeSmallScreen);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.finalFitVsDiameterRatioShortEdgeBigScreen.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeBigScreen;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.finalFitVsDiameterRatioShortEdgeBigScreen.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioShortEdgeBigScreen);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.finalFitVsDiameterRatioLongEdgeBigScreen.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeBigScreen;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.finalFitVsDiameterRatioLongEdgeBigScreen.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_finalFitVsDiameterRatioLongEdgeBigScreen);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.edgeLightHintTransitionDelay.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintTransitionDelay;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.edgeLightHintTransitionDelay.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintTransitionDelay);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.donutMaskEndTransitionDelay.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskEndTransitionDelay;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.donutMaskEndTransitionDelay.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskEndTransitionDelay);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

id SUIAShockwavePrototypeSettings.donutMaskPositionAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskPositionAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.donutMaskPositionAnimationSettings.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_donutMaskPositionAnimationSettings);
}

id SUIAShockwavePrototypeSettings.chromaticAberrationInitialDonutMask.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationInitialDonutMask);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.chromaticAberrationInitialDonutMask.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationInitialDonutMask);
}

id SUIAShockwavePrototypeSettings.chromaticAberrationFinalDonutMaskSmallScreen.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskSmallScreen);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.chromaticAberrationFinalDonutMaskSmallScreen.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskSmallScreen);
}

id SUIAShockwavePrototypeSettings.chromaticAberrationFinalDonutMaskLargeScreen.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskLargeScreen);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.chromaticAberrationFinalDonutMaskLargeScreen.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_chromaticAberrationFinalDonutMaskLargeScreen);
}

id SUIAShockwavePrototypeSettings.colorFillInitialCircleMask.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillInitialCircleMask);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.colorFillInitialCircleMask.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillInitialCircleMask);
}

id SUIAShockwavePrototypeSettings.colorFillHintCircleMask.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillHintCircleMask);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.colorFillHintCircleMask.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillHintCircleMask);
}

id SUIAShockwavePrototypeSettings.colorFillFinalCircleMask.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillFinalCircleMask);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.colorFillFinalCircleMask.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_colorFillFinalCircleMask);
}

id SUIAShockwavePrototypeSettings.edgeLightInitialCircleMask.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightInitialCircleMask);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.edgeLightInitialCircleMask.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightInitialCircleMask);
}

id SUIAShockwavePrototypeSettings.edgeLightHintCircleMask.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintCircleMask);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.edgeLightHintCircleMask.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightHintCircleMask);
}

id SUIAShockwavePrototypeSettings.edgeLightFinalCircleMask.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightFinalCircleMask);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.edgeLightFinalCircleMask.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_edgeLightFinalCircleMask);
}

double SUIAShockwavePrototypeSettings.aberrationMagnitudeX.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeX;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationMagnitudeX.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeX);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.aberrationMagnitudeY.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeY;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationMagnitudeY.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationMagnitudeY);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.aberrationBlurRadius.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationBlurRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationBlurRadius.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationBlurRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationUseColorSaturate.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorSaturate);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationUseColorSaturate.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorSaturate);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.aberrationColorSaturateAmount.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorSaturateAmount;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationColorSaturateAmount.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorSaturateAmount);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationUseEDR.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseEDR);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationUseEDR.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseEDR);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.aberrationEDRGain.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationEDRGain;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationEDRGain.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationEDRGain);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationUseColorBrightness.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorBrightness);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationUseColorBrightness.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorBrightness);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.aberrationColorBrightness.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorBrightness;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationColorBrightness.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorBrightness);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationUseColorMatrixMultiply.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorMatrixMultiply);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationUseColorMatrixMultiply.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationUseColorMatrixMultiply);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.aberrationColorMatrixMultiplyFactor.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorMatrixMultiplyFactor;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationColorMatrixMultiplyFactor.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationColorMatrixMultiplyFactor);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.aberrationFadeOutDelay.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelay;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationFadeOutDelay.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelay);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.aberrationFadeOutDelayIPad.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelayIPad;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.aberrationFadeOutDelayIPad.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_aberrationFadeOutDelayIPad);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

id SUIAShockwavePrototypeSettings.abberationFadeOutAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationFadeOutAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.abberationFadeOutAnimationSettings.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationFadeOutAnimationSettings);
}

id SUIAShockwavePrototypeSettings.abberationCancelledFadeOutAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationCancelledFadeOutAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.abberationCancelledFadeOutAnimationSettings.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_abberationCancelledFadeOutAnimationSettings);
}

double SUIAShockwavePrototypeSettings.meshSquareFinalSizeDiagonalRatio.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshSquareFinalSizeDiagonalRatio;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.meshSquareFinalSizeDiagonalRatio.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshSquareFinalSizeDiagonalRatio);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.meshRectangularFinalShortDimensionRatio.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalShortDimensionRatio;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.meshRectangularFinalShortDimensionRatio.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalShortDimensionRatio);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.meshRectangularFinalLongDimensionRatio.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalLongDimensionRatio;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.meshRectangularFinalLongDimensionRatio.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshRectangularFinalLongDimensionRatio);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.meshFinalProportionAcrossScreenLongEdge.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenLongEdge;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.meshFinalProportionAcrossScreenLongEdge.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenLongEdge);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.meshFinalProportionAcrossScreenShortEdge.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenShortEdge;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.meshFinalProportionAcrossScreenShortEdge.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionAcrossScreenShortEdge);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.meshFinalProportionTowardsCenterOnLargeDisplays.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionTowardsCenterOnLargeDisplays;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.meshFinalProportionTowardsCenterOnLargeDisplays.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshFinalProportionTowardsCenterOnLargeDisplays);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.meshPointsEndTransitionDelay.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsEndTransitionDelay;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.meshPointsEndTransitionDelay.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsEndTransitionDelay);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.useSiriMeshForCapture.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_useSiriMeshForCapture);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.useSiriMeshForCapture.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_useSiriMeshForCapture);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

id SUIAShockwavePrototypeSettings.meshPointsAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.meshPointsAnimationSettings.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsAnimationSettings);
}

id SUIAShockwavePrototypeSettings.meshPositionAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPositionAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.meshPositionAnimationSettings.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPositionAnimationSettings);
}

id SUIAShockwavePrototypeSettings.meshPointsCancelledAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsCancelledAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.meshPointsCancelledAnimationSettings.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_meshPointsCancelledAnimationSettings);
}

double SUIAShockwavePrototypeSettings.fillLightInitialIntensity.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightInitialIntensity;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.fillLightInitialIntensity.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightInitialIntensity);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.fillLightCaptureInitialIntensity.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightCaptureInitialIntensity;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.fillLightCaptureInitialIntensity.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightCaptureInitialIntensity);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.captureFillWhiteValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillWhiteValue;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.captureFillWhiteValue.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillWhiteValue);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.fillLightFinalIntensity.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightFinalIntensity;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.fillLightFinalIntensity.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightFinalIntensity);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

id SUIAShockwavePrototypeSettings.lightIntensityAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.lightIntensityAnimationSettings.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityAnimationSettings);
}

id SUIAShockwavePrototypeSettings.lightIntensityCancelledAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityCancelledAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwavePrototypeSettings.lightIntensityCancelledAnimationSettings.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_lightIntensityCancelledAnimationSettings);
}

double SUIAShockwavePrototypeSettings.fillLightIntensityFinalStateDelay.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightIntensityFinalStateDelay;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.fillLightIntensityFinalStateDelay.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightIntensityFinalStateDelay);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.fillLightColorSaturateAmount.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorSaturateAmount;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.fillLightColorSaturateAmount.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorSaturateAmount);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.fillLightColorBrightnessAmount.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorBrightnessAmount;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.fillLightColorBrightnessAmount.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorBrightnessAmount);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.fillLightColorContrastAmount.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorContrastAmount;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.fillLightColorContrastAmount.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_fillLightColorContrastAmount);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

id SUIAShockwavePrototypeSettings.captureHintAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void sub_247C8DF64(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void **v5;
  void *v6;
  id v7;

  v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;

}

void SUIAShockwavePrototypeSettings.captureHintAnimationSettings.setter(void *a1)
{
  sub_247C8DFC8(a1, &OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintAnimationSettings);
}

void sub_247C8DFC8(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

double SUIAShockwavePrototypeSettings.captureHintRetargetImpulse.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintRetargetImpulse;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.captureHintRetargetImpulse.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintRetargetImpulse);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.captureHintInterpolationProgress.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintInterpolationProgress;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.captureHintInterpolationProgress.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintInterpolationProgress);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwavePrototypeSettings.captureHintMeshOffset.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintMeshOffset;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.captureHintMeshOffset.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureHintMeshOffset);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.captureChromaticAberrationEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureChromaticAberrationEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.captureChromaticAberrationEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureChromaticAberrationEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.captureMeshEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureMeshEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.captureMeshEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureMeshEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.captureFillLightType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillLightType;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SUIAShockwavePrototypeSettings.captureFillLightType.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_captureFillLightType);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.siriButtonChromaticAberrationEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonChromaticAberrationEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.siriButtonChromaticAberrationEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonChromaticAberrationEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.siriButtonMeshEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.siriButtonMeshEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.siriButtonMeshEnabledLargeScreen.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabledLargeScreen);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.siriButtonMeshEnabledLargeScreen.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonMeshEnabledLargeScreen);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.siriButtonFillLightEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonFillLightEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.siriButtonFillLightEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonFillLightEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.siriButtonEdgeLightEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonEdgeLightEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.siriButtonEdgeLightEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriButtonEdgeLightEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.siriEdgeChromaticAberrationEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeChromaticAberrationEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.siriEdgeChromaticAberrationEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeChromaticAberrationEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.siriEdgeMeshEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.siriEdgeMeshEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.siriEdgeMeshEnabledLargeScreen.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabledLargeScreen);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.siriEdgeMeshEnabledLargeScreen.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeMeshEnabledLargeScreen);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.siriEdgeFillLightEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeFillLightEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.siriEdgeFillLightEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeFillLightEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwavePrototypeSettings.siriEdgeEdgeLightEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeEdgeLightEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t SUIAShockwavePrototypeSettings.siriEdgeEdgeLightEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SUIAShockwavePrototypeSettings_siriEdgeEdgeLightEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

Swift::Void __swiftcall SUIAShockwavePrototypeSettings.setDefaultValues()()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  double v96;
  double v97;
  objc_super v98;
  uint64_t v99;

  v1 = v0;
  v99 = *MEMORY[0x24BDAC8D0];
  v98.super_class = (Class)SUIAShockwavePrototypeSettings;
  objc_msgSendSuper2(&v98, sel_setDefaultValues);
  v96 = 0.0;
  v97 = 0.0;
  objc_msgSend(v0, sel_setMaximumHintDuration_);
  objc_msgSend(v0, sel_setTotalDuration_, 4.2);
  objc_msgSend(v0, sel_setVisualizeEffectMasks_, 0);
  objc_msgSend(v0, sel_setDonutMaskInitialEdgeOutsetProportion_, 1.44);
  objc_msgSend(v0, sel_setFinalFitVsDiameterRatioShortEdgeSmallScreen_, 1.0);
  objc_msgSend(v0, sel_setFinalFitVsDiameterRatioLongEdgeSmallScreen_, 0.75);
  objc_msgSend(v0, sel_setFinalFitVsDiameterRatioShortEdgeBigScreen_, 1.1);
  objc_msgSend(v0, sel_setFinalFitVsDiameterRatioLongEdgeBigScreen_, 0.85);
  objc_msgSend(v0, sel_setEdgeLightHintTransitionDelay_, 0.06);
  objc_msgSend(v0, sel_setDonutMaskEndTransitionDelay_, 0.0);
  v2 = objc_msgSend(objc_allocWithZone((Class)SUIAFluidBehaviorSettings), sel_init);
  objc_msgSend(v1, sel_setDonutMaskPositionAnimationSettings_, v2);

  v3 = objc_msgSend(v1, sel_donutMaskPositionAnimationSettings);
  objc_msgSend(v3, sel_setDefaultCriticallyDampedValues);
  sub_247C9FE74();
  objc_msgSend(v3, sel_setFrameRateRange_highFrameRateReason_, 3014657);
  objc_msgSend(v3, sel_setBehaviorType_, 0);
  v4 = (void *)sub_247C9FDA8();
  objc_msgSend(v3, sel_setName_, v4);

  v5 = objc_msgSend(v1, sel_donutMaskPositionAnimationSettings, SUIAConvertMassStiffnessAndDampingToDampingRatioAndResponse(&v96, &v97, 2.0, 50.0, 20.0));
  objc_msgSend(v5, sel_setDampingRatio_, v96);

  v6 = objc_msgSend(v1, sel_donutMaskPositionAnimationSettings);
  objc_msgSend(v6, sel_setResponse_, v97);

  v7 = objc_msgSend(v1, sel_chromaticAberrationInitialDonutMask);
  v8 = (void *)sub_247C9FDA8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0C30);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_247CA3110;
  sub_247C84B94(0, &qword_2576F0C38);
  *(_QWORD *)(v9 + 32) = sub_247C9FE80();
  *(_QWORD *)(v9 + 40) = sub_247C9FE80();
  *(_QWORD *)(v9 + 48) = sub_247C9FE80();
  *(_QWORD *)(v9 + 56) = sub_247C9FE80();
  *(_QWORD *)(v9 + 64) = sub_247C9FE80();
  *(_QWORD *)(v9 + 72) = sub_247C9FE80();
  *(_QWORD *)(v9 + 80) = sub_247C9FE80();
  *(_QWORD *)(v9 + 88) = sub_247C9FE80();
  *(_QWORD *)(v9 + 96) = sub_247C9FE80();
  *(_QWORD *)(v9 + 104) = sub_247C9FE80();
  *(_QWORD *)(v9 + 112) = sub_247C9FE80();
  *(_QWORD *)(v9 + 120) = sub_247C9FE80();
  *(_QWORD *)(v9 + 128) = sub_247C9FE80();
  *(_QWORD *)(v9 + 136) = sub_247C9FE80();
  *(_QWORD *)(v9 + 144) = sub_247C9FE80();
  *(_QWORD *)(v9 + 152) = sub_247C9FE80();
  *(_QWORD *)(v9 + 160) = sub_247C9FE80();
  *(_QWORD *)(v9 + 168) = sub_247C9FE80();
  *(_QWORD *)(v9 + 176) = sub_247C9FE80();
  *(_QWORD *)(v9 + 184) = sub_247C9FE80();
  *(_QWORD *)(v9 + 192) = sub_247C9FE80();
  *(_QWORD *)(v9 + 200) = sub_247C9FE80();
  *(_QWORD *)(v9 + 208) = sub_247C9FE80();
  *(_QWORD *)(v9 + 216) = sub_247C9FE80();
  *(_QWORD *)(v9 + 224) = sub_247C9FE80();
  *(_QWORD *)(v9 + 232) = sub_247C9FE80();
  *(_QWORD *)(v9 + 240) = sub_247C9FE80();
  *(_QWORD *)(v9 + 248) = sub_247C9FE80();
  *(_QWORD *)(v9 + 256) = sub_247C9FE80();
  *(_QWORD *)(v9 + 264) = sub_247C9FE80();
  sub_247C9FE14();
  v10 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v11 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v11 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v11 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v11 + 56) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v11 + 64) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v11 + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v11 + 80) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v11 + 88) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v11 + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.133);
  *(_QWORD *)(v11 + 104) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.224);
  *(_QWORD *)(v11 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.333);
  *(_QWORD *)(v11 + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.471);
  *(_QWORD *)(v11 + 128) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.608);
  *(_QWORD *)(v11 + 136) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.729);
  *(_QWORD *)(v11 + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.82);
  *(_QWORD *)(v11 + 152) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.871);
  *(_QWORD *)(v11 + 160) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.875);
  *(_QWORD *)(v11 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.835);
  *(_QWORD *)(v11 + 176) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.753);
  *(_QWORD *)(v11 + 184) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.639);
  *(_QWORD *)(v11 + 192) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v11 + 200) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.369);
  *(_QWORD *)(v11 + 208) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.251);
  *(_QWORD *)(v11 + 216) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.153);
  *(_QWORD *)(v11 + 224) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.082);
  *(_QWORD *)(v11 + 232) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v11 + 240) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v11 + 248) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v11 + 256) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v11 + 264) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  sub_247C9FE14();
  sub_247C84B94(0, &qword_2576F0C40);
  v12 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setDefaultValuesWithName_majorDiameter_ringWidth_blurRadius_sampleCount_locations_colors_gradientLayerSize_, v8, 30, v10, v12, 195.5, 42.0, 14.0, 279.5, 279.5);

  v13 = objc_msgSend(v1, sel_chromaticAberrationFinalDonutMaskSmallScreen);
  v14 = (void *)sub_247C9FDA8();
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v15 + 32) = sub_247C9FE80();
  *(_QWORD *)(v15 + 40) = sub_247C9FE80();
  *(_QWORD *)(v15 + 48) = sub_247C9FE80();
  *(_QWORD *)(v15 + 56) = sub_247C9FE80();
  *(_QWORD *)(v15 + 64) = sub_247C9FE80();
  *(_QWORD *)(v15 + 72) = sub_247C9FE80();
  *(_QWORD *)(v15 + 80) = sub_247C9FE80();
  *(_QWORD *)(v15 + 88) = sub_247C9FE80();
  *(_QWORD *)(v15 + 96) = sub_247C9FE80();
  *(_QWORD *)(v15 + 104) = sub_247C9FE80();
  *(_QWORD *)(v15 + 112) = sub_247C9FE80();
  *(_QWORD *)(v15 + 120) = sub_247C9FE80();
  *(_QWORD *)(v15 + 128) = sub_247C9FE80();
  *(_QWORD *)(v15 + 136) = sub_247C9FE80();
  *(_QWORD *)(v15 + 144) = sub_247C9FE80();
  *(_QWORD *)(v15 + 152) = sub_247C9FE80();
  *(_QWORD *)(v15 + 160) = sub_247C9FE80();
  *(_QWORD *)(v15 + 168) = sub_247C9FE80();
  *(_QWORD *)(v15 + 176) = sub_247C9FE80();
  *(_QWORD *)(v15 + 184) = sub_247C9FE80();
  *(_QWORD *)(v15 + 192) = sub_247C9FE80();
  *(_QWORD *)(v15 + 200) = sub_247C9FE80();
  *(_QWORD *)(v15 + 208) = sub_247C9FE80();
  *(_QWORD *)(v15 + 216) = sub_247C9FE80();
  *(_QWORD *)(v15 + 224) = sub_247C9FE80();
  *(_QWORD *)(v15 + 232) = sub_247C9FE80();
  *(_QWORD *)(v15 + 240) = sub_247C9FE80();
  *(_QWORD *)(v15 + 248) = sub_247C9FE80();
  *(_QWORD *)(v15 + 256) = sub_247C9FE80();
  *(_QWORD *)(v15 + 264) = sub_247C9FE80();
  sub_247C9FE14();
  v16 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v17 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 56) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 64) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 80) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 88) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 104) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v17 + 128) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.004);
  *(_QWORD *)(v17 + 136) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.035);
  *(_QWORD *)(v17 + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.122);
  *(_QWORD *)(v17 + 152) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.29);
  *(_QWORD *)(v17 + 160) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.525);
  *(_QWORD *)(v17 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.753);
  *(_QWORD *)(v17 + 176) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.906);
  *(_QWORD *)(v17 + 184) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.976);
  *(_QWORD *)(v17 + 192) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v17 + 200) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.976);
  *(_QWORD *)(v17 + 208) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.906);
  *(_QWORD *)(v17 + 216) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.761);
  *(_QWORD *)(v17 + 224) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v17 + 232) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v17 + 240) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.122);
  *(_QWORD *)(v17 + 248) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v17 + 256) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.004);
  *(_QWORD *)(v17 + 264) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  sub_247C9FE14();
  v18 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setDefaultValuesWithName_majorDiameter_ringWidth_blurRadius_sampleCount_locations_colors_gradientLayerSize_, v14, 30, v16, v18);

  v19 = objc_msgSend(v1, sel_chromaticAberrationFinalDonutMaskLargeScreen);
  v20 = (void *)sub_247C9FDA8();
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v21 + 32) = sub_247C9FE80();
  *(_QWORD *)(v21 + 40) = sub_247C9FE80();
  *(_QWORD *)(v21 + 48) = sub_247C9FE80();
  *(_QWORD *)(v21 + 56) = sub_247C9FE80();
  *(_QWORD *)(v21 + 64) = sub_247C9FE80();
  *(_QWORD *)(v21 + 72) = sub_247C9FE80();
  *(_QWORD *)(v21 + 80) = sub_247C9FE80();
  *(_QWORD *)(v21 + 88) = sub_247C9FE80();
  *(_QWORD *)(v21 + 96) = sub_247C9FE80();
  *(_QWORD *)(v21 + 104) = sub_247C9FE80();
  *(_QWORD *)(v21 + 112) = sub_247C9FE80();
  *(_QWORD *)(v21 + 120) = sub_247C9FE80();
  *(_QWORD *)(v21 + 128) = sub_247C9FE80();
  *(_QWORD *)(v21 + 136) = sub_247C9FE80();
  *(_QWORD *)(v21 + 144) = sub_247C9FE80();
  *(_QWORD *)(v21 + 152) = sub_247C9FE80();
  *(_QWORD *)(v21 + 160) = sub_247C9FE80();
  *(_QWORD *)(v21 + 168) = sub_247C9FE80();
  *(_QWORD *)(v21 + 176) = sub_247C9FE80();
  *(_QWORD *)(v21 + 184) = sub_247C9FE80();
  *(_QWORD *)(v21 + 192) = sub_247C9FE80();
  *(_QWORD *)(v21 + 200) = sub_247C9FE80();
  *(_QWORD *)(v21 + 208) = sub_247C9FE80();
  *(_QWORD *)(v21 + 216) = sub_247C9FE80();
  *(_QWORD *)(v21 + 224) = sub_247C9FE80();
  *(_QWORD *)(v21 + 232) = sub_247C9FE80();
  *(_QWORD *)(v21 + 240) = sub_247C9FE80();
  *(_QWORD *)(v21 + 248) = sub_247C9FE80();
  *(_QWORD *)(v21 + 256) = sub_247C9FE80();
  *(_QWORD *)(v21 + 264) = sub_247C9FE80();
  sub_247C9FE14();
  v22 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v23 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 56) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 64) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 80) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 88) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 104) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 128) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 136) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 152) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v23 + 160) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.004);
  *(_QWORD *)(v23 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.027);
  *(_QWORD *)(v23 + 176) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.106);
  *(_QWORD *)(v23 + 184) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.267);
  *(_QWORD *)(v23 + 192) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.494);
  *(_QWORD *)(v23 + 200) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v23 + 208) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.8);
  *(_QWORD *)(v23 + 216) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.725);
  *(_QWORD *)(v23 + 224) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.529);
  *(_QWORD *)(v23 + 232) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.294);
  *(_QWORD *)(v23 + 240) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.122);
  *(_QWORD *)(v23 + 248) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.039);
  *(_QWORD *)(v23 + 256) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.004);
  *(_QWORD *)(v23 + 264) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  sub_247C9FE14();
  v24 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setDefaultValuesWithName_majorDiameter_ringWidth_blurRadius_sampleCount_locations_colors_gradientLayerSize_, v20, 30, v22, v24, 2004.0, 170.0, 66.66, 2403.96, 2403.96);

  v25 = objc_msgSend(v1, sel_colorFillInitialCircleMask);
  v26 = (void *)sub_247C9FDA8();
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v27 + 32) = sub_247C9FE80();
  *(_QWORD *)(v27 + 40) = sub_247C9FE80();
  *(_QWORD *)(v27 + 48) = sub_247C9FE80();
  *(_QWORD *)(v27 + 56) = sub_247C9FE80();
  *(_QWORD *)(v27 + 64) = sub_247C9FE80();
  *(_QWORD *)(v27 + 72) = sub_247C9FE80();
  *(_QWORD *)(v27 + 80) = sub_247C9FE80();
  *(_QWORD *)(v27 + 88) = sub_247C9FE80();
  *(_QWORD *)(v27 + 96) = sub_247C9FE80();
  *(_QWORD *)(v27 + 104) = sub_247C9FE80();
  *(_QWORD *)(v27 + 112) = sub_247C9FE80();
  *(_QWORD *)(v27 + 120) = sub_247C9FE80();
  *(_QWORD *)(v27 + 128) = sub_247C9FE80();
  *(_QWORD *)(v27 + 136) = sub_247C9FE80();
  *(_QWORD *)(v27 + 144) = sub_247C9FE80();
  *(_QWORD *)(v27 + 152) = sub_247C9FE80();
  *(_QWORD *)(v27 + 160) = sub_247C9FE80();
  *(_QWORD *)(v27 + 168) = sub_247C9FE80();
  *(_QWORD *)(v27 + 176) = sub_247C9FE80();
  *(_QWORD *)(v27 + 184) = sub_247C9FE80();
  *(_QWORD *)(v27 + 192) = sub_247C9FE80();
  *(_QWORD *)(v27 + 200) = sub_247C9FE80();
  *(_QWORD *)(v27 + 208) = sub_247C9FE80();
  *(_QWORD *)(v27 + 216) = sub_247C9FE80();
  *(_QWORD *)(v27 + 224) = sub_247C9FE80();
  *(_QWORD *)(v27 + 232) = sub_247C9FE80();
  *(_QWORD *)(v27 + 240) = sub_247C9FE80();
  *(_QWORD *)(v27 + 248) = sub_247C9FE80();
  *(_QWORD *)(v27 + 256) = sub_247C9FE80();
  *(_QWORD *)(v27 + 264) = sub_247C9FE80();
  sub_247C9FE14();
  v28 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v29 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 56) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 64) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 80) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 88) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 104) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 128) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 136) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 152) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 160) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 176) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 184) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 192) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v29 + 200) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.973);
  *(_QWORD *)(v29 + 208) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v29 + 216) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.733);
  *(_QWORD *)(v29 + 224) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.506);
  *(_QWORD *)(v29 + 232) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.263);
  *(_QWORD *)(v29 + 240) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.11);
  *(_QWORD *)(v29 + 248) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.031);
  *(_QWORD *)(v29 + 256) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v29 + 264) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  sub_247C9FE14();
  v30 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v25, sel_setDefaultValuesWithName_majorDiameter_ringWidth_blurRadius_sampleCount_locations_colors_gradientLayerSize_, v26, 30, v28, v30);

  v31 = objc_msgSend(v1, sel_colorFillHintCircleMask);
  v32 = (void *)sub_247C9FDA8();
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v33 + 32) = sub_247C9FE80();
  *(_QWORD *)(v33 + 40) = sub_247C9FE80();
  *(_QWORD *)(v33 + 48) = sub_247C9FE80();
  *(_QWORD *)(v33 + 56) = sub_247C9FE80();
  *(_QWORD *)(v33 + 64) = sub_247C9FE80();
  *(_QWORD *)(v33 + 72) = sub_247C9FE80();
  *(_QWORD *)(v33 + 80) = sub_247C9FE80();
  *(_QWORD *)(v33 + 88) = sub_247C9FE80();
  *(_QWORD *)(v33 + 96) = sub_247C9FE80();
  *(_QWORD *)(v33 + 104) = sub_247C9FE80();
  *(_QWORD *)(v33 + 112) = sub_247C9FE80();
  *(_QWORD *)(v33 + 120) = sub_247C9FE80();
  *(_QWORD *)(v33 + 128) = sub_247C9FE80();
  *(_QWORD *)(v33 + 136) = sub_247C9FE80();
  *(_QWORD *)(v33 + 144) = sub_247C9FE80();
  *(_QWORD *)(v33 + 152) = sub_247C9FE80();
  *(_QWORD *)(v33 + 160) = sub_247C9FE80();
  *(_QWORD *)(v33 + 168) = sub_247C9FE80();
  *(_QWORD *)(v33 + 176) = sub_247C9FE80();
  *(_QWORD *)(v33 + 184) = sub_247C9FE80();
  *(_QWORD *)(v33 + 192) = sub_247C9FE80();
  *(_QWORD *)(v33 + 200) = sub_247C9FE80();
  *(_QWORD *)(v33 + 208) = sub_247C9FE80();
  *(_QWORD *)(v33 + 216) = sub_247C9FE80();
  *(_QWORD *)(v33 + 224) = sub_247C9FE80();
  *(_QWORD *)(v33 + 232) = sub_247C9FE80();
  *(_QWORD *)(v33 + 240) = sub_247C9FE80();
  *(_QWORD *)(v33 + 248) = sub_247C9FE80();
  *(_QWORD *)(v33 + 256) = sub_247C9FE80();
  *(_QWORD *)(v33 + 264) = sub_247C9FE80();
  sub_247C9FE14();
  v34 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v35 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v35 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v35 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v35 + 56) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v35 + 64) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v35 + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.996);
  *(_QWORD *)(v35 + 80) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v35 + 88) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v35 + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.973);
  *(_QWORD *)(v35 + 104) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.953);
  *(_QWORD *)(v35 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.922);
  *(_QWORD *)(v35 + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.882);
  *(_QWORD *)(v35 + 128) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.827);
  *(_QWORD *)(v35 + 136) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.757);
  *(_QWORD *)(v35 + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.671);
  *(_QWORD *)(v35 + 152) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.588);
  *(_QWORD *)(v35 + 160) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.49);
  *(_QWORD *)(v35 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.4);
  *(_QWORD *)(v35 + 176) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.31);
  *(_QWORD *)(v35 + 184) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.231);
  *(_QWORD *)(v35 + 192) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.165);
  *(_QWORD *)(v35 + 200) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.114);
  *(_QWORD *)(v35 + 208) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.075);
  *(_QWORD *)(v35 + 216) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.047);
  *(_QWORD *)(v35 + 224) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v35 + 232) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.012);
  *(_QWORD *)(v35 + 240) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.004);
  *(_QWORD *)(v35 + 248) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.004);
  *(_QWORD *)(v35 + 256) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v35 + 264) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  sub_247C9FE14();
  v36 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v31, sel_setDefaultValuesWithName_majorDiameter_ringWidth_blurRadius_sampleCount_locations_colors_gradientLayerSize_, v32, 30, v34, v36, 196.5, 0.0, 25.0, 346.5, 346.5);

  v37 = objc_msgSend(v1, sel_colorFillFinalCircleMask);
  v38 = (void *)sub_247C9FDA8();
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v39 + 32) = sub_247C9FE80();
  *(_QWORD *)(v39 + 40) = sub_247C9FE80();
  *(_QWORD *)(v39 + 48) = sub_247C9FE80();
  *(_QWORD *)(v39 + 56) = sub_247C9FE80();
  *(_QWORD *)(v39 + 64) = sub_247C9FE80();
  *(_QWORD *)(v39 + 72) = sub_247C9FE80();
  *(_QWORD *)(v39 + 80) = sub_247C9FE80();
  *(_QWORD *)(v39 + 88) = sub_247C9FE80();
  *(_QWORD *)(v39 + 96) = sub_247C9FE80();
  *(_QWORD *)(v39 + 104) = sub_247C9FE80();
  *(_QWORD *)(v39 + 112) = sub_247C9FE80();
  *(_QWORD *)(v39 + 120) = sub_247C9FE80();
  *(_QWORD *)(v39 + 128) = sub_247C9FE80();
  *(_QWORD *)(v39 + 136) = sub_247C9FE80();
  *(_QWORD *)(v39 + 144) = sub_247C9FE80();
  *(_QWORD *)(v39 + 152) = sub_247C9FE80();
  *(_QWORD *)(v39 + 160) = sub_247C9FE80();
  *(_QWORD *)(v39 + 168) = sub_247C9FE80();
  *(_QWORD *)(v39 + 176) = sub_247C9FE80();
  *(_QWORD *)(v39 + 184) = sub_247C9FE80();
  *(_QWORD *)(v39 + 192) = sub_247C9FE80();
  *(_QWORD *)(v39 + 200) = sub_247C9FE80();
  *(_QWORD *)(v39 + 208) = sub_247C9FE80();
  *(_QWORD *)(v39 + 216) = sub_247C9FE80();
  *(_QWORD *)(v39 + 224) = sub_247C9FE80();
  *(_QWORD *)(v39 + 232) = sub_247C9FE80();
  *(_QWORD *)(v39 + 240) = sub_247C9FE80();
  *(_QWORD *)(v39 + 248) = sub_247C9FE80();
  *(_QWORD *)(v39 + 256) = sub_247C9FE80();
  *(_QWORD *)(v39 + 264) = sub_247C9FE80();
  sub_247C9FE14();
  v40 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v41 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 56) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 64) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 80) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 88) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 104) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 128) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 136) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 152) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 160) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 176) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 184) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v41 + 192) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.996);
  *(_QWORD *)(v41 + 200) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v41 + 208) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.894);
  *(_QWORD *)(v41 + 216) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v41 + 224) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v41 + 232) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v41 + 240) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.122);
  *(_QWORD *)(v41 + 248) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.043);
  *(_QWORD *)(v41 + 256) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.008);
  *(_QWORD *)(v41 + 264) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  sub_247C9FE14();
  v42 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v37, sel_setDefaultValuesWithName_majorDiameter_ringWidth_blurRadius_sampleCount_locations_colors_gradientLayerSize_, v38, 30, v40, v42, 2004.0, 0.0);

  v43 = objc_msgSend(v1, sel_edgeLightInitialCircleMask);
  v44 = (void *)sub_247C9FDA8();
  v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v45 + 32) = sub_247C9FE80();
  *(_QWORD *)(v45 + 40) = sub_247C9FE80();
  *(_QWORD *)(v45 + 48) = sub_247C9FE80();
  *(_QWORD *)(v45 + 56) = sub_247C9FE80();
  *(_QWORD *)(v45 + 64) = sub_247C9FE80();
  *(_QWORD *)(v45 + 72) = sub_247C9FE80();
  *(_QWORD *)(v45 + 80) = sub_247C9FE80();
  *(_QWORD *)(v45 + 88) = sub_247C9FE80();
  *(_QWORD *)(v45 + 96) = sub_247C9FE80();
  *(_QWORD *)(v45 + 104) = sub_247C9FE80();
  *(_QWORD *)(v45 + 112) = sub_247C9FE80();
  *(_QWORD *)(v45 + 120) = sub_247C9FE80();
  *(_QWORD *)(v45 + 128) = sub_247C9FE80();
  *(_QWORD *)(v45 + 136) = sub_247C9FE80();
  *(_QWORD *)(v45 + 144) = sub_247C9FE80();
  *(_QWORD *)(v45 + 152) = sub_247C9FE80();
  *(_QWORD *)(v45 + 160) = sub_247C9FE80();
  *(_QWORD *)(v45 + 168) = sub_247C9FE80();
  *(_QWORD *)(v45 + 176) = sub_247C9FE80();
  *(_QWORD *)(v45 + 184) = sub_247C9FE80();
  *(_QWORD *)(v45 + 192) = sub_247C9FE80();
  *(_QWORD *)(v45 + 200) = sub_247C9FE80();
  *(_QWORD *)(v45 + 208) = sub_247C9FE80();
  *(_QWORD *)(v45 + 216) = sub_247C9FE80();
  *(_QWORD *)(v45 + 224) = sub_247C9FE80();
  *(_QWORD *)(v45 + 232) = sub_247C9FE80();
  *(_QWORD *)(v45 + 240) = sub_247C9FE80();
  *(_QWORD *)(v45 + 248) = sub_247C9FE80();
  *(_QWORD *)(v45 + 256) = sub_247C9FE80();
  *(_QWORD *)(v45 + 264) = sub_247C9FE80();
  sub_247C9FE14();
  v46 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v47 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 56) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 64) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 80) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 88) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 104) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 128) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 136) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 152) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 160) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v47 + 176) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.996);
  *(_QWORD *)(v47 + 184) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.984);
  *(_QWORD *)(v47 + 192) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.937);
  *(_QWORD *)(v47 + 200) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.847);
  *(_QWORD *)(v47 + 208) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.706);
  *(_QWORD *)(v47 + 216) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.506);
  *(_QWORD *)(v47 + 224) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.306);
  *(_QWORD *)(v47 + 232) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.157);
  *(_QWORD *)(v47 + 240) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0);
  *(_QWORD *)(v47 + 248) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.024);
  *(_QWORD *)(v47 + 256) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v47 + 264) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  sub_247C9FE14();
  v48 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v43, sel_setDefaultValuesWithName_majorDiameter_ringWidth_blurRadius_sampleCount_locations_colors_gradientLayerSize_, v44, 30, v46, v48, 196.0, 0.0, 8.33, 245.98, 245.98);

  v49 = objc_msgSend(v1, sel_edgeLightHintCircleMask);
  v50 = (void *)sub_247C9FDA8();
  v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v51 + 32) = sub_247C9FE80();
  *(_QWORD *)(v51 + 40) = sub_247C9FE80();
  *(_QWORD *)(v51 + 48) = sub_247C9FE80();
  *(_QWORD *)(v51 + 56) = sub_247C9FE80();
  *(_QWORD *)(v51 + 64) = sub_247C9FE80();
  *(_QWORD *)(v51 + 72) = sub_247C9FE80();
  *(_QWORD *)(v51 + 80) = sub_247C9FE80();
  *(_QWORD *)(v51 + 88) = sub_247C9FE80();
  *(_QWORD *)(v51 + 96) = sub_247C9FE80();
  *(_QWORD *)(v51 + 104) = sub_247C9FE80();
  *(_QWORD *)(v51 + 112) = sub_247C9FE80();
  *(_QWORD *)(v51 + 120) = sub_247C9FE80();
  *(_QWORD *)(v51 + 128) = sub_247C9FE80();
  *(_QWORD *)(v51 + 136) = sub_247C9FE80();
  *(_QWORD *)(v51 + 144) = sub_247C9FE80();
  *(_QWORD *)(v51 + 152) = sub_247C9FE80();
  *(_QWORD *)(v51 + 160) = sub_247C9FE80();
  *(_QWORD *)(v51 + 168) = sub_247C9FE80();
  *(_QWORD *)(v51 + 176) = sub_247C9FE80();
  *(_QWORD *)(v51 + 184) = sub_247C9FE80();
  *(_QWORD *)(v51 + 192) = sub_247C9FE80();
  *(_QWORD *)(v51 + 200) = sub_247C9FE80();
  *(_QWORD *)(v51 + 208) = sub_247C9FE80();
  *(_QWORD *)(v51 + 216) = sub_247C9FE80();
  *(_QWORD *)(v51 + 224) = sub_247C9FE80();
  *(_QWORD *)(v51 + 232) = sub_247C9FE80();
  *(_QWORD *)(v51 + 240) = sub_247C9FE80();
  *(_QWORD *)(v51 + 248) = sub_247C9FE80();
  *(_QWORD *)(v51 + 256) = sub_247C9FE80();
  *(_QWORD *)(v51 + 264) = sub_247C9FE80();
  sub_247C9FE14();
  v52 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v53 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v53 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v53 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v53 + 56) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v53 + 64) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v53 + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.992);
  *(_QWORD *)(v53 + 80) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.984);
  *(_QWORD *)(v53 + 88) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.976);
  *(_QWORD *)(v53 + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.957);
  *(_QWORD *)(v53 + 104) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.929);
  *(_QWORD *)(v53 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.89);
  *(_QWORD *)(v53 + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.843);
  *(_QWORD *)(v53 + 128) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.78);
  *(_QWORD *)(v53 + 136) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.706);
  *(_QWORD *)(v53 + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.624);
  *(_QWORD *)(v53 + 152) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.537);
  *(_QWORD *)(v53 + 160) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.443);
  *(_QWORD *)(v53 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.353);
  *(_QWORD *)(v53 + 176) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.275);
  *(_QWORD *)(v53 + 184) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.204);
  *(_QWORD *)(v53 + 192) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.145);
  *(_QWORD *)(v53 + 200) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.102);
  *(_QWORD *)(v53 + 208) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.067);
  *(_QWORD *)(v53 + 216) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.039);
  *(_QWORD *)(v53 + 224) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.02);
  *(_QWORD *)(v53 + 232) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.008);
  *(_QWORD *)(v53 + 240) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.004);
  *(_QWORD *)(v53 + 248) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v53 + 256) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  *(_QWORD *)(v53 + 264) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  sub_247C9FE14();
  v54 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v49, sel_setDefaultValuesWithName_majorDiameter_ringWidth_blurRadius_sampleCount_locations_colors_gradientLayerSize_, v50, 30, v52, v54, 275.0, 0.0, 37.5, 500.0, 500.0);

  v55 = objc_msgSend(v1, sel_edgeLightFinalCircleMask);
  v56 = (void *)sub_247C9FDA8();
  v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v57 + 32) = sub_247C9FE80();
  *(_QWORD *)(v57 + 40) = sub_247C9FE80();
  *(_QWORD *)(v57 + 48) = sub_247C9FE80();
  *(_QWORD *)(v57 + 56) = sub_247C9FE80();
  *(_QWORD *)(v57 + 64) = sub_247C9FE80();
  *(_QWORD *)(v57 + 72) = sub_247C9FE80();
  *(_QWORD *)(v57 + 80) = sub_247C9FE80();
  *(_QWORD *)(v57 + 88) = sub_247C9FE80();
  *(_QWORD *)(v57 + 96) = sub_247C9FE80();
  *(_QWORD *)(v57 + 104) = sub_247C9FE80();
  *(_QWORD *)(v57 + 112) = sub_247C9FE80();
  *(_QWORD *)(v57 + 120) = sub_247C9FE80();
  *(_QWORD *)(v57 + 128) = sub_247C9FE80();
  *(_QWORD *)(v57 + 136) = sub_247C9FE80();
  *(_QWORD *)(v57 + 144) = sub_247C9FE80();
  *(_QWORD *)(v57 + 152) = sub_247C9FE80();
  *(_QWORD *)(v57 + 160) = sub_247C9FE80();
  *(_QWORD *)(v57 + 168) = sub_247C9FE80();
  *(_QWORD *)(v57 + 176) = sub_247C9FE80();
  *(_QWORD *)(v57 + 184) = sub_247C9FE80();
  *(_QWORD *)(v57 + 192) = sub_247C9FE80();
  *(_QWORD *)(v57 + 200) = sub_247C9FE80();
  *(_QWORD *)(v57 + 208) = sub_247C9FE80();
  *(_QWORD *)(v57 + 216) = sub_247C9FE80();
  *(_QWORD *)(v57 + 224) = sub_247C9FE80();
  *(_QWORD *)(v57 + 232) = sub_247C9FE80();
  *(_QWORD *)(v57 + 240) = sub_247C9FE80();
  *(_QWORD *)(v57 + 248) = sub_247C9FE80();
  *(_QWORD *)(v57 + 256) = sub_247C9FE80();
  *(_QWORD *)(v57 + 264) = sub_247C9FE80();
  sub_247C9FE14();
  v58 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = xmmword_247CA3110;
  *(_QWORD *)(v59 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 56) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 64) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 80) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 88) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 104) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 128) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 136) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 152) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 160) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 176) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 184) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 1.0);
  *(_QWORD *)(v59 + 192) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.996);
  *(_QWORD *)(v59 + 200) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.969);
  *(_QWORD *)(v59 + 208) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.894);
  *(_QWORD *)(v59 + 216) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.737);
  *(_QWORD *)(v59 + 224) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.51);
  *(_QWORD *)(v59 + 232) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.282);
  *(_QWORD *)(v59 + 240) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.122);
  *(_QWORD *)(v59 + 248) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.043);
  *(_QWORD *)(v59 + 256) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.008);
  *(_QWORD *)(v59 + 264) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.0);
  sub_247C9FE14();
  v60 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v55, sel_setDefaultValuesWithName_majorDiameter_ringWidth_blurRadius_sampleCount_locations_colors_gradientLayerSize_, v56, 30, v58, v60, 2004.0, 0.0, 68.0, 2412.0, 2412.0);

  objc_msgSend(v1, sel_setAberrationMagnitudeX_, 2.66666667);
  objc_msgSend(v1, sel_setAberrationMagnitudeY_, 0.0);
  objc_msgSend(v1, sel_setAberrationBlurRadius_, 1.66666667);
  objc_msgSend(v1, sel_setAberrationUseColorSaturate_, 1);
  objc_msgSend(v1, sel_setAberrationColorSaturateAmount_, 1.2);
  objc_msgSend(v1, sel_setAberrationUseEDR_, 0);
  objc_msgSend(v1, sel_setAberrationEDRGain_, 1.4);
  objc_msgSend(v1, sel_setAberrationUseColorBrightness_, 1);
  objc_msgSend(v1, sel_setAberrationColorBrightness_, 0.1);
  objc_msgSend(v1, sel_setAberrationUseColorMatrixMultiply_, 0);
  objc_msgSend(v1, sel_setAberrationColorMatrixMultiplyFactor_, 1.4);
  objc_msgSend(v1, sel_setAberrationFadeOutDelay_, 0.47);
  objc_msgSend(v1, sel_setAberrationFadeOutDelayIPad_, 0.52);
  v61 = objc_msgSend(objc_allocWithZone((Class)SUIAFluidBehaviorSettings), sel_init);
  objc_msgSend(v1, sel_setAbberationFadeOutAnimationSettings_, v61);

  v62 = objc_msgSend(v1, sel_abberationFadeOutAnimationSettings);
  objc_msgSend(v62, sel_setDefaultValues);

  v63 = objc_msgSend(objc_allocWithZone((Class)SUIAFluidBehaviorSettings), sel_init);
  objc_msgSend(v1, sel_setAbberationCancelledFadeOutAnimationSettings_, v63);

  v64 = objc_msgSend(v1, sel_abberationCancelledFadeOutAnimationSettings);
  objc_msgSend(v64, sel_setDefaultCriticallyDampedValues);
  sub_247C9FE74();
  objc_msgSend(v64, sel_setFrameRateRange_highFrameRateReason_, 3014657);
  objc_msgSend(v64, sel_setBehaviorType_, 0);
  v65 = (void *)sub_247C9FDA8();
  objc_msgSend(v64, sel_setName_, v65);

  v66 = objc_msgSend(v1, sel_abberationCancelledFadeOutAnimationSettings, SUIAConvertMassStiffnessAndDampingToDampingRatioAndResponse(&v96, &v97, 2.0, 50.0, 20.0));
  objc_msgSend(v66, sel_setDampingRatio_, v96);

  v67 = objc_msgSend(v1, sel_abberationCancelledFadeOutAnimationSettings);
  objc_msgSend(v67, sel_setResponse_, v97);

  objc_msgSend(v1, sel_setMeshSquareFinalSizeDiagonalRatio_, 1.77);
  objc_msgSend(v1, sel_setMeshRectangularFinalShortDimensionRatio_, 2.96861747);
  objc_msgSend(v1, sel_setMeshRectangularFinalLongDimensionRatio_, 2.34741784);
  objc_msgSend(v1, sel_setMeshFinalProportionAcrossScreenLongEdge_, 0.415182358);
  objc_msgSend(v1, sel_setMeshFinalProportionAcrossScreenShortEdge_, 0.0551643192);
  objc_msgSend(v1, sel_setMeshFinalProportionTowardsCenterOnLargeDisplays_, 0.5);
  objc_msgSend(v1, sel_setMeshPointsEndTransitionDelay_, 0.125);
  objc_msgSend(v1, sel_setUseSiriMeshForCapture_, 1);
  v68 = objc_msgSend(objc_allocWithZone((Class)SUIAFluidBehaviorSettings), sel_init);
  objc_msgSend(v1, sel_setMeshPointsAnimationSettings_, v68);

  v69 = objc_msgSend(v1, sel_meshPointsAnimationSettings);
  objc_msgSend(v69, sel_setDefaultCriticallyDampedValues);
  sub_247C9FE74();
  objc_msgSend(v69, sel_setFrameRateRange_highFrameRateReason_, 3014657);
  objc_msgSend(v69, sel_setBehaviorType_, 0);
  v70 = (void *)sub_247C9FDA8();
  objc_msgSend(v69, sel_setName_, v70);

  v71 = objc_msgSend(v1, sel_meshPointsAnimationSettings, SUIAConvertMassStiffnessAndDampingToDampingRatioAndResponse(&v96, &v97, 2.0, 150.0, 10.0));
  objc_msgSend(v71, sel_setDampingRatio_, v96);

  v72 = objc_msgSend(v1, sel_meshPointsAnimationSettings);
  objc_msgSend(v72, sel_setResponse_, v97);

  v73 = objc_msgSend(objc_allocWithZone((Class)SUIAFluidBehaviorSettings), sel_init);
  objc_msgSend(v1, sel_setMeshPositionAnimationSettings_, v73);

  v74 = objc_msgSend(v1, sel_meshPositionAnimationSettings);
  objc_msgSend(v74, sel_setDefaultCriticallyDampedValues);
  sub_247C9FE74();
  objc_msgSend(v74, sel_setFrameRateRange_highFrameRateReason_, 3014657);
  objc_msgSend(v74, sel_setBehaviorType_, 0);
  v75 = (void *)sub_247C9FDA8();
  objc_msgSend(v74, sel_setName_, v75);

  v76 = objc_msgSend(v1, sel_meshPositionAnimationSettings, SUIAConvertMassStiffnessAndDampingToDampingRatioAndResponse(&v96, &v97, 2.0, 60.0, 21.9089));
  objc_msgSend(v76, sel_setDampingRatio_, v96);

  v77 = objc_msgSend(v1, sel_meshPositionAnimationSettings);
  objc_msgSend(v77, sel_setResponse_, v97);

  v78 = objc_msgSend(objc_allocWithZone((Class)SUIAFluidBehaviorSettings), sel_init);
  objc_msgSend(v1, sel_setMeshPointsCancelledAnimationSettings_, v78);

  v79 = objc_msgSend(v1, sel_meshPointsCancelledAnimationSettings);
  objc_msgSend(v79, sel_setDefaultCriticallyDampedValues);
  sub_247C9FE74();
  objc_msgSend(v79, sel_setFrameRateRange_highFrameRateReason_, 3014657);
  objc_msgSend(v79, sel_setBehaviorType_, 0);
  v80 = (void *)sub_247C9FDA8();
  objc_msgSend(v79, sel_setName_, v80);

  v81 = objc_msgSend(v1, sel_meshPointsCancelledAnimationSettings);
  objc_msgSend(v81, (SEL)0x25194B7D2, 1.0);

  v82 = objc_msgSend(v1, sel_meshPointsCancelledAnimationSettings);
  objc_msgSend(v82, sel_setResponse_, 0.4083);

  objc_msgSend(v1, sel_setFillLightInitialIntensity_, 1.0);
  objc_msgSend(v1, sel_setFillLightCaptureInitialIntensity_, 0.38);
  objc_msgSend(v1, sel_setCaptureFillWhiteValue_, 1.0);
  objc_msgSend(v1, sel_setFillLightFinalIntensity_, 0.0);
  v83 = objc_msgSend(objc_allocWithZone((Class)SUIAFluidBehaviorSettings), sel_init);
  objc_msgSend(v1, sel_setLightIntensityAnimationSettings_, v83);

  v84 = objc_msgSend(v1, sel_lightIntensityAnimationSettings);
  objc_msgSend(v84, sel_setDefaultCriticallyDampedValues);
  sub_247C9FE74();
  objc_msgSend(v84, sel_setFrameRateRange_highFrameRateReason_, 3014657);
  objc_msgSend(v84, sel_setBehaviorType_, 0);
  v85 = (void *)sub_247C9FDA8();
  objc_msgSend(v84, sel_setName_, v85);

  v86 = objc_msgSend(v1, sel_lightIntensityAnimationSettings);
  objc_msgSend(v86, sel_setDampingRatio_, 1.0);

  v87 = objc_msgSend(v1, sel_lightIntensityAnimationSettings);
  objc_msgSend(v87, sel_setResponse_, 1.35);

  v88 = objc_msgSend(objc_allocWithZone((Class)SUIAFluidBehaviorSettings), (SEL)0x25194BDC8);
  objc_msgSend(v1, sel_setLightIntensityCancelledAnimationSettings_, v88);

  v89 = objc_msgSend(v1, sel_lightIntensityCancelledAnimationSettings);
  objc_msgSend(v89, sel_setDefaultCriticallyDampedValues);
  sub_247C9FE74();
  objc_msgSend(v89, sel_setFrameRateRange_highFrameRateReason_, 3014657);
  objc_msgSend(v89, sel_setBehaviorType_, 0);
  v90 = (void *)sub_247C9FDA8();
  objc_msgSend(v89, sel_setName_, v90);

  v91 = objc_msgSend(v1, sel_lightIntensityCancelledAnimationSettings);
  objc_msgSend(v91, sel_setDampingRatio_, 1.0);

  v92 = objc_msgSend(v1, sel_lightIntensityCancelledAnimationSettings);
  objc_msgSend(v92, sel_setResponse_, 0.6805);

  objc_msgSend(v1, sel_setFillLightColorSaturateAmount_, 2.0);
  objc_msgSend(v1, sel_setFillLightColorBrightnessAmount_, 0.5);
  objc_msgSend(v1, sel_setFillLightColorContrastAmount_, 2.22);
  objc_msgSend(v1, sel_setFillLightIntensityFinalStateDelay_, 0.05);
  v93 = objc_msgSend(objc_allocWithZone((Class)SUIAFluidBehaviorSettings), (SEL)0x25194BDC8);
  objc_msgSend(v1, sel_setCaptureHintAnimationSettings_, v93);

  v94 = objc_msgSend(v1, sel_captureHintAnimationSettings);
  objc_msgSend(v94, sel_setDefaultCriticallyDampedValues);
  sub_247C9FE74();
  objc_msgSend(v94, sel_setFrameRateRange_highFrameRateReason_, 3014657);
  objc_msgSend(v94, sel_setBehaviorType_, 0);
  v95 = (void *)sub_247C9FDA8();
  objc_msgSend(v94, sel_setName_, v95);

  SUIAConvertMassStiffnessAndDampingToDampingRatioAndResponse(&v96, &v97, 1.0, 438.649084, 29.321531);
  objc_msgSend(v1, sel_setCaptureHintRetargetImpulse_, 0.12);
  objc_msgSend(v1, sel_setCaptureHintInterpolationProgress_, 0.15);
  objc_msgSend(v1, sel_setCaptureHintMeshOffset_, 0.3);
  objc_msgSend(v1, sel_setCaptureChromaticAberrationEnabled_, 1);
  objc_msgSend(v1, sel_setCaptureMeshEnabled_, 1);
  objc_msgSend(v1, sel_setCaptureFillLightType_, 2);
  objc_msgSend(v1, sel_setSiriButtonChromaticAberrationEnabled_, 1);
  objc_msgSend(v1, sel_setSiriButtonMeshEnabled_, 1);
  objc_msgSend(v1, sel_setSiriButtonMeshEnabledLargeScreen_, 0);
  objc_msgSend(v1, sel_setSiriButtonFillLightEnabled_, 1);
  objc_msgSend(v1, sel_setSiriButtonEdgeLightEnabled_, 1);
  objc_msgSend(v1, sel_setSiriEdgeChromaticAberrationEnabled_, 1);
  objc_msgSend(v1, sel_setSiriEdgeMeshEnabled_, 1);
  objc_msgSend(v1, sel_setSiriEdgeMeshEnabledLargeScreen_, 0);
  objc_msgSend(v1, sel_setSiriEdgeFillLightEnabled_, 1);
  objc_msgSend(v1, sel_setSiriEdgeEdgeLightEnabled_, 1);
}

Swift::Bool __swiftcall SUIAShockwavePrototypeSettings.shouldBehaveLikeLargeScreen(_:)(CGSize a1)
{
  double height;
  double width;
  id v3;
  id v4;
  double v5;

  height = a1.height;
  width = a1.width;
  v3 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v4 = objc_msgSend(v3, sel_userInterfaceIdiom);

  if (height >= width)
    v5 = width;
  else
    v5 = height;
  return v5 > 500.0 || v4 == (id)1;
}

id SUIAShockwavePrototypeSettings.finalFitVsDiameterRatioShortEdge(forShockwaveSize:)()
{
  return sub_247C93B28((SEL *)&selRef_finalFitVsDiameterRatioShortEdgeBigScreen, (SEL *)&selRef_finalFitVsDiameterRatioShortEdgeSmallScreen);
}

id SUIAShockwavePrototypeSettings.finalFitVsDiameterRatioLongEdge(forShockwaveSize:)()
{
  return sub_247C93B28((SEL *)&selRef_finalFitVsDiameterRatioLongEdgeBigScreen, (SEL *)&selRef_finalFitVsDiameterRatioLongEdgeSmallScreen);
}

id sub_247C93B28(SEL *a1, SEL *a2)
{
  void *v2;
  SEL *v5;

  if (objc_msgSend(v2, sel_shouldBehaveLikeLargeScreen_))
    v5 = a1;
  else
    v5 = a2;
  return objc_msgSend(v2, *v5);
}

double sub_247C93B84(void *a1, double a2, double a3, uint64_t a4, SEL *a5, SEL *a6)
{
  id v10;
  SEL *v11;
  double v12;
  double v13;

  v10 = a1;
  if (objc_msgSend(v10, sel_shouldBehaveLikeLargeScreen_, a2, a3))
    v11 = a5;
  else
    v11 = a6;
  objc_msgSend(v10, *v11);
  v13 = v12;

  return v13;
}

void __swiftcall SUIAShockwavePrototypeSettings.chromaticAberrationFinalDonutMask(forShockwaveSize:)(SUIAShockwaveRadialMaskSettings *__return_ptr retstr, CGSize forShockwaveSize)
{
  void *v2;
  unsigned int v3;
  char **v4;
  id v5;

  v3 = objc_msgSend(v2, sel_shouldBehaveLikeLargeScreen_, forShockwaveSize.width, forShockwaveSize.height);
  v4 = &selRef_chromaticAberrationFinalDonutMaskLargeScreen;
  if (!v3)
    v4 = &selRef_chromaticAberrationFinalDonutMaskSmallScreen;
  v5 = objc_msgSend(v2, *v4);
}

void sub_247C93CC0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  __objc2_prop *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  void *v22;
  id v23;
  id v24;
  __objc2_prop *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37[2];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  sub_247C895D0(a2, (uint64_t)&v42);
  if (!*((_QWORD *)&v43 + 1))
    goto LABEL_37;
  sub_247C84B94(0, &qword_2576F0C80);
  if ((swift_dynamicCast() & 1) == 0)
    return;
  v2 = (void *)v39;
  v3 = (void *)sub_247C9FDA8();
  v4 = &stru_25194A000;
  v5 = objc_msgSend((id)v39, sel_valueForKey_, v3);

  if (v5)
  {
    sub_247C9FE98();
    swift_unknownObjectRelease();
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
  }
  sub_247C98DAC((uint64_t)&v39, (uint64_t)&v42);
  if (!*((_QWORD *)&v43 + 1))
  {

LABEL_37:
    sub_247C89618((uint64_t)&v42);
    return;
  }
  sub_247C84B94(0, &qword_2576F0C88);
  if ((swift_dynamicCast() & 1) == 0)
  {

    return;
  }
  v33 = v2;
  v6 = v37[0];
  v45 = 0;
  v46 = 0xE000000000000000;
  v7 = objc_msgSend(v37[0], sel__allKeys);
  if (!v7)
    goto LABEL_43;
  v8 = v7;
  v9 = MEMORY[0x24BEE23D0];
  v10 = sub_247C9FE50();

  v11 = 0;
  v12 = v10 + 56;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v10 + 56);
  v16 = (unint64_t)(v13 + 63) >> 6;
  v35 = v10;
  v34 = v10 + 56;
  while (v15)
  {
    v17 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    v18 = v17 | (v11 << 6);
LABEL_29:
    sub_247C98DF4(*(_QWORD *)(v10 + 48) + 40 * v18, (uint64_t)&v42);
    v39 = v42;
    v40 = v43;
    v41 = v44;
    if ((swift_dynamicCast() & 1) != 0)
    {
      v22 = (void *)sub_247C9FDA8();
      swift_bridgeObjectRelease();
      v23 = objc_msgSend(v6, v4[243].attr, v22);

      if (v23)
      {
        sub_247C9FE98();
        swift_unknownObjectRelease();
      }
      else
      {
        *(_OWORD *)v37 = 0u;
        v38 = 0u;
      }
      sub_247C98DAC((uint64_t)v37, (uint64_t)&v39);
      if (*((_QWORD *)&v40 + 1))
      {
        type metadata accessor for SUIAShockwaveRadialMaskSettings(0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v24 = objc_msgSend(v36, sel_computeDerivativeValuesAndGenerateSource);
          v25 = v4;
          v26 = sub_247C9FDB4();
          v27 = v9;
          v28 = v6;
          v30 = v29;

          *(_QWORD *)&v39 = v26;
          *((_QWORD *)&v39 + 1) = v30;
          v6 = v28;
          v9 = v27;
          sub_247C9FDD8();
          sub_247C9FDD8();

          v4 = v25;
          v12 = v34;
          v10 = v35;
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        sub_247C89618((uint64_t)&v39);
      }
    }
  }
  v19 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v19 >= v16)
    goto LABEL_40;
  v20 = *(_QWORD *)(v12 + 8 * v19);
  ++v11;
  if (v20)
    goto LABEL_28;
  v11 = v19 + 1;
  if (v19 + 1 >= v16)
    goto LABEL_40;
  v20 = *(_QWORD *)(v12 + 8 * v11);
  if (v20)
    goto LABEL_28;
  v11 = v19 + 2;
  if (v19 + 2 >= v16)
    goto LABEL_40;
  v20 = *(_QWORD *)(v12 + 8 * v11);
  if (v20)
  {
LABEL_28:
    v15 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v11 << 6);
    goto LABEL_29;
  }
  v21 = v19 + 3;
  if (v21 >= v16)
  {
LABEL_40:
    swift_release();
    v31 = objc_msgSend((id)objc_opt_self(), sel_generalPasteboard);
    swift_bridgeObjectRetain();
    v32 = (void *)sub_247C9FDA8();
    swift_bridgeObjectRelease();
    objc_msgSend(v31, sel_setString_, v32);

    sub_247C9FDCC();
    swift_bridgeObjectRelease();

    return;
  }
  v20 = *(_QWORD *)(v12 + 8 * v21);
  if (v20)
  {
    v11 = v21;
    goto LABEL_28;
  }
  while (1)
  {
    v11 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v11 >= v16)
      goto LABEL_40;
    v20 = *(_QWORD *)(v12 + 8 * v11);
    ++v21;
    if (v20)
      goto LABEL_28;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
}

void _sSo30SUIAShockwavePrototypeSettingsC20SystemUIAnimationKitE24settingsControllerModuleSo8PTModuleCSgyFZ_0()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  id v123;
  id v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  id v132;
  id v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  id v141;
  id v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  id v153;
  uint64_t v154;
  void *v155;
  void *v156;
  id v157;
  id v158;
  void *v159;
  void *v160;
  id v161;
  id v162;
  void *v163;
  void *v164;
  id v165;
  id v166;
  void *v167;
  void *v168;
  id v169;
  id v170;
  void *v171;
  void *v172;
  id v173;
  id v174;
  void *v175;
  void *v176;
  id v177;
  id v178;
  void *v179;
  void *v180;
  id v181;
  void *v182;
  void *v183;
  id v184;
  void *v185;
  void *v186;
  id v187;
  void *v188;
  void *v189;
  id v190;
  void *v191;
  void *v192;
  id v193;
  uint64_t v194;
  void *v195;
  void *v196;
  id v197;
  id v198;
  void *v199;
  void *v200;
  id v201;
  id v202;
  void *v203;
  void *v204;
  id v205;
  id v206;
  void *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  id v211;
  id v212;
  void *v213;
  void *v214;
  id v215;
  void *v216;
  void *v217;
  id v218;
  void *v219;
  void *v220;
  id v221;
  id v222;
  void *v223;
  void *v224;
  id v225;
  id v226;
  void *v227;
  void *v228;
  id v229;
  id v230;
  void *v231;
  void *v232;
  id v233;
  uint64_t v234;
  void *v235;
  void *v236;
  id v237;
  void *v238;
  void *v239;
  id v240;
  id v241;
  void *v242;
  void *v243;
  id v244;
  id v245;
  void *v246;
  void *v247;
  id v248;
  id v249;
  void *v250;
  void *v251;
  id v252;
  uint64_t v253;
  void *v254;
  void *v255;
  id v256;
  void *v257;
  void *v258;
  id v259;
  void *v260;
  void *v261;
  id v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  id v269;
  void *v270;
  void *v271;
  id v272;
  uint64_t v273;
  void *v274;
  void *v275;
  id v276;
  void *v277;
  void *v278;
  id v279;
  void *v280;
  void *v281;
  id v282;
  void *v283;
  void *v284;
  id v285;
  void *v286;
  void *v287;
  id v288;
  void *v289;
  void *v290;
  id v291;
  uint64_t v292;
  void *v293;
  void *v294;
  id v295;
  void *v296;
  void *v297;
  id v298;
  void *v299;
  void *v300;
  id v301;
  void *v302;
  void *v303;
  id v304;
  void *v305;
  void *v306;
  id v307;
  void *v308;
  void *v309;
  id v310;
  uint64_t v311;
  uint64_t v312;
  id v313;
  void *v314;
  void *v315;
  id v316;
  id v317;
  void *v318;
  void *v319;
  id v320;
  id v321;
  uint64_t v322;
  void *v323;
  id v324;
  id v325;
  id v326;
  uint64_t v327;
  uint64_t v328;
  __int128 v329;
  _OWORD v330[2];
  _OWORD v331[2];
  _OWORD v332[2];
  _OWORD v333[2];
  __int128 aBlock;
  uint64_t (*v335)(uint64_t, uint64_t, uint64_t);
  void *v336;
  void (*v337)(uint64_t, uint64_t);
  uint64_t v338;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0830);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_247CA3120;
  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_restoreDefaultSettingsButton);
  if (!v2)
  {
    __break(1u);
    goto LABEL_105;
  }
  v3 = v2;
  v4 = sub_247C84B94(0, &qword_2576F0C78);
  *(_QWORD *)(v0 + 56) = v4;
  *(_QWORD *)(v0 + 32) = v3;
  v5 = (void *)sub_247C9FDA8();
  v6 = (void *)sub_247C9FDA8();
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v5, v6);

  if (!v8)
  {
LABEL_105:
    __break(1u);
    goto LABEL_106;
  }
  v9 = sub_247C9CA78(2, 0, 0);

  v10 = sub_247C84B94(0, (unint64_t *)&qword_2576F0998);
  *(_QWORD *)(v0 + 88) = v10;
  *(_QWORD *)(v0 + 64) = v9;
  v11 = (void *)sub_247C9FDA8();
  v12 = (void *)sub_247C9FDA8();
  v13 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v11, v12);

  if (!v13)
  {
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  v14 = sub_247C9CA78(2, 0, 0);

  v328 = v10;
  *(_QWORD *)(v0 + 120) = v10;
  *(_QWORD *)(v0 + 96) = v14;
  v15 = (void *)sub_247C9FDA8();
  v16 = (void *)sub_247C9FDA8();
  v17 = (void *)objc_opt_self();
  v18 = objc_msgSend(v17, sel_rowWithTitle_valueKeyPath_, v15, v16);

  if (!v18)
  {
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  v19 = (void *)objc_opt_self();
  v327 = sub_247C84B94(0, &qword_2576F09A0);
  *(_QWORD *)(v0 + 152) = v327;
  *(_QWORD *)(v0 + 128) = v18;
  v20 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v21 = (void *)sub_247C9FDA8();
  v22 = objc_msgSend(v19, sel_sectionWithRows_title_, v20, v21);

  if (!v22)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  v319 = v22;
  v326 = v19;
  v337 = sub_247C93CC0;
  v338 = 0;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v335 = sub_247C98E30;
  v336 = &block_descriptor;
  v23 = _Block_copy(&aBlock);
  swift_release();
  v24 = objc_msgSend((id)objc_opt_self(), sel_actionWithHandler_, v23);
  _Block_release(v23);
  v323 = v24;
  if (!v24)
  {
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  v321 = (id)v4;
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_247CA2C50;
  v26 = (void *)sub_247C9FDA8();
  v27 = (void *)sub_247C9FDA8();
  v28 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v26, v27);

  if (!v28)
  {
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  v29 = objc_msgSend(v28, sel_precision_, 1);

  if (!v29)
  {
LABEL_111:
    __break(1u);
    goto LABEL_112;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(&aBlock, (_OWORD *)(v25 + 32));
  v30 = (void *)sub_247C9FDA8();
  v31 = (void *)sub_247C9FDA8();
  v32 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v30, v31);

  if (!v32)
  {
LABEL_112:
    __break(1u);
    goto LABEL_113;
  }
  v33 = objc_msgSend(v32, sel_precision_, 2);

  if (!v33)
  {
LABEL_113:
    __break(1u);
    goto LABEL_114;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v333, (_OWORD *)(v25 + 64));
  v34 = (void *)sub_247C9FDA8();
  v35 = (void *)sub_247C9FDA8();
  v36 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v34, v35);

  if (!v36)
  {
LABEL_114:
    __break(1u);
    goto LABEL_115;
  }
  v37 = objc_msgSend(v36, sel_precision_, 2);

  if (!v37)
  {
LABEL_115:
    __break(1u);
    goto LABEL_116;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v332, (_OWORD *)(v25 + 96));
  v38 = (void *)sub_247C9FDA8();
  v39 = (void *)sub_247C9FDA8();
  v40 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v38, v39);

  if (!v40)
  {
LABEL_116:
    __break(1u);
    goto LABEL_117;
  }
  v41 = objc_msgSend(v40, sel_precision_, 2);

  if (!v41)
  {
LABEL_117:
    __break(1u);
    goto LABEL_118;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v331, (_OWORD *)(v25 + 128));
  v42 = (void *)sub_247C9FDA8();
  v43 = (void *)sub_247C9FDA8();
  v44 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v42, v43);

  if (!v44)
  {
LABEL_118:
    __break(1u);
    goto LABEL_119;
  }
  v45 = objc_msgSend(v44, sel_precision_, 2);

  if (!v45)
  {
LABEL_119:
    __break(1u);
    goto LABEL_120;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v330, (_OWORD *)(v25 + 160));
  v46 = (void *)sub_247C9FDA8();
  v47 = (void *)sub_247C9FDA8();
  v48 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v46, v47);

  if (!v48)
  {
LABEL_120:
    __break(1u);
    goto LABEL_121;
  }
  v325 = v17;
  v49 = objc_msgSend(v48, sel_precision_, 2);

  if (!v49)
  {
LABEL_121:
    __break(1u);
    goto LABEL_122;
  }
  v320 = v1;
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(&v329, (_OWORD *)(v25 + 192));
  v50 = (void *)sub_247C9FDA8();
  v51 = (void *)sub_247C9FDA8();
  v52 = (void *)objc_opt_self();
  v53 = objc_msgSend(v52, sel_rowWithTitle_childSettingsKeyPath_, v50, v51);

  if (!v53)
  {
LABEL_122:
    __break(1u);
    goto LABEL_123;
  }
  v54 = sub_247C84B94(0, &qword_2576F0838);
  *(_QWORD *)(v25 + 248) = v54;
  *(_QWORD *)(v25 + 224) = v53;
  v55 = (void *)sub_247C9FDA8();
  v56 = (void *)sub_247C9FDA8();
  v57 = objc_msgSend(v52, sel_rowWithTitle_childSettingsKeyPath_, v55, v56);

  if (!v57)
  {
LABEL_123:
    __break(1u);
    goto LABEL_124;
  }
  *(_QWORD *)(v25 + 280) = v54;
  *(_QWORD *)(v25 + 256) = v57;
  v58 = (void *)sub_247C9FDA8();
  v59 = (void *)sub_247C9FDA8();
  v60 = objc_msgSend(v52, (SEL)0x25194BE72, v58, v59);

  if (!v60)
  {
LABEL_124:
    __break(1u);
    goto LABEL_125;
  }
  *(_QWORD *)(v25 + 312) = v54;
  *(_QWORD *)(v25 + 288) = v60;
  v61 = (void *)sub_247C9FDA8();
  v62 = (void *)sub_247C9FDA8();
  v63 = objc_msgSend(v52, (SEL)0x25194BE72, v61, v62);

  if (!v63)
  {
LABEL_125:
    __break(1u);
    goto LABEL_126;
  }
  *(_QWORD *)(v25 + 344) = v54;
  *(_QWORD *)(v25 + 320) = v63;
  v64 = (void *)sub_247C9FDA8();
  v65 = (void *)sub_247C9FDA8();
  v66 = objc_msgSend(v52, (SEL)0x25194BE72, v64, v65);

  if (!v66)
  {
LABEL_126:
    __break(1u);
    goto LABEL_127;
  }
  *(_QWORD *)(v25 + 376) = v54;
  *(_QWORD *)(v25 + 352) = v66;
  v67 = (void *)sub_247C9FDA8();
  v68 = (void *)sub_247C9FDA8();
  v69 = objc_msgSend(v52, (SEL)0x25194BE72, v67, v68);

  if (!v69)
  {
LABEL_127:
    __break(1u);
    goto LABEL_128;
  }
  *(_QWORD *)(v25 + 408) = v54;
  *(_QWORD *)(v25 + 384) = v69;
  v70 = (void *)sub_247C9FDA8();
  v71 = (void *)sub_247C9FDA8();
  v72 = objc_msgSend(v52, (SEL)0x25194BE72, v70, v71);

  if (!v72)
  {
LABEL_128:
    __break(1u);
    goto LABEL_129;
  }
  *(_QWORD *)(v25 + 440) = v54;
  *(_QWORD *)(v25 + 416) = v72;
  v73 = (void *)sub_247C9FDA8();
  v74 = (void *)sub_247C9FDA8();
  v75 = objc_msgSend(v52, (SEL)0x25194BE72, v73, v74);

  if (!v75)
  {
LABEL_129:
    __break(1u);
    goto LABEL_130;
  }
  *(_QWORD *)(v25 + 472) = v54;
  *(_QWORD *)(v25 + 448) = v75;
  v76 = (void *)sub_247C9FDA8();
  v77 = (void *)sub_247C9FDA8();
  v78 = objc_msgSend(v52, (SEL)0x25194BE72, v76, v77);

  if (!v78)
  {
LABEL_130:
    __break(1u);
    goto LABEL_131;
  }
  *(_QWORD *)(v25 + 504) = v54;
  *(_QWORD *)(v25 + 480) = v78;
  v79 = (void *)sub_247C9FDA8();
  v80 = (void *)sub_247C9FDA8();
  v81 = objc_msgSend(v52, (SEL)0x25194BE72, v79, v80);

  if (!v81)
  {
LABEL_131:
    __break(1u);
    goto LABEL_132;
  }
  v322 = v54;
  *(_QWORD *)(v25 + 536) = v54;
  *(_QWORD *)(v25 + 512) = v81;
  v82 = v323;
  v83 = (void *)sub_247C9FDA8();
  v84 = objc_msgSend(v320, sel_rowWithTitle_action_, v83, v82);

  if (!v84)
  {
LABEL_132:
    __break(1u);
    goto LABEL_133;
  }
  *(_QWORD *)(v25 + 568) = v321;
  *(_QWORD *)(v25 + 544) = v84;
  v85 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v86 = (void *)sub_247C9FDA8();
  v87 = objc_msgSend(v326, sel_sectionWithRows_title_, v85, v86);

  if (!v87)
  {
LABEL_133:
    __break(1u);
    goto LABEL_134;
  }
  v88 = swift_allocObject();
  *(_OWORD *)(v88 + 16) = xmmword_247CA3130;
  v89 = (void *)sub_247C9FDA8();
  v90 = (void *)sub_247C9FDA8();
  v91 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v89, v90);

  if (!v91)
  {
LABEL_134:
    __break(1u);
    goto LABEL_135;
  }
  v318 = v82;
  v92 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v88 + 56) = v328;
  *(_QWORD *)(v88 + 32) = v92;
  v93 = (void *)sub_247C9FDA8();
  v94 = (void *)sub_247C9FDA8();
  v95 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v93, v94);

  if (!v95)
  {
LABEL_135:
    __break(1u);
    goto LABEL_136;
  }
  v96 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v88 + 88) = v328;
  *(_QWORD *)(v88 + 64) = v96;
  v97 = (void *)sub_247C9FDA8();
  v98 = (void *)sub_247C9FDA8();
  v99 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v97, v98);

  if (!v99)
  {
LABEL_136:
    __break(1u);
    goto LABEL_137;
  }
  v100 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v88 + 120) = v328;
  *(_QWORD *)(v88 + 96) = v100;
  v101 = (void *)sub_247C9FDA8();
  v102 = (void *)sub_247C9FDA8();
  v103 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v101, v102);

  if (!v103)
  {
LABEL_137:
    __break(1u);
    goto LABEL_138;
  }
  v104 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v88 + 152) = v328;
  *(_QWORD *)(v88 + 128) = v104;
  v105 = (void *)sub_247C9FDA8();
  v106 = (void *)sub_247C9FDA8();
  v107 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v105, v106);

  if (!v107)
  {
LABEL_138:
    __break(1u);
    goto LABEL_139;
  }
  v108 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v88 + 184) = v328;
  *(_QWORD *)(v88 + 160) = v108;
  v109 = (void *)sub_247C9FDA8();
  v110 = (void *)sub_247C9FDA8();
  v111 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v109, v110);

  if (!v111)
  {
LABEL_139:
    __break(1u);
    goto LABEL_140;
  }
  *(_QWORD *)(v88 + 216) = v327;
  *(_QWORD *)(v88 + 192) = v111;
  v112 = (void *)sub_247C9FDA8();
  v113 = (void *)sub_247C9FDA8();
  v114 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v112, v113);

  if (!v114)
  {
LABEL_140:
    __break(1u);
    goto LABEL_141;
  }
  v115 = sub_247C9CA78(2, 0, 0);

  sub_247C84B94(0, &qword_2576F0980);
  v116 = (void *)sub_247C9FE5C();
  if (!objc_msgSend(v115, sel_condition_, v116))
  {
LABEL_141:
    __break(1u);
    goto LABEL_142;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v333, &aBlock);
  swift_dynamicCast();
  v117 = *(_QWORD *)&v332[0];

  *(_QWORD *)(v88 + 248) = v328;
  *(_QWORD *)(v88 + 224) = v117;
  v118 = (void *)sub_247C9FDA8();
  v119 = (void *)sub_247C9FDA8();
  v120 = objc_msgSend(v325, (SEL)0x25194BE95, v118, v119);

  if (!v120)
  {
LABEL_142:
    __break(1u);
    goto LABEL_143;
  }
  *(_QWORD *)(v88 + 280) = v327;
  *(_QWORD *)(v88 + 256) = v120;
  v121 = (void *)sub_247C9FDA8();
  v122 = (void *)sub_247C9FDA8();
  v123 = objc_msgSend(v7, (SEL)0x25194BE95, v121, v122);

  if (!v123)
  {
LABEL_143:
    __break(1u);
    goto LABEL_144;
  }
  v124 = sub_247C9CA78(2, 0, 0);

  v125 = (void *)sub_247C9FE5C();
  if (!objc_msgSend(v124, sel_condition_, v125))
  {
LABEL_144:
    __break(1u);
    goto LABEL_145;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v333, &aBlock);
  swift_dynamicCast();
  v126 = *(_QWORD *)&v332[0];

  *(_QWORD *)(v88 + 312) = v328;
  *(_QWORD *)(v88 + 288) = v126;
  v127 = (void *)sub_247C9FDA8();
  v128 = (void *)sub_247C9FDA8();
  v129 = objc_msgSend(v325, (SEL)0x25194BE95, v127, v128);

  if (!v129)
  {
LABEL_145:
    __break(1u);
    goto LABEL_146;
  }
  *(_QWORD *)(v88 + 344) = v327;
  *(_QWORD *)(v88 + 320) = v129;
  v130 = (void *)sub_247C9FDA8();
  v131 = (void *)sub_247C9FDA8();
  v132 = objc_msgSend(v7, (SEL)0x25194BE95, v130, v131);

  if (!v132)
  {
LABEL_146:
    __break(1u);
    goto LABEL_147;
  }
  v133 = sub_247C9CA78(2, 0, 0);

  v134 = (void *)sub_247C9FE5C();
  if (!objc_msgSend(v133, sel_condition_, v134))
  {
LABEL_147:
    __break(1u);
    goto LABEL_148;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v333, &aBlock);
  swift_dynamicCast();
  v135 = *(_QWORD *)&v332[0];

  *(_QWORD *)(v88 + 376) = v328;
  *(_QWORD *)(v88 + 352) = v135;
  v136 = (void *)sub_247C9FDA8();
  v137 = (void *)sub_247C9FDA8();
  v138 = objc_msgSend(v325, (SEL)0x25194BE95, v136, v137);

  if (!v138)
  {
LABEL_148:
    __break(1u);
    goto LABEL_149;
  }
  *(_QWORD *)(v88 + 408) = v327;
  *(_QWORD *)(v88 + 384) = v138;
  v139 = (void *)sub_247C9FDA8();
  v140 = (void *)sub_247C9FDA8();
  v141 = objc_msgSend(v7, (SEL)0x25194BE95, v139, v140);

  if (!v141)
  {
LABEL_149:
    __break(1u);
    goto LABEL_150;
  }
  v317 = v87;
  v142 = sub_247C9CA78(2, 0, 0);

  v143 = (void *)sub_247C9FE5C();
  if (!objc_msgSend(v142, sel_condition_, v143))
  {
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v333, &aBlock);
  swift_dynamicCast();
  v144 = *(_QWORD *)&v332[0];

  *(_QWORD *)(v88 + 440) = v328;
  *(_QWORD *)(v88 + 416) = v144;
  v145 = (void *)sub_247C9FDA8();
  v146 = (void *)sub_247C9FDA8();
  v147 = objc_msgSend(v52, sel_rowWithTitle_childSettingsKeyPath_, v145, v146);

  if (!v147)
  {
LABEL_151:
    __break(1u);
    goto LABEL_152;
  }
  *(_QWORD *)(v88 + 472) = v54;
  *(_QWORD *)(v88 + 448) = v147;
  v148 = (void *)sub_247C9FDA8();
  v149 = (void *)sub_247C9FDA8();
  v150 = objc_msgSend(v52, sel_rowWithTitle_childSettingsKeyPath_, v148, v149);

  if (!v150)
  {
LABEL_152:
    __break(1u);
    goto LABEL_153;
  }
  *(_QWORD *)(v88 + 504) = v54;
  *(_QWORD *)(v88 + 480) = v150;
  v151 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v152 = (void *)sub_247C9FDA8();
  v153 = objc_msgSend(v326, sel_sectionWithRows_title_, v151, v152);

  if (!v153)
  {
LABEL_153:
    __break(1u);
    goto LABEL_154;
  }
  v154 = swift_allocObject();
  *(_OWORD *)(v154 + 16) = xmmword_247CA3140;
  v155 = (void *)sub_247C9FDA8();
  v156 = (void *)sub_247C9FDA8();
  v157 = objc_msgSend(v7, (SEL)0x25194BE95, v155, v156);

  if (!v157)
  {
LABEL_154:
    __break(1u);
    goto LABEL_155;
  }
  v158 = objc_msgSend(v157, sel_precision_, 2);

  if (!v158)
  {
LABEL_155:
    __break(1u);
    goto LABEL_156;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(&aBlock, (_OWORD *)(v154 + 32));
  v159 = (void *)sub_247C9FDA8();
  v160 = (void *)sub_247C9FDA8();
  v161 = objc_msgSend(v7, (SEL)0x25194BE95, v159, v160);

  if (!v161)
  {
LABEL_156:
    __break(1u);
    goto LABEL_157;
  }
  v162 = objc_msgSend(v161, sel_precision_, 2);

  if (!v162)
  {
LABEL_157:
    __break(1u);
    goto LABEL_158;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v333, (_OWORD *)(v154 + 64));
  v163 = (void *)sub_247C9FDA8();
  v164 = (void *)sub_247C9FDA8();
  v165 = objc_msgSend(v7, (SEL)0x25194BE95, v163, v164);

  if (!v165)
  {
LABEL_158:
    __break(1u);
    goto LABEL_159;
  }
  v166 = objc_msgSend(v165, sel_precision_, 2);

  if (!v166)
  {
LABEL_159:
    __break(1u);
    goto LABEL_160;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v332, (_OWORD *)(v154 + 96));
  v167 = (void *)sub_247C9FDA8();
  v168 = (void *)sub_247C9FDA8();
  v169 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v167, v168);

  if (!v169)
  {
LABEL_160:
    __break(1u);
    goto LABEL_161;
  }
  v170 = objc_msgSend(v169, sel_precision_, 2);

  if (!v170)
  {
LABEL_161:
    __break(1u);
    goto LABEL_162;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v331, (_OWORD *)(v154 + 128));
  v171 = (void *)sub_247C9FDA8();
  v172 = (void *)sub_247C9FDA8();
  v173 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v171, v172);

  if (!v173)
  {
LABEL_162:
    __break(1u);
    goto LABEL_163;
  }
  v174 = objc_msgSend(v173, sel_precision_, 2);

  if (!v174)
  {
LABEL_163:
    __break(1u);
    goto LABEL_164;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v330, (_OWORD *)(v154 + 160));
  v175 = (void *)sub_247C9FDA8();
  v176 = (void *)sub_247C9FDA8();
  v177 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v175, v176);

  if (!v177)
  {
LABEL_164:
    __break(1u);
    goto LABEL_165;
  }
  v178 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v154 + 216) = v328;
  *(_QWORD *)(v154 + 192) = v178;
  v179 = (void *)sub_247C9FDA8();
  v180 = (void *)sub_247C9FDA8();
  v181 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v179, v180);

  if (!v181)
  {
LABEL_165:
    __break(1u);
    goto LABEL_166;
  }
  v316 = v153;
  *(_QWORD *)(v154 + 248) = v327;
  *(_QWORD *)(v154 + 224) = v181;
  v182 = (void *)sub_247C9FDA8();
  v183 = (void *)sub_247C9FDA8();
  v184 = objc_msgSend(v52, sel_rowWithTitle_childSettingsKeyPath_, v182, v183);

  if (!v184)
  {
LABEL_166:
    __break(1u);
    goto LABEL_167;
  }
  *(_QWORD *)(v154 + 280) = v322;
  *(_QWORD *)(v154 + 256) = v184;
  v185 = (void *)sub_247C9FDA8();
  v186 = (void *)sub_247C9FDA8();
  v187 = objc_msgSend(v52, sel_rowWithTitle_childSettingsKeyPath_, v185, v186);

  if (!v187)
  {
LABEL_167:
    __break(1u);
    goto LABEL_168;
  }
  *(_QWORD *)(v154 + 312) = v322;
  *(_QWORD *)(v154 + 288) = v187;
  v188 = (void *)sub_247C9FDA8();
  v189 = (void *)sub_247C9FDA8();
  v190 = objc_msgSend(v52, sel_rowWithTitle_childSettingsKeyPath_, v188, v189);

  if (!v190)
  {
LABEL_168:
    __break(1u);
    goto LABEL_169;
  }
  *(_QWORD *)(v154 + 344) = v322;
  *(_QWORD *)(v154 + 320) = v190;
  v191 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v192 = (void *)sub_247C9FDA8();
  v193 = objc_msgSend(v326, sel_sectionWithRows_title_, v191, v192);

  if (!v193)
  {
LABEL_169:
    __break(1u);
    goto LABEL_170;
  }
  v194 = swift_allocObject();
  *(_OWORD *)(v194 + 16) = xmmword_247CA3150;
  v195 = (void *)sub_247C9FDA8();
  v196 = (void *)sub_247C9FDA8();
  v197 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v195, v196);

  if (!v197)
  {
LABEL_170:
    __break(1u);
    goto LABEL_171;
  }
  v198 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v194 + 56) = v328;
  *(_QWORD *)(v194 + 32) = v198;
  v199 = (void *)sub_247C9FDA8();
  v200 = (void *)sub_247C9FDA8();
  v201 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v199, v200);

  if (!v201)
  {
LABEL_171:
    __break(1u);
    goto LABEL_172;
  }
  v202 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v194 + 88) = v328;
  *(_QWORD *)(v194 + 64) = v202;
  v203 = (void *)sub_247C9FDA8();
  v204 = (void *)sub_247C9FDA8();
  v205 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v203, v204);

  if (!v205)
  {
LABEL_172:
    __break(1u);
    goto LABEL_173;
  }
  v206 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)&aBlock = 0;
  *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
  sub_247C9FEA4();
  swift_bridgeObjectRelease();
  *(_QWORD *)&aBlock = 0xD000000000000018;
  *((_QWORD *)&aBlock + 1) = 0x8000000247CA6820;
  *(_QWORD *)&v333[0] = 2;
  sub_247C9FF1C();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  v207 = (void *)sub_247C9FE5C();
  swift_bridgeObjectRelease();
  if (!objc_msgSend(v206, sel_condition_, v207))
  {
LABEL_173:
    __break(1u);
    goto LABEL_174;
  }
  v324 = v193;
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v333, &aBlock);
  swift_dynamicCast();
  v208 = *(_QWORD *)&v332[0];

  *(_QWORD *)(v194 + 120) = v328;
  *(_QWORD *)(v194 + 96) = v208;
  v209 = (void *)sub_247C9FDA8();
  v210 = (void *)sub_247C9FDA8();
  v211 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v209, v210);

  if (!v211)
  {
LABEL_174:
    __break(1u);
    goto LABEL_175;
  }
  v212 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v194 + 152) = v328;
  *(_QWORD *)(v194 + 128) = v212;
  v213 = (void *)sub_247C9FDA8();
  v214 = (void *)sub_247C9FDA8();
  v215 = objc_msgSend(v52, sel_rowWithTitle_childSettingsKeyPath_, v213, v214);

  if (!v215)
  {
LABEL_175:
    __break(1u);
    goto LABEL_176;
  }
  *(_QWORD *)(v194 + 184) = v322;
  *(_QWORD *)(v194 + 160) = v215;
  v216 = (void *)sub_247C9FDA8();
  v217 = (void *)sub_247C9FDA8();
  v218 = objc_msgSend(v52, sel_rowWithTitle_childSettingsKeyPath_, v216, v217);

  if (!v218)
  {
LABEL_176:
    __break(1u);
    goto LABEL_177;
  }
  *(_QWORD *)(v194 + 216) = v322;
  *(_QWORD *)(v194 + 192) = v218;
  v219 = (void *)sub_247C9FDA8();
  v220 = (void *)sub_247C9FDA8();
  v221 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v219, v220);

  if (!v221)
  {
LABEL_177:
    __break(1u);
    goto LABEL_178;
  }
  v222 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v194 + 248) = v328;
  *(_QWORD *)(v194 + 224) = v222;
  v223 = (void *)sub_247C9FDA8();
  v224 = (void *)sub_247C9FDA8();
  v225 = objc_msgSend(v7, (SEL)0x25194BE95, v223, v224);

  if (!v225)
  {
LABEL_178:
    __break(1u);
    goto LABEL_179;
  }
  v226 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v194 + 280) = v328;
  *(_QWORD *)(v194 + 256) = v226;
  v227 = (void *)sub_247C9FDA8();
  v228 = (void *)sub_247C9FDA8();
  v229 = objc_msgSend(v7, (SEL)0x25194BE95, v227, v228);

  if (!v229)
  {
LABEL_179:
    __break(1u);
    goto LABEL_180;
  }
  v230 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v194 + 312) = v328;
  *(_QWORD *)(v194 + 288) = v230;
  v231 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v232 = (void *)sub_247C9FDA8();
  v233 = objc_msgSend(v326, sel_sectionWithRows_title_, v231, v232);

  if (!v233)
  {
LABEL_180:
    __break(1u);
    goto LABEL_181;
  }
  v234 = swift_allocObject();
  *(_OWORD *)(v234 + 16) = xmmword_247CA3120;
  v235 = (void *)sub_247C9FDA8();
  v236 = (void *)sub_247C9FDA8();
  v237 = objc_msgSend(v52, sel_rowWithTitle_childSettingsKeyPath_, v235, v236);

  if (!v237)
  {
LABEL_181:
    __break(1u);
    goto LABEL_182;
  }
  *(_QWORD *)(v234 + 56) = v322;
  *(_QWORD *)(v234 + 32) = v237;
  v238 = (void *)sub_247C9FDA8();
  v239 = (void *)sub_247C9FDA8();
  v240 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v238, v239);

  if (!v240)
  {
LABEL_182:
    __break(1u);
    goto LABEL_183;
  }
  v241 = objc_msgSend(v240, sel_precision_, 3);

  if (!v241)
  {
LABEL_183:
    __break(1u);
    goto LABEL_184;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(&aBlock, (_OWORD *)(v234 + 64));
  v242 = (void *)sub_247C9FDA8();
  v243 = (void *)sub_247C9FDA8();
  v244 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v242, v243);

  if (!v244)
  {
LABEL_184:
    __break(1u);
    goto LABEL_185;
  }
  v245 = objc_msgSend(v244, sel_precision_, 3);

  if (!v245)
  {
LABEL_185:
    __break(1u);
    goto LABEL_186;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v333, (_OWORD *)(v234 + 96));
  v246 = (void *)sub_247C9FDA8();
  v247 = (void *)sub_247C9FDA8();
  v248 = objc_msgSend(v7, sel_rowWithTitle_valueKeyPath_, v246, v247);

  if (!v248)
  {
LABEL_186:
    __break(1u);
    goto LABEL_187;
  }
  v249 = objc_msgSend(v248, sel_precision_, 3);

  if (!v249)
  {
LABEL_187:
    __break(1u);
    goto LABEL_188;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v332, (_OWORD *)(v234 + 128));
  v250 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v251 = (void *)sub_247C9FDA8();
  v252 = objc_msgSend(v326, sel_sectionWithRows_title_, v250, v251);

  if (!v252)
  {
LABEL_188:
    __break(1u);
    goto LABEL_189;
  }
  v253 = swift_allocObject();
  *(_OWORD *)(v253 + 16) = xmmword_247CA3160;
  v254 = (void *)sub_247C9FDA8();
  v255 = (void *)sub_247C9FDA8();
  v256 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v254, v255);

  if (!v256)
  {
LABEL_189:
    __break(1u);
    goto LABEL_190;
  }
  *(_QWORD *)(v253 + 56) = v327;
  *(_QWORD *)(v253 + 32) = v256;
  v257 = (void *)sub_247C9FDA8();
  v258 = (void *)sub_247C9FDA8();
  v259 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v257, v258);

  if (!v259)
  {
LABEL_190:
    __break(1u);
    goto LABEL_191;
  }
  *(_QWORD *)(v253 + 88) = v327;
  *(_QWORD *)(v253 + 64) = v259;
  v260 = (void *)sub_247C9FDA8();
  v261 = (void *)sub_247C9FDA8();
  v262 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_valueKeyPath_, v260, v261);

  if (!v262)
  {
LABEL_191:
    __break(1u);
    goto LABEL_192;
  }
  v263 = swift_allocObject();
  *(_OWORD *)(v263 + 16) = xmmword_247CA3160;
  *(_QWORD *)(v263 + 32) = 0;
  v264 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v263 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v263 + 64) = 1;
  *(_QWORD *)(v263 + 120) = v264;
  *(_QWORD *)(v263 + 88) = v264;
  *(_QWORD *)(v263 + 96) = 2;
  v265 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v266 = swift_allocObject();
  *(_OWORD *)(v266 + 16) = xmmword_247CA3160;
  v267 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v266 + 32) = 1701736270;
  *(_QWORD *)(v266 + 40) = 0xE400000000000000;
  *(_QWORD *)(v266 + 56) = v267;
  strcpy((char *)(v266 + 64), "Intelligence");
  *(_BYTE *)(v266 + 77) = 0;
  *(_WORD *)(v266 + 78) = -5120;
  *(_QWORD *)(v266 + 120) = v267;
  *(_QWORD *)(v266 + 88) = v267;
  *(_QWORD *)(v266 + 96) = 0x6574696857;
  *(_QWORD *)(v266 + 104) = 0xE500000000000000;
  v268 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v269 = objc_msgSend(v262, sel_possibleValues_titles_, v265, v268);

  if (!v269)
  {
LABEL_192:
    __break(1u);
    goto LABEL_193;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(&aBlock, (_OWORD *)(v253 + 96));
  v270 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v271 = (void *)sub_247C9FDA8();
  v272 = objc_msgSend(v326, sel_sectionWithRows_title_, v270, v271);

  if (!v272)
  {
LABEL_193:
    __break(1u);
    goto LABEL_194;
  }
  v273 = swift_allocObject();
  *(_OWORD *)(v273 + 16) = xmmword_247CA3170;
  v274 = (void *)sub_247C9FDA8();
  v275 = (void *)sub_247C9FDA8();
  v276 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v274, v275);

  if (!v276)
  {
LABEL_194:
    __break(1u);
    goto LABEL_195;
  }
  *(_QWORD *)(v273 + 56) = v327;
  *(_QWORD *)(v273 + 32) = v276;
  v277 = (void *)sub_247C9FDA8();
  v278 = (void *)sub_247C9FDA8();
  v279 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v277, v278);

  if (!v279)
  {
LABEL_195:
    __break(1u);
    goto LABEL_196;
  }
  *(_QWORD *)(v273 + 88) = v327;
  *(_QWORD *)(v273 + 64) = v279;
  v280 = (void *)sub_247C9FDA8();
  v281 = (void *)sub_247C9FDA8();
  v282 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v280, v281);

  if (!v282)
  {
LABEL_196:
    __break(1u);
    goto LABEL_197;
  }
  *(_QWORD *)(v273 + 120) = v327;
  *(_QWORD *)(v273 + 96) = v282;
  v283 = (void *)sub_247C9FDA8();
  v284 = (void *)sub_247C9FDA8();
  v285 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v283, v284);

  if (!v285)
  {
LABEL_197:
    __break(1u);
    goto LABEL_198;
  }
  *(_QWORD *)(v273 + 152) = v327;
  *(_QWORD *)(v273 + 128) = v285;
  v286 = (void *)sub_247C9FDA8();
  v287 = (void *)sub_247C9FDA8();
  v288 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v286, v287);

  if (!v288)
  {
LABEL_198:
    __break(1u);
    goto LABEL_199;
  }
  *(_QWORD *)(v273 + 184) = v327;
  *(_QWORD *)(v273 + 160) = v288;
  v289 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v290 = (void *)sub_247C9FDA8();
  v291 = objc_msgSend(v326, sel_sectionWithRows_title_, v289, v290);

  if (!v291)
  {
LABEL_199:
    __break(1u);
    goto LABEL_200;
  }
  v292 = swift_allocObject();
  *(_OWORD *)(v292 + 16) = xmmword_247CA3170;
  v293 = (void *)sub_247C9FDA8();
  v294 = (void *)sub_247C9FDA8();
  v295 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v293, v294);

  if (!v295)
  {
LABEL_200:
    __break(1u);
    goto LABEL_201;
  }
  *(_QWORD *)(v292 + 56) = v327;
  *(_QWORD *)(v292 + 32) = v295;
  v296 = (void *)sub_247C9FDA8();
  v297 = (void *)sub_247C9FDA8();
  v298 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v296, v297);

  if (!v298)
  {
LABEL_201:
    __break(1u);
    goto LABEL_202;
  }
  *(_QWORD *)(v292 + 88) = v327;
  *(_QWORD *)(v292 + 64) = v298;
  v299 = (void *)sub_247C9FDA8();
  v300 = (void *)sub_247C9FDA8();
  v301 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v299, v300);

  if (!v301)
  {
LABEL_202:
    __break(1u);
    goto LABEL_203;
  }
  *(_QWORD *)(v292 + 120) = v327;
  *(_QWORD *)(v292 + 96) = v301;
  v302 = (void *)sub_247C9FDA8();
  v303 = (void *)sub_247C9FDA8();
  v304 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v302, v303);

  if (!v304)
  {
LABEL_203:
    __break(1u);
    goto LABEL_204;
  }
  *(_QWORD *)(v292 + 152) = v327;
  *(_QWORD *)(v292 + 128) = v304;
  v305 = (void *)sub_247C9FDA8();
  v306 = (void *)sub_247C9FDA8();
  v307 = objc_msgSend(v325, sel_rowWithTitle_valueKeyPath_, v305, v306);

  if (!v307)
  {
LABEL_204:
    __break(1u);
    goto LABEL_205;
  }
  *(_QWORD *)(v292 + 184) = v327;
  *(_QWORD *)(v292 + 160) = v307;
  v308 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v309 = (void *)sub_247C9FDA8();
  v310 = objc_msgSend(v326, sel_sectionWithRows_title_, v308, v309);

  if (v310)
  {
    v311 = swift_allocObject();
    *(_OWORD *)(v311 + 16) = xmmword_247CA3150;
    v312 = sub_247C84B94(0, &qword_2576F0840);
    *(_QWORD *)(v311 + 32) = v319;
    *(_QWORD *)(v311 + 56) = v312;
    *(_QWORD *)(v311 + 64) = v317;
    *(_QWORD *)(v311 + 88) = v312;
    *(_QWORD *)(v311 + 96) = v316;
    *(_QWORD *)(v311 + 120) = v312;
    *(_QWORD *)(v311 + 128) = v324;
    *(_QWORD *)(v311 + 152) = v312;
    *(_QWORD *)(v311 + 160) = v233;
    *(_QWORD *)(v311 + 184) = v312;
    *(_QWORD *)(v311 + 192) = v252;
    *(_QWORD *)(v311 + 216) = v312;
    *(_QWORD *)(v311 + 224) = v272;
    *(_QWORD *)(v311 + 248) = v312;
    *(_QWORD *)(v311 + 256) = v291;
    *(_QWORD *)(v311 + 312) = v312;
    *(_QWORD *)(v311 + 280) = v312;
    *(_QWORD *)(v311 + 288) = v310;
    v313 = v319;
    v314 = (void *)sub_247C9FDA8();
    v315 = (void *)sub_247C9FDFC();
    swift_bridgeObjectRelease();
    objc_msgSend(v326, sel_moduleWithTitle_contents_, v314, v315);

    return;
  }
LABEL_205:
  __break(1u);
}

char *keypath_get_selector_maximumHintDuration()
{
  return sel_maximumHintDuration;
}

id sub_247C9762C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_maximumHintDuration);
  *a2 = v4;
  return result;
}

id sub_247C9765C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMaximumHintDuration_, *a1);
}

char *keypath_get_selector_totalDuration()
{
  return sel_totalDuration;
}

id sub_247C9767C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_totalDuration);
  *a2 = v4;
  return result;
}

id sub_247C976AC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTotalDuration_, *a1);
}

char *keypath_get_selector_visualizeEffectMasks()
{
  return sel_visualizeEffectMasks;
}

id sub_247C976CC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_visualizeEffectMasks);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C976FC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVisualizeEffectMasks_, *a1);
}

char *keypath_get_selector_donutMaskInitialEdgeOutsetProportion()
{
  return sel_donutMaskInitialEdgeOutsetProportion;
}

id sub_247C9771C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_donutMaskInitialEdgeOutsetProportion);
  *a2 = v4;
  return result;
}

id sub_247C9774C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDonutMaskInitialEdgeOutsetProportion_, *a1);
}

char *keypath_get_selector_finalFitVsDiameterRatioShortEdgeSmallScreen()
{
  return sel_finalFitVsDiameterRatioShortEdgeSmallScreen;
}

id sub_247C9776C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_finalFitVsDiameterRatioShortEdgeSmallScreen);
  *a2 = v4;
  return result;
}

id sub_247C9779C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFinalFitVsDiameterRatioShortEdgeSmallScreen_, *a1);
}

char *keypath_get_selector_finalFitVsDiameterRatioLongEdgeSmallScreen()
{
  return sel_finalFitVsDiameterRatioLongEdgeSmallScreen;
}

id sub_247C977BC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_finalFitVsDiameterRatioLongEdgeSmallScreen);
  *a2 = v4;
  return result;
}

id sub_247C977EC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFinalFitVsDiameterRatioLongEdgeSmallScreen_, *a1);
}

char *keypath_get_selector_finalFitVsDiameterRatioShortEdgeBigScreen()
{
  return sel_finalFitVsDiameterRatioShortEdgeBigScreen;
}

id sub_247C9780C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_finalFitVsDiameterRatioShortEdgeBigScreen);
  *a2 = v4;
  return result;
}

id sub_247C9783C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFinalFitVsDiameterRatioShortEdgeBigScreen_, *a1);
}

char *keypath_get_selector_finalFitVsDiameterRatioLongEdgeBigScreen()
{
  return sel_finalFitVsDiameterRatioLongEdgeBigScreen;
}

id sub_247C9785C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_finalFitVsDiameterRatioLongEdgeBigScreen);
  *a2 = v4;
  return result;
}

id sub_247C9788C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFinalFitVsDiameterRatioLongEdgeBigScreen_, *a1);
}

char *keypath_get_selector_edgeLightHintTransitionDelay()
{
  return sel_edgeLightHintTransitionDelay;
}

id sub_247C978AC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_edgeLightHintTransitionDelay);
  *a2 = v4;
  return result;
}

id sub_247C978DC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeLightHintTransitionDelay_, *a1);
}

char *keypath_get_selector_donutMaskEndTransitionDelay()
{
  return sel_donutMaskEndTransitionDelay;
}

id sub_247C978FC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_donutMaskEndTransitionDelay);
  *a2 = v4;
  return result;
}

id sub_247C9792C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDonutMaskEndTransitionDelay_, *a1);
}

char *keypath_get_selector_donutMaskPositionAnimationSettings()
{
  return sel_donutMaskPositionAnimationSettings;
}

id sub_247C9794C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_donutMaskPositionAnimationSettings);
  *a2 = result;
  return result;
}

id sub_247C97984(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDonutMaskPositionAnimationSettings_, *a1);
}

char *keypath_get_selector_chromaticAberrationInitialDonutMask()
{
  return sel_chromaticAberrationInitialDonutMask;
}

id sub_247C979A4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_chromaticAberrationInitialDonutMask);
  *a2 = result;
  return result;
}

id sub_247C979DC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setChromaticAberrationInitialDonutMask_, *a1);
}

char *keypath_get_selector_chromaticAberrationFinalDonutMaskSmallScreen()
{
  return sel_chromaticAberrationFinalDonutMaskSmallScreen;
}

id sub_247C979FC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_chromaticAberrationFinalDonutMaskSmallScreen);
  *a2 = result;
  return result;
}

id sub_247C97A34(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setChromaticAberrationFinalDonutMaskSmallScreen_, *a1);
}

char *keypath_get_selector_chromaticAberrationFinalDonutMaskLargeScreen()
{
  return sel_chromaticAberrationFinalDonutMaskLargeScreen;
}

id sub_247C97A54@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_chromaticAberrationFinalDonutMaskLargeScreen);
  *a2 = result;
  return result;
}

id sub_247C97A8C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setChromaticAberrationFinalDonutMaskLargeScreen_, *a1);
}

char *keypath_get_selector_colorFillInitialCircleMask()
{
  return sel_colorFillInitialCircleMask;
}

id sub_247C97AAC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_colorFillInitialCircleMask);
  *a2 = result;
  return result;
}

id sub_247C97AE4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setColorFillInitialCircleMask_, *a1);
}

char *keypath_get_selector_colorFillHintCircleMask()
{
  return sel_colorFillHintCircleMask;
}

id sub_247C97B04@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_colorFillHintCircleMask);
  *a2 = result;
  return result;
}

id sub_247C97B3C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setColorFillHintCircleMask_, *a1);
}

char *keypath_get_selector_colorFillFinalCircleMask()
{
  return sel_colorFillFinalCircleMask;
}

id sub_247C97B5C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_colorFillFinalCircleMask);
  *a2 = result;
  return result;
}

id sub_247C97B94(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setColorFillFinalCircleMask_, *a1);
}

char *keypath_get_selector_edgeLightInitialCircleMask()
{
  return sel_edgeLightInitialCircleMask;
}

id sub_247C97BB4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeLightInitialCircleMask);
  *a2 = result;
  return result;
}

id sub_247C97BEC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeLightInitialCircleMask_, *a1);
}

char *keypath_get_selector_edgeLightHintCircleMask()
{
  return sel_edgeLightHintCircleMask;
}

id sub_247C97C0C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeLightHintCircleMask);
  *a2 = result;
  return result;
}

id sub_247C97C44(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeLightHintCircleMask_, *a1);
}

char *keypath_get_selector_edgeLightFinalCircleMask()
{
  return sel_edgeLightFinalCircleMask;
}

id sub_247C97C64@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeLightFinalCircleMask);
  *a2 = result;
  return result;
}

id sub_247C97C9C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeLightFinalCircleMask_, *a1);
}

char *keypath_get_selector_aberrationMagnitudeX()
{
  return sel_aberrationMagnitudeX;
}

id sub_247C97CBC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_aberrationMagnitudeX);
  *a2 = v4;
  return result;
}

id sub_247C97CEC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationMagnitudeX_, *a1);
}

char *keypath_get_selector_aberrationMagnitudeY()
{
  return sel_aberrationMagnitudeY;
}

id sub_247C97D0C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_aberrationMagnitudeY);
  *a2 = v4;
  return result;
}

id sub_247C97D3C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationMagnitudeY_, *a1);
}

char *keypath_get_selector_aberrationBlurRadius()
{
  return sel_aberrationBlurRadius;
}

id sub_247C97D5C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_aberrationBlurRadius);
  *a2 = v4;
  return result;
}

id sub_247C97D8C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationBlurRadius_, *a1);
}

char *keypath_get_selector_aberrationUseColorSaturate()
{
  return sel_aberrationUseColorSaturate;
}

id sub_247C97DAC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_aberrationUseColorSaturate);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C97DDC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationUseColorSaturate_, *a1);
}

char *keypath_get_selector_aberrationColorSaturateAmount()
{
  return sel_aberrationColorSaturateAmount;
}

id sub_247C97DFC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_aberrationColorSaturateAmount);
  *a2 = v4;
  return result;
}

id sub_247C97E2C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationColorSaturateAmount_, *a1);
}

char *keypath_get_selector_aberrationUseEDR()
{
  return sel_aberrationUseEDR;
}

id sub_247C97E4C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_aberrationUseEDR);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C97E7C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationUseEDR_, *a1);
}

char *keypath_get_selector_aberrationEDRGain()
{
  return sel_aberrationEDRGain;
}

id sub_247C97E9C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_aberrationEDRGain);
  *a2 = v4;
  return result;
}

id sub_247C97ECC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationEDRGain_, *a1);
}

char *keypath_get_selector_aberrationUseColorBrightness()
{
  return sel_aberrationUseColorBrightness;
}

id sub_247C97EEC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_aberrationUseColorBrightness);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C97F1C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationUseColorBrightness_, *a1);
}

char *keypath_get_selector_aberrationColorBrightness()
{
  return sel_aberrationColorBrightness;
}

id sub_247C97F3C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_aberrationColorBrightness);
  *a2 = v4;
  return result;
}

id sub_247C97F6C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationColorBrightness_, *a1);
}

char *keypath_get_selector_aberrationUseColorMatrixMultiply()
{
  return sel_aberrationUseColorMatrixMultiply;
}

id sub_247C97F8C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_aberrationUseColorMatrixMultiply);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C97FBC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationUseColorMatrixMultiply_, *a1);
}

char *keypath_get_selector_aberrationColorMatrixMultiplyFactor()
{
  return sel_aberrationColorMatrixMultiplyFactor;
}

id sub_247C97FDC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_aberrationColorMatrixMultiplyFactor);
  *a2 = v4;
  return result;
}

id sub_247C9800C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationColorMatrixMultiplyFactor_, *a1);
}

char *keypath_get_selector_aberrationFadeOutDelay()
{
  return sel_aberrationFadeOutDelay;
}

id sub_247C9802C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_aberrationFadeOutDelay);
  *a2 = v4;
  return result;
}

id sub_247C9805C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationFadeOutDelay_, *a1);
}

char *keypath_get_selector_aberrationFadeOutDelayIPad()
{
  return sel_aberrationFadeOutDelayIPad;
}

id sub_247C9807C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_aberrationFadeOutDelayIPad);
  *a2 = v4;
  return result;
}

id sub_247C980AC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAberrationFadeOutDelayIPad_, *a1);
}

char *keypath_get_selector_abberationFadeOutAnimationSettings()
{
  return sel_abberationFadeOutAnimationSettings;
}

id sub_247C980CC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_abberationFadeOutAnimationSettings);
  *a2 = result;
  return result;
}

id sub_247C98104(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAbberationFadeOutAnimationSettings_, *a1);
}

char *keypath_get_selector_abberationCancelledFadeOutAnimationSettings()
{
  return sel_abberationCancelledFadeOutAnimationSettings;
}

id sub_247C98124@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_abberationCancelledFadeOutAnimationSettings);
  *a2 = result;
  return result;
}

id sub_247C9815C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAbberationCancelledFadeOutAnimationSettings_, *a1);
}

char *keypath_get_selector_meshSquareFinalSizeDiagonalRatio()
{
  return sel_meshSquareFinalSizeDiagonalRatio;
}

id sub_247C9817C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_meshSquareFinalSizeDiagonalRatio);
  *a2 = v4;
  return result;
}

id sub_247C981AC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMeshSquareFinalSizeDiagonalRatio_, *a1);
}

char *keypath_get_selector_meshRectangularFinalShortDimensionRatio()
{
  return sel_meshRectangularFinalShortDimensionRatio;
}

id sub_247C981CC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_meshRectangularFinalShortDimensionRatio);
  *a2 = v4;
  return result;
}

id sub_247C981FC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMeshRectangularFinalShortDimensionRatio_, *a1);
}

char *keypath_get_selector_meshRectangularFinalLongDimensionRatio()
{
  return sel_meshRectangularFinalLongDimensionRatio;
}

id sub_247C9821C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_meshRectangularFinalLongDimensionRatio);
  *a2 = v4;
  return result;
}

id sub_247C9824C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMeshRectangularFinalLongDimensionRatio_, *a1);
}

char *keypath_get_selector_meshFinalProportionAcrossScreenLongEdge()
{
  return sel_meshFinalProportionAcrossScreenLongEdge;
}

id sub_247C9826C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_meshFinalProportionAcrossScreenLongEdge);
  *a2 = v4;
  return result;
}

id sub_247C9829C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMeshFinalProportionAcrossScreenLongEdge_, *a1);
}

char *keypath_get_selector_meshFinalProportionAcrossScreenShortEdge()
{
  return sel_meshFinalProportionAcrossScreenShortEdge;
}

id sub_247C982BC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_meshFinalProportionAcrossScreenShortEdge);
  *a2 = v4;
  return result;
}

id sub_247C982EC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMeshFinalProportionAcrossScreenShortEdge_, *a1);
}

char *keypath_get_selector_meshFinalProportionTowardsCenterOnLargeDisplays()
{
  return sel_meshFinalProportionTowardsCenterOnLargeDisplays;
}

id sub_247C9830C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_meshFinalProportionTowardsCenterOnLargeDisplays);
  *a2 = v4;
  return result;
}

id sub_247C9833C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMeshFinalProportionTowardsCenterOnLargeDisplays_, *a1);
}

char *keypath_get_selector_meshPointsEndTransitionDelay()
{
  return sel_meshPointsEndTransitionDelay;
}

id sub_247C9835C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_meshPointsEndTransitionDelay);
  *a2 = v4;
  return result;
}

id sub_247C9838C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMeshPointsEndTransitionDelay_, *a1);
}

char *keypath_get_selector_useSiriMeshForCapture()
{
  return sel_useSiriMeshForCapture;
}

id sub_247C983AC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_useSiriMeshForCapture);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C983DC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUseSiriMeshForCapture_, *a1);
}

char *keypath_get_selector_meshPointsAnimationSettings()
{
  return sel_meshPointsAnimationSettings;
}

id sub_247C983FC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_meshPointsAnimationSettings);
  *a2 = result;
  return result;
}

id sub_247C98434(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMeshPointsAnimationSettings_, *a1);
}

char *keypath_get_selector_meshPositionAnimationSettings()
{
  return sel_meshPositionAnimationSettings;
}

id sub_247C98454@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_meshPositionAnimationSettings);
  *a2 = result;
  return result;
}

id sub_247C9848C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMeshPositionAnimationSettings_, *a1);
}

char *keypath_get_selector_meshPointsCancelledAnimationSettings()
{
  return sel_meshPointsCancelledAnimationSettings;
}

id sub_247C984AC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_meshPointsCancelledAnimationSettings);
  *a2 = result;
  return result;
}

id sub_247C984E4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMeshPointsCancelledAnimationSettings_, *a1);
}

char *keypath_get_selector_fillLightInitialIntensity()
{
  return sel_fillLightInitialIntensity;
}

id sub_247C98504@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_fillLightInitialIntensity);
  *a2 = v4;
  return result;
}

id sub_247C98534(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFillLightInitialIntensity_, *a1);
}

char *keypath_get_selector_fillLightCaptureInitialIntensity()
{
  return sel_fillLightCaptureInitialIntensity;
}

id sub_247C98554@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_fillLightCaptureInitialIntensity);
  *a2 = v4;
  return result;
}

id sub_247C98584(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFillLightCaptureInitialIntensity_, *a1);
}

char *keypath_get_selector_captureFillWhiteValue()
{
  return sel_captureFillWhiteValue;
}

id sub_247C985A4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_captureFillWhiteValue);
  *a2 = v4;
  return result;
}

id sub_247C985D4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCaptureFillWhiteValue_, *a1);
}

char *keypath_get_selector_fillLightFinalIntensity()
{
  return sel_fillLightFinalIntensity;
}

id sub_247C985F4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_fillLightFinalIntensity);
  *a2 = v4;
  return result;
}

id sub_247C98624(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFillLightFinalIntensity_, *a1);
}

char *keypath_get_selector_lightIntensityAnimationSettings()
{
  return sel_lightIntensityAnimationSettings;
}

id sub_247C98644@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_lightIntensityAnimationSettings);
  *a2 = result;
  return result;
}

id sub_247C9867C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLightIntensityAnimationSettings_, *a1);
}

char *keypath_get_selector_lightIntensityCancelledAnimationSettings()
{
  return sel_lightIntensityCancelledAnimationSettings;
}

id sub_247C9869C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_lightIntensityCancelledAnimationSettings);
  *a2 = result;
  return result;
}

id sub_247C986D4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLightIntensityCancelledAnimationSettings_, *a1);
}

char *keypath_get_selector_fillLightIntensityFinalStateDelay()
{
  return sel_fillLightIntensityFinalStateDelay;
}

id sub_247C986F4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_fillLightIntensityFinalStateDelay);
  *a2 = v4;
  return result;
}

id sub_247C98724(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFillLightIntensityFinalStateDelay_, *a1);
}

char *keypath_get_selector_fillLightColorSaturateAmount()
{
  return sel_fillLightColorSaturateAmount;
}

id sub_247C98744@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_fillLightColorSaturateAmount);
  *a2 = v4;
  return result;
}

id sub_247C98774(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFillLightColorSaturateAmount_, *a1);
}

char *keypath_get_selector_fillLightColorBrightnessAmount()
{
  return sel_fillLightColorBrightnessAmount;
}

id sub_247C98794@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_fillLightColorBrightnessAmount);
  *a2 = v4;
  return result;
}

id sub_247C987C4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFillLightColorBrightnessAmount_, *a1);
}

char *keypath_get_selector_fillLightColorContrastAmount()
{
  return sel_fillLightColorContrastAmount;
}

id sub_247C987E4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_fillLightColorContrastAmount);
  *a2 = v4;
  return result;
}

id sub_247C98814(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFillLightColorContrastAmount_, *a1);
}

char *keypath_get_selector_captureHintAnimationSettings()
{
  return sel_captureHintAnimationSettings;
}

id sub_247C98834@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_captureHintAnimationSettings);
  *a2 = result;
  return result;
}

id sub_247C9886C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCaptureHintAnimationSettings_, *a1);
}

char *keypath_get_selector_captureHintRetargetImpulse()
{
  return sel_captureHintRetargetImpulse;
}

id sub_247C9888C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_captureHintRetargetImpulse);
  *a2 = v4;
  return result;
}

id sub_247C988BC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCaptureHintRetargetImpulse_, *a1);
}

char *keypath_get_selector_captureHintInterpolationProgress()
{
  return sel_captureHintInterpolationProgress;
}

id sub_247C988DC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_captureHintInterpolationProgress);
  *a2 = v4;
  return result;
}

id sub_247C9890C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCaptureHintInterpolationProgress_, *a1);
}

char *keypath_get_selector_captureHintMeshOffset()
{
  return sel_captureHintMeshOffset;
}

id sub_247C9892C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_captureHintMeshOffset);
  *a2 = v4;
  return result;
}

id sub_247C9895C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCaptureHintMeshOffset_, *a1);
}

char *keypath_get_selector_captureChromaticAberrationEnabled()
{
  return sel_captureChromaticAberrationEnabled;
}

id sub_247C9897C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_captureChromaticAberrationEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C989AC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCaptureChromaticAberrationEnabled_, *a1);
}

char *keypath_get_selector_captureMeshEnabled()
{
  return sel_captureMeshEnabled;
}

id sub_247C989CC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_captureMeshEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C989FC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCaptureMeshEnabled_, *a1);
}

char *keypath_get_selector_captureFillLightType()
{
  return sel_captureFillLightType;
}

id sub_247C98A1C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_captureFillLightType);
  *a2 = result;
  return result;
}

id sub_247C98A4C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCaptureFillLightType_, *a1);
}

char *keypath_get_selector_siriButtonChromaticAberrationEnabled()
{
  return sel_siriButtonChromaticAberrationEnabled;
}

id sub_247C98A6C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_siriButtonChromaticAberrationEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C98A9C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriButtonChromaticAberrationEnabled_, *a1);
}

char *keypath_get_selector_siriButtonMeshEnabled()
{
  return sel_siriButtonMeshEnabled;
}

id sub_247C98ABC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_siriButtonMeshEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C98AEC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriButtonMeshEnabled_, *a1);
}

char *keypath_get_selector_siriButtonMeshEnabledLargeScreen()
{
  return sel_siriButtonMeshEnabledLargeScreen;
}

id sub_247C98B0C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_siriButtonMeshEnabledLargeScreen);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C98B3C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriButtonMeshEnabledLargeScreen_, *a1);
}

char *keypath_get_selector_siriButtonFillLightEnabled()
{
  return sel_siriButtonFillLightEnabled;
}

id sub_247C98B5C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_siriButtonFillLightEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C98B8C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriButtonFillLightEnabled_, *a1);
}

char *keypath_get_selector_siriButtonEdgeLightEnabled()
{
  return sel_siriButtonEdgeLightEnabled;
}

id sub_247C98BAC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_siriButtonEdgeLightEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C98BDC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriButtonEdgeLightEnabled_, *a1);
}

char *keypath_get_selector_siriEdgeChromaticAberrationEnabled()
{
  return sel_siriEdgeChromaticAberrationEnabled;
}

id sub_247C98BFC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_siriEdgeChromaticAberrationEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C98C2C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriEdgeChromaticAberrationEnabled_, *a1);
}

char *keypath_get_selector_siriEdgeMeshEnabled()
{
  return sel_siriEdgeMeshEnabled;
}

id sub_247C98C4C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_siriEdgeMeshEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C98C7C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriEdgeMeshEnabled_, *a1);
}

char *keypath_get_selector_siriEdgeMeshEnabledLargeScreen()
{
  return sel_siriEdgeMeshEnabledLargeScreen;
}

id sub_247C98C9C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_siriEdgeMeshEnabledLargeScreen);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C98CCC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriEdgeMeshEnabledLargeScreen_, *a1);
}

char *keypath_get_selector_siriEdgeFillLightEnabled()
{
  return sel_siriEdgeFillLightEnabled;
}

id sub_247C98CEC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_siriEdgeFillLightEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C98D1C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriEdgeFillLightEnabled_, *a1);
}

char *keypath_get_selector_siriEdgeEdgeLightEnabled()
{
  return sel_siriEdgeEdgeLightEnabled;
}

id sub_247C98D3C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_siriEdgeEdgeLightEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_247C98D6C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriEdgeEdgeLightEnabled_, *a1);
}

uint64_t type metadata accessor for SUIAShockwavePrototypeSettings(uint64_t a1)
{
  return sub_247C84B94(a1, &qword_2576F0C70);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_247C98DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247C98DF4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_247C98E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(__int128 *, __int128 *);
  char v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = *(uint64_t (**)(__int128 *, __int128 *))(a1 + 32);
  if (!a2)
  {
    v10 = 0u;
    v11 = 0u;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v8 = 0u;
    v9 = 0u;
    goto LABEL_6;
  }
  *((_QWORD *)&v11 + 1) = swift_getObjectType();
  *(_QWORD *)&v10 = a2;
  if (!a3)
    goto LABEL_5;
LABEL_3:
  *((_QWORD *)&v9 + 1) = swift_getObjectType();
  *(_QWORD *)&v8 = a3;
LABEL_6:
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = v5(&v10, &v8);
  swift_release();
  sub_247C89618((uint64_t)&v8);
  sub_247C89618((uint64_t)&v10);
  return v6 & 1;
}

uint64_t SUIAShockwaveRadialMaskSettings.name.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_name);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SUIAShockwaveRadialMaskSettings.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_name);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_247C99068(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*a1, sel_name);
  v4 = sub_247C9FDB4();
  v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

uint64_t SUIAShockwaveRadialMaskSettings.locations.getter()
{
  return sub_247C991B8();
}

uint64_t SUIAShockwaveRadialMaskSettings.locations.setter(uint64_t a1)
{
  return sub_247C992A0(a1, &OBJC_IVAR___SUIAShockwaveRadialMaskSettings_locations);
}

id sub_247C99128(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  void *v5;

  swift_beginAccess();
  sub_247C84B94(0, a4);
  swift_bridgeObjectRetain();
  v5 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t SUIAShockwaveRadialMaskSettings.colors.getter()
{
  return sub_247C991B8();
}

uint64_t sub_247C991B8()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_247C99218(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v8;
  uint64_t *v9;

  sub_247C84B94(0, a4);
  v8 = sub_247C9FE08();
  v9 = (uint64_t *)(a1 + *a6);
  swift_beginAccess();
  *v9 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t SUIAShockwaveRadialMaskSettings.colors.setter(uint64_t a1)
{
  return sub_247C992A0(a1, &OBJC_IVAR___SUIAShockwaveRadialMaskSettings_colors);
}

uint64_t sub_247C992A0(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_bridgeObjectRelease();
}

void sub_247C992EC(id *a1@<X0>, SEL *a2@<X3>, unint64_t *a3@<X4>, uint64_t *a4@<X8>)
{
  id v6;
  uint64_t v7;

  v6 = objc_msgSend(*a1, *a2);
  sub_247C84B94(0, a3);
  v7 = sub_247C9FE08();

  *a4 = v7;
}

void sub_247C99358(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, unint64_t *a5, uint64_t a6, SEL *a7)
{
  void *v8;
  id v9;

  v8 = *a2;
  sub_247C84B94(0, a5);
  v9 = (id)sub_247C9FDFC();
  objc_msgSend(v8, *a7, v9);

}

id SUIAShockwaveRadialMaskSettings.gradientLayerSize.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_gradientLayerSize);
  swift_beginAccess();
  return *v1;
}

void SUIAShockwaveRadialMaskSettings.gradientLayerSize.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_gradientLayerSize);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

double SUIAShockwaveRadialMaskSettings.majorDiameter.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_majorDiameter;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwaveRadialMaskSettings.majorDiameter.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_majorDiameter);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwaveRadialMaskSettings.ringWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_ringWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwaveRadialMaskSettings.ringWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_ringWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double SUIAShockwaveRadialMaskSettings.blurRadius.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_blurRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t SUIAShockwaveRadialMaskSettings.blurRadius.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_blurRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t SUIAShockwaveRadialMaskSettings.sampleCount.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_sampleCount;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SUIAShockwaveRadialMaskSettings.sampleCount.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___SUIAShockwaveRadialMaskSettings_sampleCount);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t static SUIAShockwaveRadialMaskSettings.ignoresKey(_:)(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  BOOL v5;
  BOOL v6;
  id v7;
  void *v9;
  objc_super v10;

  if (a2)
  {
    v4 = *(_QWORD *)"donut" == a1 && a2 == 0xE500000000000000;
    if (v4 || (sub_247C9FF34() & 1) != 0)
      return 1;
    if (*(_QWORD *)"ius")
    {
      v5 = *(_QWORD *)"innerRadius" == a1 && *(_QWORD *)"ius" == a2;
      if (v5 || (sub_247C9FF34() & 1) != 0)
        return 1;
    }
  }
  else if (!*(_QWORD *)"ius")
  {
    return 1;
  }
  if (*(_QWORD *)"ius")
  {
    if (!a2)
      goto LABEL_27;
    v6 = *(_QWORD *)"outerRadius" == a1 && *(_QWORD *)"ius" == a2;
    if (v6 || (sub_247C9FF34() & 1) != 0)
      return 1;
LABEL_24:
    if (a1 == 0xD00000000000001ALL && a2 == 0x8000000247CA39A0 || (sub_247C9FF34() & 1) != 0)
      return 1;
LABEL_27:
    if (a2)
    {
      if (a1 == 0xD000000000000016 && a2 == 0x8000000247CA39C0 || (sub_247C9FF34() & 1) != 0)
        return 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0CD0);
      swift_arrayDestroy();
      v9 = (void *)sub_247C9FDA8();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0CD0);
      swift_arrayDestroy();
      v9 = 0;
    }
    v10.receiver = (id)swift_getObjCClassFromMetadata();
    v10.super_class = (Class)&OBJC_METACLASS___SUIAShockwaveRadialMaskSettings;
    v7 = objc_msgSendSuper2(&v10, sel_ignoresKey_, v9);

    return (uint64_t)v7;
  }
  if (a2)
    goto LABEL_24;
  return 1;
}

BOOL SUIAShockwaveRadialMaskSettings.isDonut.getter()
{
  void *v0;
  double v1;

  objc_msgSend(v0, sel_ringWidth);
  return v1 > 0.0;
}

double SUIAShockwaveRadialMaskSettings.innerRadius.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  char IsOne;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  float v14;
  float v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(v0, sel_colors);
  sub_247C84B94(0, &qword_2576F0C40);
  v2 = sub_247C9FE08();

  if (v2 >> 62)
    goto LABEL_18;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v3)
  {
    v4 = 0;
    while (1)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x24958FA5C](v4, v2);
      else
        v5 = *(id *)(v2 + 8 * v4 + 32);
      v6 = v5;
      v17[0] = 0x7FEFFFFFFFFFFFFFLL;
      objc_msgSend(v5, sel_getRed_green_blue_alpha_, 0, 0, 0, v17);
      IsOne = BSFloatIsOne();

      if ((IsOne & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v9 = v4 - (v4 > 0);
        goto LABEL_12;
      }
      v8 = v4 + 1;
      if (__OFADD__(v4, 1))
        break;
      ++v4;
      if (v8 == v3)
        goto LABEL_10;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v3 = sub_247C9FF10();
    swift_bridgeObjectRelease();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  v9 = 0;
LABEL_12:
  v10 = objc_msgSend(v0, sel_locations);
  sub_247C84B94(0, &qword_2576F0C38);
  v11 = sub_247C9FE08();

  if ((v11 & 0xC000000000000001) != 0)
  {
    v12 = (id)MEMORY[0x24958FA5C](v9, v11);
    goto LABEL_16;
  }
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_22:
    __break(1u);
  }
  if (v9 >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_22;
  v12 = *(id *)(v11 + 8 * v9 + 32);
LABEL_16:
  v13 = v12;
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_floatValue);
  v15 = v14;

  return v15;
}

double SUIAShockwaveRadialMaskSettings.outerRadius.getter()
{
  void *v0;
  void *v1;
  uint64_t IsZero;
  id v3;
  unint64_t v4;
  unint64_t v5;
  id v7;
  int64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  float v16;
  float v17;
  id v19;
  _QWORD v20[2];

  v1 = v0;
  v20[1] = *MEMORY[0x24BDAC8D0];
  IsZero = (uint64_t)&stru_25194A000;
  v3 = objc_msgSend(v0, sel_colors);
  sub_247C84B94(0, &qword_2576F0C40);
  v4 = sub_247C9FE08();

  if (v4 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    v5 = sub_247C9FF10();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      v19 = v1;
      do
      {
        if (__OFSUB__(v5--, 1))
        {
          __break(1u);
LABEL_23:
          __break(1u);
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
        if ((v4 & 0xC000000000000001) != 0)
        {
          v7 = (id)MEMORY[0x24958FA5C](v5, v4);
        }
        else
        {
          if ((v5 & 0x8000000000000000) != 0)
            goto LABEL_23;
          if (v5 >= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_24;
          v7 = *(id *)(v4 + 32 + 8 * v5);
        }
        v1 = v7;
        v20[0] = 0x7FEFFFFFFFFFFFFFLL;
        objc_msgSend(v7, sel_getRed_green_blue_alpha_, 0, 0, 0, v20);
        IsZero = BSFloatIsZero();

      }
      while ((IsZero & 1) != 0 && v5);
      swift_bridgeObjectRelease();
      v1 = v19;
      IsZero = (uint64_t)&stru_25194A000;
      v8 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_28;
      goto LABEL_13;
    }
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  v8 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
LABEL_13:
  v9 = objc_msgSend(v1, *(SEL *)(IsZero + 2512));
  v10 = sub_247C9FE08();

  if (!(v10 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_15;
  }
LABEL_29:
  swift_bridgeObjectRetain();
  v11 = sub_247C9FF10();
  swift_bridgeObjectRelease();
LABEL_15:
  swift_bridgeObjectRelease();
  if (v8 < v11)
    v5 = v8;
  v12 = objc_msgSend(v1, sel_locations);
  sub_247C84B94(0, &qword_2576F0C38);
  v13 = sub_247C9FE08();

  if ((v13 & 0xC000000000000001) != 0)
  {
    v14 = (id)MEMORY[0x24958FA5C](v5, v13);
    goto LABEL_21;
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_32:
    __break(1u);
  }
  if (v5 >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_32;
  v14 = *(id *)(v13 + 8 * v5 + 32);
LABEL_21:
  v15 = v14;
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_floatValue);
  v17 = v16;

  return v17;
}

double SUIAShockwaveRadialMaskSettings.maximumExtentOfZeroOpacity.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  char IsZero;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  float v14;
  float v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(v0, sel_colors);
  sub_247C84B94(0, &qword_2576F0C40);
  v2 = sub_247C9FE08();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    v9 = 0;
    goto LABEL_14;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  v3 = sub_247C9FF10();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_10;
LABEL_3:
  v4 = 0;
  while (1)
  {
    v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24958FA5C](v4, v2) : *(id *)(v2 + 8 * v4 + 32);
    v6 = v5;
    v17[0] = 0x7FEFFFFFFFFFFFFFLL;
    objc_msgSend(v5, sel_getRed_green_blue_alpha_, 0, 0, 0, v17);
    IsZero = BSFloatIsZero();

    if ((IsZero & 1) == 0)
      break;
    v8 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    ++v4;
    if (v8 == v3)
      goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  if (v4 <= 0)
    v9 = 0;
  else
    v9 = v4 - 1;
LABEL_14:
  v10 = objc_msgSend(v0, sel_locations);
  sub_247C84B94(0, &qword_2576F0C38);
  v11 = sub_247C9FE08();

  if ((v11 & 0xC000000000000001) != 0)
  {
    v12 = (id)MEMORY[0x24958FA5C](v9, v11);
  }
  else
  {
    if (v9 >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v12 = *(id *)(v11 + 8 * v9 + 32);
  }
  v13 = v12;
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_floatValue);
  v15 = v14;

  return v15;
}

double SUIAShockwaveRadialMaskSettings.radiusOfMaximumOpacity.getter()
{
  char **v0;
  __objc2_prop *v1;
  id v2;
  unint64_t v3;
  unint64_t v4;
  __objc2_prop *v6;
  char IsZero;
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  void *v13;
  float v14;
  float v15;
  double v16;
  char **v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v1 = &stru_25194A000;
  v2 = objc_msgSend(v0, sel_colors);
  sub_247C84B94(0, &qword_2576F0C40);
  v3 = sub_247C9FE08();

  if (v3 >> 62)
    goto LABEL_17;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v18 = v0;
    v0 = &selRef_edgeLightMaskCenter;
    while (!__OFSUB__(v4--, 1))
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        v6 = (__objc2_prop *)MEMORY[0x24958FA5C](v4, v3);
      }
      else
      {
        if ((v4 & 0x8000000000000000) != 0)
          goto LABEL_15;
        if (v4 >= *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_16;
        v6 = (__objc2_prop *)*(id *)(v3 + 32 + 8 * v4);
      }
      v1 = v6;
      v19[0] = 0x7FEFFFFFFFFFFFFFLL;
      -[__objc2_prop getRed:green:blue:alpha:](v6, sel_getRed_green_blue_alpha_, 0, 0, 0, v19);
      IsZero = BSFloatIsZero();

      if ((IsZero & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v0 = v18;
        goto LABEL_22;
      }
      if (!v4)
      {
        swift_bridgeObjectRelease();
        v0 = v18;
        v1 = &stru_25194A000;
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
    v4 = sub_247C9FF10();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_19:
  v8 = objc_msgSend(v0, v1[157].name);
  v9 = sub_247C9FE08();

  if (v9 >> 62)
    goto LABEL_32;
  v3 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    swift_bridgeObjectRelease();
    v4 = v3 - 1;
    if (__OFSUB__(v3, 1))
      __break(1u);
LABEL_22:
    v10 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    v11 = objc_msgSend(v0, sel_locations);
    sub_247C84B94(0, &qword_2576F0C38);
    v3 = sub_247C9FE08();

    if ((v3 & 0xC000000000000001) != 0)
      goto LABEL_29;
    if ((v10 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v10 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v12 = *(id *)(v3 + 8 * v10 + 32);
      goto LABEL_27;
    }
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    v3 = sub_247C9FF10();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_29:
  v12 = (id)MEMORY[0x24958FA5C](v10, v3);
LABEL_27:
  v13 = v12;
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_floatValue);
  v15 = v14;

  objc_msgSend(v0, sel_maximumExtentOfZeroOpacity);
  return (v16 + v15) * 0.5;
}

Swift::Bool __swiftcall SUIAShockwaveRadialMaskSettings.validateComputedValuesCorrespondToSourceValues()()
{
  void *v0;
  uint64_t v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  char v14;
  _QWORD v16[6];

  v1 = swift_allocObject();
  *(_BYTE *)(v1 + 16) = 1;
  v2 = (void *)objc_opt_self();
  objc_msgSend(v0, sel_majorDiameter);
  v4 = v3;
  objc_msgSend(v0, sel_ringWidth);
  v6 = v5;
  objc_msgSend(v0, sel_blurRadius);
  v8 = v7;
  v9 = (unint64_t)objc_msgSend(v0, sel_sampleCount);
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v10 = v9;
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v0;
    *(_QWORD *)(v11 + 24) = v1;
    v16[4] = sub_247C9AFBC;
    v16[5] = v11;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 1107296256;
    v16[2] = sub_247C9AFC4;
    v16[3] = &block_descriptor_0;
    v12 = _Block_copy(v16);
    v13 = v0;
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_calculateDescriptionForGradientMajorDiameter_ringWidth_blurRadius_numberOfSamples_completion_, v10, v12, v4, v6, v8);
    _Block_release(v12);
    swift_beginAccess();
    v14 = *(_BYTE *)(v1 + 16);
    swift_release();
    LOBYTE(v9) = v14;
  }
  return v9;
}

uint64_t sub_247C9A970()
{
  return swift_deallocObject();
}

uint64_t sub_247C9A980(unint64_t a1, unint64_t a2, int a3, id a4, uint64_t a5)
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t result;
  _BYTE *v42;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = objc_msgSend(a4, sel_locations);
  sub_247C84B94(0, &qword_2576F0C38);
  v9 = sub_247C9FE08();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_247C9FF10();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v42 = (_BYTE *)(a5 + 16);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v16 = sub_247C9FF10();
    swift_bridgeObjectRelease();
    if (v10 == v16)
    {
      swift_bridgeObjectRetain();
      v10 = sub_247C9FF10();
      if (v10)
        goto LABEL_6;
      goto LABEL_22;
    }
  }
  else if (v10 == *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_bridgeObjectRetain();
    if (v10)
    {
LABEL_6:
      if (v10 < 1)
      {
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
      if ((v9 & 0xC000000000000001) == 0
        && (unint64_t)(v10 - 1) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_65:
        __break(1u);
      }
      swift_beginAccess();
      for (i = 0; i != v10; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
          v12 = (id)MEMORY[0x24958FA5C](i, a1);
        else
          v12 = *(id *)(a1 + 8 * i + 32);
        v13 = v12;
        objc_msgSend(v12, sel_bs_CGFloatValue);
        if ((v9 & 0xC000000000000001) != 0)
          v14 = (id)MEMORY[0x24958FA5C](i, v9);
        else
          v14 = *(id *)(v9 + 8 * i + 32);
        v15 = v14;
        objc_msgSend(v14, sel_bs_CGFloatValue);

        LOBYTE(v15) = BSFloatApproximatelyEqualToFloat();
        if ((v15 & 1) == 0)
          *v42 = 0;
      }
    }
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *v42 = 0;
LABEL_24:
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v17 = sub_247C9FF10();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v18 = MEMORY[0x24BEE4AF8];
  if (v17)
  {
    v44 = MEMORY[0x24BEE4AF8];
    sub_247C9E7E0(0, v17 & ~(v17 >> 63), 0);
    if (v17 < 0)
    {
      __break(1u);
      goto LABEL_63;
    }
    v19 = 0;
    v20 = v44;
    do
    {
      if ((a2 & 0xC000000000000001) != 0)
        v21 = (id)MEMORY[0x24958FA5C](v19, a2);
      else
        v21 = *(id *)(a2 + 8 * v19 + 32);
      v22 = v21;
      v43[0] = 0;
      objc_msgSend(v21, sel_getRed_green_blue_alpha_, 0, 0, 0, v43);

      v23 = v43[0];
      v44 = v20;
      v25 = *(_QWORD *)(v20 + 16);
      v24 = *(_QWORD *)(v20 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_247C9E7E0((char *)(v24 > 1), v25 + 1, 1);
        v20 = v44;
      }
      ++v19;
      *(_QWORD *)(v20 + 16) = v25 + 1;
      *(_QWORD *)(v20 + 8 * v25 + 32) = v23;
    }
    while (v17 != v19);
  }
  else
  {
    v20 = MEMORY[0x24BEE4AF8];
  }
  v26 = objc_msgSend(a4, sel_colors);
  sub_247C84B94(0, &qword_2576F0C40);
  v27 = sub_247C9FE08();

  if (!(v27 >> 62))
  {
    v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v28)
      goto LABEL_39;
LABEL_50:
    swift_bridgeObjectRelease();
    v30 = MEMORY[0x24BEE4AF8];
    goto LABEL_51;
  }
  swift_bridgeObjectRetain();
  v28 = sub_247C9FF10();
  swift_bridgeObjectRelease();
  if (!v28)
    goto LABEL_50;
LABEL_39:
  v44 = v18;
  sub_247C9E7E0(0, v28 & ~(v28 >> 63), 0);
  if (v28 < 0)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  v29 = 0;
  v30 = v44;
  do
  {
    if ((v27 & 0xC000000000000001) != 0)
      v31 = (id)MEMORY[0x24958FA5C](v29, v27);
    else
      v31 = *(id *)(v27 + 8 * v29 + 32);
    v32 = v31;
    v43[0] = 0;
    objc_msgSend(v31, sel_getRed_green_blue_alpha_, 0, 0, 0, v43);

    v33 = v43[0];
    v44 = v30;
    v35 = *(_QWORD *)(v30 + 16);
    v34 = *(_QWORD *)(v30 + 24);
    if (v35 >= v34 >> 1)
    {
      sub_247C9E7E0((char *)(v34 > 1), v35 + 1, 1);
      v30 = v44;
    }
    ++v29;
    *(_QWORD *)(v30 + 16) = v35 + 1;
    *(_QWORD *)(v30 + 8 * v35 + 32) = v33;
  }
  while (v28 != v29);
  swift_bridgeObjectRelease();
LABEL_51:
  v36 = *(_QWORD *)(v30 + 16);
  if (v36 == *(_QWORD *)(v20 + 16))
  {
    if (v36)
    {
      swift_beginAccess();
      v37 = -v36;
      v38 = 4;
      do
      {
        if ((BSFloatApproximatelyEqualToFloat() & 1) == 0)
          *v42 = 0;
        ++v38;
      }
      while (v37 + v38 != 4);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    *v42 = 0;
  }
  v39 = objc_msgSend(a4, sel_gradientLayerSize);
  objc_msgSend(v39, sel_width);

  result = BSFloatApproximatelyEqualToFloat();
  if ((result & 1) == 0)
  {
    result = swift_beginAccess();
    *v42 = 0;
  }
  return result;
}

uint64_t sub_247C9AFBC(unint64_t a1, unint64_t a2, int a3)
{
  uint64_t v3;

  return sub_247C9A980(a1, a2, a3, *(id *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

void sub_247C9AFC4(uint64_t a1, double a2, uint64_t a3, uint64_t a4, void *a5)
{
  void (*v7)(uint64_t, uint64_t, id, double);
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = *(void (**)(uint64_t, uint64_t, id, double))(a1 + 32);
  sub_247C84B94(0, &qword_2576F0C38);
  v8 = sub_247C9FE08();
  sub_247C84B94(0, &qword_2576F0C40);
  v9 = sub_247C9FE08();
  swift_retain();
  v10 = a5;
  v7(v8, v9, v10, a2);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

Swift::String __swiftcall SUIAShockwaveRadialMaskSettings.computeDerivativeValuesAndGenerateSource()()
{
  void *v0;
  uint64_t v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  Swift::String result;
  _QWORD v18[6];

  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0xE000000000000000;
  v2 = (void *)objc_opt_self();
  objc_msgSend(v0, sel_majorDiameter);
  v4 = v3;
  objc_msgSend(v0, sel_ringWidth);
  v6 = v5;
  objc_msgSend(v0, sel_blurRadius);
  v8 = v7;
  v9 = (uint64_t)objc_msgSend(v0, sel_sampleCount);
  if (v9 < 0)
  {
    __break(1u);
  }
  else
  {
    v11 = v9;
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v0;
    *(_QWORD *)(v12 + 24) = v1;
    v18[4] = sub_247C9BAD4;
    v18[5] = v12;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 1107296256;
    v18[2] = sub_247C9AFC4;
    v18[3] = &block_descriptor_12;
    v13 = _Block_copy(v18);
    v14 = v0;
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_calculateDescriptionForGradientMajorDiameter_ringWidth_blurRadius_numberOfSamples_completion_, v11, v13, v4, v6, v8);
    _Block_release(v13);
    swift_beginAccess();
    v15 = *(_QWORD *)(v1 + 16);
    v16 = *(void **)(v1 + 24);
    swift_bridgeObjectRetain();
    swift_release();
    v9 = v15;
    v10 = v16;
  }
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

uint64_t sub_247C9B298()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_247C9B2BC(unint64_t a1, unint64_t a2, double a3, uint64_t a4, void *a5, uint64_t a6)
{
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  id v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  id v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  sub_247C84B94(0, &qword_2576F0C38);
  v11 = (void *)sub_247C9FDFC();
  objc_msgSend(a5, sel_setLocations_, v11);

  sub_247C84B94(0, &qword_2576F0C40);
  v12 = (void *)sub_247C9FDFC();
  objc_msgSend(a5, sel_setColors_, v12);

  v13 = objc_msgSend(a5, sel_gradientLayerSize);
  objc_msgSend(v13, sel_setSizeValue_, a3, a3);

  v48 = a5;
  v49 = a6;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_247C9FF10();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v15 = MEMORY[0x24BEE4AF8];
  v51 = a2;
  if (v14)
  {
    v53 = MEMORY[0x24BEE4AF8];
    sub_247C9E7FC(0, v14 & ~(v14 >> 63), 0);
    if (v14 < 0)
    {
      __break(1u);
      goto LABEL_27;
    }
    v16 = 0;
    v15 = v53;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v17 = (id)MEMORY[0x24958FA5C](v16, a1);
      else
        v17 = *(id *)(a1 + 8 * v16 + 32);
      v18 = v17;
      objc_msgSend(v17, sel_doubleValue);
      v20 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0988);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_247CA2B60;
      *(_QWORD *)(v21 + 56) = MEMORY[0x24BEE13C8];
      *(_QWORD *)(v21 + 64) = MEMORY[0x24BEE1448];
      *(_QWORD *)(v21 + 32) = v20;
      v22 = sub_247C9FDC0();
      v24 = v23;

      v53 = v15;
      v26 = *(_QWORD *)(v15 + 16);
      v25 = *(_QWORD *)(v15 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_247C9E7FC((char *)(v25 > 1), v26 + 1, 1);
        v15 = v53;
      }
      ++v16;
      *(_QWORD *)(v15 + 16) = v26 + 1;
      v27 = v15 + 16 * v26;
      *(_QWORD *)(v27 + 32) = v22;
      *(_QWORD *)(v27 + 40) = v24;
    }
    while (v14 != v16);
  }
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v28 = sub_247C9FF10();
    swift_bridgeObjectRelease();
  }
  else
  {
    v28 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v29 = MEMORY[0x24BEE4AF8];
  if (!v28)
    goto LABEL_23;
  v53 = MEMORY[0x24BEE4AF8];
  sub_247C9E7FC(0, v28 & ~(v28 >> 63), 0);
  if (v28 < 0)
LABEL_27:
    __break(1u);
  v30 = 0;
  v29 = v53;
  v50 = a2 & 0xC000000000000001;
  do
  {
    if (v50)
      v31 = (id)MEMORY[0x24958FA5C](v30, a2);
    else
      v31 = *(id *)(a2 + 8 * v30 + 32);
    v32 = v31;
    v52 = 0;
    objc_msgSend(v31, sel_getRed_green_blue_alpha_, 0, 0, 0, &v52);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0988);
    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_247CA2B60;
    v34 = v52;
    *(_QWORD *)(v33 + 56) = MEMORY[0x24BEE50B0];
    *(_QWORD *)(v33 + 64) = sub_247C9CA24();
    *(_QWORD *)(v33 + 32) = v34;
    v35 = sub_247C9FDC0();
    v37 = v36;

    v53 = v29;
    v39 = *(_QWORD *)(v29 + 16);
    v38 = *(_QWORD *)(v29 + 24);
    if (v39 >= v38 >> 1)
    {
      sub_247C9E7FC((char *)(v38 > 1), v39 + 1, 1);
      v29 = v53;
    }
    ++v30;
    *(_QWORD *)(v29 + 16) = v39 + 1;
    v40 = v29 + 16 * v39;
    *(_QWORD *)(v40 + 32) = v35;
    *(_QWORD *)(v40 + 40) = v37;
    a2 = v51;
  }
  while (v28 != v30);
LABEL_23:
  v53 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0900);
  sub_247C8952C();
  sub_247C9FD9C();
  swift_bridgeObjectRelease();
  v53 = v29;
  sub_247C9FD9C();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0988);
  v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_247CA2C60;
  v42 = MEMORY[0x24BEE50B0];
  *(_QWORD *)(v41 + 56) = MEMORY[0x24BEE50B0];
  v43 = sub_247C9CA24();
  *(_QWORD *)(v41 + 64) = v43;
  *(double *)(v41 + 32) = a3;
  *(_QWORD *)(v41 + 96) = v42;
  *(_QWORD *)(v41 + 104) = v43;
  *(double *)(v41 + 72) = a3;
  sub_247C9FDC0();
  v53 = 0;
  v54 = 0xE000000000000000;
  sub_247C9FEA4();
  sub_247C9FDD8();
  v44 = objc_msgSend(v48, sel_name);
  sub_247C9FDB4();

  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  sub_247C9FDD8();
  objc_msgSend(v48, sel_majorDiameter);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  sub_247C9FDD8();
  objc_msgSend(v48, sel_ringWidth);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  sub_247C9FDD8();
  objc_msgSend(v48, sel_blurRadius);
  sub_247C9FE44();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  sub_247C9FDD8();
  v52 = objc_msgSend(v48, sel_sampleCount);
  sub_247C9FF1C();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  sub_247C9FDD8();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  sub_247C9FDD8();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  sub_247C9FDD8();
  sub_247C9FDD8();
  swift_bridgeObjectRelease();
  sub_247C9FDD8();
  v45 = v53;
  v46 = v54;
  swift_beginAccess();
  *(_QWORD *)(v49 + 16) = v45;
  *(_QWORD *)(v49 + 24) = v46;
  return swift_bridgeObjectRelease();
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247C9BAD4(unint64_t a1, unint64_t a2, uint64_t a3, double a4)
{
  uint64_t v4;

  return sub_247C9B2BC(a1, a2, a4, a3, *(void **)(v4 + 16), *(_QWORD *)(v4 + 24));
}

Swift::Void __swiftcall SUIAShockwaveRadialMaskSettings.setDefaultValues()()
{
  objc_super v0;

  v0.super_class = (Class)SUIAShockwaveRadialMaskSettings;
  objc_msgSendSuper2(&v0, sel_setDefaultValues);
}

void SUIAShockwaveRadialMaskSettings.setDefaultValuesWithName(_:majorDiameter:ringWidth:blurRadius:sampleCount:locations:colors:gradientLayerSize:)(double a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v15 = (void *)sub_247C9FDA8();
  objc_msgSend(v8, sel_setName_, v15);

  objc_msgSend(v8, sel_setMajorDiameter_, a1);
  objc_msgSend(v8, sel_setRingWidth_, a2);
  objc_msgSend(v8, sel_setBlurRadius_, a3);
  objc_msgSend(v8, sel_setSampleCount_, a8);
  sub_247C84B94(0, &qword_2576F0C38);
  v16 = (void *)sub_247C9FDFC();
  objc_msgSend(v8, sel_setLocations_, v16);

  sub_247C84B94(0, &qword_2576F0C40);
  v17 = (void *)sub_247C9FDFC();
  objc_msgSend(v8, sel_setColors_, v17);

  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7B378]), sel_init);
  objc_msgSend(v8, sel_setGradientLayerSize_, v18);

  v19 = objc_msgSend(v8, sel_gradientLayerSize);
  objc_msgSend(v19, sel_setSizeValue_, a4, a5);

}

BOOL sub_247C9BE74(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v10;
  _OWORD v11[2];
  _BYTE v12[24];
  uint64_t v13;

  sub_247C895D0(a2, (uint64_t)v12);
  if (!v13)
    goto LABEL_12;
  sub_247C84B94(0, &qword_2576F0C80);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v2 = *(void **)&v11[0];
  v3 = (void *)sub_247C9FDA8();
  v4 = objc_msgSend(*(id *)&v11[0], sel_valueForKey_, v3);

  if (v4)
  {
    sub_247C9FE98();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  v5 = sub_247C98DAC((uint64_t)v11, (uint64_t)v12);
  if (!v13)
  {

LABEL_12:
    sub_247C89618((uint64_t)v12);
    return 0;
  }
  type metadata accessor for SUIAShockwaveRadialMaskSettings(v5);
  if ((swift_dynamicCast() & 1) == 0)
  {

    return 0;
  }
  v6 = objc_msgSend(v10, sel_computeDerivativeValuesAndGenerateSource);
  if (!v6)
  {
    sub_247C9FDB4();
    v6 = (id)sub_247C9FDA8();
    swift_bridgeObjectRelease();
  }
  sub_247C9FDB4();
  v7 = objc_msgSend((id)objc_opt_self(), sel_generalPasteboard);
  objc_msgSend(v7, sel_setString_, v6);

  v8 = sub_247C9FDCC();
  swift_bridgeObjectRelease();

  return v8 > 0;
}

void _sSo31SUIAShockwaveRadialMaskSettingsC20SystemUIAnimationKitE24settingsControllerModuleSo8PTModuleCSgyFZ_0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[6];

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0830);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_247CA3170;
  v1 = (void *)sub_247C9FDA8();
  v2 = (void *)sub_247C9FDA8();
  v3 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_valueKeyPath_, v1, v2);

  if (!v3)
  {
    __break(1u);
    goto LABEL_12;
  }
  *(_QWORD *)(v0 + 56) = sub_247C84B94(0, &qword_2576F0990);
  *(_QWORD *)(v0 + 32) = v3;
  v4 = (void *)sub_247C9FDA8();
  v5 = (void *)sub_247C9FDA8();
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_rowWithTitle_valueKeyPath_, v4, v5);

  if (!v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v8 = sub_247C9CA78(2, 0, 0);

  v9 = sub_247C84B94(0, (unint64_t *)&qword_2576F0998);
  *(_QWORD *)(v0 + 88) = v9;
  *(_QWORD *)(v0 + 64) = v8;
  v10 = (void *)sub_247C9FDA8();
  v11 = (void *)sub_247C9FDA8();
  v12 = objc_msgSend(v6, sel_rowWithTitle_valueKeyPath_, v10, v11);

  if (!v12)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v13 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v0 + 120) = v9;
  *(_QWORD *)(v0 + 96) = v13;
  v14 = (void *)sub_247C9FDA8();
  v15 = (void *)sub_247C9FDA8();
  v16 = objc_msgSend(v6, sel_rowWithTitle_valueKeyPath_, v14, v15);

  if (!v16)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v17 = sub_247C9CA78(2, 0, 0);

  *(_QWORD *)(v0 + 152) = v9;
  *(_QWORD *)(v0 + 128) = v17;
  v18 = (void *)sub_247C9FDA8();
  v19 = (void *)sub_247C9FDA8();
  v20 = objc_msgSend(v6, sel_rowWithTitle_valueKeyPath_, v18, v19);

  if (!v20)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v21 = (void *)objc_opt_self();
  v22 = sub_247C9CA78(0, 0, 0);

  *(_QWORD *)(v0 + 184) = v9;
  *(_QWORD *)(v0 + 160) = v22;
  v23 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v24 = (void *)sub_247C9FDA8();
  v25 = objc_msgSend(v21, sel_sectionWithRows_title_, v23, v24);

  if (!v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v41[4] = sub_247C9BE74;
  v41[5] = 0;
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 1107296256;
  v41[2] = sub_247C98E30;
  v41[3] = &block_descriptor_29;
  v26 = _Block_copy(v41);
  swift_release();
  v27 = objc_msgSend((id)objc_opt_self(), sel_actionWithHandler_, v26);
  _Block_release(v26);
  if (!v27)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_247CA2B60;
  v29 = v27;
  v30 = (void *)sub_247C9FDA8();
  v31 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_action_, v30, v29);

  if (!v31)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *(_QWORD *)(v28 + 56) = sub_247C84B94(0, &qword_2576F0C78);
  *(_QWORD *)(v28 + 32) = v31;
  v32 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  v33 = (void *)sub_247C9FDA8();
  v34 = objc_msgSend(v21, sel_sectionWithRows_title_, v32, v33);

  if (v34)
  {
    v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_247CA2C60;
    v36 = sub_247C84B94(0, &qword_2576F0840);
    *(_QWORD *)(v35 + 32) = v25;
    *(_QWORD *)(v35 + 88) = v36;
    *(_QWORD *)(v35 + 56) = v36;
    *(_QWORD *)(v35 + 64) = v34;
    v37 = v25;
    v38 = v34;
    v39 = (void *)sub_247C9FDA8();
    v40 = (void *)sub_247C9FDFC();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_moduleWithTitle_contents_, v39, v40);

    return;
  }
LABEL_19:
  __break(1u);
}

void sub_247C9C760(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  v3 = (id)sub_247C9FDA8();
  objc_msgSend(v2, sel_setName_, v3);

}

char *keypath_get_selector_locations()
{
  return sel_locations;
}

void sub_247C9C7BC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_247C992EC(a1, (SEL *)&selRef_locations, &qword_2576F0C38, a2);
}

void sub_247C9C7E8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_247C99358(a1, a2, a3, a4, &qword_2576F0C38, 0x24BDD16E0, (SEL *)&selRef_setLocations_);
}

char *keypath_get_selector_colors()
{
  return sel_colors;
}

void sub_247C9C820(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_247C992EC(a1, (SEL *)&selRef_colors, &qword_2576F0C40, a2);
}

void sub_247C9C84C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_247C99358(a1, a2, a3, a4, &qword_2576F0C40, 0x24BEBD4B8, (SEL *)&selRef_setColors_);
}

char *keypath_get_selector_gradientLayerSize()
{
  return sel_gradientLayerSize;
}

id sub_247C9C884@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_gradientLayerSize);
  *a2 = result;
  return result;
}

id sub_247C9C8BC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGradientLayerSize_, *a1);
}

char *keypath_get_selector_majorDiameter()
{
  return sel_majorDiameter;
}

id sub_247C9C8DC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_majorDiameter);
  *a2 = v4;
  return result;
}

id sub_247C9C90C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMajorDiameter_, *a1);
}

char *keypath_get_selector_ringWidth()
{
  return sel_ringWidth;
}

id sub_247C9C92C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_ringWidth);
  *a2 = v4;
  return result;
}

id sub_247C9C95C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRingWidth_, *a1);
}

char *keypath_get_selector_blurRadius()
{
  return sel_blurRadius;
}

id sub_247C9C97C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_blurRadius);
  *a2 = v4;
  return result;
}

id sub_247C9C9AC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBlurRadius_, *a1);
}

char *keypath_get_selector_sampleCount()
{
  return sel_sampleCount;
}

id sub_247C9C9CC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_sampleCount);
  *a2 = result;
  return result;
}

id sub_247C9C9FC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSampleCount_, *a1);
}

uint64_t type metadata accessor for SUIAShockwaveRadialMaskSettings(uint64_t a1)
{
  return sub_247C84B94(a1, &qword_2576F0D00);
}

unint64_t sub_247C9CA24()
{
  unint64_t result;

  result = qword_2576F0D08;
  if (!qword_2576F0D08)
  {
    result = MEMORY[0x249590098](MEMORY[0x24BEE5108], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2576F0D08);
  }
  return result;
}

id sub_247C9CA78(uint64_t a1, char a2, void *a3)
{
  void *v3;
  void *v4;
  id result;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _OWORD v13[2];
  _OWORD v14[2];

  v4 = v3;
  result = objc_msgSend(v4, sel_between_and_);
  if (!result)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_247C9FE98();
  swift_unknownObjectRelease();
  sub_247C89B68(v13, v14);
  sub_247C9CC14();
  swift_dynamicCast();
  v9 = v12;
  if ((a2 & 1) != 0)
  {
LABEL_5:
    if (!a3)
      return v9;
    v11 = a3;
    result = objc_msgSend(v9, sel_condition_, v11);
    if (result)
    {
      sub_247C9FE98();
      swift_unknownObjectRelease();
      sub_247C89B68(v13, v14);
      swift_dynamicCast();

      return v12;
    }
    goto LABEL_10;
  }
  v10 = v12;
  result = objc_msgSend(v10, sel_precision_, a1);
  if (result)
  {
    sub_247C9FE98();
    swift_unknownObjectRelease();
    sub_247C89B68(v13, v14);
    swift_dynamicCast();
    v9 = v12;

    goto LABEL_5;
  }
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_247C9CC14()
{
  unint64_t result;

  result = qword_2576F0998;
  if (!qword_2576F0998)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2576F0998);
  }
  return result;
}

Swift::Bool __swiftcall SUIARadialGradientView._shouldAnimateProperty(withKey:)(Swift::String_optional withKey)
{
  void *v1;
  void *object;
  uint64_t countAndFlagsBits;
  BOOL v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  object = withKey.value._object;
  countAndFlagsBits = withKey.value._countAndFlagsBits;
  if (withKey.value._object)
  {
    v4 = *(_QWORD *)"colors" == withKey.value._countAndFlagsBits
      && withKey.value._object == (void *)0xE600000000000000;
    if (v4 || (sub_247C9FF34() & 1) != 0)
      return 1;
    if (*(_QWORD *)"s")
    {
      v5 = *(_QWORD *)"locations" == countAndFlagsBits && *(_QWORD *)"s" == (_QWORD)object;
      if (v5 || (sub_247C9FF34() & 1) != 0)
        return 1;
    }
  }
  else if (!*(_QWORD *)"s")
  {
    return 1;
  }
  if (!*(_QWORD *)"lors")
  {
    if (!object)
      return 1;
    goto LABEL_24;
  }
  if (object)
  {
    v6 = *(_QWORD *)"layer.colors" == countAndFlagsBits && *(_QWORD *)"lors" == (_QWORD)object;
    if (v6 || (sub_247C9FF34() & 1) != 0)
      return 1;
LABEL_24:
    if ((countAndFlagsBits != 0x6F6C2E726579616CLL || object != (void *)0xEF736E6F69746163)
      && (sub_247C9FF34() & 1) == 0)
    {
      goto LABEL_27;
    }
    return 1;
  }
LABEL_27:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0CD0);
  swift_arrayDestroy();
  if (object)
    v7 = (void *)sub_247C9FDA8();
  else
    v7 = 0;
  v10.receiver = v1;
  v10.super_class = (Class)SUIARadialGradientView;
  v8 = objc_msgSendSuper2(&v10, sel__shouldAnimatePropertyWithKey_, v7);

  return v8;
}

uint64_t static SUIARadialGradientView.layerClass.getter()
{
  return sub_247C84B94(0, &qword_2576F0D10);
}

id sub_247C9CF10()
{
  id v0;
  id v1;
  id v2;
  id v3;
  objc_super v5;

  v5.super_class = (Class)SUIARadialGradientView;
  v0 = objc_msgSendSuper2(&v5, sel_initWithFrame_);
  v1 = objc_msgSend(v0, sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setType_, *MEMORY[0x24BDE5C58]);

  v2 = objc_msgSend(v0, sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setStartPoint_, 0.5, 0.5);

  v3 = objc_msgSend(v0, sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setEndPoint_, 1.0, 1.0);

  return v0;
}

void __swiftcall SUIARadialGradientView.init(coder:)(SUIARadialGradientView_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void SUIARadialGradientView.init(coder:)()
{
  sub_247C9FF04();
  __break(1u);
}

uint64_t SUIARadialGradientView.colors.getter()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = objc_msgSend(v0, sel_layer);
  objc_opt_self();
  v2 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_colors);

  if (!v2)
    return 0;
  v3 = sub_247C9FE08();

  v4 = sub_247C9D638(v3);
  swift_bridgeObjectRelease();
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_4;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v5 = sub_247C9FF10();
  swift_bridgeObjectRelease();
  if (!v5)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
LABEL_4:
  v11 = MEMORY[0x24BEE4AF8];
  result = sub_247C9FED4();
  if ((v5 & 0x8000000000000000) == 0)
  {
    v7 = 0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x24958FA5C](v7, v4);
      else
        v8 = *(id *)(v4 + 8 * v7 + 32);
      v9 = v8;
      ++v7;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithCGColor_, v8);

      sub_247C9FEBC();
      sub_247C9FEE0();
      sub_247C9FEEC();
      sub_247C9FEC8();
    }
    while (v5 != v7);
    v10 = v11;
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void SUIARadialGradientView.colors.setter(unint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v3 = objc_msgSend(v1, sel_layer);
  objc_opt_self();
  v4 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (!a1)
    goto LABEL_16;
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_4;
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    a1 = sub_247C9FDFC();
    swift_bridgeObjectRelease();
LABEL_16:
    objc_msgSend(v4, sel_setColors_, a1);

    return;
  }
  swift_bridgeObjectRetain();
  v5 = sub_247C9FF10();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_14;
LABEL_4:
  v16 = MEMORY[0x24BEE4AF8];
  sub_247C9E818(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = v16;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x24958FA5C](v6, a1);
      else
        v8 = *(id *)(a1 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_CGColor);
      type metadata accessor for CGColor(0);
      v15 = v11;

      *(_QWORD *)&v14 = v10;
      v16 = v7;
      v13 = *(_QWORD *)(v7 + 16);
      v12 = *(_QWORD *)(v7 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_247C9E818((char *)(v12 > 1), v13 + 1, 1);
        v7 = v16;
      }
      ++v6;
      *(_QWORD *)(v7 + 16) = v13 + 1;
      sub_247C89B68(&v14, (_OWORD *)(v7 + 32 * v13 + 32));
    }
    while (v5 != v6);
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  __break(1u);
}

uint64_t sub_247C9D638(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v6 = MEMORY[0x24BEE4AF8];
    sub_247C9FED4();
    v4 = a1 + 32;
    do
    {
      sub_247C9F8D0(v4, (uint64_t)&v5);
      type metadata accessor for CGColor(0);
      swift_dynamicCast();
      sub_247C9FEBC();
      sub_247C9FEE0();
      sub_247C9FEEC();
      sub_247C9FEC8();
      v4 += 32;
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

uint64_t SUIARadialGradientView.locations.getter()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_layer);
  objc_opt_self();
  v2 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_locations);

  if (!v2)
    return 0;
  sub_247C84B94(0, &qword_2576F0C38);
  v3 = sub_247C9FE08();

  return v3;
}

void SUIARadialGradientView.locations.setter(uint64_t a1)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  id v6;

  v2 = v1;
  v4 = objc_msgSend(v2, sel_layer);
  objc_opt_self();
  v5 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (a1)
  {
    sub_247C84B94(0, &qword_2576F0C38);
    v6 = (id)sub_247C9FDFC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v5, sel_setLocations_, v6);

}

void sub_247C9DA6C(id *a1@<X0>, SEL *a2@<X3>, unint64_t *a3@<X4>, uint64_t *a4@<X8>)
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = objc_msgSend(*a1, *a2);
  if (v6)
  {
    v7 = v6;
    sub_247C84B94(0, a3);
    v8 = sub_247C9FE08();

  }
  else
  {
    v8 = 0;
  }
  *a4 = v8;
}

void sub_247C9DAE4(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4, unint64_t *a5, uint64_t a6, SEL *a7)
{
  void *v8;
  uint64_t v9;
  id v10;

  v8 = *a2;
  if (*a1)
  {
    sub_247C84B94(0, a5);
    v9 = sub_247C9FDFC();
  }
  else
  {
    v9 = 0;
  }
  v10 = (id)v9;
  objc_msgSend(v8, *a7);

}

void static SUIARadialGradientView.calculateDescription(forGradientMajorDiameter:ringWidth:blurRadius:numberOfSamples:completion:)(uint64_t a1, void (*a2)(uint64_t, uint64_t, id, double), double a3, double a4, double a5)
{
  uint64_t v7;
  double v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  double v29;
  double v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  char isEscapingClosureAtFileLocation;
  int64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  void *v52;
  id v53;
  uint64_t v55;
  _QWORD aBlock[8];

  aBlock[6] = *MEMORY[0x24BDAC8D0];
  v7 = 2;
  if (a1 > 2)
    v7 = a1;
  v55 = v7;
  v8 = a5 * 6.0 + a3;
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, v8, v8);
  v10 = (void *)objc_opt_self();
  v11 = objc_msgSend(v10, sel_whiteColor);
  objc_msgSend(v9, sel_setBackgroundColor_, v11);

  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, a3, a3);
  objc_msgSend(v9, sel_addSubview_, v12);
  objc_msgSend(v9, sel_center);
  objc_msgSend(v12, sel_setCenter_);
  sub_247C9FDB4();
  v13 = objc_allocWithZone(MEMORY[0x24BDE56B0]);
  v14 = (void *)sub_247C9FDA8();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithType_, v14);

  v16 = (void *)sub_247C9FD90();
  objc_msgSend(v15, sel_setValue_forKey_, v16, *MEMORY[0x24BDE5B18]);

  v17 = (void *)sub_247C9FE38();
  objc_msgSend(v15, sel_setValue_forKey_, v17, *MEMORY[0x24BDE5B00]);

  v18 = objc_msgSend(v9, sel_layer);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0830);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_247CA2B60;
  *(_QWORD *)(v19 + 56) = sub_247C84B94(0, &qword_2576F0D18);
  *(_QWORD *)(v19 + 32) = v15;
  v53 = v15;
  v20 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setFilters_, v20);

  v21 = v12;
  v22 = objc_msgSend(v12, sel_layer);
  objc_msgSend(v22, sel_setCornerRadius_, a3 * 0.5);

  if (a4 == 0.0)
  {
    v23 = objc_msgSend(v10, sel_blackColor);
    objc_msgSend(v12, sel_setBackgroundColor_, v23);
  }
  else
  {
    v24 = objc_msgSend(v10, sel_whiteColor);
    objc_msgSend(v12, sel_setBackgroundColor_, v24);

    v25 = objc_msgSend(v12, sel_layer);
    v26 = objc_msgSend(v10, sel_blackColor);
    v27 = objc_msgSend(v26, sel_CGColor);

    objc_msgSend(v25, sel_setBorderColor_, v27);
    v23 = objc_msgSend(v12, sel_layer);
    objc_msgSend(v23, sel_setBorderWidth_, a4);
  }

  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD620]), sel_init);
  objc_msgSend(v28, sel_setPreferredRange_, 2);
  objc_msgSend(v9, sel_bounds);
  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD618]), sel_initWithSize_format_, v28, v29, v30);
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = v9;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = sub_247C9E858;
  *(_QWORD *)(v33 + 24) = v32;
  aBlock[4] = sub_247C9E86C;
  aBlock[5] = v33;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247C9E54C;
  aBlock[3] = &block_descriptor_1;
  v34 = _Block_copy(aBlock);
  v35 = v9;
  swift_retain();
  swift_release();
  v36 = objc_msgSend(v31, sel_imageWithActions_, v34);
  _Block_release(v34);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
    goto LABEL_39;
  }
  v52 = v35;
  v38 = sub_247C9E580();
  v42 = v38;
  v43 = v39;
  v44 = MEMORY[0x24BEE4AF8];
  v45 = MEMORY[0x24BEE4AF8];
  if (v39 >> 60 != 15)
  {
    v46 = (double)v40 * 0.5;
    if ((~*(_QWORD *)&v46 & 0x7FF0000000000000) != 0)
    {
      if (v46 > -9.22337204e18)
      {
        if (v46 < 9.22337204e18)
        {
          if (!__OFSUB__(v40, (uint64_t)v46))
          {
            v47 = 1.0 / (double)(v55 - 1);
            if (v47 != 0.0)
            {
              if (v41 >= 0)
                v48 = v41;
              else
                v48 = v41 + 1;
              v49 = v48 >> 1;
              v50 = v40 * v49;
              if (v47 > 0.0)
              {
                if (1.0 <= 0.0 && 1.0 != 0.0)
                  goto LABEL_30;
              }
              else if (1.0 >= 0.0 && 1.0 != 0.0)
              {
LABEL_30:
                v44 = MEMORY[0x24BEE4AF8];
                v45 = MEMORY[0x24BEE4AF8];
                v43 = v39;
                v42 = v38;
                goto LABEL_31;
              }
              v51 = 0.0 * (double)(v40 - (uint64_t)v46) + (double)(uint64_t)v46;
              if ((~*(_QWORD *)&v51 & 0x7FF0000000000000) != 0)
              {
                if (v51 > -9.22337204e18)
                {
                  if (v51 < 9.22337204e18)
                  {
                    if ((unsigned __int128)(v40 * (__int128)v49) >> 64 == (v40 * v49) >> 63)
                    {
                      if (!__OFADD__(v50, (uint64_t)v51))
                      {
                        if ((unint64_t)(v50 + (uint64_t)v51 - 0x2000000000000000) >> 62 == 3)
                          __asm { BR              X8 }
LABEL_37:
                        __break(1u);
                        __break(1u);
                        JUMPOUT(0x247C9E4FCLL);
                      }
LABEL_36:
                      __break(1u);
                      goto LABEL_37;
                    }
LABEL_35:
                    __break(1u);
                    goto LABEL_36;
                  }
LABEL_34:
                  __break(1u);
                  goto LABEL_35;
                }
              }
              else
              {
                __break(1u);
              }
              __break(1u);
              goto LABEL_34;
            }
LABEL_43:
            __break(1u);
            JUMPOUT(0x247C9E52CLL);
          }
LABEL_42:
          __break(1u);
          goto LABEL_43;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
LABEL_31:
  a2(v45, v44, v36, v8);

  sub_247C9E8A4(v42, v43);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

void sub_247C9E54C(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

int64_t sub_247C9E580()
{
  void *v0;
  CGImage *v1;
  CGImage *v2;
  uint64_t Width;
  int64_t result;
  int64_t v5;
  uint64_t v6;
  CGColorSpace *v7;
  void *v8;
  void *v9;
  CGContextRef v10;
  CGContext *v11;
  id v12;
  CGColor *v13;
  _BYTE *Data;
  uint64_t v15;
  CGRect v16;

  v1 = (CGImage *)objc_msgSend(v0, sel_CGImage);
  if (!v1)
    return 0;
  v2 = v1;
  Width = CGImageGetWidth(v1);
  result = CGImageGetHeight(v2);
  if ((unint64_t)(Width - 0x2000000000000000) >> 62 != 3)
  {
    __break(1u);
    goto LABEL_16;
  }
  v5 = result;
  v6 = 4 * Width * result;
  if ((unsigned __int128)(4 * Width * (__int128)result) >> 64 != v6 >> 63)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  result = CGImageGetColorSpace(v2);
  if (result)
  {
    v7 = (CGColorSpace *)result;
    v8 = malloc(v6);
    if (v8)
    {
      v9 = v8;
      v10 = CGBitmapContextCreate(v8, Width, v5, 8uLL, 4 * Width, v7, 1u);
      if (v10)
      {
        v11 = v10;
        v12 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
        v13 = (CGColor *)objc_msgSend(v12, sel_CGColor);

        CGContextSetFillColorWithColor(v11, v13);
        v16.origin.x = 0.0;
        v16.origin.y = 0.0;
        v16.size.width = (double)Width;
        v16.size.height = (double)v5;
        CGContextFillRect(v11, v16);
        sub_247C9FE68();
        Data = CGBitmapContextGetData(v11);
        if (Data)
        {
          v15 = sub_247C9ED7C(Data, v6);
          free(v9);

          v2 = v7;
          v7 = v11;
LABEL_13:

          return v15;
        }

      }
      else
      {
        free(v9);
      }
    }
    v15 = 0;
    goto LABEL_13;
  }
LABEL_17:
  __break(1u);
  return result;
}

char *sub_247C9E7E0(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_247C9E9C0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_247C9E7FC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_247C9EAB8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_247C9E818(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_247C9EBB8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_247C9E834()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_247C9E85C()
{
  return swift_deallocObject();
}

uint64_t sub_247C9E86C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_247C9E8A4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_247C9E8B8(a1, a2);
  return a1;
}

uint64_t sub_247C9E8B8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

void sub_247C9E8FC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_247C9DA6C(a1, (SEL *)&selRef_colors, &qword_2576F0C40, a2);
}

void sub_247C9E928(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_247C9DAE4(a1, a2, a3, a4, &qword_2576F0C40, 0x24BEBD4B8, (SEL *)&selRef_setColors_);
}

void sub_247C9E954(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_247C9DA6C(a1, (SEL *)&selRef_locations, &qword_2576F0C38, a2);
}

void sub_247C9E980(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_247C9DAE4(a1, a2, a3, a4, &qword_2576F0C38, 0x24BDD16E0, (SEL *)&selRef_setLocations_);
}

uint64_t type metadata accessor for SUIARadialGradientView(uint64_t a1)
{
  return sub_247C84B94(a1, &qword_2576F0D48);
}

char *sub_247C9E9C0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0D50);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

char *sub_247C9EAB8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F08F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_247C9EBB8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0830);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_247C9ECBC(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_247C9ED7C(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_247C9ECBC(__src, &__src[a2]);
  sub_247C9FD78();
  swift_allocObject();
  sub_247C9FD54();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_247C9FD84();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

void sub_247C9EE28(uint64_t a1, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v7;
  double v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  double v29;
  double v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  char isEscapingClosureAtFileLocation;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v56;
  _QWORD aBlock[8];

  aBlock[6] = *MEMORY[0x24BDAC8D0];
  v7 = 2;
  if (a1 > 2)
    v7 = a1;
  v56 = v7;
  v8 = a5 * 6.0 + a3;
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, v8, v8);
  v10 = (void *)objc_opt_self();
  v11 = objc_msgSend(v10, sel_whiteColor);
  objc_msgSend(v9, sel_setBackgroundColor_, v11);

  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, a3, a3);
  objc_msgSend(v9, sel_addSubview_, v12);
  objc_msgSend(v9, sel_center);
  objc_msgSend(v12, sel_setCenter_);
  sub_247C9FDB4();
  v13 = objc_allocWithZone(MEMORY[0x24BDE56B0]);
  v14 = (void *)sub_247C9FDA8();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithType_, v14);

  v16 = (void *)sub_247C9FD90();
  objc_msgSend(v15, sel_setValue_forKey_, v16, *MEMORY[0x24BDE5B18]);

  v17 = (void *)sub_247C9FE38();
  objc_msgSend(v15, sel_setValue_forKey_, v17, *MEMORY[0x24BDE5B00]);

  v18 = objc_msgSend(v9, sel_layer);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F0830);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_247CA2B60;
  *(_QWORD *)(v19 + 56) = sub_247C84B94(0, &qword_2576F0D18);
  *(_QWORD *)(v19 + 32) = v15;
  v20 = v15;
  v21 = (void *)sub_247C9FDFC();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setFilters_, v21);

  v22 = objc_msgSend(v12, sel_layer);
  objc_msgSend(v22, sel_setCornerRadius_, a3 * 0.5);

  if (a4 == 0.0)
  {
    v23 = objc_msgSend(v10, sel_blackColor);
    objc_msgSend(v12, sel_setBackgroundColor_, v23);
  }
  else
  {
    v24 = objc_msgSend(v10, sel_whiteColor);
    objc_msgSend(v12, sel_setBackgroundColor_, v24);

    v25 = objc_msgSend(v12, sel_layer);
    v26 = objc_msgSend(v10, sel_blackColor);
    v27 = objc_msgSend(v26, sel_CGColor);

    objc_msgSend(v25, sel_setBorderColor_, v27);
    v23 = objc_msgSend(v12, sel_layer);
    objc_msgSend(v23, sel_setBorderWidth_, a4);
  }

  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD620]), sel_init);
  objc_msgSend(v28, sel_setPreferredRange_, 2);
  objc_msgSend(v9, sel_bounds);
  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD618]), sel_initWithSize_format_, v28, v29, v30);
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = v9;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = sub_247C9E858;
  *(_QWORD *)(v33 + 24) = v32;
  aBlock[4] = sub_247C9F918;
  aBlock[5] = v33;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247C9E54C;
  aBlock[3] = &block_descriptor_16;
  v34 = _Block_copy(aBlock);
  v54 = v9;
  swift_retain();
  swift_release();
  v35 = objc_msgSend(v31, sel_imageWithActions_, v34);
  _Block_release(v34);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v40 = sub_247C9E580();
  v41 = v35;
  v53 = v20;
  if (v37 >> 60 == 15)
    goto LABEL_31;
  v42 = (double)v38 * 0.5;
  if ((~*(_QWORD *)&v42 & 0x7FF0000000000000) == 0)
    goto LABEL_39;
  if (v42 <= -9.22337204e18)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v42 >= 9.22337204e18)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (__OFSUB__(v38, (uint64_t)v42))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v43 = 1.0 / (double)(v56 - 1);
  if (v43 == 0.0)
  {
LABEL_43:
    __break(1u);
    JUMPOUT(0x247C9F864);
  }
  v52 = v28;
  if (v39 >= 0)
    v44 = v39;
  else
    v44 = v39 + 1;
  v45 = v44 >> 1;
  v46 = v38 * v45;
  if (v43 <= 0.0)
  {
    if (1.0 < 0.0 || 1.0 == 0.0)
    {
LABEL_23:
      v47 = 0.0 * (double)(v38 - (uint64_t)v42) + (double)(uint64_t)v42;
      if ((~*(_QWORD *)&v47 & 0x7FF0000000000000) != 0)
      {
        if (v47 > -9.22337204e18)
        {
          if (v47 < 9.22337204e18)
          {
            if ((unsigned __int128)(v38 * (__int128)v45) >> 64 == (v38 * v45) >> 63)
            {
              if (!__OFADD__(v46, (uint64_t)v47))
              {
                if ((unint64_t)(v46 + (uint64_t)v47 - 0x2000000000000000) >> 62 == 3)
                  __asm { BR              X8 }
LABEL_37:
                __break(1u);
                __break(1u);
                JUMPOUT(0x247C9F834);
              }
LABEL_36:
              __break(1u);
              goto LABEL_37;
            }
LABEL_35:
            __break(1u);
            goto LABEL_36;
          }
LABEL_34:
          __break(1u);
          goto LABEL_35;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_34;
    }
  }
  else if (1.0 > 0.0 || 1.0 == 0.0)
  {
    goto LABEL_23;
  }
  v28 = v52;
  v41 = v35;
LABEL_31:
  v48 = v37;
  sub_247C84B94(0, &qword_2576F0C38);
  v49 = (void *)sub_247C9FDFC();
  sub_247C84B94(0, &qword_2576F0C40);
  v50 = v12;
  v51 = (void *)sub_247C9FDFC();
  (*(void (**)(uint64_t, void *, void *, void *, double))(a2 + 16))(a2, v49, v51, v41, v8);

  sub_247C9E8A4(v40, v48);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

id sub_247C9F884()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  objc_msgSend(v1, sel_bounds);
  return objc_msgSend(v1, sel_drawViewHierarchyInRect_afterScreenUpdates_, 1);
}

uint64_t sub_247C9F8C0()
{
  return swift_deallocObject();
}

uint64_t sub_247C9F8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t SUIAFrameRateRange.caFrameRateRange.getter()
{
  return sub_247C9FE74();
}

uint64_t SUIAFrameRateReason.caHighFrameRateReason.getter(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned __int16 v4;

  v2 = (*(uint64_t (**)(void))(a2 + 16))();
  sub_247C9FDE4();
  return v4 | (v2 << 16);
}

BOOL static SUIAFrameRateRange.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SUIAFrameRateRange.hash(into:)()
{
  return sub_247C9FF4C();
}

uint64_t SUIAFrameRateRange.hashValue.getter()
{
  sub_247C9FF40();
  sub_247C9FF4C();
  return sub_247C9FF58();
}

BOOL sub_247C9FA88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247C9FA9C()
{
  sub_247C9FF40();
  sub_247C9FF4C();
  return sub_247C9FF58();
}

uint64_t sub_247C9FAE0()
{
  return sub_247C9FF4C();
}

uint64_t sub_247C9FB08()
{
  sub_247C9FF40();
  sub_247C9FF4C();
  return sub_247C9FF58();
}

Swift::UInt32 __swiftcall SUIAHighFrameRateReasonMake(componentID:reason:)(Swift::UInt32 componentID, Swift::UInt32 reason)
{
  return (unsigned __int16)reason | ((unsigned __int16)componentID << 16);
}

unint64_t sub_247C9FB58()
{
  unint64_t result;

  result = qword_2576F0D58;
  if (!qword_2576F0D58)
  {
    result = MEMORY[0x249590098](&protocol conformance descriptor for SUIAFrameRateRange, &type metadata for SUIAFrameRateRange);
    atomic_store(result, (unint64_t *)&qword_2576F0D58);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SUIAFrameRateRange(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SUIAFrameRateRange(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_247C9FC88 + 4 * byte_247CA3195[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_247C9FCBC + 4 * byte_247CA3190[v4]))();
}

uint64_t sub_247C9FCBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247C9FCC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247C9FCCCLL);
  return result;
}

uint64_t sub_247C9FCD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247C9FCE0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_247C9FCE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247C9FCEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247C9FCF8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_247C9FD04(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SUIAFrameRateRange()
{
  return &type metadata for SUIAFrameRateRange;
}

uint64_t dispatch thunk of static SUIAFrameRateReason.componentID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_247C9FD24()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_247C9FD54()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_247C9FD60()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_247C9FD6C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_247C9FD78()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_247C9FD84()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_247C9FD90()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_247C9FD9C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_247C9FDA8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_247C9FDB4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_247C9FDC0()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_247C9FDCC()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_247C9FDD8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_247C9FDE4()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_247C9FDF0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_247C9FDFC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_247C9FE08()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_247C9FE14()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_247C9FE20()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_247C9FE2C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_247C9FE38()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_247C9FE44()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_247C9FE50()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_247C9FE5C()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_247C9FE68()
{
  return MEMORY[0x24BDBD780]();
}

uint64_t sub_247C9FE74()
{
  return MEMORY[0x24BEE5CA8]();
}

uint64_t sub_247C9FE80()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_247C9FE8C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_247C9FE98()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_247C9FEA4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_247C9FEB0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_247C9FEBC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_247C9FEC8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_247C9FED4()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_247C9FEE0()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_247C9FEEC()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_247C9FEF8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_247C9FF04()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_247C9FF10()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_247C9FF1C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_247C9FF28()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_247C9FF34()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_247C9FF40()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_247C9FF4C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_247C9FF58()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x24BE0BBB8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x24BE0BBD0]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x24BE0BBF0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x24BE0BBF8]();
}

uint64_t BSRectCenteredAboutPoint()
{
  return MEMORY[0x24BE0BC98]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t BSValueWithPoint()
{
  return MEMORY[0x24BE0BD68]();
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x24BDE5438](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDE5590](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55E8](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55F8](retstr, t, sx, sy, sz);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x24BEBDF70]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x24BEBE120]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BEBE6A8]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x24BEBE6B0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x24BEBEBE0]();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return MEMORY[0x24BEBEBE8]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

