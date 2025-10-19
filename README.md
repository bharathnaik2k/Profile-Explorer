# Profile Explorer

## Features
- **Grid Layout**: Displays user profiles in a responsive 2-column grid
- **Profile Cards**: Each card shows profile picture, name, and location
- **Profile Details**: Tap on any profile to view full details
- **Like/Unlike**: Toggle favorite status with animated heart icon
- **State Sync**: Like status syncs between home screen and detail screen
- **Error Handling**: Proper loading and error states with retry functionality

## API

**Endpoint**: `https://randomuser.me/api/?results=20`

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
  provider: ^6.1.1
  cached_network_image: ^3.3.0
```