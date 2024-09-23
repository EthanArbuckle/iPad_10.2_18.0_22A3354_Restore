@implementation WFPlacardCell

- (UINavigationItem)navigationItem
{
  return (UINavigationItem *)(id)MEMORY[0x219A32F30]((char *)self + OBJC_IVAR___WFPlacardCell_navigationItem, a2);
}

- (void)setNavigationItem:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (WFPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_2197529A8();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (WFPlacardCell *)sub_2197292A8(v4, v5);
}

- (WFPlacardCell)initWithCoder:(id)a3
{
  id v5;
  WFPlacardCell *result;

  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (WFPlacardCell *)sub_219752B70();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
