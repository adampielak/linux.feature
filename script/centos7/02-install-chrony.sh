# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum install chrony
systemctl enable chronyd
systemctl start chronyd
