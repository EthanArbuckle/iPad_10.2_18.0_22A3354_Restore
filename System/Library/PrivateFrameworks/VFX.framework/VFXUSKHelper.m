@implementation VFXUSKHelper

+ (id)world:(id)a3 nodeAtPath:(id)a4 type:(id)a5
{
  return (id)objc_msgSend_newNodeAtPath_type_(a3, a2, (uint64_t)a4, (uint64_t)a5);
}

+ (id)node:(id)a3 propertyWithName:(id)a4 type:(id)a5 role:(id)a6
{
  return (id)objc_msgSend_newPropertyWithName_type_role_(a3, a2, (uint64_t)a4, (uint64_t)a5, a6);
}

@end
