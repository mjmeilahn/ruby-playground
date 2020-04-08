$LOAD_PATH << '.'
require '1-basics'

users = [
  { username: 'matt', password: '1234' },
  { username: 'jack', password: 'jack' },
  { username: 'kyle', password: 'ok123' }
]

secured_users = AuthUser.secure_users(users)
puts AuthUser.auth_user('matt', '1234', secured_users)