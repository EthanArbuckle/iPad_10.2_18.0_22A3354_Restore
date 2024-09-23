@implementation CRKAssignUserRequest

- (NSArray)stu_enrolledGroupIdentifiers
{
  return (NSArray *)-[CRKAssignUserRequest enrolledCourseIdentifiers](self, "enrolledCourseIdentifiers");
}

@end
