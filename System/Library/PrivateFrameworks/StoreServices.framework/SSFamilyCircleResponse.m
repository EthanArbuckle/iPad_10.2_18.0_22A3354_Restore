@implementation SSFamilyCircleResponse

- (SSFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (void)setFamilyCircle:(id)a3
{
  objc_storeStrong((id *)&self->_familyCircle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyCircle, 0);
}

@end
