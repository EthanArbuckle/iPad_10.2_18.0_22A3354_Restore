@implementation DOMNode(WebDOMNodeOperations)

- (uint64_t)webArchiveByFilteringSubframes:()WebDOMNodeOperations
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD **)(*(_QWORD *)(a2 + 280) + 16);
  if (((*(uint64_t (**)(_QWORD *))(*v3 + 1072))(v3) & 1) != 0)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, v3[2]);
}

@end
