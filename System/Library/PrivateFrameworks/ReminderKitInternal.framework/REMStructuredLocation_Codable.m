@implementation REMStructuredLocation_Codable

- (REMStructuredLocation_Codable)initWithTitle:(id)a3 locationUID:(id)a4 latitude:(double)a5 longitude:(double)a6 radius:(double)a7 address:(id)a8 routing:(id)a9 referenceFrameString:(id)a10 contactLabel:(id)a11 mapKitHandle:(id)a12
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  if (a3)
  {
    v20 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    v45 = v21;
    v46 = v20;
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v45 = 0;
    v46 = 0;
    if (a4)
    {
LABEL_3:
      v22 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
      v43 = v23;
      v44 = v22;
      v24 = a12;
      if (a8)
        goto LABEL_4;
LABEL_8:
      v42 = 0;
      v26 = 0;
      if (a9)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  v43 = 0;
  v44 = 0;
  v24 = a12;
  if (!a8)
    goto LABEL_8;
LABEL_4:
  v42 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v26 = v25;
  if (a9)
  {
LABEL_5:
    a9 = (id)_sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    v28 = v27;
    goto LABEL_10;
  }
LABEL_9:
  v28 = 0;
LABEL_10:
  v29 = a10;
  v30 = a11;
  v31 = v24;
  if (v29)
  {
    v32 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    v34 = v33;

    if (v30)
      goto LABEL_12;
LABEL_15:
    v35 = 0;
    v37 = 0;
    if (v31)
      goto LABEL_13;
LABEL_16:
    v38 = 0;
    v40 = 0xF000000000000000;
    return (REMStructuredLocation_Codable *)REMStructuredLocation_Codable.init(title:locationUID:latitude:longitude:radius:address:routing:referenceFrameString:contactLabel:mapKitHandle:)(a5, a6, a7, v46, v45, v44, v43, v42, v26, (uint64_t)a9, v28, v32, v34, v35, v37, v38, v40);
  }
  v32 = 0;
  v34 = 0;
  if (!v30)
    goto LABEL_15;
LABEL_12:
  v35 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v37 = v36;

  if (!v31)
    goto LABEL_16;
LABEL_13:
  v38 = sub_1A468FFC4();
  v40 = v39;

  return (REMStructuredLocation_Codable *)REMStructuredLocation_Codable.init(title:locationUID:latitude:longitude:radius:address:routing:referenceFrameString:contactLabel:mapKitHandle:)(a5, a6, a7, v46, v45, v44, v43, v42, v26, (uint64_t)a9, v28, v32, v34, v35, v37, v38, v40);
}

- (REMStructuredLocation_Codable)initWithTitle:(id)a3
{
  REMStructuredLocation_Codable *result;

  result = (REMStructuredLocation_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (REMStructuredLocation_Codable)init
{
  REMStructuredLocation_Codable *result;

  result = (REMStructuredLocation_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (REMStructuredLocation_Codable)initWithTitle:(id)a3 locationUID:(id)a4
{
  REMStructuredLocation_Codable *result;

  result = (REMStructuredLocation_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
